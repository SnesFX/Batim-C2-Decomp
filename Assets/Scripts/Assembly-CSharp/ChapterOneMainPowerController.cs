using System;
using System.Collections.Generic;
using DG.Tweening;
using TMPro;
using UnityEngine;

// Token: 0x02000261 RID: 609
public class ChapterOneMainPowerController : BaseController
{
	// Token: 0x17000282 RID: 642
	// (get) Token: 0x06000CC8 RID: 3272 RVA: 0x0007795A File Offset: 0x00075D5A
	public Interactable Interactable
	{
		get
		{
			return this.m_Interactable;
		}
	}

	// Token: 0x06000CC9 RID: 3273 RVA: 0x00077964 File Offset: 0x00075D64
	public override void Init()
	{
		base.Init();
		for (int i = 0; i < this.m_ActiveGameObjects.Count; i++)
		{
			this.m_ActiveGameObjects[i].SetActive(false);
		}
		this.m_MainPowerLbl.text = "MAIN POWER";
		this.m_CautionLbl.text = "CAUTION";
		this.SetScreenLabel("LOW\n<size=65%>PRESSURE</size>", 0.5f, 0.25f);
		this.m_Interactable.SetActive(false);
		this.m_theMeatlyEventTrigger.SetActive(false);
	}

	// Token: 0x06000CCA RID: 3274 RVA: 0x000779F2 File Offset: 0x00075DF2
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_LeverClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Mainr_Power_Lever_Turn_On_01");
		this.m_TheMeatlyClip = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterOne/Henry/DIA_Player_07");
	}

	// Token: 0x06000CCB RID: 3275 RVA: 0x00077A24 File Offset: 0x00075E24
	public void Activate()
	{
		this.m_Interactable.SetActive(true);
		this.m_Interactable.OnInteracted += this.HandleInteractableOnInteracted;
		this.SetScreenLabel("READY", 0.5f, 0.25f);
	}

	// Token: 0x06000CCC RID: 3276 RVA: 0x00077A60 File Offset: 0x00075E60
	private void HandleInteractableOnInteracted(object sender, EventArgs e)
	{
		this.m_Interactable.OnInteracted -= this.HandleInteractableOnInteracted;
		GameManager.Instance.AudioManager.Play(this.m_LeverClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_Lever.DOLocalRotateQuaternion(this.m_FinalRotation.rotation, 0.75f).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.HandleLeverRotationOnComplete));
	}

	// Token: 0x06000CCD RID: 3277 RVA: 0x00077AD4 File Offset: 0x00075ED4
	private void HandleLeverRotationOnComplete()
	{
		this.SetScreenLabel("RUNNING", 0.25f, 0.15f);
		int count = this.m_ActiveGameObjects.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_ActiveGameObjects[i].SetActive(true);
		}
		int count2 = this.m_InkPipes.Count;
		for (int j = 0; j < count2; j++)
		{
			this.m_InkPipes[j].TurnOn();
		}
		this.m_InkMachineController.TurnOn();
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Light_Switch_Sammys_Room_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_LightController.TurnOff();
		this.m_theMeatlyCollider.enabled = false;
		this.m_theMeatlyEventTrigger.SetActive(true);
		this.m_theMeatlyEventTrigger.OnEnter += this.HandleTheMeatlyEventTriggerOnEnter;
		base.SendOnComplete();
	}

	// Token: 0x06000CCE RID: 3278 RVA: 0x00077BB8 File Offset: 0x00075FB8
	private void HandleTheMeatlyEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_theMeatlyEventTrigger.OnEnter -= this.HandleTheMeatlyEventTriggerOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_TheMeatlyClip, "What the heck is this?", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.AchievementManager.SetAchievement(AchievementName.THE_CREATOR);
		};
	}

	// Token: 0x06000CCF RID: 3279 RVA: 0x00077C1C File Offset: 0x0007601C
	public void SetScreenLabel(string label, float duration = 0.5f, float delay = 0.25f)
	{
		this.m_ScreenLbl.DOKill(false);
		this.m_ScreenLbl.text = label;
		this.m_ScreenLbl.alpha = 1f;
		this.m_ScreenLbl.DOFade(0.25f, duration).SetDelay(delay).SetLoops(-1, LoopType.Yoyo).SetEase(Ease.InOutQuad);
	}

	// Token: 0x06000CD0 RID: 3280 RVA: 0x00077C78 File Offset: 0x00076078
	protected override void OnDisposed()
	{
		this.m_ScreenLbl.DOKill(false);
		this.m_LeverClip = null;
		this.m_TheMeatlyClip = null;
		if (this.m_Interactable != null)
		{
			this.m_Interactable.OnInteracted -= this.HandleInteractableOnInteracted;
		}
		if (this.m_theMeatlyEventTrigger != null)
		{
			this.m_theMeatlyEventTrigger.OnEnter -= this.HandleTheMeatlyEventTriggerOnEnter;
		}
		base.OnDisposed();
	}

	// Token: 0x04000EE4 RID: 3812
	[Header("GameObjects")]
	[SerializeField]
	private List<GameObject> m_ActiveGameObjects;

	// Token: 0x04000EE5 RID: 3813
	[Header("Transforms")]
	[SerializeField]
	private Transform m_FinalRotation;

	// Token: 0x04000EE6 RID: 3814
	[Header("TextMeshPro")]
	[SerializeField]
	private TextMeshPro m_MainPowerLbl;

	// Token: 0x04000EE7 RID: 3815
	[SerializeField]
	private TextMeshPro m_CautionLbl;

	// Token: 0x04000EE8 RID: 3816
	[SerializeField]
	private TextMeshPro m_ScreenLbl;

	// Token: 0x04000EE9 RID: 3817
	[Header("Lever")]
	[SerializeField]
	private Interactable m_Interactable;

	// Token: 0x04000EEA RID: 3818
	[SerializeField]
	private Transform m_Lever;

	// Token: 0x04000EEB RID: 3819
	[Header("Ink Pipes")]
	[SerializeField]
	private List<InkPipeController> m_InkPipes;

	// Token: 0x04000EEC RID: 3820
	[Header("Light Fixtures")]
	[SerializeField]
	private LightFixtureController m_LightController;

	// Token: 0x04000EED RID: 3821
	[Header("Ink Machine")]
	[SerializeField]
	private InkMachineController m_InkMachineController;

	// Token: 0x04000EEE RID: 3822
	[Header("theMeatly")]
	[SerializeField]
	private Collider m_theMeatlyCollider;

	// Token: 0x04000EEF RID: 3823
	[SerializeField]
	private EventTrigger m_theMeatlyEventTrigger;

	// Token: 0x04000EF0 RID: 3824
	private AudioClip m_LeverClip;

	// Token: 0x04000EF1 RID: 3825
	private AudioClip m_TheMeatlyClip;
}
