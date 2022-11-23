using System;
using System.Collections;
using DG.Tweening;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x0200026F RID: 623
public class ChapterTwoController : AbstractChapterController
{
	// Token: 0x06000D60 RID: 3424 RVA: 0x0007AF28 File Offset: 0x00079328
	public override void Init()
	{
		base.Init();
		this.m_ChapterManager = GameManager.Instance.GetChapter(this.m_Chapter);
		GameManager.Instance.CurrentChapter = "ChapterTwo";
		GameManager.Instance.LockPause();
		AudioListener.volume = GameManager.Instance.PlayerSettings.Volume;
		GameManager.Instance.ShowScreenBlocker(0f, 0f, null);
	}

	// Token: 0x06000D61 RID: 3425 RVA: 0x0007AF94 File Offset: 0x00079394
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_TitleMusicClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_Chapter_Two_Title");
		this.m_HorrorAmbienceClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Horror_Ambience_Loop_01");
		GameManager.Instance.HideCrosshair();
		base.StartCoroutine(this.LoadChapter());
	}

	// Token: 0x06000D62 RID: 3426 RVA: 0x0007AFE8 File Offset: 0x000793E8
	private IEnumerator LoadChapter()
	{
		yield return new WaitForSeconds(1f);
		yield return new WaitForEndOfFrame();
		UnityEngine.Object.Destroy(this.m_TEMP_WATER);
		if (GameManager.Instance.hasChapterTwo_SavePoint)
		{
			this.ClearFirstHalf();
			GameManager.Instance.UnlockPause();
			this.m_SammyFinaleController.Activate();
			this.m_SammyFinaleController.OnComplete += this.HandleSammyFinaleOnComplete;
		}
		else
		{
			this.InitializeChapter();
		}
		yield break;
	}

	// Token: 0x06000D63 RID: 3427 RVA: 0x0007B004 File Offset: 0x00079404
	public override void InitializeChapter()
	{
		GameManager.Instance.AudioManager.Play(this.m_TitleMusicClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_HorrorAmbience = GameManager.Instance.AudioManager.Play(this.m_HorrorAmbienceClip, AudioObjectType.AMBIENCE, -1, false);
		this.m_OpeningSequenceController.Activate();
		this.m_OpeningSequenceController.OnComplete += this.HandleOpeningSequenceOnComplete;
		this.m_PentagramDoorController.Activate();
		this.m_PentagramDoorController.OnComplete += this.HandlePentagramDoorOnComplete;
	}

	// Token: 0x06000D64 RID: 3428 RVA: 0x0007B08C File Offset: 0x0007948C
	private void HandleOpeningSequenceOnComplete(object sender, EventArgs e)
	{
		this.m_OpeningSequenceController.OnComplete -= this.HandleOpeningSequenceOnComplete;
		this.m_OpeningSequenceController.Dispose();
	}

	// Token: 0x06000D65 RID: 3429 RVA: 0x0007B0B0 File Offset: 0x000794B0
	private void HandlePentagramDoorOnComplete(object sender, EventArgs e)
	{
		this.m_PentagramDoorController.OnComplete -= this.HandlePentagramDoorOnComplete;
		this.m_SammyHallwayController.Activate();
		this.m_SammyHallwayController.OnComplete += this.HandleSammyHallwayOnComplete;
	}

	// Token: 0x06000D66 RID: 3430 RVA: 0x0007B0EB File Offset: 0x000794EB
	private void HandleSammyHallwayOnComplete(object sender, EventArgs e)
	{
		this.m_SammyHallwayController.OnComplete -= this.HandleSammyHallwayOnComplete;
		this.m_MainGateController.Activate();
		this.m_MainGateController.OnComplete += this.HandleMainGateOnComplete;
	}

	// Token: 0x06000D67 RID: 3431 RVA: 0x0007B126 File Offset: 0x00079526
	private void HandleMainGateOnComplete(object sender, EventArgs e)
	{
		this.m_MainGateController.OnComplete -= this.HandleMainGateOnComplete;
		this.m_MainPowerController.Activate();
		this.m_MainPowerController.OnComplete += this.HandleMainPowerOnComplete;
	}

	// Token: 0x06000D68 RID: 3432 RVA: 0x0007B161 File Offset: 0x00079561
	private void HandleMainPowerOnComplete(object sender, EventArgs e)
	{
		this.m_MainPowerController.OnComplete -= this.HandleMainPowerOnComplete;
		this.m_AudioLogController.Activate();
		this.m_AudioLogController.OnLostKeyObjective += this.HandleLostKeysObjectiveOnActive;
	}

	// Token: 0x06000D69 RID: 3433 RVA: 0x0007B19C File Offset: 0x0007959C
	private void HandleLostKeysObjectiveOnActive(object sender, EventArgs e)
	{
		this.m_AudioLogController.OnLostKeyObjective -= this.HandleLostKeysObjectiveOnActive;
		this.m_CollectableController.Activate();
		this.m_CollectableController.OnComplete += this.HandleLostKeysObjectiveOnComplete;
	}

	// Token: 0x06000D6A RID: 3434 RVA: 0x0007B1D7 File Offset: 0x000795D7
	private void HandleLostKeysObjectiveOnComplete(object sender, EventArgs e)
	{
		this.m_CollectableController.OnComplete -= this.HandleLostKeysObjectiveOnComplete;
		this.m_AudioLogController.ActivateFavoriteSong();
		this.m_AudioLogController.OnFavoriteSongObjective += this.HandleFavoriteSongObjectiveOnActive;
	}

	// Token: 0x06000D6B RID: 3435 RVA: 0x0007B212 File Offset: 0x00079612
	private void HandleFavoriteSongObjectiveOnActive(object sender, EventArgs e)
	{
		this.m_AudioLogController.OnFavoriteSongObjective -= this.HandleFavoriteSongObjectiveOnActive;
		this.m_RecordingStudioController.Activate();
		this.m_RecordingStudioController.OnComplete += this.HandleFavoriteSongObjectiveOnComplete;
	}

	// Token: 0x06000D6C RID: 3436 RVA: 0x0007B24D File Offset: 0x0007964D
	private void HandleFavoriteSongObjectiveOnComplete(object sender, EventArgs e)
	{
		this.m_RecordingStudioController.OnComplete -= this.HandleFavoriteSongObjectiveOnComplete;
		this.m_ValveController.Activate();
		this.m_ValveController.OnComplete += this.HandleValveOnComplete;
	}

	// Token: 0x06000D6D RID: 3437 RVA: 0x0007B288 File Offset: 0x00079688
	private void HandleValveOnComplete(object sender, EventArgs e)
	{
		this.m_ValveController.OnComplete -= this.HandleValveOnComplete;
		this.m_SearcherFinaleController.Activate();
		this.m_SearcherFinaleController.OnComplete += this.HandleSearcherFinaleOnComplete;
	}

	// Token: 0x06000D6E RID: 3438 RVA: 0x0007B2C3 File Offset: 0x000796C3
	private void HandleSearcherFinaleOnComplete(object sender, EventArgs e)
	{
		this.m_SearcherFinaleController.OnComplete -= this.HandleSearcherFinaleOnComplete;
		this.m_SammyOfficeController.Activate();
		this.m_SammyOfficeController.OnComplete += this.HandleSammyOfficeOnComplete;
	}

	// Token: 0x06000D6F RID: 3439 RVA: 0x0007B300 File Offset: 0x00079700
	private void HandleSammyOfficeOnComplete(object sender, EventArgs e)
	{
		this.m_SammyOfficeController.OnComplete -= this.HandleSammyOfficeOnComplete;
		this.ClearFirstHalf();
		this.m_SammyFinaleController.Activate();
		this.m_SammyFinaleController.OnComplete += this.HandleSammyFinaleOnComplete;
	}

	// Token: 0x06000D70 RID: 3440 RVA: 0x0007B34C File Offset: 0x0007974C
	private void HandleSammyFinaleOnComplete(object sender, EventArgs e)
	{
		this.m_SammyFinaleController.OnComplete -= this.HandleSammyFinaleOnComplete;
		this.m_InkWaterController.MoveAudioToBendy();
		this.m_BendyFinaleController.Activate();
		this.m_BendyFinaleController.OnComplete += this.HandleBendyFinaleOnComplete;
	}

	// Token: 0x06000D71 RID: 3441 RVA: 0x0007B39D File Offset: 0x0007979D
	private void HandleBendyFinaleOnComplete(object sender, EventArgs e)
	{
		this.m_BendyFinaleController.OnComplete -= this.HandleBendyFinaleOnComplete;
		this.m_BorisFinaleController.Activate();
		this.m_BorisFinaleController.OnComplete += this.HandleChapterOnComplete;
	}

	// Token: 0x06000D72 RID: 3442 RVA: 0x0007B3D8 File Offset: 0x000797D8
	private void HandleChapterOnComplete(object sender, EventArgs e)
	{
		this.m_BorisFinaleController.OnComplete -= this.HandleChapterOnComplete;
		CreditsDataVO data = new CreditsDataVO(true);
		GameManager.Instance.UIManager.Show<CreditsScreenController>("UI/Views/CreditsScreen", "VIEW", data);
		SceneManager.LoadScene("Credits");
	}

	// Token: 0x06000D73 RID: 3443 RVA: 0x0007B428 File Offset: 0x00079828
	private void ClearFirstHalf()
	{
		this.m_PentagramDoorController.Dispose();
		this.m_SammyHallwayController.Dispose();
		this.m_MainGateController.Dispose();
		this.m_MainPowerController.Dispose();
		this.m_AudioLogController.Dispose();
		this.m_RecordingStudioController.Dispose();
		this.m_SammyOfficeController.Dispose();
		this.TurnOffMusic();
	}

	// Token: 0x06000D74 RID: 3444 RVA: 0x0007B488 File Offset: 0x00079888
	private void TurnOffMusic()
	{
		if (this.m_HorrorAmbience != null)
		{
			this.m_HorrorAmbience.AudioSource.DOFade(0f, 2f).OnComplete(delegate
			{
				if (this.m_HorrorAmbience != null)
				{
					this.m_HorrorAmbience.Clear();
					this.m_HorrorAmbience = null;
				}
			});
		}
	}

	// Token: 0x06000D75 RID: 3445 RVA: 0x0007B4C7 File Offset: 0x000798C7
	protected override void OnDisposed()
	{
		if (this.m_HorrorAmbience != null)
		{
			this.m_HorrorAmbience.Clear();
			this.m_HorrorAmbience = null;
		}
		this.m_HorrorAmbienceClip = null;
		this.m_TitleMusicClip = null;
		base.OnDisposed();
	}

	// Token: 0x04000F81 RID: 3969
	[Header("< Controllers >")]
	[SerializeField]
	private ChapterTwoOpeningSequenceController m_OpeningSequenceController;

	// Token: 0x04000F82 RID: 3970
	[SerializeField]
	private ChapterOnePentagramDoorController m_PentagramDoorController;

	// Token: 0x04000F83 RID: 3971
	[SerializeField]
	private ChapterTwoSammyHallwayController m_SammyHallwayController;

	// Token: 0x04000F84 RID: 3972
	[SerializeField]
	private ChapterTwoMainGateSwitchController m_MainGateController;

	// Token: 0x04000F85 RID: 3973
	[SerializeField]
	private ChapterTwoMainPowerController m_MainPowerController;

	// Token: 0x04000F86 RID: 3974
	[SerializeField]
	private ChapterTwoAudioLogsController m_AudioLogController;

	// Token: 0x04000F87 RID: 3975
	[SerializeField]
	private ChapterTwoCollectableController m_CollectableController;

	// Token: 0x04000F88 RID: 3976
	[SerializeField]
	private ChapterTwoRecordingStudioController m_RecordingStudioController;

	// Token: 0x04000F89 RID: 3977
	[SerializeField]
	private ChapterTwoPipeCrankController m_ValveController;

	// Token: 0x04000F8A RID: 3978
	[SerializeField]
	private ChapterTwoSearcherFinaleController m_SearcherFinaleController;

	// Token: 0x04000F8B RID: 3979
	[SerializeField]
	private ChapterTwoSammyOfficeController m_SammyOfficeController;

	// Token: 0x04000F8C RID: 3980
	[SerializeField]
	private ChapterTwoSammyFinaleChallenge m_SammyFinaleController;

	// Token: 0x04000F8D RID: 3981
	[SerializeField]
	private ChapterTwoBendyFinaleController m_BendyFinaleController;

	// Token: 0x04000F8E RID: 3982
	[SerializeField]
	private ChapterTwoBorisFinaleController m_BorisFinaleController;

	// Token: 0x04000F8F RID: 3983
	[Header("< Other Controllers >")]
	[SerializeField]
	private InkWaterController m_InkWaterController;

	// Token: 0x04000F90 RID: 3984
	[Header("TEMP")]
	[SerializeField]
	private GameObject m_TEMP_WATER;

	// Token: 0x04000F91 RID: 3985
	private ChapterManager m_ChapterManager;

	// Token: 0x04000F92 RID: 3986
	private AudioObject m_HorrorAmbience;

	// Token: 0x04000F93 RID: 3987
	private AudioClip m_HorrorAmbienceClip;

	// Token: 0x04000F94 RID: 3988
	private AudioClip m_TitleMusicClip;
}
