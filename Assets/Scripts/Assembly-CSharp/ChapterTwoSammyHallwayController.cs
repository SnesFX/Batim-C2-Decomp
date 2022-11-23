using System;
using System.Collections;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200027B RID: 635
public class ChapterTwoSammyHallwayController : BaseController
{
	// Token: 0x06000E07 RID: 3591 RVA: 0x0007ED57 File Offset: 0x0007D157
	public override void Init()
	{
		base.Init();
		this.m_Sammy.gameObject.SetActive(false);
	}

	// Token: 0x06000E08 RID: 3592 RVA: 0x0007ED70 File Offset: 0x0007D170
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_HorrorCueAudioClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_Horror_Cue_02");
		this.m_HenryDialogueClip_03 = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_03");
		this.m_HenryDialogueClip_04 = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_04");
	}

	// Token: 0x06000E09 RID: 3593 RVA: 0x0007EDC2 File Offset: 0x0007D1C2
	public void Activate()
	{
		this.m_SammyEvent.OnEnter += this.HandleSammyEventOnEnter;
	}

	// Token: 0x06000E0A RID: 3594 RVA: 0x0007EDDC File Offset: 0x0007D1DC
	private void HandleSammyEventOnEnter(object sender, EventArgs e)
	{
		this.m_SammyEvent.OnEnter -= this.HandleSammyEventOnEnter;
		GameManager.Instance.AudioManager.Play(this.m_HorrorCueAudioClip, AudioObjectType.MUSIC, 0, false);
		base.StartCoroutine(this.DelayPlayerDialogue());
		this.m_Sammy.gameObject.SetActive(true);
		this.m_Sammy.localPosition = this.m_SammyStartPos.localPosition;
		this.m_DialogueAudio = GameManager.Instance.AudioManager.PlayAtPosition("Audio/DIA/ChapterTwo/Sammy/DIA_Sammy_01", this.m_AudioPosition.position, AudioObjectType.DIALOGUE, 0, false, this.m_Sammy);
		this.m_Sammy.DOLocalMove(this.m_SammyEndPos.localPosition, this.m_WalkDuration, false).SetEase(Ease.Linear).OnComplete(new TweenCallback(this.HandleSammyMoveOnComplete));
		this.m_SammyEndEvent.SetActive(true);
		this.m_SammyEndEvent.OnEnter += this.HandleSammyEndEventOnEnter;
	}

	// Token: 0x06000E0B RID: 3595 RVA: 0x0007EED4 File Offset: 0x0007D2D4
	private IEnumerator DelayPlayerDialogue()
	{
		yield return new WaitForSeconds(2f);
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_HenryDialogueClip_03, "Hello! Excuse me! Can you help me! Hello?", false));
		yield break;
	}

	// Token: 0x06000E0C RID: 3596 RVA: 0x0007EEEF File Offset: 0x0007D2EF
	private void HandleSammyEndEventOnEnter(object sender, EventArgs e)
	{
		this.m_SammyEndEvent.OnEnter -= this.HandleSammyEndEventOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_HenryDialogueClip_04, "Where the hell did he go?", false));
		base.SendOnComplete();
	}

	// Token: 0x06000E0D RID: 3597 RVA: 0x0007EF2C File Offset: 0x0007D32C
	private void HandleSammyMoveOnComplete()
	{
		this.m_DialogueAudio.transform.SetParent(null);
		this.m_DialogueAudio.transform.DOLocalMoveX(this.m_DialogueAudio.transform.localPosition.x + 25f, 5f, false);
		this.m_DialogueAudio.OnComplete += delegate(object sender, EventArgs e)
		{
			this.m_DialogueAudio.transform.DOKill(false);
		};
		UnityEngine.Object.Destroy(this.m_Sammy.gameObject);
	}

	// Token: 0x06000E0E RID: 3598 RVA: 0x0007EFA8 File Offset: 0x0007D3A8
	private void DOMoveLoop()
	{
		this.m_Sammy.DOKill(false);
		this.m_Sammy.localPosition = this.m_SammyStartPos.localPosition;
		this.m_Sammy.DOLocalMove(this.m_SammyEndPos.localPosition, this.m_WalkDuration, false).SetEase(Ease.Linear).OnComplete(new TweenCallback(this.DOMoveLoop));
	}

	// Token: 0x06000E0F RID: 3599 RVA: 0x0007F010 File Offset: 0x0007D410
	protected override void OnDisposed()
	{
		this.m_SammyEvent.OnEnter -= this.HandleSammyEventOnEnter;
		this.m_HorrorCueAudioClip = null;
		if (this.m_DialogueAudio != null)
		{
			this.m_DialogueAudio.Clear();
			this.m_DialogueAudio = null;
		}
		base.OnDisposed();
	}

	// Token: 0x0400102C RID: 4140
	[Header("Transforms")]
	[SerializeField]
	private Transform m_Sammy;

	// Token: 0x0400102D RID: 4141
	[SerializeField]
	private Transform m_SammyStartPos;

	// Token: 0x0400102E RID: 4142
	[SerializeField]
	private Transform m_SammyEndPos;

	// Token: 0x0400102F RID: 4143
	[SerializeField]
	private Transform m_AudioPosition;

	// Token: 0x04001030 RID: 4144
	[Header("Event Trigger")]
	[SerializeField]
	private EventTrigger m_SammyEvent;

	// Token: 0x04001031 RID: 4145
	[SerializeField]
	private EventTrigger m_SammyEndEvent;

	// Token: 0x04001032 RID: 4146
	[Header("Sammy Movement Options")]
	[SerializeField]
	private float m_WalkDuration = 5.58f;

	// Token: 0x04001033 RID: 4147
	private AudioClip m_HorrorCueAudioClip;

	// Token: 0x04001034 RID: 4148
	private AudioObject m_DialogueAudio;

	// Token: 0x04001035 RID: 4149
	private AudioClip m_HenryDialogueClip_03;

	// Token: 0x04001036 RID: 4150
	private AudioClip m_HenryDialogueClip_04;
}
