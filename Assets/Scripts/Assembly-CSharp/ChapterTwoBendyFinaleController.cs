using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200026B RID: 619
public class ChapterTwoBendyFinaleController : BaseController
{
	// Token: 0x06000D2E RID: 3374 RVA: 0x00079E17 File Offset: 0x00078217
	public override void Init()
	{
		base.Init();
		this.m_BendyTrigger.SetActive(false);
		this.m_BarricadeTrigger.SetActive(false);
		this.m_BlockerCollider.SetActive(false);
		this.m_InitialAmbientLighting = RenderSettings.ambientLight;
	}

	// Token: 0x06000D2F RID: 3375 RVA: 0x00079E50 File Offset: 0x00078250
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_BendyFootstepClips = GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Bendy/Loud");
		this.m_BendyRevealClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_BendyAppearsFromInk");
		this.m_Target = GameManager.Instance.Player.transform;
	}

	// Token: 0x06000D30 RID: 3376 RVA: 0x00079EAC File Offset: 0x000782AC
	public void Activate()
	{
		this.m_BendyTrigger.SetActive(true);
		this.m_BendyTrigger.OnEnter += this.HandleBendyOnEntered;
	}

	// Token: 0x06000D31 RID: 3377 RVA: 0x00079ED4 File Offset: 0x000782D4
	private void Update()
	{
		if (!this.m_IsBendyActive || this.m_IsClose || this.m_IsBendyGone)
		{
			return;
		}
		Vector3 position = this.m_Bendy.position;
		position.y = this.m_Target.position.y;
		Color ambientLight = RenderSettings.ambientLight;
		float num = ambientLight.r;
		float num2 = ambientLight.b;
		float num3 = ambientLight.g;
		if (!this.m_IsSafe && Vector3.Distance(this.m_Target.position, position) < 7.5f)
		{
			this.OnDeath();
		}
		if (Vector3.Distance(this.m_Target.position, position) < 15.5f)
		{
			this.RemoveAmbience(ref num, ref num3, ref num2);
		}
		else
		{
			this.AddAmbience(ref num, ref num3, ref num2);
		}
		num = Mathf.Clamp(num, 0f, this.m_InitialAmbientLighting.r);
		num2 = Mathf.Clamp(num2, 0f, this.m_InitialAmbientLighting.b);
		num3 = Mathf.Clamp(num3, 0f, this.m_InitialAmbientLighting.g);
		RenderSettings.ambientLight = new Color(num, num3, num2);
	}

	// Token: 0x06000D32 RID: 3378 RVA: 0x0007A005 File Offset: 0x00078405
	private void AddAmbience(ref float r, ref float g, ref float b)
	{
		r += 0.005f;
		b += 0.005f;
		g += 0.005f;
	}

	// Token: 0x06000D33 RID: 3379 RVA: 0x0007A025 File Offset: 0x00078425
	private void RemoveAmbience(ref float r, ref float g, ref float b)
	{
		r -= 0.005f;
		b -= 0.005f;
		g -= 0.005f;
	}

	// Token: 0x06000D34 RID: 3380 RVA: 0x0007A048 File Offset: 0x00078448
	private void OnDeath()
	{
		this.m_IsClose = true;
		this.m_MoveSequence.Kill(false);
		GameManager.Instance.ShowScreenBlocker(0f, 0f, null);
		this.m_MusicAudioObject.Clear();
		this.m_MusicAudioObject = null;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_ChapterOneBendyAppears", AudioObjectType.SOUND_EFFECT, 0, false).OnComplete += delegate(object sender, EventArgs e)
		{
			GameManager.Instance.hasChapterTwo_SavePoint = true;
			DOTweenUtil.DOAudioListenerVolume(0f, 1f, delegate
			{
				GameManager.Instance.ReloadChapter("ChapterTwo");
			});
		};
	}

	// Token: 0x06000D35 RID: 3381 RVA: 0x0007A0C8 File Offset: 0x000784C8
	private void HandleBendyOnEntered(object sender, EventArgs e)
	{
		if (this.m_BendyRenderer.isVisible)
		{
			GameManager.Instance.LockPause();
			this.m_IsBendyActive = true;
			this.m_BendyTrigger.OnEnter -= this.HandleBendyOnEntered;
			this.m_BendyTrigger.Dispose();
			this.m_ExitTrigger.SetActive(true);
			this.m_ExitTrigger.OnEnter += this.HandleExitTriggerOnEntered;
			for (int i = 0; i < this.m_InkFloors.Count; i++)
			{
				this.m_InkFloors[i].ShowInk();
			}
			this.m_InkDissolveMaterial.SetFloat("_DissolveAmount", 1f);
			this.m_InkDissolveMaterial.DOKill(false);
			this.m_InkDissolveMaterial.DOFloat(0.36f, "_DissolveAmount", 7.5f);
			for (int j = 0; j < this.m_ActiveGameObjects.Count; j++)
			{
				GameObject gameObject = this.m_ActiveGameObjects[j];
				gameObject.SetActive(!gameObject.activeSelf);
			}
			GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Ceiling_Collapse_02", this.m_CollapseAudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
			GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Ceiling_Settle_02", AudioObjectType.SOUND_EFFECT, 0, false);
			this.m_BendyAnimator.SetBool("WasSeen", true);
			this.m_BendyRenderer.gameObject.layer = LayerMask.NameToLayer("Default");
			GameManager.Instance.AudioManager.Play(this.m_BendyRevealClip, AudioObjectType.SOUND_EFFECT, 0, false);
			this.m_MusicAudioObject = GameManager.Instance.AudioManager.Play("Audio/MUS/MUS_Little_Devil_Darling_Loop_01", AudioObjectType.SOUND_EFFECT, 0, false);
			this.m_MusicAudioObject.AudioSource.volume = 0f;
			this.m_MusicAudioObject.AudioSource.DOFade(1f, 1.5f);
			this.DOChaseSequence().OnComplete(new TweenCallback(this.HandleBendyChaseOnComplete));
		}
	}

	// Token: 0x06000D36 RID: 3382 RVA: 0x0007A2C4 File Offset: 0x000786C4
	private Sequence DOChaseSequence()
	{
		float num = 1f;
		float num2 = 3.15f;
		this.m_MoveSequence = DOTween.Sequence();
		this.m_MoveSequence.InsertCallback(num, delegate
		{
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "RUN AWAY", string.Empty, 3f, false));
		});
		num += 2f;
		this.m_MoveSequence.InsertCallback(num, delegate
		{
			this.m_HeadController.Activate();
			this.m_BendyAnimator.SetBool("CanRun", true);
		});
		for (int i = 0; i < 23; i++)
		{
			this.m_MoveSequence.InsertCallback(num + (float)i * 0.41f, new TweenCallback(this.PlayFootStepAudio));
		}
		int count = this.m_Waypoints.Count;
		for (int j = 0; j < count; j++)
		{
			int num3 = j + 1;
			Vector3 position = this.m_Waypoints[j].position;
			this.m_MoveSequence.Insert(num, this.m_Bendy.DOMove(position, num2, false).SetEase(Ease.Linear));
			if (num3 < count)
			{
				Vector3 position2 = this.m_Waypoints[num3].position;
				position2.y = this.m_Bendy.transform.position.y;
				this.m_MoveSequence.Insert(num + (num2 - 0.75f), this.m_Bendy.DOLookAt(position2, 1f, AxisConstraint.None, null).SetEase(Ease.Linear));
			}
			num += num2;
		}
		return this.m_MoveSequence;
	}

	// Token: 0x06000D37 RID: 3383 RVA: 0x0007A444 File Offset: 0x00078844
	private void HandleBendyChaseOnComplete()
	{
		if (this.m_IsSafe)
		{
			GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_BendyAtTheDoor", this.m_DoorBangAudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null).OnComplete += this.HandleBendyAtTheDoorOnComplete;
		}
		else
		{
			this.OnDeath();
		}
	}

	// Token: 0x06000D38 RID: 3384 RVA: 0x0007A49C File Offset: 0x0007889C
	private void HandleBendyAtTheDoorOnComplete(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleBendyAtTheDoorOnComplete;
		this.m_Bendy.DOMove(this.m_Waypoints[1].position, 8f, false).OnComplete(delegate
		{
			this.m_IsBendyGone = true;
		});
	}

	// Token: 0x06000D39 RID: 3385 RVA: 0x0007A4F4 File Offset: 0x000788F4
	private void HandleExitTriggerOnEntered(object sender, EventArgs e)
	{
		this.m_ExitTrigger.OnEnter -= this.HandleExitTriggerOnEntered;
		this.m_DoorController.Open(1f, 125f);
		this.m_BarricadeTrigger.SetActive(true);
		this.m_BarricadeTrigger.OnEnter += this.HandleBarricadeTriggerOnEnter;
	}

	// Token: 0x06000D3A RID: 3386 RVA: 0x0007A550 File Offset: 0x00078950
	private void HandleBarricadeTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_BarricadeTrigger.OnEnter -= this.HandleBarricadeTriggerOnEnter;
		GameManager.Instance.Player.LockRun();
		this.m_IsSafe = true;
		GameManager.Instance.hasChapterTwo_SavePoint = false;
		this.m_BlockerCollider.SetActive(true);
		GameManager.Instance.AudioManager.Play("Audio/SFX/Door/SFX_Door_Slam_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_DoorController.SetSilent(true);
		this.m_DoorController.Close(0.25f, Ease.Linear, new Action(this.HandleDoorCloseOnComplete));
		this.m_MusicAudioObject.AudioSource.DOFade(0f, 3f).OnComplete(delegate
		{
			this.m_MusicAudioObject.Clear();
			this.m_MusicAudioObject = null;
		});
	}

	// Token: 0x06000D3B RID: 3387 RVA: 0x0007A610 File Offset: 0x00078A10
	private void HandleDoorCloseOnComplete()
	{
		this.m_Bendy.gameObject.SetActive(false);
		this.m_DoorController.Lock();
		GameManager.Instance.AudioManager.Play("Audio/MUS/MUS_Horror_Cue_02", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_PlankBarricade.DOLocalRotate(Vector3.zero, 0.75f, RotateMode.Fast).SetEase(Ease.OutBounce).OnComplete(delegate
		{
			GameManager.Instance.AchievementManager.SetAchievement(AchievementName.THE_BELIEVER);
		});
		base.SendOnComplete();
	}

	// Token: 0x06000D3C RID: 3388 RVA: 0x0007A698 File Offset: 0x00078A98
	private void PlayFootStepAudio()
	{
		if (this.m_BendyFootstepClips == null || this.m_BendyFootstepClips.Length <= 0)
		{
			return;
		}
		int num = UnityEngine.Random.Range(0, this.m_BendyFootstepClips.Length);
		AudioClip audioClip = this.m_BendyFootstepClips[num];
		GameManager.Instance.GameCamera.transform.DOShakePosition(0.25f, 0.15f, 12, 90f, false, true);
		GameManager.Instance.AudioManager.Play(audioClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_BendyFootstepClips[num] = this.m_BendyFootstepClips[0];
		this.m_BendyFootstepClips[0] = audioClip;
	}

	// Token: 0x06000D3D RID: 3389 RVA: 0x0007A72C File Offset: 0x00078B2C
	protected override void OnDisposed()
	{
		this.m_BendyTrigger.OnEnter -= this.HandleBendyOnEntered;
		this.m_InkDissolveMaterial.SetFloat("_DissolveAmount", 1f);
		this.m_InkDissolveMaterial.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x04000F4C RID: 3916
	private const string DISSOLVE_AMOUNT = "_DissolveAmount";

	// Token: 0x04000F4D RID: 3917
	[Header("Transforms")]
	[SerializeField]
	private Transform m_PlankBarricade;

	// Token: 0x04000F4E RID: 3918
	[SerializeField]
	private Transform m_CollapseAudioPosition;

	// Token: 0x04000F4F RID: 3919
	[SerializeField]
	private Transform m_DoorBangAudioPosition;

	// Token: 0x04000F50 RID: 3920
	[Header("GameObjects")]
	[SerializeField]
	private List<GameObject> m_ActiveGameObjects;

	// Token: 0x04000F51 RID: 3921
	[SerializeField]
	private GameObject m_BlockerCollider;

	// Token: 0x04000F52 RID: 3922
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_BendyTrigger;

	// Token: 0x04000F53 RID: 3923
	[SerializeField]
	private EventTrigger m_ExitTrigger;

	// Token: 0x04000F54 RID: 3924
	[SerializeField]
	private EventTrigger m_BarricadeTrigger;

	// Token: 0x04000F55 RID: 3925
	[Header("Materials")]
	[SerializeField]
	private Material m_InkDissolveMaterial;

	// Token: 0x04000F56 RID: 3926
	[Header("Ink Floors")]
	[SerializeField]
	private List<InkedFloor> m_InkFloors;

	// Token: 0x04000F57 RID: 3927
	[Header("Doors")]
	[SerializeField]
	private DoorController m_DoorController;

	// Token: 0x04000F58 RID: 3928
	[Header("Light Fixture")]
	[SerializeField]
	private LightFixtureController m_LightController;

	// Token: 0x04000F59 RID: 3929
	[Header("Bendy")]
	[SerializeField]
	private Transform m_Bendy;

	// Token: 0x04000F5A RID: 3930
	[SerializeField]
	private SkinnedMeshRenderer m_BendyRenderer;

	// Token: 0x04000F5B RID: 3931
	[SerializeField]
	private Animator m_BendyAnimator;

	// Token: 0x04000F5C RID: 3932
	[Header("Waypoints")]
	[SerializeField]
	private List<Transform> m_Waypoints;

	// Token: 0x04000F5D RID: 3933
	[Header("Head Controller")]
	[SerializeField]
	private CharacterHeadController m_HeadController;

	// Token: 0x04000F5E RID: 3934
	private Sequence m_MoveSequence;

	// Token: 0x04000F5F RID: 3935
	private AudioClip[] m_BendyFootstepClips;

	// Token: 0x04000F60 RID: 3936
	private AudioClip m_BendyRevealClip;

	// Token: 0x04000F61 RID: 3937
	private AudioObject m_MusicAudioObject;

	// Token: 0x04000F62 RID: 3938
	private Transform m_Target;

	// Token: 0x04000F63 RID: 3939
	private Color m_InitialAmbientLighting;

	// Token: 0x04000F64 RID: 3940
	private bool m_IsBendyActive;

	// Token: 0x04000F65 RID: 3941
	private bool m_IsClose;

	// Token: 0x04000F66 RID: 3942
	private bool m_IsSafe;

	// Token: 0x04000F67 RID: 3943
	private bool m_IsBendyGone;
}
