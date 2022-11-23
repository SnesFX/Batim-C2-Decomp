using System;
using System.Collections.Generic;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using ScionEngine;
using UnityEngine;

// Token: 0x0200027A RID: 634
public class ChapterTwoSammyFinaleChallenge : BaseController
{
	// Token: 0x06000DF1 RID: 3569 RVA: 0x0007E0BE File Offset: 0x0007C4BE
	public override void Init()
	{
		base.Init();
		this.m_LightController.TurnOff();
		this.m_SammysDoor.Open(0f, 85f);
		this.m_SammyInk.gameObject.SetActive(false);
	}

	// Token: 0x06000DF2 RID: 3570 RVA: 0x0007E0F8 File Offset: 0x0007C4F8
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_SammyFootstepClips = GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Sammy/Wood");
		this.m_MonologueClips = GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/");
		this.m_SpeakerMonologueClips = GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/");
		this.m_MusicLittleDevilClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/MUS/MUS_Little_Devil_Darling_Loop_01");
		this.m_SammyMonologueBGClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/DIA/ChapterTwo/DIA_Sammy_Finale_BG_Audio_02");
	}

	// Token: 0x06000DF3 RID: 3571 RVA: 0x0007E190 File Offset: 0x0007C590
	public void Activate()
	{
		GameManager.Instance.Player.Unlock();
		GameManager.Instance.Player.LockMovement();
		GameManager.Instance.Player.transform.SetParent(this.m_TiedUpPosition);
		GameManager.Instance.Player.LookRotation(Quaternion.identity, Quaternion.identity);
		GameManager.Instance.Player.LockRotation(50f, 25f);
		GameManager.Instance.Player.transform.localPosition = Vector3.zero;
		GameManager.Instance.Player.transform.localEulerAngles = new Vector3(0f, 0f, 0f);
		GameManager.Instance.GameCamera.Camera.transform.localPosition = Vector3.zero;
		GameManager.Instance.GameCamera.Camera.transform.localEulerAngles = Vector3.zero;
		Sequence s = DOTween.Sequence();
		GameCamera gameCam = GameManager.Instance.GameCamera;
		s.InsertCallback(0.75f, delegate
		{
			GameManager.Instance.HideScreenBlocker(2f, 0f, null);
		});
		s.InsertCallback(3.2f, delegate
		{
			GameManager.Instance.ShowScreenBlocker(1f, 0f, null);
		});
		s.InsertCallback(4.3f, delegate
		{
			GameManager.Instance.HideScreenBlocker(1f, 0f, null);
		});
		if (gameCam.PostProcess.depthOfField)
		{
			float distance = gameCam.PostProcess.focalDistance;
			s.Insert(2.5f, DOTween.To(() => distance, delegate(float value)
			{
				distance = value;
			}, 1f, 2f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				gameCam.PostProcess.focalDistance = distance;
			}));
			s.InsertCallback(4.5f, delegate
			{
				gameCam.PostProcess.depthFocusMode = DepthFocusMode.PointAverage;
			});
		}
		int num = this.m_MonologueClips.Length;
		int num2 = 7;
		for (int i = 0; i < num; i++)
		{
			AudioObject audioObject = GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_MonologueClips[i], SubtitleConstants.DIALOGUE_CHAPTER_TWO_SAMMY_FINALE_MONOLOGUE[i], true));
			if (i == num - 1)
			{
				audioObject.OnComplete += this.HandleMonologueOnComplete;
			}
			else if (i == num2)
			{
				audioObject.OnComplete += this.HandleDuctCrawlingAudio;
			}
		}
	}

	// Token: 0x06000DF4 RID: 3572 RVA: 0x0007E438 File Offset: 0x0007C838
	private void HandleDuctCrawlingAudio(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleDuctCrawlingAudio;
		GameManager.Instance.AudioManager.Play("Audio/SFX/FOL_Duct_Crawling_01", AudioObjectType.SOUND_EFFECT, 0, false);
	}

	// Token: 0x06000DF5 RID: 3573 RVA: 0x0007E46C File Offset: 0x0007C86C
	private void HandleMonologueOnComplete(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleMonologueOnComplete;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Rope_Stress_01", AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.GameCamera.Camera.DOShakePosition(2f, 0.15f, 10, 90f, false).OnComplete(delegate
		{
			GameManager.Instance.GameCamera.Camera.DOShakePosition(2f, 0.15f, 10, 90f, false).SetDelay(1f);
		});
		Vector3 localPosition = this.m_Sammy.localPosition;
		localPosition.y = this.m_SammyEndPosition.localPosition.y;
		this.m_SammyAnimator.SetBool("Walk", true);
		Sequence sequence = DOTween.Sequence();
		sequence.Insert(0f, this.m_Sammy.DOLookAt(this.m_SammyEndPosition.position, 0.45f, AxisConstraint.None, null));
		sequence.Insert(0f, this.m_Sammy.DOLocalMoveY(localPosition.y, 0.35f, false).SetEase(Ease.InOutQuad));
		for (int i = 0; i < 9; i++)
		{
			sequence.InsertCallback((float)i * 0.72f, new TweenCallback(this.PlayFootStepAudio));
		}
		sequence.Insert(0f, this.m_Sammy.DOMoveX(this.m_SammyEndPosition.position.x, 6.5f, false).SetEase(Ease.Linear));
		sequence.Insert(0f, this.m_Sammy.DOMoveZ(this.m_SammyEndPosition.position.z, 6.5f, false).SetEase(Ease.Linear));
		sequence.InsertCallback(5.5f, new TweenCallback(this.m_SammysDoor.Close));
		sequence.InsertCallback(5.5f, delegate
		{
			GameManager.Instance.AudioManager.Play("Audio/SFX/Door/SFX_Door_Generic_Close_01", AudioObjectType.SOUND_EFFECT, 0, false);
		});
		sequence.InsertCallback(6f, new TweenCallback(this.m_SammysDoor.Lock));
		sequence.OnComplete(new TweenCallback(this.HandleSammyExitOnComplete));
	}

	// Token: 0x06000DF6 RID: 3574 RVA: 0x0007E6A0 File Offset: 0x0007CAA0
	private void HandleSammyExitOnComplete()
	{
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Speaker_Tap_Feedback", AudioObjectType.SOUND_EFFECT, 0, false).OnComplete += this.HandleSpeakersOnComplete;
		for (int i = 0; i < this.m_Speakers.Count; i++)
		{
			this.m_Speakers[i].DOScaleZ(UnityEngine.Random.Range(1.03f, 1.05f), 0.25f).SetDelay(UnityEngine.Random.Range(0.05f, 0.15f)).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		}
	}

	// Token: 0x06000DF7 RID: 3575 RVA: 0x0007E738 File Offset: 0x0007CB38
	private void HandleSpeakersOnComplete(object sender, EventArgs e)
	{
		GameManager.Instance.AudioManager.Play(this.m_SammyMonologueBGClip, AudioObjectType.SOUND_EFFECT, 0, false);
		int num = this.m_SpeakerMonologueClips.Length;
		int num2 = 1;
		int num3 = num - 3;
		for (int i = 0; i < num; i++)
		{
			AudioObject audioObject = GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_SpeakerMonologueClips[i], SubtitleConstants.DIALOGUE_CHAPTER_TWO_SAMMY_FINALE_SPEAKER_MONOLOGUE[i], true));
			if (i == num2)
			{
				audioObject.OnComplete += this.HandleGateDoorOpen;
			}
			else if (i == num3)
			{
				audioObject.OnComplete += this.HandleMusicTrigger;
			}
			if (i == num - 1)
			{
				audioObject.OnComplete += this.HandleSpeakerMonologueOnComplete;
			}
		}
	}

	// Token: 0x06000DF8 RID: 3576 RVA: 0x0007E7F8 File Offset: 0x0007CBF8
	private void HandleGateDoorOpen(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleGateDoorOpen;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Rope_Stress_01", AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.GameCamera.Camera.DOShakePosition(2f, 0.15f, 10, 90f, false).OnComplete(delegate
		{
			GameManager.Instance.GameCamera.Camera.DOShakePosition(2f, 0.15f, 10, 90f, false).SetDelay(1f);
		});
		this.m_LightController.TurnOn();
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Gate_Open_Slow_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_GateDoor.DOLocalMoveY(9.75f, 8f, false).SetDelay(2f).SetEase(Ease.Linear);
	}

	// Token: 0x06000DF9 RID: 3577 RVA: 0x0007E8C8 File Offset: 0x0007CCC8
	private void HandleMusicTrigger(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleMusicTrigger;
		this.m_MusicAudioObject = GameManager.Instance.AudioManager.Play(this.m_MusicLittleDevilClip, AudioObjectType.MUSIC, -1, false);
		this.m_MusicAudioObject.AudioSource.volume = 0.1f;
		this.m_MusicAudioObject.AudioSource.DOFade(1f, 4f).SetEase(Ease.Linear).SetDelay(0.2f);
	}

	// Token: 0x06000DFA RID: 3578 RVA: 0x0007E94C File Offset: 0x0007CD4C
	private void HandleSpeakerMonologueOnComplete(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleSpeakerMonologueOnComplete;
		for (int i = 0; i < this.m_Speakers.Count; i++)
		{
			this.m_Speakers[i].DOKill(false);
		}
		this.m_SammyInk.gameObject.SetActive(true);
		this.m_SammyInk.DOScale(0f, 1f).From<Tweener>();
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Rope_Stress_Snap_02", AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.GameCamera.Camera.DOShakePosition(3f, 0.25f, 10, 90f, false).OnComplete(delegate
		{
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "ESCAPE BENDY", "TIP: USE THE AXE TO CLEAR YOUR PATH", 4f, false));
			GameManager.Instance.ShowCrosshair();
			GameManager.Instance.Player.UnlockMovement();
			GameManager.Instance.Player.UnlockRotation();
			for (int j = 0; j < this.m_Searchers.Count; j++)
			{
				this.m_Searchers[j].Activate();
			}
		});
		this.m_MusicEventTrigger.OnEnter += this.HandleMusicEventTriggerOnEnter;
	}

	// Token: 0x06000DFB RID: 3579 RVA: 0x0007EA34 File Offset: 0x0007CE34
	private void HandleMusicEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_MusicEventTrigger.OnEnter -= this.HandleMusicEventTriggerOnEnter;
		base.SendOnComplete();
		GameManager.Instance.AudioManager.Play("Audio/SFX/FOL_Duct_Crawling_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_MusicAudioObject.AudioSource.DOFade(0f, 8f).OnComplete(delegate
		{
			this.m_MusicAudioObject.Clear();
			this.m_MusicAudioObject = null;
		});
	}

	// Token: 0x06000DFC RID: 3580 RVA: 0x0007EAA4 File Offset: 0x0007CEA4
	private void PlayFootStepAudio()
	{
		if (this.m_SammyFootstepClips == null || this.m_SammyFootstepClips.Length <= 0)
		{
			return;
		}
		int num = UnityEngine.Random.Range(0, this.m_SammyFootstepClips.Length);
		AudioClip audioClip = this.m_SammyFootstepClips[num];
		GameManager.Instance.AudioManager.PlayAtPosition(audioClip, this.m_Sammy.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_SammyFootstepClips[num] = this.m_SammyFootstepClips[0];
		this.m_SammyFootstepClips[0] = audioClip;
	}

	// Token: 0x06000DFD RID: 3581 RVA: 0x0007EB1C File Offset: 0x0007CF1C
	protected override void OnDisposed()
	{
		this.m_GateDoor.DOKill(false);
		for (int i = 0; i < this.m_Speakers.Count; i++)
		{
			this.m_Speakers[i].DOKill(false);
		}
		if (this.m_MusicAudioObject != null)
		{
			this.m_MusicAudioObject.Clear();
			this.m_MusicAudioObject = null;
		}
		base.OnDisposed();
	}

	// Token: 0x04001013 RID: 4115
	private const float LOCK_VERTICAL = 25f;

	// Token: 0x04001014 RID: 4116
	private const float LOCK_HORIZONTAL = 50f;

	// Token: 0x04001015 RID: 4117
	[Header("Transforms")]
	[SerializeField]
	private Transform m_SammyInk;

	// Token: 0x04001016 RID: 4118
	[SerializeField]
	private Transform m_Sammy;

	// Token: 0x04001017 RID: 4119
	[SerializeField]
	private Transform m_SammyEndPosition;

	// Token: 0x04001018 RID: 4120
	[SerializeField]
	private Transform m_TiedUpPosition;

	// Token: 0x04001019 RID: 4121
	[SerializeField]
	private Transform m_GateDoor;

	// Token: 0x0400101A RID: 4122
	[SerializeField]
	private List<Transform> m_Speakers;

	// Token: 0x0400101B RID: 4123
	[Header("Animator")]
	[SerializeField]
	private Animator m_SammyAnimator;

	// Token: 0x0400101C RID: 4124
	[Header("Door")]
	[SerializeField]
	private DoorController m_SammysDoor;

	// Token: 0x0400101D RID: 4125
	[Header("Light Fixture")]
	[SerializeField]
	private LightFixtureController m_LightController;

	// Token: 0x0400101E RID: 4126
	[Header("Event Trigger")]
	[SerializeField]
	private EventTrigger m_MusicEventTrigger;

	// Token: 0x0400101F RID: 4127
	[Header("Searchers")]
	[SerializeField]
	private List<SearcherSpawnController> m_Searchers;

	// Token: 0x04001020 RID: 4128
	private AudioClip[] m_SammyFootstepClips;

	// Token: 0x04001021 RID: 4129
	private AudioClip[] m_MonologueClips;

	// Token: 0x04001022 RID: 4130
	private AudioClip[] m_SpeakerMonologueClips;

	// Token: 0x04001023 RID: 4131
	private AudioClip m_MusicLittleDevilClip;

	// Token: 0x04001024 RID: 4132
	private AudioClip m_SammyMonologueBGClip;

	// Token: 0x04001025 RID: 4133
	private AudioObject m_MusicAudioObject;
}
