using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x02000277 RID: 631
public class ChapterTwoRecordingStudioController : BaseController
{
	// Token: 0x17000283 RID: 643
	// (get) Token: 0x06000DCB RID: 3531 RVA: 0x0007D608 File Offset: 0x0007BA08
	// (set) Token: 0x06000DCC RID: 3532 RVA: 0x0007D610 File Offset: 0x0007BA10
	public bool IsTiming { get; private set; }

	// Token: 0x17000284 RID: 644
	// (get) Token: 0x06000DCD RID: 3533 RVA: 0x0007D619 File Offset: 0x0007BA19
	// (set) Token: 0x06000DCE RID: 3534 RVA: 0x0007D621 File Offset: 0x0007BA21
	public bool IsSuccess { get; private set; }

	// Token: 0x17000285 RID: 645
	// (get) Token: 0x06000DCF RID: 3535 RVA: 0x0007D62A File Offset: 0x0007BA2A
	// (set) Token: 0x06000DD0 RID: 3536 RVA: 0x0007D632 File Offset: 0x0007BA32
	public bool IsComplete { get; private set; }

	// Token: 0x17000286 RID: 646
	// (get) Token: 0x06000DD1 RID: 3537 RVA: 0x0007D63B File Offset: 0x0007BA3B
	// (set) Token: 0x06000DD2 RID: 3538 RVA: 0x0007D643 File Offset: 0x0007BA43
	public bool IsDoorOpening { get; private set; }

	// Token: 0x17000287 RID: 647
	// (get) Token: 0x06000DD3 RID: 3539 RVA: 0x0007D64C File Offset: 0x0007BA4C
	// (set) Token: 0x06000DD4 RID: 3540 RVA: 0x0007D654 File Offset: 0x0007BA54
	public bool canSolve { get; private set; }

	// Token: 0x17000288 RID: 648
	// (get) Token: 0x06000DD5 RID: 3541 RVA: 0x0007D65D File Offset: 0x0007BA5D
	// (set) Token: 0x06000DD6 RID: 3542 RVA: 0x0007D665 File Offset: 0x0007BA65
	public List<int> InstrumentOrder { get; private set; }

	// Token: 0x06000DD7 RID: 3543 RVA: 0x0007D670 File Offset: 0x0007BA70
	public override void Init()
	{
		base.Init();
		this.m_StrikeUpTheBandMax = this.m_BendyCutouts.Count;
		for (int i = 0; i < this.m_Instruments.Count; i++)
		{
			InteractableMusicalInstrument interactableMusicalInstrument = this.m_Instruments[i];
			if (interactableMusicalInstrument.InstrumentType == InstrumentType.PIANO)
			{
				interactableMusicalInstrument.SetActive(false);
			}
			interactableMusicalInstrument.OnNotePlayed += this.HandleInstrumentOnNotePlayed;
		}
		this.m_ProjectorRunningWildClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Projector_Running_Wild_01");
		this.m_PianoJumpscareClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Piano_Lid_Close_Jumpscare");
		this.m_LightController.TurnOff();
		this.m_ProjectorController.InitTurnOff();
		this.m_ProjectorInteract.OnInteracted += this.HandleProjectorOnInteracted;
		this.GenerateCutoutPositions();
		this.m_PianoJumpscare.OnEnter += this.HandlePianoJumpscareOnEnter;
		this.m_LowerTrigger.SetActive(true);
		this.m_LowerTrigger.OnEnter += this.HandleLowerTriggerOnEnter;
		this.m_UpperTrigger.SetActive(true);
		this.m_UpperTrigger.OnEnter += this.HandleUpperTriggerOnEnter;
	}

	// Token: 0x06000DD8 RID: 3544 RVA: 0x0007D7A6 File Offset: 0x0007BBA6
	public void Activate()
	{
		this.canSolve = true;
	}

	// Token: 0x06000DD9 RID: 3545 RVA: 0x0007D7B0 File Offset: 0x0007BBB0
	private void GenerateCutoutPositions()
	{
		this.m_BendyCutouts.Shuffle<Transform>();
		this.m_StagePositions.Shuffle<Transform>();
		this.m_BalconyPositions.Shuffle<Transform>();
		for (int i = 0; i < this.m_StrikeUpTheBandMax; i++)
		{
			ChapterTwoRecordingStudioController.Cutout item = new ChapterTwoRecordingStudioController.Cutout
			{
				Trans = this.m_BendyCutouts[i],
				StagePosition = this.m_StagePositions[i].position,
				StageRotation = this.m_StagePositions[i].rotation,
				BalconyPosition = this.m_BalconyPositions[i].position,
				BalconyRotation = this.m_BalconyPositions[i].rotation
			};
			this.m_ActiveCutouts.Add(item);
		}
	}

	// Token: 0x06000DDA RID: 3546 RVA: 0x0007D877 File Offset: 0x0007BC77
	public void GeneratePuzzle()
	{
		this.InstrumentOrder = new List<int>();
		this.SetupInstruments();
		this.InstrumentOrder.Shuffle<int>();
	}

	// Token: 0x06000DDB RID: 3547 RVA: 0x0007D898 File Offset: 0x0007BC98
	private void SetupInstruments()
	{
		if (this.m_AvailableInstruments != null)
		{
			this.m_AvailableInstruments.Clear();
			this.m_AvailableInstruments = null;
		}
		this.m_AvailableInstruments = new List<ChapterTwoRecordingStudioController.Instrument>();
		this.m_AvailableInstruments.Add(new ChapterTwoRecordingStudioController.Instrument
		{
			InstrumentType = InstrumentType.BANJO,
			AvailableMax = 2
		});
		this.m_AvailableInstruments.Add(new ChapterTwoRecordingStudioController.Instrument
		{
			InstrumentType = InstrumentType.DRUM,
			AvailableMax = 2
		});
		this.m_AvailableInstruments.Add(new ChapterTwoRecordingStudioController.Instrument
		{
			InstrumentType = InstrumentType.BASS_FIDDLE,
			AvailableMax = 2
		});
		this.m_AvailableInstruments.Add(new ChapterTwoRecordingStudioController.Instrument
		{
			InstrumentType = InstrumentType.VIOLIN,
			AvailableMax = 2
		});
		this.m_AvailableInstruments.Add(new ChapterTwoRecordingStudioController.Instrument
		{
			InstrumentType = InstrumentType.PIANO,
			AvailableMax = 2
		});
		for (int i = 0; i < 4; i++)
		{
			this.FindNextInstrument();
		}
	}

	// Token: 0x06000DDC RID: 3548 RVA: 0x0007D988 File Offset: 0x0007BD88
	private void FindNextInstrument()
	{
		int num = UnityEngine.Random.Range(0, this.m_AvailableInstruments.Count);
		if (this.m_AvailableInstruments[num].AvailableMax <= 0)
		{
			this.FindNextInstrument();
		}
		else
		{
			this.m_AvailableInstruments[num].AvailableMax--;
			this.InstrumentOrder.Add(num);
		}
	}

	// Token: 0x06000DDD RID: 3549 RVA: 0x0007D9F0 File Offset: 0x0007BDF0
	private void Update()
	{
		if (GameManager.Instance.isPaused)
		{
			return;
		}
		if (this.IsSuccess && this.IsComplete && !this.IsDoorOpening && this.canSolve)
		{
			this.DOSuccess();
		}
		if (this.IsTiming && !this.IsComplete)
		{
			this.DOTimer();
		}
	}

	// Token: 0x06000DDE RID: 3550 RVA: 0x0007DA5B File Offset: 0x0007BE5B
	private void DOTimer()
	{
		this.m_Timer += Time.deltaTime;
		if (this.m_Timer > this.m_TimerMax)
		{
			this.Reset();
		}
	}

	// Token: 0x06000DDF RID: 3551 RVA: 0x0007DA88 File Offset: 0x0007BE88
	private void DOSuccess()
	{
		this.m_SuccessTimer += Time.deltaTime;
		if (this.m_SuccessTimer > this.m_SuccessTimerMax)
		{
			this.IsDoorOpening = true;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "ENTER THE SANCTUARY", string.Empty, 4f, false));
			GameManager.Instance.AchievementManager.SetAchievement(AchievementName.MY_FAVORITE_SONG);
			this.m_LightController.TurnOn();
			this.TurnOffProjector();
			this.OpenGate();
		}
	}

	// Token: 0x06000DE0 RID: 3552 RVA: 0x0007DB0C File Offset: 0x0007BF0C
	private void HandlePianoJumpscareOnEnter(object sender, EventArgs e)
	{
		this.m_PianoJumpscare.OnEnter -= this.HandlePianoJumpscareOnEnter;
		GameManager.Instance.AudioManager.PlayAtPosition(this.m_PianoJumpscareClip, this.m_PianoLid.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_PianoLid.DOKill(false);
		this.m_PianoLid.DOLocalRotate(Vector3.zero, 0.5f, RotateMode.Fast).SetEase(Ease.OutBounce).OnComplete(new TweenCallback(this.PianoJumpscareOnComplete));
	}

	// Token: 0x06000DE1 RID: 3553 RVA: 0x0007DB94 File Offset: 0x0007BF94
	private void PianoJumpscareOnComplete()
	{
		for (int i = 0; i < this.m_Instruments.Count; i++)
		{
			InteractableMusicalInstrument interactableMusicalInstrument = this.m_Instruments[i];
			if (interactableMusicalInstrument.InstrumentType == InstrumentType.PIANO)
			{
				interactableMusicalInstrument.SetActive(true);
			}
		}
	}

	// Token: 0x06000DE2 RID: 3554 RVA: 0x0007DBE0 File Offset: 0x0007BFE0
	private void HandleInstrumentOnNotePlayed(object sender, EventArgs e)
	{
		if (!this.IsTiming || this.IsComplete)
		{
			return;
		}
		InteractableMusicalInstrument interactableMusicalInstrument = (InteractableMusicalInstrument)sender;
		if (interactableMusicalInstrument == null)
		{
			return;
		}
		this.m_InstrumentsPlayed.Add((int)interactableMusicalInstrument.InstrumentType);
		if (this.InstrumentOrder.Count == this.m_InstrumentsPlayed.Count)
		{
			for (int i = 0; i < this.InstrumentOrder.Count; i++)
			{
				if (this.InstrumentOrder[i] != this.m_InstrumentsPlayed[i])
				{
					this.IsSuccess = false;
					break;
				}
				this.IsSuccess = true;
			}
		}
		if (this.m_InstrumentsPlayed.Count > 4)
		{
			this.Reset();
			return;
		}
		if (this.IsSuccess)
		{
			this.IsTiming = false;
			this.IsComplete = true;
			this.m_Timer = 0f;
			if (this.m_StrikeUpTheBandCount >= this.m_StrikeUpTheBandMax)
			{
				GameManager.Instance.AchievementManager.SetAchievement(AchievementName.STRIKE_UP_THE_BAND);
			}
		}
		else if (!this.IsSuccess && this.m_InstrumentsPlayed.Count == 4)
		{
			this.Reset();
		}
	}

	// Token: 0x06000DE3 RID: 3555 RVA: 0x0007DD1C File Offset: 0x0007C11C
	private void Reset()
	{
		this.IsSuccess = false;
		this.m_Timer = 0f;
		this.IsTiming = false;
		this.IsSuccess = false;
		this.TurnOffProjector();
		this.m_ProjectorInteract.SetActive(true);
		this.m_ProjectorInteract.OnInteracted += this.HandleProjectorOnInteracted;
		if (this.m_ProjectorRunningWildObject != null)
		{
			this.m_ProjectorRunningWildObject.Clear();
			this.m_ProjectorRunningWildObject = null;
		}
		if (this.m_InstrumentsPlayed != null)
		{
			this.m_InstrumentsPlayed.Clear();
		}
		this.m_StrikeUpTheBandCount++;
	}

	// Token: 0x06000DE4 RID: 3556 RVA: 0x0007DDBC File Offset: 0x0007C1BC
	private void TurnOffProjector()
	{
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Projector_Switch_Turn_On_01", AudioObjectType.SOUND_EFFECT, 0, false);
		if (this.m_ProjectorRunningWildObject != null)
		{
			this.m_ProjectorRunningWildObject.Clear();
			this.m_ProjectorRunningWildObject = null;
		}
		this.m_ProjectorController.TurnOffSilent();
	}

	// Token: 0x06000DE5 RID: 3557 RVA: 0x0007DE0F File Offset: 0x0007C20F
	private void HandleLowerTriggerOnEnter(object sender, EventArgs e)
	{
		this.MoveCutoutsToBalcony();
	}

	// Token: 0x06000DE6 RID: 3558 RVA: 0x0007DE17 File Offset: 0x0007C217
	private void HandleUpperTriggerOnEnter(object sender, EventArgs e)
	{
		this.MoveCutoutsToStage();
	}

	// Token: 0x06000DE7 RID: 3559 RVA: 0x0007DE20 File Offset: 0x0007C220
	private void MoveCutoutsToStage()
	{
		for (int i = 0; i < this.m_StrikeUpTheBandCount; i++)
		{
			if (i >= this.m_StrikeUpTheBandMax)
			{
				break;
			}
			ChapterTwoRecordingStudioController.Cutout cutout = this.m_ActiveCutouts[i];
			cutout.Trans.position = cutout.StagePosition;
			cutout.Trans.rotation = cutout.StageRotation;
		}
	}

	// Token: 0x06000DE8 RID: 3560 RVA: 0x0007DE84 File Offset: 0x0007C284
	private void MoveCutoutsToBalcony()
	{
		for (int i = 0; i < this.m_StrikeUpTheBandCount; i++)
		{
			if (i >= this.m_StrikeUpTheBandMax)
			{
				break;
			}
			ChapterTwoRecordingStudioController.Cutout cutout = this.m_ActiveCutouts[i];
			cutout.Trans.position = cutout.BalconyPosition;
			cutout.Trans.rotation = cutout.BalconyRotation;
		}
	}

	// Token: 0x06000DE9 RID: 3561 RVA: 0x0007DEE8 File Offset: 0x0007C2E8
	private void OpenGate()
	{
		base.SendOnComplete();
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Gate_Open_Slow_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_Gate.DOLocalMoveY(9.5f, 8f, false).SetDelay(2f);
	}

	// Token: 0x06000DEA RID: 3562 RVA: 0x0007DF34 File Offset: 0x0007C334
	public void EnableTip()
	{
		this.m_PuzzleTip.SetActive(true);
		this.m_PuzzleTip.OnEnter += this.HandlePuzzleTipOnEnter;
		this.m_HasTip = true;
	}

	// Token: 0x06000DEB RID: 3563 RVA: 0x0007DF60 File Offset: 0x0007C360
	private void HandlePuzzleTipOnEnter(object sender, EventArgs e)
	{
		this.m_PuzzleTip.OnEnter -= this.HandlePuzzleTipOnEnter;
		if (this.m_HasTip)
		{
			GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_08", "I know there's something I have to do in here.\nBut I feel like I am missing something.", false));
		}
	}

	// Token: 0x06000DEC RID: 3564 RVA: 0x0007DFA0 File Offset: 0x0007C3A0
	private void HandleProjectorOnInteracted(object sender, EventArgs e)
	{
		this.m_ProjectorInteract.SetActive(false);
		this.m_ProjectorInteract.OnInteracted -= this.HandleProjectorOnInteracted;
		this.m_ProjectorController.TurnOn();
		this.m_ProjectorRunningWildObject = GameManager.Instance.AudioManager.PlayAtPosition(this.m_ProjectorRunningWildClip, this.m_ProjectorController.transform.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
		this.IsTiming = true;
		this.m_HasTip = false;
	}

	// Token: 0x06000DED RID: 3565 RVA: 0x0007E018 File Offset: 0x0007C418
	protected override void OnDisposed()
	{
		this.m_PianoLid.DOKill(false);
		this.m_Gate.DOKill(false);
		if (this.m_PianoJumpscare != null)
		{
			this.m_PianoJumpscare.OnEnter -= this.HandlePianoJumpscareOnEnter;
		}
		for (int i = 0; i < this.m_Instruments.Count; i++)
		{
			this.m_Instruments[i].OnNotePlayed -= this.HandleInstrumentOnNotePlayed;
		}
		base.OnDisposed();
	}

	// Token: 0x04000FEC RID: 4076
	[Header("Transforms")]
	[SerializeField]
	private Transform m_Gate;

	// Token: 0x04000FED RID: 4077
	[SerializeField]
	private Transform m_PianoLid;

	// Token: 0x04000FEE RID: 4078
	[Header("Projector")]
	[SerializeField]
	private ProjectorController m_ProjectorController;

	// Token: 0x04000FEF RID: 4079
	[SerializeField]
	private Interactable m_ProjectorInteract;

	// Token: 0x04000FF0 RID: 4080
	[Header("Light Fixture")]
	[SerializeField]
	private LightFixtureController m_LightController;

	// Token: 0x04000FF1 RID: 4081
	[Header("Instruments")]
	[SerializeField]
	private List<InteractableMusicalInstrument> m_Instruments;

	// Token: 0x04000FF2 RID: 4082
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_PianoJumpscare;

	// Token: 0x04000FF3 RID: 4083
	[SerializeField]
	private EventTrigger m_PuzzleTip;

	// Token: 0x04000FF4 RID: 4084
	[Header("Strike Up The Band")]
	[SerializeField]
	private EventTrigger m_LowerTrigger;

	// Token: 0x04000FF5 RID: 4085
	[SerializeField]
	private EventTrigger m_UpperTrigger;

	// Token: 0x04000FF6 RID: 4086
	[SerializeField]
	private List<Transform> m_StagePositions;

	// Token: 0x04000FF7 RID: 4087
	[SerializeField]
	private List<Transform> m_BalconyPositions;

	// Token: 0x04000FF8 RID: 4088
	[SerializeField]
	private List<Transform> m_BendyCutouts;

	// Token: 0x04000FF9 RID: 4089
	private List<ChapterTwoRecordingStudioController.Instrument> m_AvailableInstruments;

	// Token: 0x04000FFA RID: 4090
	private AudioClip m_PianoJumpscareClip;

	// Token: 0x04000FFB RID: 4091
	private AudioClip m_ProjectorRunningWildClip;

	// Token: 0x04000FFC RID: 4092
	private AudioObject m_ProjectorRunningWildObject;

	// Token: 0x04000FFD RID: 4093
	private List<int> m_InstrumentsPlayed = new List<int>();

	// Token: 0x04000FFE RID: 4094
	private List<ChapterTwoRecordingStudioController.Cutout> m_ActiveCutouts = new List<ChapterTwoRecordingStudioController.Cutout>();

	// Token: 0x04000FFF RID: 4095
	private float m_Timer;

	// Token: 0x04001000 RID: 4096
	private float m_TimerMax = 35f;

	// Token: 0x04001001 RID: 4097
	private float m_SuccessTimer;

	// Token: 0x04001002 RID: 4098
	private float m_SuccessTimerMax = 1f;

	// Token: 0x04001003 RID: 4099
	private int m_StrikeUpTheBandCount = 1;

	// Token: 0x04001004 RID: 4100
	private int m_StrikeUpTheBandMax;

	// Token: 0x0400100B RID: 4107
	private bool m_HasTip;

	// Token: 0x02000278 RID: 632
	private class Instrument
	{
		// Token: 0x0400100C RID: 4108
		public InstrumentType InstrumentType;

		// Token: 0x0400100D RID: 4109
		public int AvailableMax;
	}

	// Token: 0x02000279 RID: 633
	public class Cutout
	{
		// Token: 0x0400100E RID: 4110
		public Transform Trans;

		// Token: 0x0400100F RID: 4111
		public Vector3 StagePosition;

		// Token: 0x04001010 RID: 4112
		public Quaternion StageRotation;

		// Token: 0x04001011 RID: 4113
		public Vector3 BalconyPosition;

		// Token: 0x04001012 RID: 4114
		public Quaternion BalconyRotation;
	}
}
