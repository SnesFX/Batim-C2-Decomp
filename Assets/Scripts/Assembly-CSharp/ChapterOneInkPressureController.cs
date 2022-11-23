using System;
using System.Collections.Generic;
using DG.Tweening;
using TMPro;
using UnityEngine;

// Token: 0x02000260 RID: 608
public class ChapterOneInkPressureController : BaseController
{
	// Token: 0x17000281 RID: 641
	// (get) Token: 0x06000CC1 RID: 3265 RVA: 0x000777D7 File Offset: 0x00075BD7
	public Interactable Interactable
	{
		get
		{
			return this.m_Interactable;
		}
	}

	// Token: 0x06000CC2 RID: 3266 RVA: 0x000777DF File Offset: 0x00075BDF
	public override void Init()
	{
		base.Init();
		this.m_InkPressureLbl.text = "INK PRESSURE";
		this.m_FlowLbl.text = "FLOW";
	}

	// Token: 0x06000CC3 RID: 3267 RVA: 0x00077807 File Offset: 0x00075C07
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_InkFlowButtonClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Ink_Flow_Buton_Press_01");
		this.m_Interactable.SetActive(false);
	}

	// Token: 0x06000CC4 RID: 3268 RVA: 0x00077830 File Offset: 0x00075C30
	public void Activate()
	{
		this.m_Interactable.SetActive(true);
		this.m_Interactable.OnInteracted += this.HandleInteractableOnInteracted;
	}

	// Token: 0x06000CC5 RID: 3269 RVA: 0x00077858 File Offset: 0x00075C58
	private void HandleInteractableOnInteracted(object sender, EventArgs e)
	{
		this.m_Interactable.OnInteracted -= this.HandleInteractableOnInteracted;
		GameManager.Instance.AudioManager.Play("Audio/Sounds/Effects/LightTurnOn", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_MainLight.enabled = true;
		GameManager.Instance.AudioManager.Play(this.m_InkFlowButtonClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_Button.DOLocalMove(new Vector3(0f, 0f, -0.15f), 0.4f, false).SetEase(Ease.OutBack);
		int count = this.m_InkPipes.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_InkPipes[i].TurnOn();
		}
		base.SendOnComplete();
	}

	// Token: 0x06000CC6 RID: 3270 RVA: 0x0007791B File Offset: 0x00075D1B
	protected override void OnDisposed()
	{
		this.m_InkFlowButtonClip = null;
		if (this.m_Interactable != null)
		{
			this.m_Interactable.OnInteracted -= this.HandleInteractableOnInteracted;
		}
		base.OnDisposed();
	}

	// Token: 0x04000EDD RID: 3805
	[Header("TextMeshPro")]
	[SerializeField]
	private TextMeshPro m_InkPressureLbl;

	// Token: 0x04000EDE RID: 3806
	[SerializeField]
	private TextMeshPro m_FlowLbl;

	// Token: 0x04000EDF RID: 3807
	[Header("Lever")]
	[SerializeField]
	private Interactable m_Interactable;

	// Token: 0x04000EE0 RID: 3808
	[SerializeField]
	private Transform m_Button;

	// Token: 0x04000EE1 RID: 3809
	[Header("Ink Pipes")]
	[SerializeField]
	private List<InkPipeController> m_InkPipes;

	// Token: 0x04000EE2 RID: 3810
	[Header("Light")]
	[SerializeField]
	private Light m_MainLight;

	// Token: 0x04000EE3 RID: 3811
	private AudioClip m_InkFlowButtonClip;
}
