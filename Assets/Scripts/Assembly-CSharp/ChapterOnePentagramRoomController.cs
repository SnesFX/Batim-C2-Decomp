using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using ScionEngine;
using UnityEngine;

// Token: 0x02000264 RID: 612
public class ChapterOnePentagramRoomController : BaseController
{
	// Token: 0x06000CE5 RID: 3301 RVA: 0x00078170 File Offset: 0x00076570
	public override void Init()
	{
		base.Init();
		for (int i = 0; i < this.m_InactiveGOs.Count; i++)
		{
			this.m_InactiveGOs[i].SetActive(false);
		}
		this.m_EventTrigger.SetActive(false);
	}

	// Token: 0x06000CE6 RID: 3302 RVA: 0x000781BD File Offset: 0x000765BD
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_HenryFaintClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Henry_Faint_Axe");
		this.m_PipeStressClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Pipes_Stress_01");
	}

	// Token: 0x06000CE7 RID: 3303 RVA: 0x000781EF File Offset: 0x000765EF
	public void Activate()
	{
		this.m_EventTrigger.SetActive(true);
		this.m_EventTrigger.OnEnter += this.HandleEventTriggerOnEnter;
	}

	// Token: 0x06000CE8 RID: 3304 RVA: 0x00078214 File Offset: 0x00076614
	private IEnumerator ConclusionSequence()
	{
		GameManager.Instance.Player.LockMovement();
		GameManager.Instance.AudioManager.Play(this.m_PipeStressClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_ConclusionController = GameManager.Instance.UIManager.Show<ChapterOneConclusionModalController>("UI/Modals/ChapterOneConclusionModalController", "MODAL", null);
		this.m_ConclusionController.ShowImage(0);
		GameManager.Instance.Player.transform.position = this.m_BasementWarpPosition.position;
		GameManager.Instance.Player.LookRotation(this.m_BasementWarpPosition.rotation, Quaternion.identity);
		this.ShowInkBasement();
		yield return new WaitForSeconds(1f);
		this.m_ConclusionController.ShowImage(1);
		GameManager.Instance.Player.transform.position = this.m_UpstairsWarpPosition.position;
		GameManager.Instance.Player.LookRotation(this.m_UpstairsWarpPosition.rotation, Quaternion.identity);
		yield return new WaitForSeconds(1f);
		this.m_ConclusionController.ShowImage(2);
		GameManager.Instance.Player.transform.position = this.m_BasementWarpPosition.position;
		GameManager.Instance.Player.LookRotation(this.m_BasementWarpPosition.rotation, Quaternion.identity);
		GameManager.Instance.Player.UnEquipWeapon();
		UnityEngine.Object.Destroy(GameManager.Instance.Player.WeaponGameObject);
		GameManager.Instance.HideCrosshair();
		this.ShowBasement();
		yield return new WaitForSeconds(1f);
		GameManager.Instance.GameCamera.transform.DOKill(false);
		this.ChapterEndSequence().OnComplete(new TweenCallback(base.SendOnComplete));
		yield break;
	}

	// Token: 0x06000CE9 RID: 3305 RVA: 0x00078230 File Offset: 0x00076630
	private Sequence ChapterEndSequence()
	{
		GameManager.Instance.Player.Lock();
		GameCamera gameCam = GameManager.Instance.GameCamera;
		GameManager.Instance.AudioManager.Play(this.m_HenryFaintClip, AudioObjectType.SOUND_EFFECT, 0, false);
		Sequence sequence = DOTween.Sequence();
		float num = 0f;
		if (gameCam.PostProcess.depthOfField)
		{
			gameCam.PostProcess.depthFocusMode = DepthFocusMode.ManualDistance;
			float distance = gameCam.PostProcess.focalDistance;
			sequence.Insert(num, DOTween.To(() => distance, delegate(float value)
			{
				distance = value;
			}, 0f, 0.5f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				gameCam.PostProcess.focalDistance = distance;
			}));
		}
		num += 0.4f;
		GameManager.Instance.ShowScreenBlocker(0.65f, num, null);
		sequence.Insert(num, GameManager.Instance.GameCamera.transform.DOMove(this.m_EndRotation.position, 0.95f, false).SetEase(Ease.InQuad));
		sequence.Insert(num, GameManager.Instance.GameCamera.transform.DORotateQuaternion(this.m_EndRotation.rotation, 1f).SetEase(Ease.InQuad));
		return sequence;
	}

	// Token: 0x06000CEA RID: 3306 RVA: 0x00078398 File Offset: 0x00076798
	private void ShowInkBasement()
	{
		for (int i = 0; i < this.m_ActiveGOs.Count; i++)
		{
			this.m_ActiveGOs[i].SetActive(false);
		}
		for (int j = 0; j < this.m_InactiveGOs.Count; j++)
		{
			this.m_InactiveGOs[j].SetActive(true);
		}
	}

	// Token: 0x06000CEB RID: 3307 RVA: 0x00078404 File Offset: 0x00076804
	private void ShowBasement()
	{
		for (int i = 0; i < this.m_ActiveGOs.Count; i++)
		{
			this.m_ActiveGOs[i].SetActive(true);
		}
		for (int j = 0; j < this.m_InactiveGOs.Count; j++)
		{
			this.m_InactiveGOs[j].SetActive(false);
		}
	}

	// Token: 0x06000CEC RID: 3308 RVA: 0x0007846D File Offset: 0x0007686D
	private void HandleEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_EventTrigger.OnEnter -= this.HandleEventTriggerOnEnter;
		base.StartCoroutine(this.ConclusionSequence());
	}

	// Token: 0x06000CED RID: 3309 RVA: 0x00078494 File Offset: 0x00076894
	protected override void OnDisposed()
	{
		this.m_EventTrigger.OnEnter -= this.HandleEventTriggerOnEnter;
		this.m_HenryFaintClip = null;
		this.m_PipeStressClip = null;
		if (this.m_ConclusionController != null)
		{
			this.m_ConclusionController.Dispose();
			this.m_ConclusionController = null;
		}
		base.OnDisposed();
	}

	// Token: 0x04000F00 RID: 3840
	[Header("Transforms")]
	[SerializeField]
	private Transform m_UpstairsWarpPosition;

	// Token: 0x04000F01 RID: 3841
	[SerializeField]
	private Transform m_BasementWarpPosition;

	// Token: 0x04000F02 RID: 3842
	[SerializeField]
	private Transform m_EndRotation;

	// Token: 0x04000F03 RID: 3843
	[SerializeField]
	private List<GameObject> m_ActiveGOs;

	// Token: 0x04000F04 RID: 3844
	[SerializeField]
	private List<GameObject> m_InactiveGOs;

	// Token: 0x04000F05 RID: 3845
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_EventTrigger;

	// Token: 0x04000F06 RID: 3846
	private ChapterOneConclusionModalController m_ConclusionController;

	// Token: 0x04000F07 RID: 3847
	private AudioClip m_HenryFaintClip;

	// Token: 0x04000F08 RID: 3848
	private AudioClip m_PipeStressClip;
}
