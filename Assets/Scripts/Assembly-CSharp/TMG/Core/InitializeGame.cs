using System;
using DG.Tweening;
using GameJolt.API;
using InControl;
using TMG.Data;
using TMG.UI;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace TMG.Core
{
	// Token: 0x020002A8 RID: 680
	public class InitializeGame : TMGMonoBehaviour
	{
		// Token: 0x06000FC8 RID: 4040 RVA: 0x00085980 File Offset: 0x00083D80
		public override void Init()
		{
			base.Init();
			this.m_GameManager = GameManager.Instance;

			Initialize();
		}

		public static void Initialize()
		{
			Application.targetFrameRate = 60;
			InitAssetManager();
			InitPlayerSettings();
			InitAchievementManager();
			InitAudioManager();
			InitDOTween();
			InitInControl();
			InitChapters();
			InitUIManager();
		}

		// Token: 0x06000FC9 RID: 4041 RVA: 0x000859D8 File Offset: 0x00083DD8
		public override void InitOnComplete()
		{
			base.InitOnComplete();
			SceneManager.LoadScene("MainMenu");

			if(!m_ShowSpashScreen)
			{
				GameManager.Instance.UIManager.Show<TitleScreenController>("UI/Views/TitleScreen", "VIEW", null);
				return;
			}

			if (!GameManager.Instance.isGameLoaded)
			{
				GameManager.Instance.UIManager.Show<SplashScreenController>("UI/Views/SplashScreen", "VIEW", null);
			}
			else
			{
				GameManager.Instance.UIManager.Show<TitleScreenController>("UI/Views/TitleScreen", "VIEW", null);
			}
			base.Dispose();
		}

		// Token: 0x06000FCA RID: 4042 RVA: 0x00085A45 File Offset: 0x00083E45
		private static void InitAssetManager()
		{
			GameManager.Instance.AssetManager = new AssetManager();
		}

		// Token: 0x06000FCB RID: 4043 RVA: 0x00085A57 File Offset: 0x00083E57
		private static void InitPlayerSettings()
		{
			GameManager.Instance.PlayerSettings = new PlayerSettings();
			GameManager.Instance.PlayerSettings.InitializeResolution();
		}

		// Token: 0x06000FCC RID: 4044 RVA: 0x00085A79 File Offset: 0x00083E79
		private static void InitAchievementManager()
		{
			GameManager.Instance.AssetManager.CreateAsset<GameJoltAPI>("Managers/GameJoltManager");
			GameManager.Instance.AchievementManager = new AchievementManager();
			GameManager.Instance.AchievementManager.Init();
		}

		// Token: 0x06000FCD RID: 4045 RVA: 0x00085AB0 File Offset: 0x00083EB0
		private static void InitDOTween()
		{
			DOTween.Init(null, null, null);
		}

		// Token: 0x06000FCE RID: 4046 RVA: 0x00085AE0 File Offset: 0x00083EE0
		private static void InitInControl()
		{
			//InControlManager instance = SingletonMonoBehavior<InControlManager, MonoBehaviour>.Instance;
			//instance.enabled = false;
			//instance.dontDestroyOnLoad = true;
			//instance.enabled = true;
		}

		// Token: 0x06000FCF RID: 4047 RVA: 0x00085B08 File Offset: 0x00083F08
		private static void InitAudioManager()
		{
			GameManager.Instance.AudioManager = AudioManager.Create();
		}

		// Token: 0x06000FD0 RID: 4048 RVA: 0x00085B1A File Offset: 0x00083F1A
		private static void InitChapters()
		{
			GameManager.Instance.ChapterOne = new ChapterManager(Chapters.ONE);
			GameManager.Instance.ChapterOne.AddCollectables(6);
			GameManager.Instance.ChapterTwo = new ChapterManager(Chapters.TWO);
		}

		// Token: 0x06000FD1 RID: 4049 RVA: 0x00085B4F File Offset: 0x00083F4F
		private static void InitUIManager()
		{
			GameManager.Instance.UIManager = UIManager.Create(null);
		}

		// Token: 0x06000FD2 RID: 4050 RVA: 0x00085B62 File Offset: 0x00083F62
		protected override void OnDisposed()
		{
			this.m_GameManager = null;
			base.OnDisposed();
		}

		// Token: 0x0400115C RID: 4444
		private GameManager m_GameManager;

		[SerializeField]
		private bool m_ShowSpashScreen = true;
	}
}
