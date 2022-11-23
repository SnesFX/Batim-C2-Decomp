using System;
using TMG.Core;
using TMG.Data;
using TMG.UI;
using UnityEngine;

// Token: 0x020002DA RID: 730
public class GameManager : TMGAbstractDisposable
{
	// Token: 0x060010E1 RID: 4321 RVA: 0x0008912D File Offset: 0x0008752D
	protected GameManager()
	{
		this.isPaused = false;
	}

	// Token: 0x170002CD RID: 717
	// (get) Token: 0x060010E2 RID: 4322 RVA: 0x0008913C File Offset: 0x0008753C
	// (set) Token: 0x060010E3 RID: 4323 RVA: 0x00089144 File Offset: 0x00087544
	public bool isPauseReady { get; private set; }

	// Token: 0x170002CE RID: 718
	// (get) Token: 0x060010E4 RID: 4324 RVA: 0x0008914D File Offset: 0x0008754D
	// (set) Token: 0x060010E5 RID: 4325 RVA: 0x00089155 File Offset: 0x00087555
	public bool isPaused { get; private set; }

	// Token: 0x170002CF RID: 719
	// (get) Token: 0x060010E6 RID: 4326 RVA: 0x0008915E File Offset: 0x0008755E
	public static GameManager Instance
	{
		get
		{
			if (GameManager.m_Instance == null)
			{
				GameManager.m_Instance = new GameManager();
			}
			return GameManager.m_Instance;
		}
	}

	// Token: 0x060010E7 RID: 4327 RVA: 0x00089179 File Offset: 0x00087579
	public AudioClip GetAudioClip(string assetKey)
	{
		return GameManager.Instance.AssetManager.GetAsset<AudioClip>(assetKey);
	}

	// Token: 0x060010E8 RID: 4328 RVA: 0x0008918B File Offset: 0x0008758B
	public AudioClip[] GetAudioClips(string folderKey)
	{
		return GameManager.Instance.AssetManager.GetAssets<AudioClip>(folderKey);
	}

	// Token: 0x060010E9 RID: 4329 RVA: 0x0008919D File Offset: 0x0008759D
	private void CheckScreenBlocker()
	{
		if (this.m_ScreenBlockerController == null)
		{
			this.m_ScreenBlockerController = GameManager.Instance.UIManager.Show<ScreenBlockerController>("UI/Blocker/ScreenBlockerController", "BLOCKER", null);
		}
	}

	// Token: 0x060010EA RID: 4330 RVA: 0x000891D0 File Offset: 0x000875D0
	public void ShowScreenBlocker(float duration = 0.5f, float delay = 0f, Action onComplete = null)
	{
		this.CheckScreenBlocker();
		this.m_BlockerOnShow = onComplete;
		this.m_ScreenBlockerController.Show(duration, delay);
		this.m_ScreenBlockerController.OnShow -= this.HandleScreenBlockerOnShown;
		this.m_ScreenBlockerController.OnShow += this.HandleScreenBlockerOnShown;
	}

	// Token: 0x060010EB RID: 4331 RVA: 0x00089228 File Offset: 0x00087628
	public void HideScreenBlocker(float duration = 0.5f, float delay = 0f, Action onComplete = null)
	{
		this.CheckScreenBlocker();
		this.m_BlockerOnHide = onComplete;
		this.m_ScreenBlockerController.Hide(duration, delay);
		this.m_ScreenBlockerController.OnHide -= this.HandleScreenBlockerOnHide;
		this.m_ScreenBlockerController.OnHide += this.HandleScreenBlockerOnHide;
	}

	// Token: 0x060010EC RID: 4332 RVA: 0x0008927D File Offset: 0x0008767D
	private void HandleScreenBlockerOnShown(object sender, EventArgs e)
	{
		this.m_ScreenBlockerController.OnShow -= this.HandleScreenBlockerOnShown;
		if (this.m_BlockerOnShow != null)
		{
			this.m_BlockerOnShow();
		}
	}

	// Token: 0x060010ED RID: 4333 RVA: 0x000892AC File Offset: 0x000876AC
	private void HandleScreenBlockerOnHide(object sender, EventArgs e)
	{
		this.m_ScreenBlockerController.OnHide -= this.HandleScreenBlockerOnHide;
		if (this.m_BlockerOnHide != null)
		{
			this.m_BlockerOnHide();
		}
	}

	// Token: 0x060010EE RID: 4334 RVA: 0x000892DC File Offset: 0x000876DC
	public void ShowChapterTitle(string chapter, string title, bool showBlocker = true)
	{
		ChapterTitleDataVO data = ChapterTitleDataVO.Create(chapter, title, showBlocker);
		GameManager.Instance.UIManager.Show<ChapterTitleModalController>("UI/Modals/ChapterTitleModalController", "CHAPTERTITLE", data);
	}

	// Token: 0x060010EF RID: 4335 RVA: 0x00089310 File Offset: 0x00087710
	public void ShowHurtBorder(bool isSilent = false)
	{
		if (this.isDead)
		{
			return;
		}
		if (this.m_HurtBordersController == null)
		{
			this.m_HurtBordersController = GameManager.Instance.UIManager.Show<HurtBordersController>("UI/Borders/HurtBordersController", "BORDERS", null);
			this.m_HurtBordersController.OnMaxHit -= this.HandleHurtBordersOnHitMax;
			this.m_HurtBordersController.OnMaxHit += this.HandleHurtBordersOnHitMax;
		}
		this.m_HurtBordersController.ShowBorder(isSilent);
	}

	// Token: 0x060010F0 RID: 4336 RVA: 0x00089394 File Offset: 0x00087794
	private void HandleHurtBordersOnHitMax(object sender, EventArgs e)
	{
		this.m_HurtBordersController.Kill();
		this.m_HurtBordersController = null;
		DOTweenUtil.DOAudioListenerVolume(0f, 1f, new Action(this.ReloadChapter));
	}

	// Token: 0x060010F1 RID: 4337 RVA: 0x000893C4 File Offset: 0x000877C4
	public void ReloadChapter()
	{
		this.Player = null;
		this.GameCamera = null;
		this.ReloadChapter(GameManager.Instance.CurrentChapter);
	}

	// Token: 0x060010F2 RID: 4338 RVA: 0x000893E4 File Offset: 0x000877E4
	public void ReloadChapter(string chapter)
	{
		this.Player = null;
		this.GameCamera = null;
		this.isDead = false;
		this.isPaused = false;
		this.ClearAllGameUI();
		DOTweenUtil.KillAll();
		GameManager.Instance.AudioManager.ClearAll();
		GameManager.Instance.LoadScene(new GenericLoaderDataVO(chapter, false));
	}

	// Token: 0x060010F3 RID: 4339 RVA: 0x00089438 File Offset: 0x00087838
	public void ShowCrosshair()
	{
		if (GameManager.Instance.PlayerSettings.Crosshair)
		{
			if (this.m_MainCrosshairController == null)
			{
				this.m_MainCrosshairController = GameManager.Instance.UIManager.Show<MainCrosshairController>("UI/Crosshairs/MainCrosshairController", "CROSSHAIR", null);
			}
			else
			{
				this.m_MainCrosshairController.Show();
			}
		}
		else
		{
			this.KillCrosshair();
		}
	}

	// Token: 0x060010F4 RID: 4340 RVA: 0x000894A5 File Offset: 0x000878A5
	public void HideCrosshair()
	{
		if (GameManager.Instance.PlayerSettings.Crosshair && this.m_MainCrosshairController != null)
		{
			this.m_MainCrosshairController.Hide();
		}
	}

	// Token: 0x060010F5 RID: 4341 RVA: 0x000894D7 File Offset: 0x000878D7
	public void KillCrosshair()
	{
		if (this.m_MainCrosshairController != null)
		{
			this.m_MainCrosshairController.Dispose();
			this.m_MainCrosshairController = null;
		}
	}

	// Token: 0x060010F6 RID: 4342 RVA: 0x000894FC File Offset: 0x000878FC
	public void UnlockPause()
	{
		this.isPauseReady = true;
	}

	// Token: 0x060010F7 RID: 4343 RVA: 0x00089505 File Offset: 0x00087905
	public void LockPause()
	{
		this.isPauseReady = false;
	}

	// Token: 0x060010F8 RID: 4344 RVA: 0x00089510 File Offset: 0x00087910
	public void Pause()
	{
		if (this.m_PauseMenu == null && !this.isPaused)
		{
			this.isPaused = true;
			this.m_PauseMenu = GameManager.Instance.UIManager.Show<GameMenuController>("UI/Menus/GameMenuController", "PAUSE", null);
			this.m_PauseMenu.OnPlayOutComplete -= this.HandlePauseMenuPlayOutComplete;
			this.m_PauseMenu.OnPlayOutComplete += this.HandlePauseMenuPlayOutComplete;
			if (GameManager.Instance.Player != null)
			{
				GameManager.Instance.Player.Lock();
			}
			this.ShowCurrentObjective();
		}
	}

	// Token: 0x060010F9 RID: 4345 RVA: 0x000895B8 File Offset: 0x000879B8
	public void Unpause()
	{
		if (this.m_PauseMenu != null && this.isPaused)
		{
			this.isPaused = false;
			this.m_PauseMenu.CloseMenu();
			if (this.m_ObjectiveController != null)
			{
				this.m_ObjectiveController.Hide();
			}
		}
	}

	// Token: 0x060010FA RID: 4346 RVA: 0x00089610 File Offset: 0x00087A10
	public AudioObject ShowDialogue(DialogueDataVO dataVO)
	{
		AudioObject audioObject;
		if (dataVO.DialogueClip != null)
		{
			audioObject = GameManager.Instance.AudioManager.Play(dataVO.DialogueClip, AudioObjectType.DIALOGUE, 0, true);
		}
		else
		{
			audioObject = GameManager.Instance.AudioManager.Play(dataVO.Dialogue, AudioObjectType.DIALOGUE, 0, true);
		}
		dataVO.Subtitles.Duration = audioObject.AudioClip.length;
		if (GameManager.Instance.PlayerSettings.Subtitles)
		{
			GameManager.Instance.ShowSubtitles(dataVO.Subtitles.Subtitles, dataVO.Subtitles.Duration, dataVO.Subtitles.IsTrimmed);
		}
		return audioObject;
	}

	// Token: 0x060010FB RID: 4347 RVA: 0x000896C0 File Offset: 0x00087AC0
	public void ShowSubtitles(string subtitles, float duration, bool isTrimmed = false)
	{
		if (!GameManager.Instance.PlayerSettings.Subtitles)
		{
			return;
		}
		if (this.m_MainSubtitlesController == null)
		{
			this.m_MainSubtitlesController = GameManager.Instance.UIManager.Show<MainSubtitlesController>("UI/Subtitles/MainSubtitlesController", "SUBTITLES", null);
		}
		this.m_MainSubtitlesController.ShowSubtitles(subtitles, duration, isTrimmed);
	}

	// Token: 0x060010FC RID: 4348 RVA: 0x00089721 File Offset: 0x00087B21
	public void ShowCollectable(CollectableDataVO dataVO)
	{
		GameManager.Instance.UIManager.Show<CollectableModalController>("UI/Modals/CollectableModalController", "MODAL", dataVO);
	}

	// Token: 0x060010FD RID: 4349 RVA: 0x00089740 File Offset: 0x00087B40
	public void ShowCurrentObjective()
	{
		if (this.m_CurrentObjective == null)
		{
			return;
		}
		if (this.m_CurrentObjective != null)
		{
			this.m_CurrentObjective.Header = "Current Objective:";
			this.m_CurrentObjective.IsCurrentObjective = true;
			this.m_CurrentObjective.Delay = 0f;
		}
		if (this.m_ObjectiveController != null)
		{
			this.m_ObjectiveController.OnPlayOutComplete -= this.HandleShowAfterObjectivePlayOutComplete;
			this.m_ObjectiveController.OnPlayOutComplete += this.HandleShowAfterObjectivePlayOutComplete;
			this.m_ObjectiveController.Hide();
		}
		else
		{
			this.m_ObjectiveController = this.ActualShowObjective();
		}
	}

	// Token: 0x060010FE RID: 4350 RVA: 0x000897EB File Offset: 0x00087BEB
	public void ClearObjective()
	{
		this.m_CurrentObjective = null;
		this.m_ObjectiveController = null;
	}

	// Token: 0x060010FF RID: 4351 RVA: 0x000897FC File Offset: 0x00087BFC
	public void ShowObjective(ObjectiveDataVO data)
	{
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_HUD_whoosh_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_CurrentObjective = data;
		if (this.m_ObjectiveController != null)
		{
			this.m_ObjectiveController.OnPlayOutComplete -= this.HandleShowAfterObjectivePlayOutComplete;
			this.m_ObjectiveController.OnPlayOutComplete += this.HandleShowAfterObjectivePlayOutComplete;
			this.m_ObjectiveController.Hide();
		}
		else
		{
			this.m_ObjectiveController = this.ActualShowObjective();
		}
	}

	// Token: 0x06001100 RID: 4352 RVA: 0x00089883 File Offset: 0x00087C83
	private ObjectivesController ActualShowObjective()
	{
		return GameManager.Instance.UIManager.Show<ObjectivesController>("UI/Objectives/ObjectiveController", "OBJECTIVE", this.m_CurrentObjective);
	}

	// Token: 0x06001101 RID: 4353 RVA: 0x000898A4 File Offset: 0x00087CA4
	private void HandleObjectivePlayOutComplete(object sender, EventArgs e)
	{
		this.m_ObjectiveController.OnPlayOutComplete -= this.HandleObjectivePlayOutComplete;
		this.m_ObjectiveController = null;
	}

	// Token: 0x06001102 RID: 4354 RVA: 0x000898C4 File Offset: 0x00087CC4
	private void HandleShowAfterObjectivePlayOutComplete(object sender, EventArgs e)
	{
		this.m_ObjectiveController.OnPlayOutComplete -= this.HandleShowAfterObjectivePlayOutComplete;
		this.m_ObjectiveController = this.ActualShowObjective();
	}

	// Token: 0x06001103 RID: 4355 RVA: 0x000898EC File Offset: 0x00087CEC
	private void HandlePauseMenuPlayOutComplete(object sender, EventArgs e)
	{
		this.m_PauseMenu.OnPlayOutComplete -= this.HandlePauseMenuPlayOutComplete;
		this.m_PauseMenu = null;
		if (GameManager.Instance.Player != null)
		{
			GameManager.Instance.Player.Unlock();
		}
	}

	// Token: 0x06001104 RID: 4356 RVA: 0x0008993C File Offset: 0x00087D3C
	public ChapterManager GetChapter(Chapters chapter)
	{
		switch (chapter)
		{
		case Chapters.ONE:
			return this.ChapterOne;
		case Chapters.TWO:
			return this.ChapterTwo;
		case Chapters.THREE:
			return this.ChapterOne;
		case Chapters.FOUR:
			return this.ChapterOne;
		case Chapters.FIVE:
			return this.ChapterOne;
		default:
			return this.ChapterOne;
		}
	}

	// Token: 0x06001105 RID: 4357 RVA: 0x00089994 File Offset: 0x00087D94
	public void LoadScene(GenericLoaderDataVO data)
	{
		this.isDead = false;
		this.Player = null;
		this.GameCamera = null;
		this.isPaused = false;
		if (this.m_GenericLoader == null)
		{
			this.m_GenericLoader = GameManager.Instance.UIManager.Show<GenericLoaderController>("UI/Loaders/GenericLoaderController", "LOADER", data);
		}
		this.m_GenericLoader.LoadScene(data);
		this.m_GenericLoader.OnLoaded -= this.HandleSceneOnLoaded;
		this.m_GenericLoader.OnLoaded += this.HandleSceneOnLoaded;
	}

	// Token: 0x06001106 RID: 4358 RVA: 0x00089A28 File Offset: 0x00087E28
	private void HandleSceneOnLoaded(object sender, EventArgs e)
	{
		this.m_GenericLoader.OnLoaded -= this.HandleSceneOnLoaded;
		this.m_GenericLoader.HideLoader();
	}

	// Token: 0x06001107 RID: 4359 RVA: 0x00089A4C File Offset: 0x00087E4C
	public void ClearAllGameUI()
	{
		this.KillCrosshair();
		if (this.m_HurtBordersController != null)
		{
			this.m_HurtBordersController.Dispose();
			this.m_HurtBordersController = null;
		}
		if (this.m_ObjectiveController != null)
		{
			this.m_ObjectiveController.Dispose();
			this.m_ObjectiveController = null;
		}
		if (this.m_CurrentObjective != null)
		{
			this.m_CurrentObjective.Dispose();
			this.m_CurrentObjective = null;
		}
		if (this.m_PauseMenu != null)
		{
			this.m_PauseMenu.Dispose();
			this.m_PauseMenu = null;
		}
		if (this.m_MainSubtitlesController != null)
		{
			this.m_MainSubtitlesController.Dispose();
			this.m_MainSubtitlesController = null;
		}
	}

	// Token: 0x06001108 RID: 4360 RVA: 0x00089B08 File Offset: 0x00087F08
	public string GetProjectVersion()
	{
		string str = "v1.";
		str += "2";
		return str + "." + this.GetPatchVersion();
	}

	// Token: 0x06001109 RID: 4361 RVA: 0x00089B3A File Offset: 0x00087F3A
	private string GetPatchVersion()
	{
		return "0";
	}

	// Token: 0x0600110A RID: 4362 RVA: 0x00089B41 File Offset: 0x00087F41
	public void Quit()
	{
		Application.Quit();
	}

	// Token: 0x0600110B RID: 4363 RVA: 0x00089B48 File Offset: 0x00087F48
	protected override void OnDisposed()
	{
		this.isPaused = false;
		if (this.m_PauseMenu != null)
		{
			this.m_PauseMenu.OnPlayOutComplete -= this.HandlePauseMenuPlayOutComplete;
			this.m_PauseMenu = null;
		}
		this.PlayerSettings.Dispose();
		this.ChapterOne.Dispose();
		this.ChapterTwo.Dispose();
		this.Player = null;
		this.GameCamera = null;
		this.m_MainCrosshairController = null;
		this.m_ObjectiveController = null;
		this.m_MainSubtitlesController = null;
		this.m_HurtBordersController = null;
		this.isPaused = false;
		base.OnDisposed();
	}

	// Token: 0x040012CE RID: 4814
	public ObjectiveConstants.ChapterObjectives CurrentObjective;

	// Token: 0x040012CF RID: 4815
	public AssetManager AssetManager;

	// Token: 0x040012D0 RID: 4816
	public UIManager UIManager;

	// Token: 0x040012D1 RID: 4817
	public AudioManager AudioManager;

	// Token: 0x040012D2 RID: 4818
	public PlayerSettings PlayerSettings;

	// Token: 0x040012D3 RID: 4819
	public AchievementManager AchievementManager;

	// Token: 0x040012D4 RID: 4820
	public GameCamera GameCamera;

	// Token: 0x040012D5 RID: 4821
	public PlayerController Player;

	// Token: 0x040012D6 RID: 4822
	public ChapterManager ChapterOne;

	// Token: 0x040012D7 RID: 4823
	public ChapterManager ChapterTwo;

	// Token: 0x040012DA RID: 4826
	private ScreenBlockerController m_ScreenBlockerController;

	// Token: 0x040012DB RID: 4827
	private GenericLoaderController m_GenericLoader;

	// Token: 0x040012DC RID: 4828
	private MainCrosshairController m_MainCrosshairController;

	// Token: 0x040012DD RID: 4829
	private GameMenuController m_PauseMenu;

	// Token: 0x040012DE RID: 4830
	private MainSubtitlesController m_MainSubtitlesController;

	// Token: 0x040012DF RID: 4831
	private ObjectivesController m_ObjectiveController;

	// Token: 0x040012E0 RID: 4832
	private HurtBordersController m_HurtBordersController;

	// Token: 0x040012E1 RID: 4833
	private ObjectiveDataVO m_CurrentObjective;

	// Token: 0x040012E2 RID: 4834
	private Action m_BlockerOnShow;

	// Token: 0x040012E3 RID: 4835
	private Action m_BlockerOnHide;

	// Token: 0x040012E4 RID: 4836
	public bool hasChapterTwo_SavePoint;

	// Token: 0x040012E5 RID: 4837
	public string CurrentChapter;

	// Token: 0x040012E6 RID: 4838
	public bool isDead;

	// Token: 0x040012E7 RID: 4839
	public bool isGameLoaded;

	// Token: 0x040012E8 RID: 4840
	private static GameManager m_Instance;
}
