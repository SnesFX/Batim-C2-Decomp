using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using ScionEngine;
using UnityEngine;

// Token: 0x0200027C RID: 636
public class ChapterTwoSammyOfficeController : BaseController
{
	// Token: 0x06000E12 RID: 3602 RVA: 0x0007F12C File Offset: 0x0007D52C
	public override void Init()
	{
		base.Init();
		for (int i = 0; i < this.m_Pipes.Count; i++)
		{
			this.m_Pipes[i].TurnOff();
		}
		this.m_LightController.TurnOff();
		this.m_WindowEventTrigger.OnEnter += this.HandleWindowEventTriggerOnEnter;
		this.m_TheMeatlyEvent.SetActive(false);
		this.m_KnockoutEventTrigger.SetActive(false);
		this.m_Lever.SetActive(false);
		this.m_LightEventTrigger.SetActive(false);
		this.m_Sammy.SetActive(false);
	}

	// Token: 0x06000E13 RID: 3603 RVA: 0x0007F1CA File Offset: 0x0007D5CA
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_KnockoutClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Henry_HitOnHead");
	}

	// Token: 0x06000E14 RID: 3604 RVA: 0x0007F1E8 File Offset: 0x0007D5E8
	public void Activate()
	{
		this.m_Lever.SetActive(true);
		this.m_Lever.OnInteracted += this.HandleLeverOnInteracted;
		this.m_LightEventTrigger.SetActive(true);
		this.m_LightEventTrigger.OnEnter += this.HandleLightEventTriggerOnEntered;
	}

	// Token: 0x06000E15 RID: 3605 RVA: 0x0007F23C File Offset: 0x0007D63C
	private void HandleWindowEventTriggerOnEnter(object sender, EventArgs e)
	{
		if (this.m_LeverMeshRenderer.isVisible)
		{
			this.m_WindowEventTrigger.OnEnter -= this.HandleWindowEventTriggerOnEnter;
			this.m_WindowEventTrigger.Dispose();
			GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_07", "Well there is the pump switch alright.\nBut that is one hell of a leak blocking the door\nthough. If I could just stop that ink from flowing,\nmaybe I can get in.", false));
		}
	}

	// Token: 0x06000E16 RID: 3606 RVA: 0x0007F296 File Offset: 0x0007D696
	private void HandleLightEventTriggerOnEntered(object sender, EventArgs e)
	{
		this.m_LightEventTrigger.OnEnter -= this.HandleLightEventTriggerOnEntered;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Light_Switch_Sammys_Room_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_LightController.TurnOn();
	}

	// Token: 0x06000E17 RID: 3607 RVA: 0x0007F2D4 File Offset: 0x0007D6D4
	private void HandleLeverOnInteracted(object sender, EventArgs e)
	{
		this.m_Lever.OnInteracted -= this.HandleLeverOnInteracted;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Mainr_Power_Lever_Turn_On_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_LeverHandle.DORotateQuaternion(this.m_FinalRotation.rotation, 0.75f).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.HandleLeverRotationOnComplete));
	}

	// Token: 0x06000E18 RID: 3608 RVA: 0x0007F344 File Offset: 0x0007D744
	private void HandleLeverRotationOnComplete()
	{
		GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "TAKE THE STAIRS", string.Empty, 4f, false));
		for (int i = 0; i < this.m_Pipes.Count; i++)
		{
			this.m_Pipes[i].TurnOn();
		}
		this.m_TheMeatlyCollider.enabled = false;
		this.m_TheMeatlyEvent.SetActive(true);
		this.m_TheMeatlyEvent.OnEnter += this.HandleTheMeatlyEventOnEnter;
		this.m_KnockoutEventTrigger.SetActive(true);
		this.m_KnockoutEventTrigger.OnEnter += this.HandleKnockoutEventTriggerOnEnter;
	}

	// Token: 0x06000E19 RID: 3609 RVA: 0x0007F3F4 File Offset: 0x0007D7F4
	private void HandleKnockoutEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_KnockoutEventTrigger.OnEnter -= this.HandleKnockoutEventTriggerOnEnter;
		this.m_KnockoutEventTrigger.Dispose();
		GameManager.Instance.AudioManager.Play(this.m_KnockoutClip, AudioObjectType.SOUND_EFFECT, 0, false).OnComplete += this.HandleKnockoutClipOnComplete;
		this.DOKnockout();
	}

	// Token: 0x06000E1A RID: 3610 RVA: 0x0007F454 File Offset: 0x0007D854
	private void HandleKnockoutClipOnComplete(object sender, EventArgs e)
	{
		AudioObject audioObject = sender as AudioObject;
		audioObject.OnComplete -= this.HandleKnockoutClipOnComplete;
		base.StartCoroutine(this.DelayComplete());
	}

	// Token: 0x06000E1B RID: 3611 RVA: 0x0007F488 File Offset: 0x0007D888
	private IEnumerator DelayComplete()
	{
		yield return new WaitForSeconds(2.5f);
		base.SendOnComplete();
		yield break;
	}

	// Token: 0x06000E1C RID: 3612 RVA: 0x0007F4A4 File Offset: 0x0007D8A4
	private Sequence DOKnockout()
	{
		GameManager.Instance.Player.Lock();
		GameManager.Instance.GameCamera.transform.DOShakePosition(3f, 0.25f, 12, 90f, false, true);
		GameManager.Instance.Player.UnEquipWeapon();
		UnityEngine.Object.Destroy(GameManager.Instance.Player.WeaponGameObject);
		GameManager.Instance.HideCrosshair();
		Sequence sequence = DOTween.Sequence();
		sequence.InsertCallback(0f, delegate
		{
			GameManager.Instance.ShowScreenBlocker(0f, 0f, null);
		});
		GameCamera gameCam = GameManager.Instance.GameCamera;
		if (gameCam.PostProcess.depthOfField)
		{
			sequence.InsertCallback(0f, delegate
			{
				gameCam.PostProcess.depthFocusMode = DepthFocusMode.ManualDistance;
				gameCam.PostProcess.focalDistance = 0f;
			});
			float distance = 0f;
			sequence.Insert(1.5f, DOTween.To(() => distance, delegate(float value)
			{
				distance = value;
			}, 1f, 1f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				gameCam.PostProcess.focalDistance = distance;
			}));
			distance = gameCam.PostProcess.focalDistance;
			sequence.Insert(2.5f, DOTween.To(() => distance, delegate(float value)
			{
				distance = value;
			}, 0f, 1f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				gameCam.PostProcess.focalDistance = distance;
			}));
		}
		sequence.InsertCallback(0.1f, delegate
		{
			GameManager.Instance.HideScreenBlocker(1.5f, 0f, null);
		});
		sequence.InsertCallback(2f, delegate
		{
			GameManager.Instance.ShowScreenBlocker(0.5f, 0f, null);
			GameManager.Instance.GameCamera.Camera.transform.DOMove(this.m_KnockoutPosition.position, 1f, false);
			GameManager.Instance.GameCamera.Camera.transform.DORotateQuaternion(this.m_KnockoutPosition.rotation, 1f);
		});
		sequence.InsertCallback(3.5f, delegate
		{
			this.m_SammyRenderer.gameObject.layer = LayerMask.NameToLayer("Default");
			this.m_Sammy.SetActive(true);
			GameManager.Instance.HideScreenBlocker(1.5f, 0f, null);
		});
		if (gameCam.PostProcess.depthOfField)
		{
			float distance = 0f;
			sequence.Insert(6f, DOTween.To(() => distance, delegate(float value)
			{
				distance = value;
			}, 1f, 1f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				gameCam.PostProcess.focalDistance = distance;
			}));
			distance = gameCam.PostProcess.focalDistance;
			sequence.Insert(7f, DOTween.To(() => distance, delegate(float value)
			{
				distance = value;
			}, 0f, 0.5f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				gameCam.PostProcess.focalDistance = distance;
			}));
		}
		sequence.InsertCallback(7.3f, delegate
		{
			GameManager.Instance.ShowScreenBlocker(0.25f, 0f, null);
		});
		return sequence;
	}

	// Token: 0x06000E1D RID: 3613 RVA: 0x0007F7AC File Offset: 0x0007DBAC
	private void HandleTheMeatlyEventOnEnter(object sender, EventArgs e)
	{
		this.m_TheMeatlyEvent.OnEnter -= this.HandleTheMeatlyEventOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_07", "What the heck is this?", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.AchievementManager.SetAchievement(AchievementName.MAN_BEHIND_THE_CURTAIN);
		};
	}

	// Token: 0x06000E1E RID: 3614 RVA: 0x0007F80C File Offset: 0x0007DC0C
	protected override void OnDisposed()
	{
		if (this.m_KnockoutEventTrigger != null)
		{
			this.m_KnockoutEventTrigger.OnEnter -= this.HandleKnockoutEventTriggerOnEnter;
		}
		if (this.m_LightEventTrigger != null)
		{
			this.m_LightEventTrigger.OnEnter -= this.HandleLightEventTriggerOnEntered;
		}
		if (this.m_WindowEventTrigger != null)
		{
			this.m_WindowEventTrigger.OnEnter -= this.HandleWindowEventTriggerOnEnter;
		}
		base.OnDisposed();
	}

	// Token: 0x04001037 RID: 4151
	[Header("Transforms")]
	[SerializeField]
	private Transform m_LeverHandle;

	// Token: 0x04001038 RID: 4152
	[SerializeField]
	private Transform m_FinalRotation;

	// Token: 0x04001039 RID: 4153
	[SerializeField]
	private Transform m_KnockoutPosition;

	// Token: 0x0400103A RID: 4154
	[Header("Interactables")]
	[SerializeField]
	private Interactable m_Lever;

	// Token: 0x0400103B RID: 4155
	[Header("Pipes")]
	[SerializeField]
	private List<InkPipeController> m_Pipes;

	// Token: 0x0400103C RID: 4156
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_KnockoutEventTrigger;

	// Token: 0x0400103D RID: 4157
	[SerializeField]
	private EventTrigger m_LightEventTrigger;

	// Token: 0x0400103E RID: 4158
	[SerializeField]
	private EventTrigger m_WindowEventTrigger;

	// Token: 0x0400103F RID: 4159
	[Header("Light Fixture")]
	[SerializeField]
	private LightFixtureController m_LightController;

	// Token: 0x04001040 RID: 4160
	[Header("Sammy")]
	[SerializeField]
	private GameObject m_Sammy;

	// Token: 0x04001041 RID: 4161
	[SerializeField]
	private SkinnedMeshRenderer m_SammyRenderer;

	// Token: 0x04001042 RID: 4162
	[Header("Renderer")]
	[SerializeField]
	private MeshRenderer m_LeverMeshRenderer;

	// Token: 0x04001043 RID: 4163
	[Header("TheMeatly")]
	[SerializeField]
	private EventTrigger m_TheMeatlyEvent;

	// Token: 0x04001044 RID: 4164
	[SerializeField]
	private Collider m_TheMeatlyCollider;

	// Token: 0x04001045 RID: 4165
	private AudioClip m_KnockoutClip;
}
