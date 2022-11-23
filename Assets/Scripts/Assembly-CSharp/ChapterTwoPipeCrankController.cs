using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x02000275 RID: 629
public class ChapterTwoPipeCrankController : BaseController
{
	// Token: 0x06000DB7 RID: 3511 RVA: 0x0007CEB0 File Offset: 0x0007B2B0
	public override void Init()
	{
		base.Init();
		for (int i = 0; i < this.m_PipeControllers.Count; i++)
		{
			this.m_PipeControllers[i].TurnOn();
		}
		this.m_Crank.SetActive(false);
		this.m_ScareInk.SetActive(false);
		this.m_Cutout.position = this.m_CutoutScarePosition.position;
		this.m_Cutout.rotation = this.m_CutoutScarePosition.rotation;
		this.m_Cutout.gameObject.SetActive(false);
	}

	// Token: 0x06000DB8 RID: 3512 RVA: 0x0007CF45 File Offset: 0x0007B345
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_ValveClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Valve_Turn_Steam_Release_01");
		this.m_Door.Lock();
	}

	// Token: 0x06000DB9 RID: 3513 RVA: 0x0007CF72 File Offset: 0x0007B372
	public void Activate()
	{
		this.m_Crank.SetActive(true);
		this.m_Crank.OnInteracted += this.HandleCrankOnInteracted;
	}

	// Token: 0x06000DBA RID: 3514 RVA: 0x0007CF97 File Offset: 0x0007B397
	private void Update()
	{
		if (!this.m_IsJumpscareReady)
		{
			return;
		}
		this.m_CanJumpscare = this.m_CutoutMeshRenderer.isVisible;
	}

	// Token: 0x06000DBB RID: 3515 RVA: 0x0007CFB8 File Offset: 0x0007B3B8
	private void HandleCrankOnInteracted(object sender, EventArgs e)
	{
		this.m_Crank.OnInteracted -= this.HandleCrankOnInteracted;
		this.m_IsJumpscareReady = true;
		this.m_Cutout.gameObject.SetActive(true);
		this.m_JumpscareTrigger.SetActive(true);
		this.m_JumpscareTrigger.OnEnter += this.HandleJumpscareTriggerOnEnter;
		this.m_StrikeUpTheBand.SetActive(false);
		GameManager.Instance.AudioManager.PlayAtPosition(this.m_ValveClip, this.m_CrankHandle.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_CrankHandle.DOKill(false);
		this.m_CrankHandle.DOLocalRotate(new Vector3(360f, 0f, 0f), 8f, RotateMode.LocalAxisAdd).SetEase(Ease.InOutQuad).OnComplete(new TweenCallback(this.HandleCrankHandleRotateOnComplete));
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_09", "Ok, that should do it.", false)).OnComplete += this.HandleValveDialogueOnComplete;
		base.SendOnComplete();
	}

	// Token: 0x06000DBC RID: 3516 RVA: 0x0007D0C3 File Offset: 0x0007B4C3
	private void HandleValveDialogueOnComplete(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleValveDialogueOnComplete;
		GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "RETURN TO SAMMY'S OFFICE", string.Empty, 4f, false));
	}

	// Token: 0x06000DBD RID: 3517 RVA: 0x0007D100 File Offset: 0x0007B500
	private void HandleCrankHandleRotateOnComplete()
	{
		this.m_Door.Unlock();
		this.m_InkBlockage.SetActive(false);
		for (int i = 0; i < this.m_PipeControllers.Count; i++)
		{
			this.m_PipeControllers[i].TurnOff();
		}
	}

	// Token: 0x06000DBE RID: 3518 RVA: 0x0007D154 File Offset: 0x0007B554
	private void HandleJumpscareTriggerOnEnter(object sender, EventArgs e)
	{
		if (!this.m_CanJumpscare)
		{
			return;
		}
		this.m_JumpscareTrigger.SetActive(false);
		this.m_JumpscareTrigger.OnEnter -= this.HandleJumpscareTriggerOnEnter;
		this.m_Cutout.position = this.m_CutoutStartPosition.position;
		this.m_Cutout.rotation = this.m_CutoutStartPosition.rotation;
		this.m_CutoutMeshRenderer.gameObject.layer = LayerMask.NameToLayer("Default");
		this.DOCutoutSequence().OnComplete(new TweenCallback(this.HandleCutoutSequenceOnComplete));
		this.m_IsJumpscareReady = false;
	}

	// Token: 0x06000DBF RID: 3519 RVA: 0x0007D1F8 File Offset: 0x0007B5F8
	private Sequence DOCutoutSequence()
	{
		this.KillCutoutSequence();
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Jumpscare_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_CutoutSequence = DOTween.Sequence();
		float duration = 0.25f;
		float num = 0f;
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DOLocalMove(this.m_CutoutScarePosition.localPosition, duration, false).SetEase(Ease.OutBack));
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DORotateQuaternion(this.m_CutoutScarePosition.localRotation, duration).SetEase(Ease.OutBack));
		num += 0.55f;
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DOMove(this.m_CutoutStartPosition.localPosition, duration, false).SetEase(Ease.InBack));
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DORotateQuaternion(this.m_CutoutStartPosition.localRotation, duration).SetEase(Ease.InBack));
		return this.m_CutoutSequence;
	}

	// Token: 0x06000DC0 RID: 3520 RVA: 0x0007D2F6 File Offset: 0x0007B6F6
	private void HandleCutoutSequenceOnComplete()
	{
		this.m_Cutout.position = this.m_CutoutEndPosition.position;
		this.m_Cutout.rotation = this.m_CutoutEndPosition.rotation;
		this.m_ScareInk.SetActive(true);
	}

	// Token: 0x06000DC1 RID: 3521 RVA: 0x0007D330 File Offset: 0x0007B730
	private void KillCutoutSequence()
	{
		if (this.m_CutoutSequence != null)
		{
			this.m_CutoutSequence.Kill(false);
			this.m_CutoutSequence = null;
		}
	}

	// Token: 0x06000DC2 RID: 3522 RVA: 0x0007D350 File Offset: 0x0007B750
	protected override void OnDisposed()
	{
		this.m_Crank.OnInteracted -= this.HandleCrankOnInteracted;
		if (this.m_JumpscareTrigger != null)
		{
			this.m_JumpscareTrigger.OnEnter -= this.HandleJumpscareTriggerOnEnter;
		}
		this.KillCutoutSequence();
		this.m_CrankHandle.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x04000FD4 RID: 4052
	[Header("Transforms")]
	[SerializeField]
	private Transform m_CrankHandle;

	// Token: 0x04000FD5 RID: 4053
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_InkBlockage;

	// Token: 0x04000FD6 RID: 4054
	[SerializeField]
	private GameObject m_StrikeUpTheBand;

	// Token: 0x04000FD7 RID: 4055
	[Header("Doors")]
	[SerializeField]
	private DoorController m_Door;

	// Token: 0x04000FD8 RID: 4056
	[Header("Interactables")]
	[SerializeField]
	private Interactable m_Crank;

	// Token: 0x04000FD9 RID: 4057
	[Header("Pipes")]
	[SerializeField]
	private List<InkPipeController> m_PipeControllers;

	// Token: 0x04000FDA RID: 4058
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_JumpscareTrigger;

	// Token: 0x04000FDB RID: 4059
	[Header("Cutout Jumpscare")]
	[SerializeField]
	private MeshRenderer m_CutoutMeshRenderer;

	// Token: 0x04000FDC RID: 4060
	[SerializeField]
	private Transform m_Cutout;

	// Token: 0x04000FDD RID: 4061
	[SerializeField]
	private Transform m_CutoutStartPosition;

	// Token: 0x04000FDE RID: 4062
	[SerializeField]
	private Transform m_CutoutScarePosition;

	// Token: 0x04000FDF RID: 4063
	[SerializeField]
	private Transform m_CutoutEndPosition;

	// Token: 0x04000FE0 RID: 4064
	[Header("Ink")]
	[SerializeField]
	private GameObject m_ScareInk;

	// Token: 0x04000FE1 RID: 4065
	private Sequence m_CutoutSequence;

	// Token: 0x04000FE2 RID: 4066
	private AudioClip m_ValveClip;

	// Token: 0x04000FE3 RID: 4067
	private bool m_IsJumpscareReady;

	// Token: 0x04000FE4 RID: 4068
	private bool m_CanJumpscare;
}
