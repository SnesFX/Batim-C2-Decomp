using System;
using System.Collections;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using UnityEngine;

// Token: 0x0200025E RID: 606
public class ChapterOneController : AbstractChapterController
{
	// Token: 0x06000C9A RID: 3226 RVA: 0x00076854 File Offset: 0x00074C54
	public override void Init()
	{
		base.Init();
		this.m_ChapterManager = GameManager.Instance.GetChapter(this.m_Chapter);
		GameManager.Instance.CurrentChapter = "ChapterTwo";
		AudioListener.volume = GameManager.Instance.PlayerSettings.Volume;
		GameManager.Instance.ShowScreenBlocker(0f, 0f, null);
		this.m_AxeWeapon.SetActive(false);
	}

	// Token: 0x06000C9B RID: 3227 RVA: 0x000768C4 File Offset: 0x00074CC4
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_DoorOpenClip = GameManager.Instance.GetAudioClip("Audio/SFX/Door/SFX_Door_Unlock_Open_Close_01");
		this.m_HorrorAmbienceClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Horror_Ambience_Loop_01");
		this.m_RumbleAudioClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Rumble_Loop_01");
		this.m_HenryOldDesk.OnEnter += this.HandleHenryOldDeskOnEnter;
		this.m_BorisRoom.OnEnter += this.HandleBorisRoomOnEnter;
		this.m_Objective_02.OnEnter += this.HandleObjective02OnEnter;
		this.m_Objective_03.OnEnter += this.HandleObjective03OnEnter;
		GameManager.Instance.HideCrosshair();
		GameManager.Instance.LockPause();
		GameManager.Instance.Player.CameraSwaySetActive(true);
		GameManager.Instance.Player.Lock();
		base.StartCoroutine(this.LoadChapter());
	}

	// Token: 0x06000C9C RID: 3228 RVA: 0x000769B4 File Offset: 0x00074DB4
	private IEnumerator LoadChapter()
	{
		yield return new WaitForSeconds(1f);
		yield return new WaitForEndOfFrame();
		this.InitializeChapter();
		yield break;
	}

	// Token: 0x06000C9D RID: 3229 RVA: 0x000769D0 File Offset: 0x00074DD0
	public override void InitializeChapter()
	{
		this.m_HorrorAmbience = GameManager.Instance.AudioManager.Play(this.m_HorrorAmbienceClip, AudioObjectType.AMBIENCE, -1, false);
		AudioObject audioObject = GameManager.Instance.AudioManager.Play(this.m_DoorOpenClip, AudioObjectType.SOUND_EFFECT, 0, false);
		audioObject.OnComplete += this.TriggerInitialDialogue;
		this.DOOpeningSequence();
	}

	// Token: 0x06000C9E RID: 3230 RVA: 0x00076A30 File Offset: 0x00074E30
	private Sequence DOOpeningSequence()
	{
		Sequence sequence = DOTween.Sequence();
		float num = 1.5f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.HideScreenBlocker(0.1f, 0f, null);
		});
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.ShowChapterTitle("CHAPTER ONE", "MOVING PICTURES", true);
		});
		num += 4f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.Player.Unlock();
			GameManager.Instance.UnlockPause();
			GameManager.Instance.Player.CameraSwaySetActive(false);
			GameManager.Instance.ShowCrosshair();
		});
		return sequence;
	}

	// Token: 0x06000C9F RID: 3231 RVA: 0x00076AC4 File Offset: 0x00074EC4
	private void TriggerInitialDialogue(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.TriggerInitialDialogue;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_01", "Alright, Joey. I'm here.\nLet's see if we can find what you wanted me to see.", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_01;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "FIND THE INK MACHINE", "TIP: EXPLORE THE WORKSHOP", 4f, false));
		};
	}

	// Token: 0x06000CA0 RID: 3232 RVA: 0x00076B24 File Offset: 0x00074F24
	private void HandleHenryOldDeskOnEnter(object sender, EventArgs e)
	{
		this.m_HenryOldDesk.OnEnter -= this.HandleHenryOldDeskOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_12", "Here's my old desk.\nI've wasted so much time in this chair.", false));
	}

	// Token: 0x06000CA1 RID: 3233 RVA: 0x00076B58 File Offset: 0x00074F58
	private void HandleBorisRoomOnEnter(object sender, EventArgs e)
	{
		this.m_BorisRoom.OnEnter -= this.HandleBorisRoomOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_06", "Oh my god. Joey, what were you doing?", false));
	}

	// Token: 0x06000CA2 RID: 3234 RVA: 0x00076B8C File Offset: 0x00074F8C
	private void HandleObjective02OnEnter(object sender, EventArgs e)
	{
		this.m_Objective_02.OnEnter -= this.HandleObjective02OnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_02", "So this is the Ink Machine, huh?\nWonder how you turn it on.", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_02;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "TURN ON THE MACHINE", string.Empty, 4f, false));
		};
	}

	// Token: 0x06000CA3 RID: 3235 RVA: 0x00076BEC File Offset: 0x00074FEC
	private void HandleObjective03OnEnter(object sender, EventArgs e)
	{
		this.m_Objective_03.OnEnter -= this.HandleObjective03OnEnter;
		if (this.m_Objective_02 != null)
		{
			this.m_Objective_02.OnEnter -= this.HandleObjective02OnEnter;
			this.m_Objective_02.Dispose();
		}
		this.m_StandupCutoutController.Activate();
		this.m_SammysRoomController.Activate();
		this.m_CollectableController.Activate(this.m_ChapterManager);
		this.m_ChapterManager.OnCollectablesComplete += this.HandleCollectablesOnComplete;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_03", "Alright! How do I get this to work?", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_03;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "FIX THE INK MACHINE", "TIP: COLLECT THE NEEDED OBJECTS", 4f, false));
		};
	}

	// Token: 0x06000CA4 RID: 3236 RVA: 0x00076CBD File Offset: 0x000750BD
	private void HandleFloorEventOnEnter(object sender, EventArgs e)
	{
		this.m_FloorEvent.OnEnter -= this.HandleFloorEventOnEnter;
		this.m_FloorController.Activate();
		this.m_FloorController.OnComplete += this.FloorControllerOnComplete;
	}

	// Token: 0x06000CA5 RID: 3237 RVA: 0x00076CF8 File Offset: 0x000750F8
	private void FloorControllerOnComplete(object sender, EventArgs e)
	{
		this.m_FloorController.OnComplete -= this.FloorControllerOnComplete;
		this.m_CollectableController.Dispose();
		this.m_SammysRoomController.Dispose();
		this.m_TheatreController.Dispose();
		this.m_BendyFinaleController.Dispose();
		this.m_InkPressureController.Dispose();
		this.m_MainPowerController.Dispose();
		this.m_AxeWeapon.SetActive(true);
		this.m_AxeWeapon.OnInteracted += this.HandleAxeWeaponOnInteracted;
	}

	// Token: 0x06000CA6 RID: 3238 RVA: 0x00076D84 File Offset: 0x00075184
	private void HandleCollectablesOnComplete(object sender, EventArgs e)
	{
		this.m_ChapterManager.OnCollectablesComplete -= this.HandleCollectablesOnComplete;
		GameManager.Instance.AchievementManager.SetAchievement(AchievementName.PICKING_UP_THE_PIECES);
		this.m_TheatreController.Activate();
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_04", "Ok! That is all of them!\nI just need to get the ink flowing somehow.\nShould be a switch around here somewhere.\nThen I can start up the main power.", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_04;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "RESTORE INK PRESSURE", string.Empty, 4f, false));
		};
		this.m_InkPressureController.Activate();
		this.m_InkPressureController.OnComplete += this.HandleInkPressureOnComplete;
	}

	// Token: 0x06000CA7 RID: 3239 RVA: 0x00076E21 File Offset: 0x00075221
	private void HandleShowObjective04()
	{
		GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_04;
		GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "RESTORE INK PRESSURE", string.Empty, 4f, false));
	}

	// Token: 0x06000CA8 RID: 3240 RVA: 0x00076E52 File Offset: 0x00075252
	private void HandleInkPressureOnComplete(object sender, EventArgs e)
	{
		this.m_InkPressureController.OnComplete -= this.HandleInkPressureOnComplete;
		this.m_MainPowerController.Activate();
		this.m_MainPowerController.OnComplete += this.HandleMainPowerOnComplete;
	}

	// Token: 0x06000CA9 RID: 3241 RVA: 0x00076E90 File Offset: 0x00075290
	private void HandleMainPowerOnComplete(object sender, EventArgs e)
	{
		this.m_MainPowerController.OnComplete -= this.HandleMainPowerOnComplete;
		this.m_CollectableController.Complete();
		Color ambientLight = RenderSettings.ambientLight;
		DOTween.To(() => ambientLight, delegate(Color value)
		{
			ambientLight = value;
		}, this.m_FinaleAmbience, 1f).SetEase(Ease.Linear).OnUpdate(delegate
		{
			RenderSettings.ambientLight = ambientLight;
		});
		this.m_BendyFinaleController.Activate();
		this.m_BnedyEventTrigger.SetActive(true);
		this.m_BnedyEventTrigger.OnEnter += this.HandleBendyEventTriggerOnEnter;
	}

	// Token: 0x06000CAA RID: 3242 RVA: 0x00076F40 File Offset: 0x00075340
	private void HandleBendyEventTriggerOnEnter(object sender, EventArgs e)
	{
		if (this.m_BendyFinaleController.CanActivate())
		{
			this.m_BnedyEventTrigger.OnEnter -= this.HandleBendyEventTriggerOnEnter;
			this.m_FloorEvent.SetActive(true);
			this.m_FloorEvent.OnEnter += this.HandleFloorEventOnEnter;
		}
	}

	// Token: 0x06000CAB RID: 3243 RVA: 0x00076F98 File Offset: 0x00075398
	private void HandleAxeWeaponOnInteracted(object sender, EventArgs e)
	{
		this.m_AxeWeapon.OnInteracted -= this.HandleAxeWeaponOnInteracted;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_05", "This will definitely come in handy.", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_05;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "CLEAR AN OLD PATH", "TIP: YOUR AXE MAY COME IN HANDY", 4f, false));
		};
		this.m_PentagramDoorController.Activate();
		this.m_PentagramDoorController.OnComplete += this.HandlePentagramDoorOnComplete;
	}

	// Token: 0x06000CAC RID: 3244 RVA: 0x0007701C File Offset: 0x0007541C
	private void HandlePentagramDoorOnComplete(object sender, EventArgs e)
	{
		this.m_PentagramDoorController.OnComplete -= this.HandlePentagramDoorOnComplete;
		this.m_RumbleAudio = GameManager.Instance.AudioManager.Play(this.m_RumbleAudioClip, AudioObjectType.AMBIENCE, -1, false);
		this.m_ChapterEndController.Activate();
		this.m_ChapterEndController.OnComplete += this.HandleChapterOnComplete;
	}

	// Token: 0x06000CAD RID: 3245 RVA: 0x00077080 File Offset: 0x00075480
	private void HandleChapterOnComplete(object sender, EventArgs e)
	{
		this.m_ChapterEndController.OnComplete -= this.HandleChapterOnComplete;
		this.m_HorrorAmbience.AudioSource.DOFade(0f, 1f).SetDelay(0.1f).OnComplete(delegate
		{
			this.m_HorrorAmbience.Clear();
			this.m_HorrorAmbience = null;
		});
		this.m_RumbleAudio.AudioSource.DOFade(0f, 2.5f).SetDelay(0.1f).OnComplete(delegate
		{
			this.m_RumbleAudio.Clear();
			this.m_RumbleAudio = null;
			this.LoadScene();
		});
	}

	// Token: 0x06000CAE RID: 3246 RVA: 0x00077110 File Offset: 0x00075510
	private void LoadScene()
	{
		GameManager.Instance.LoadScene(new GenericLoaderDataVO("ChapterTwo", false));
	}

	// Token: 0x06000CAF RID: 3247 RVA: 0x00077128 File Offset: 0x00075528
	protected override void OnDisposed()
	{
		this.m_RumbleAudioClip = null;
		this.m_DoorOpenClip = null;
		this.m_HorrorAmbienceClip = null;
		this.m_MainPowerController.OnComplete -= this.HandleMainPowerOnComplete;
		this.m_ChapterEndController.OnComplete -= this.HandleChapterOnComplete;
		this.m_HenryOldDesk.OnEnter -= this.HandleHenryOldDeskOnEnter;
		this.m_BorisRoom.OnEnter -= this.HandleBorisRoomOnEnter;
		this.m_Objective_02.OnEnter -= this.HandleObjective02OnEnter;
		this.m_Objective_03.OnEnter -= this.HandleObjective03OnEnter;
		this.m_AxeWeapon.OnInteracted -= this.HandleAxeWeaponOnInteracted;
		if (this.m_HorrorAmbience != null)
		{
			this.m_HorrorAmbience.Clear();
			this.m_HorrorAmbience = null;
		}
		if (this.m_RumbleAudio != null)
		{
			this.m_RumbleAudio.Clear();
			this.m_RumbleAudio = null;
		}
		base.OnDisposed();
	}

	// Token: 0x04000EAF RID: 3759
	[Header("< Event Triggers >")]
	[Header("Audio")]
	[SerializeField]
	private EventTrigger m_HenryOldDesk;

	// Token: 0x04000EB0 RID: 3760
	[SerializeField]
	private EventTrigger m_BorisRoom;

	// Token: 0x04000EB1 RID: 3761
	[Header("Objectives")]
	[SerializeField]
	private EventTrigger m_Objective_02;

	// Token: 0x04000EB2 RID: 3762
	[SerializeField]
	private EventTrigger m_Objective_03;

	// Token: 0x04000EB3 RID: 3763
	[SerializeField]
	private Interactable m_AxeWeapon;

	// Token: 0x04000EB4 RID: 3764
	[Header("Events")]
	[SerializeField]
	private EventTrigger m_BnedyEventTrigger;

	// Token: 0x04000EB5 RID: 3765
	[SerializeField]
	private EventTrigger m_FloorEvent;

	// Token: 0x04000EB6 RID: 3766
	[Header("< Controllers >")]
	[SerializeField]
	private ChapterOneStandupCutoutJumpScareController m_StandupCutoutController;

	// Token: 0x04000EB7 RID: 3767
	[SerializeField]
	private ChapterOneSammysRoomController m_SammysRoomController;

	// Token: 0x04000EB8 RID: 3768
	[SerializeField]
	private ChapterOneCollectableController m_CollectableController;

	// Token: 0x04000EB9 RID: 3769
	[SerializeField]
	private ChapterOneInkPressureController m_InkPressureController;

	// Token: 0x04000EBA RID: 3770
	[SerializeField]
	private ChapterOneTheatreScareController m_TheatreController;

	// Token: 0x04000EBB RID: 3771
	[SerializeField]
	private ChapterOneMainPowerController m_MainPowerController;

	// Token: 0x04000EBC RID: 3772
	[SerializeField]
	private ChapterOneBendyFinaleController m_BendyFinaleController;

	// Token: 0x04000EBD RID: 3773
	[SerializeField]
	private ChapterOneFloorController m_FloorController;

	// Token: 0x04000EBE RID: 3774
	[SerializeField]
	private ChapterOnePentagramDoorController m_PentagramDoorController;

	// Token: 0x04000EBF RID: 3775
	[SerializeField]
	private ChapterOnePentagramRoomController m_ChapterEndController;

	// Token: 0x04000EC0 RID: 3776
	[Header("< Collectables >")]
	[SerializeField]
	private ChapterCollectable m_CollectableGrear;

	// Token: 0x04000EC1 RID: 3777
	[SerializeField]
	private ChapterCollectable m_CollectableWrench;

	// Token: 0x04000EC2 RID: 3778
	[SerializeField]
	private ChapterCollectable m_CollectableBook;

	// Token: 0x04000EC3 RID: 3779
	[SerializeField]
	private ChapterCollectable m_CollectableDoll;

	// Token: 0x04000EC4 RID: 3780
	[SerializeField]
	private ChapterCollectable m_CollectableRecord;

	// Token: 0x04000EC5 RID: 3781
	[SerializeField]
	private ChapterCollectable m_CollectableInkwell;

	// Token: 0x04000EC6 RID: 3782
	[Header("Colors")]
	[SerializeField]
	private Color m_FinaleAmbience;

	// Token: 0x04000EC7 RID: 3783
	private AudioClip m_DoorOpenClip;

	// Token: 0x04000EC8 RID: 3784
	private AudioObject m_HorrorAmbience;

	// Token: 0x04000EC9 RID: 3785
	private AudioClip m_HorrorAmbienceClip;

	// Token: 0x04000ECA RID: 3786
	private AudioObject m_RumbleAudio;

	// Token: 0x04000ECB RID: 3787
	private AudioClip m_RumbleAudioClip;

	// Token: 0x04000ECC RID: 3788
	private ChapterManager m_ChapterManager;
}
