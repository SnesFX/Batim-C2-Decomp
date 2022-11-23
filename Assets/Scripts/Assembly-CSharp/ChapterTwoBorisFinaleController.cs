using System;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200026C RID: 620
public class ChapterTwoBorisFinaleController : BaseController
{
	// Token: 0x06000D46 RID: 3398 RVA: 0x0007A83E File Offset: 0x00078C3E
	public override void Init()
	{
		base.Init();
		this.m_Boris.gameObject.SetActive(false);
	}

	// Token: 0x06000D47 RID: 3399 RVA: 0x0007A857 File Offset: 0x00078C57
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_BorisFootstepClips = GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Boris/Wood");
		this.m_FinalBorisClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_11");
	}

	// Token: 0x06000D48 RID: 3400 RVA: 0x0007A893 File Offset: 0x00078C93
	public void Activate()
	{
		this.m_FinaleTrigger.OnEnter += this.HandleFinaleOnEnter;
	}

	// Token: 0x06000D49 RID: 3401 RVA: 0x0007A8AC File Offset: 0x00078CAC
	private void Update()
	{
		if (!this.m_IsBorisTriggered)
		{
			return;
		}
		Vector3 position = GameManager.Instance.Player.transform.position;
		position.y -= 2.5f;
		this.m_BorisNeck.LookAt(position);
		Vector3 localEulerAngles = this.m_BorisNeck.localEulerAngles;
		localEulerAngles.z = 0f;
		this.m_BorisNeck.localEulerAngles = localEulerAngles;
	}

	// Token: 0x06000D4A RID: 3402 RVA: 0x0007A920 File Offset: 0x00078D20
	private Sequence DOCanKick()
	{
		Sequence sequence = DOTween.Sequence();
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Can_Roll_slow_01", AudioObjectType.SOUND_EFFECT, 0, false);
		sequence.Insert(0f, this.m_Can.DOMove(this.m_CanEndPos.position, 3.5f, false).SetEase(Ease.Linear));
		sequence.Insert(0f, this.m_Can.DOLocalRotate(new Vector3(0f, 2160f, 0f), 3.5f, RotateMode.LocalAxisAdd).SetEase(Ease.Linear));
		sequence.InsertCallback(1.5f, new TweenCallback(this.DODialogue));
		return sequence;
	}

	// Token: 0x06000D4B RID: 3403 RVA: 0x0007A9CC File Offset: 0x00078DCC
	private void DODialogue()
	{
		GameManager.Instance.AudioManager.Play("Audio/MUS/MUS_Horror_Cue_02", AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_10", "Hello? Someone there? I know you're in here.\nCome out and show yourself.", false)).OnComplete += this.HandleDialogueOnComplete;
	}

	// Token: 0x06000D4C RID: 3404 RVA: 0x0007AA1C File Offset: 0x00078E1C
	private void HandleDialogueOnComplete(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleDialogueOnComplete;
		this.DOBorisWalk().OnComplete(new TweenCallback(this.HandleBorisMoveOnComplete));
	}

	// Token: 0x06000D4D RID: 3405 RVA: 0x0007AA50 File Offset: 0x00078E50
	private Sequence DOBorisWalk()
	{
		this.m_Boris.gameObject.SetActive(true);
		this.m_BorisAnimator.SetFloat("Speed", 1f);
		Sequence sequence = DOTween.Sequence();
		sequence.Insert(1.5f, this.m_Boris.DOMove(this.m_BorisEndPos.position, 2.5f, false).SetEase(Ease.Linear));
		for (int i = 0; i < 6; i++)
		{
			sequence.InsertCallback(1.5f + (float)i * 0.5f, new TweenCallback(this.PlayFootStepAudio));
		}
		return sequence;
	}

	// Token: 0x06000D4E RID: 3406 RVA: 0x0007AAEC File Offset: 0x00078EEC
	private void HandleFinaleOnEnter(object sender, EventArgs e)
	{
		this.m_FinaleTrigger.OnEnter -= this.HandleFinaleOnEnter;
		GameManager.Instance.HideCrosshair();
		GameManager.Instance.Player.CameraSwaySetActive(true);
		GameManager.Instance.Player.Lock();
		GameManager.Instance.Player.HeadContainer.DOLookAt(this.m_FinalLookAt.position, 2f, AxisConstraint.None, null).SetEase(Ease.InOutQuad);
		this.m_IsBorisTriggered = true;
		this.DOCanKick();
	}

	// Token: 0x06000D4F RID: 3407 RVA: 0x0007AB7C File Offset: 0x00078F7C
	private void HandleBorisMoveOnComplete()
	{
		this.m_BorisAnimator.SetFloat("Speed", 0f);
		float num = 0f;
		Sequence s = DOTween.Sequence();
		s.Insert(0f, this.m_Boris.DOLocalRotateQuaternion(this.m_BorisEndPos.localRotation, 0.25f).SetEase(Ease.InOutQuad));
		num += 1.5f;
		s.InsertCallback(num, delegate
		{
			GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_HUD_whoosh_01", AudioObjectType.SOUND_EFFECT, 0, false);
		});
		s.InsertCallback(num, delegate
		{
			GameManager.Instance.ShowScreenBlocker(0f, 0f, null);
		});
		num += 2f;
		s.InsertCallback(num, delegate
		{
			GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_FinalBorisClip, "Boris?", false));
		});
		num += this.m_FinalBorisClip.length + 0.5f;
		s.InsertCallback(num, new TweenCallback(base.SendOnComplete));
	}

	// Token: 0x06000D50 RID: 3408 RVA: 0x0007AC70 File Offset: 0x00079070
	private void PlayFootStepAudio()
	{
		if (this.m_BorisFootstepClips == null || this.m_BorisFootstepClips.Length <= 0)
		{
			return;
		}
		int num = UnityEngine.Random.Range(0, this.m_BorisFootstepClips.Length);
		AudioClip audioClip = this.m_BorisFootstepClips[num];
		GameManager.Instance.AudioManager.Play(audioClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_BorisFootstepClips[num] = this.m_BorisFootstepClips[0];
		this.m_BorisFootstepClips[0] = audioClip;
	}

	// Token: 0x06000D51 RID: 3409 RVA: 0x0007ACDC File Offset: 0x000790DC
	protected override void OnDisposed()
	{
		this.m_FinaleTrigger.OnEnter -= this.HandleFinaleOnEnter;
		this.m_BorisFootstepClips = null;
		base.OnDisposed();
	}

	// Token: 0x04000F6C RID: 3948
	[Header("Transforms")]
	[SerializeField]
	private Transform m_FinalLookAt;

	// Token: 0x04000F6D RID: 3949
	[SerializeField]
	private Transform m_Boris;

	// Token: 0x04000F6E RID: 3950
	[SerializeField]
	private Transform m_BorisEndPos;

	// Token: 0x04000F6F RID: 3951
	[SerializeField]
	private Transform m_FinalRot;

	// Token: 0x04000F70 RID: 3952
	[SerializeField]
	private Transform m_BorisNeck;

	// Token: 0x04000F71 RID: 3953
	[SerializeField]
	private Transform m_Can;

	// Token: 0x04000F72 RID: 3954
	[SerializeField]
	private Transform m_CanEndPos;

	// Token: 0x04000F73 RID: 3955
	[Header("Animators")]
	[SerializeField]
	private Animator m_BorisAnimator;

	// Token: 0x04000F74 RID: 3956
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_FinaleTrigger;

	// Token: 0x04000F75 RID: 3957
	private AudioClip[] m_BorisFootstepClips;

	// Token: 0x04000F76 RID: 3958
	private AudioClip m_FinalBorisClip;

	// Token: 0x04000F77 RID: 3959
	private bool m_IsBorisTriggered;
}
