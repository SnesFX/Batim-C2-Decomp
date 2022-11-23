using System;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using ScionEngine;
using UnityEngine;

// Token: 0x02000274 RID: 628
public class ChapterTwoOpeningSequenceController : BaseController
{
	// Token: 0x06000DA4 RID: 3492 RVA: 0x0007C76A File Offset: 0x0007AB6A
	public override void Init()
	{
		base.Init();
	}

	// Token: 0x06000DA5 RID: 3493 RVA: 0x0007C774 File Offset: 0x0007AB74
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_RingingEarsClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Ringing_Ears_02");
		this.m_StandUpClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Stand_Up_Player_01");
		this.m_HenryIntroClip_01 = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Intro_01");
		this.m_HenryIntroClip_02 = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Intro_02");
		this.m_HenryIntroClip_03 = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Intro_03");
		GameManager.Instance.ShowHurtBorder(true);
	}

	// Token: 0x06000DA6 RID: 3494 RVA: 0x0007C7FC File Offset: 0x0007ABFC
	public void Activate()
	{
		this.m_Player = GameManager.Instance.Player;
		this.m_Player.LookRotation(this.m_InitialLookAt.rotation);
		this.m_Player.Lock();
		this.m_Player.DisableInteraction();
		GameManager.Instance.LockPause();
		this.m_GameCam = GameManager.Instance.GameCamera;
		this.m_GameCam.Camera.transform.SetParent(this.m_StartPosition);
		this.m_GameCam.Camera.transform.localPosition = Vector3.zero;
		this.m_GameCam.Camera.transform.localEulerAngles = Vector3.zero;
		if (this.m_GameCam.PostProcess.depthOfField)
		{
			this.InitBlur();
		}
		this.DOOpeningSequence();
	}

	// Token: 0x06000DA7 RID: 3495 RVA: 0x0007C8D0 File Offset: 0x0007ACD0
	private Sequence DOOpeningSequence()
	{
		Sequence sequence = DOTween.Sequence();
		float num = 5f;
		float duration = 1f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.ShowChapterTitle("CHAPTER TWO", "THE OLD SONG", false);
		});
		num += 2f;
		for (int i = 0; i < 4; i++)
		{
			sequence.InsertCallback(num, delegate
			{
				GameManager.Instance.ShowHurtBorder(true);
			});
		}
		sequence.InsertCallback(num, new TweenCallback(this.PlayIntroDialogue_01));
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.HideScreenBlocker(duration, 0f, null);
		});
		num += duration;
		duration = 0.5f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.ShowScreenBlocker(duration, 0f, null);
		});
		num += duration + 0.75f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.HideScreenBlocker(duration, 0f, null);
		});
		num += duration + 0.25f;
		if (this.m_GameCam.PostProcess.depthOfField)
		{
			float distance = this.m_GameCam.PostProcess.focalDistance;
			sequence.Insert(num, DOTween.To(() => distance, delegate(float value)
			{
				distance = value;
			}, 5f, 2f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				this.m_GameCam.PostProcess.focalDistance = distance;
			}));
		}
		num += 1.5f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.ShowScreenBlocker(0.5f, 0f, null);
		});
		num += 0.6f;
		if (this.m_GameCam.PostProcess.depthOfField)
		{
			sequence.InsertCallback(num, delegate
			{
				this.m_GameCam.PostProcess.depthFocusMode = DepthFocusMode.PointAverage;
			});
		}
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.HideScreenBlocker(0.5f, 0f, null);
		});
		return sequence;
	}

	// Token: 0x06000DA8 RID: 3496 RVA: 0x0007CAF0 File Offset: 0x0007AEF0
	private Sequence DOGetUpSequence()
	{
		Sequence sequence = DOTween.Sequence();
		float num = 1f;
		sequence.InsertCallback(num, delegate
		{
			this.m_GameCam.Camera.transform.SetParent(this.m_Player.CameraParent);
		});
		sequence.InsertCallback(num += 0.5f, new TweenCallback(this.PlayIntroDialogue_02));
		sequence.Insert(num, this.m_GameCam.Camera.transform.DOMove(this.m_KneelPosition.position, 1.5f, false).SetEase(Ease.InOutQuad));
		sequence.Insert(num, this.m_GameCam.Camera.transform.DORotate(this.m_KneelPosition.eulerAngles, 1.5f, RotateMode.Fast).SetEase(Ease.InOutQuad));
		num += 2.1f;
		sequence.Insert(num, this.m_GameCam.Camera.transform.DOLocalMove(Vector3.zero, 2f, false).SetEase(this.m_KneelCurve));
		sequence.Insert(num, this.m_GameCam.Camera.transform.DOLocalRotate(Vector3.zero, 2f, RotateMode.Fast).SetEase(this.m_KneelCurve));
		return sequence;
	}

	// Token: 0x06000DA9 RID: 3497 RVA: 0x0007CC10 File Offset: 0x0007B010
	private void InitBlur()
	{
		this.m_GameCam.PostProcess.depthFocusMode = DepthFocusMode.ManualDistance;
		this.m_GameCam.PostProcess.focalDistance = 0f;
	}

	// Token: 0x06000DAA RID: 3498 RVA: 0x0007CC38 File Offset: 0x0007B038
	private void PlayIntroDialogue_01()
	{
		GameManager.Instance.AudioManager.Play(this.m_RingingEarsClip, AudioObjectType.SOUND_EFFECT, 0, false);
		AudioObject audioObject = GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_HenryIntroClip_01, "Ugh, oh my head. What happened?", false));
		audioObject.OnComplete += delegate(object sender, EventArgs e)
		{
			this.DOGetUpSequence().OnComplete(delegate
			{
				this.PlayIntroDialogue_03();
				this.m_Player.Unlock();
				GameManager.Instance.UnlockPause();
				GameManager.Instance.Player.EnableInteraction();
			});
		};
	}

	// Token: 0x06000DAB RID: 3499 RVA: 0x0007CC8C File Offset: 0x0007B08C
	private void PlayIntroDialogue_02()
	{
		GameManager.Instance.AudioManager.Play(this.m_StandUpClip, AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_HenryIntroClip_02, string.Empty, false));
	}

	// Token: 0x06000DAC RID: 3500 RVA: 0x0007CCC3 File Offset: 0x0007B0C3
	private void PlayIntroDialogue_03()
	{
		GameManager.Instance.ShowCrosshair();
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create(this.m_HenryIntroClip_03, "Well, I guess there is only one thing to do:\nPress on. See if I can find a way out.", false)).OnComplete += delegate(object sender, EventArgs e)
		{
			GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_01;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "FIND A NEW EXIT", "TIP: AN AXE MAY COME IN HANDY", 4f, false));
			base.SendOnComplete();
		};
	}

	// Token: 0x06000DAD RID: 3501 RVA: 0x0007CCFB File Offset: 0x0007B0FB
	protected override void OnDisposed()
	{
		this.m_Player = null;
		this.m_GameCam = null;
		base.OnDisposed();
	}

	// Token: 0x04000FC5 RID: 4037
	[Header("Transforms")]
	[SerializeField]
	private Transform m_StartPosition;

	// Token: 0x04000FC6 RID: 4038
	[SerializeField]
	private Transform m_KneelPosition;

	// Token: 0x04000FC7 RID: 4039
	[SerializeField]
	private Transform m_InitialLookAt;

	// Token: 0x04000FC8 RID: 4040
	[Header("Animation Curves")]
	[SerializeField]
	private AnimationCurve m_KneelCurve;

	// Token: 0x04000FC9 RID: 4041
	private PlayerController m_Player;

	// Token: 0x04000FCA RID: 4042
	private GameCamera m_GameCam;

	// Token: 0x04000FCB RID: 4043
	private AudioClip m_RingingEarsClip;

	// Token: 0x04000FCC RID: 4044
	private AudioClip m_StandUpClip;

	// Token: 0x04000FCD RID: 4045
	private AudioClip m_HenryIntroClip_01;

	// Token: 0x04000FCE RID: 4046
	private AudioClip m_HenryIntroClip_02;

	// Token: 0x04000FCF RID: 4047
	private AudioClip m_HenryIntroClip_03;
}
