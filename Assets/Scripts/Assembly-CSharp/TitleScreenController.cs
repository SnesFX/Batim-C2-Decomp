using System;
using System.Collections.Generic;
using DG.Tweening;
using GameJolt.API;
using GameJolt.API.Core;
using GameJolt.UI;
using TMG.UI;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x020002FE RID: 766
public class TitleScreenController : BaseUIController
{
	// Token: 0x170002D4 RID: 724
	// (get) Token: 0x060011F6 RID: 4598 RVA: 0x0008DE25 File Offset: 0x0008C225
	// (set) Token: 0x060011F7 RID: 4599 RVA: 0x0008DE2D File Offset: 0x0008C22D
	public AudioObject TitleMusicAudioObject { get; private set; }

	// Token: 0x060011F8 RID: 4600 RVA: 0x0008DE38 File Offset: 0x0008C238
	public override void InitController(object _data)
	{
		base.InitController(_data);
		GameManager.Instance.LockPause();
		Cursor.visible = true;
		Cursor.lockState = CursorLockMode.None;
		GameManager.Instance.AudioManager.ListenerSetActive(true);
		this.m_VersionLabel.text = GameManager.Instance.GetProjectVersion();
		this.SetupBasicMenu();
		for (int i = 0; i < this.m_MenuItemButtons.Count; i++)
		{
			this.m_MenuItemButtons[i].OnSelected += this.HandleMenuItemOnSelected;
		}
		this.SetupChapterMenu();
		this.m_MenuItemButton.gameObject.SetActive(false);
		this.m_ChapterMenuItemButton.gameObject.SetActive(false);
		this.m_ChapterMenuItemContainer.gameObject.SetActive(false);
		this.m_BackgroundImages = new List<Image>();
		this.m_BackgroundImages.Add(this.m_Background_01);
		this.m_BackgroundImages.Add(this.m_Background_02);
		this.m_ForegroundImages = new List<Image>();
		this.m_ForegroundImages.Add(this.m_Foreground_01);
		this.m_ForegroundImages.Add(this.m_Foreground_02);
		this.m_BlackOutImage.color = new Color(0f, 0f, 0f, 1f);
		Color color = new Color(1f, 1f, 1f, 0f);
		this.m_Background_01.color = color;
		this.m_Foreground_01.color = color;
		this.m_Background_02.color = color;
		this.m_Foreground_02.color = color;
		this.m_WhooshClip = GameManager.Instance.GetAudioClip("Audio/Sounds/Credits/Whoosh");
		this.m_SketchesMusicClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_Title_Music_Sketches");
	}

	// Token: 0x060011F9 RID: 4601 RVA: 0x0008DFF4 File Offset: 0x0008C3F4
	public override void PlayIn()
	{
		GameManager.Instance.AudioManager.Play(this.m_WhooshClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.TitleMusicAudioObject = GameManager.Instance.AudioManager.Play(this.m_SketchesMusicClip, AudioObjectType.MUSIC, -1, false);
		this.m_LightFlickerImage.DOFade(0.1f, 0.1f).SetEase(Ease.Linear).SetLoops(-1, LoopType.Yoyo);
		this.m_BackgroundContainer.DOScale(1.05f, 5f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		this.m_ForegroundContainer.DOScale(1.15f, 5f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		this.SwapBackground(this.m_Background_01, this.m_Foreground_01);
		this.m_BlackOutImage.DOFade(0f, 0.5f).OnComplete(new TweenCallback(this.PlayInComplete));
	}

	// Token: 0x060011FA RID: 4602 RVA: 0x0008E0DC File Offset: 0x0008C4DC
	private void SetupBasicMenu()
	{
		MenuItemButtonDataVO vo = MenuItemButtonDataVO.Create("New Game", new Action(this.LoadChapterOne));
		this.m_MenuItemButtons.Add(this.CreateMenuItemButton(this.m_MenuItemButton, this.m_MenuItemContainer, vo));
		MenuItemButtonDataVO vo2 = MenuItemButtonDataVO.Create("Chapter Selection", new Action(this.ShowChapterMenu));
		this.m_MenuItemButtons.Add(this.CreateMenuItemButton(this.m_MenuItemButton, this.m_MenuItemContainer, vo2));
		if (MonoSingleton<GameJoltAPI>.Instance.CurrentUser == null)
		{
			MenuItemButtonDataVO vo3 = MenuItemButtonDataVO.Create("Game Jolt Sign In", new Action(this.ShowGameJoltSignIn));
			this.m_GameJoltSignInButton = this.CreateMenuItemButton(this.m_MenuItemButton, this.m_MenuItemContainer, vo3);
			this.m_MenuItemButtons.Add(this.m_GameJoltSignInButton);
		}
		this.SetupFinalButtons();
	}

	// Token: 0x060011FB RID: 4603 RVA: 0x0008E1AC File Offset: 0x0008C5AC
	private void SetupFinalButtons()
	{
		MenuItemButtonDataVO vo = MenuItemButtonDataVO.Create("Quit", new Action(GameManager.Instance.Quit));
		this.m_MenuItemButtons.Add(this.CreateMenuItemButton(this.m_MenuItemButton, this.m_MenuItemContainer, vo));
	}

	// Token: 0x060011FC RID: 4604 RVA: 0x0008E1F4 File Offset: 0x0008C5F4
	private void SetupChapterMenu()
	{
		this.GetChapterData("Chapter One: Moving Pictures", new Action(this.HandleChapterOneOnClick), new EventHandler(this.HandleChapterOneOnEnter), true);
		this.GetChapterData("Chapter Two: The Old Song", new Action(this.HandleChapterTwoOnClick), new EventHandler(this.HandleChapterTwoOnEnter), true);
		this.GetChapterData("Chapter Three: Coming Soon", null, null, false);
		this.GetChapterData("Chapter Four: Coming Soon", null, null, false);
		this.GetChapterData("Chapter Five: Coming Soon", null, null, false);
	}

	// Token: 0x060011FD RID: 4605 RVA: 0x0008E274 File Offset: 0x0008C674
	private void GetChapterData(string title, Action onClick, EventHandler onEvent, bool isAvailable)
	{
		MenuItemButtonDataVO vo = MenuItemButtonDataVO.Create(title, onClick);
		MenuItemButton menuItemButton = this.CreateMenuItemButton(this.m_ChapterMenuItemButton, this.m_ChapterMenuItemContainer, vo);
		if (isAvailable)
		{
			menuItemButton.Button.OnEnter += onEvent;
			this.m_ChapterMenuItemButtons.Add(menuItemButton);
		}
		else
		{
			menuItemButton.Button.Button.interactable = false;
		}
	}

	// Token: 0x060011FE RID: 4606 RVA: 0x0008E2D2 File Offset: 0x0008C6D2
	private void HandleChapterOneOnClick()
	{
		this.LoadChapterOne();
	}

	// Token: 0x060011FF RID: 4607 RVA: 0x0008E2DA File Offset: 0x0008C6DA
	private void LoadChapterOne()
	{
		this.m_BlackOutImage.DOFade(1f, 0.5f).OnComplete(delegate
		{
			ChapterOneIntroModalController chapterOneIntroModalController = GameManager.Instance.UIManager.Show<ChapterOneIntroModalController>("UI/Modals/ChapterOneIntroModalController", "MODAL", this);
			chapterOneIntroModalController.SetSceneToLoad("ChapterOne");
		});
	}

	// Token: 0x06001200 RID: 4608 RVA: 0x0008E304 File Offset: 0x0008C704
	private void HandleChapterTwoOnClick()
	{
		this.m_BlackOutImage.DOFade(1f, 0.49f);
		this.TitleMusicAudioObject.AudioSource.DOFade(0f, 0.5f).OnComplete(delegate
		{
			this.TitleMusicAudioObject.Clear();
			this.TitleMusicAudioObject = null;
			GameManager.Instance.AudioManager.ListenerSetActive(false);
			GameManager.Instance.LoadScene(new GenericLoaderDataVO("ChapterTwo", true));
			base.Kill();
		});
	}

	// Token: 0x06001201 RID: 4609 RVA: 0x0008E353 File Offset: 0x0008C753
	private void HandleChapterThreeOnClick()
	{
	}

	// Token: 0x06001202 RID: 4610 RVA: 0x0008E355 File Offset: 0x0008C755
	private void HandleChapterFourOnClick()
	{
	}

	// Token: 0x06001203 RID: 4611 RVA: 0x0008E357 File Offset: 0x0008C757
	private void HandleChapterFiveOnClick()
	{
	}

	// Token: 0x06001204 RID: 4612 RVA: 0x0008E35C File Offset: 0x0008C75C
	private void HandleMenuItemOnSelected(object sender, EventArgs e)
	{
		for (int i = 0; i < this.m_MenuItemButtons.Count; i++)
		{
			MenuItemButton menuItemButton = this.m_MenuItemButtons[i];
			if (!menuItemButton.Equals(sender))
			{
				menuItemButton.Deselect();
			}
		}
	}

	// Token: 0x06001205 RID: 4613 RVA: 0x0008E3A9 File Offset: 0x0008C7A9
	private void HandleChapterOneOnEnter(object sender, EventArgs e)
	{
		this.SwapBackground(this.m_Background_01, this.m_Foreground_01);
	}

	// Token: 0x06001206 RID: 4614 RVA: 0x0008E3BD File Offset: 0x0008C7BD
	private void HandleChapterTwoOnEnter(object sender, EventArgs e)
	{
		this.SwapBackground(this.m_Background_02, this.m_Foreground_02);
	}

	// Token: 0x06001207 RID: 4615 RVA: 0x0008E3D1 File Offset: 0x0008C7D1
	private void HandleChapterThreeOnEnter(object sender, EventArgs e)
	{
	}

	// Token: 0x06001208 RID: 4616 RVA: 0x0008E3D3 File Offset: 0x0008C7D3
	private void HandleChapterFourOnEnter(object sender, EventArgs e)
	{
	}

	// Token: 0x06001209 RID: 4617 RVA: 0x0008E3D5 File Offset: 0x0008C7D5
	private void HandleChapterFiveOnEnter(object sender, EventArgs e)
	{
	}

	// Token: 0x0600120A RID: 4618 RVA: 0x0008E3D8 File Offset: 0x0008C7D8
	private void SwapBackground(Image background, Image foreground)
	{
		int count = this.m_BackgroundImages.Count;
		for (int i = 0; i < count; i++)
		{
			Image image = this.m_BackgroundImages[i];
			image.DOKill(false);
			if (image.Equals(background))
			{
				image.DOFade(1f, 0.5f);
			}
			else
			{
				image.DOFade(0f, 0.5f);
			}
		}
		int count2 = this.m_ForegroundImages.Count;
		for (int j = 0; j < count2; j++)
		{
			Image image2 = this.m_ForegroundImages[j];
			image2.DOKill(false);
			if (image2.Equals(foreground))
			{
				image2.DOFade(1f, 0.5f);
			}
			else
			{
				image2.DOFade(0f, 0.5f);
			}
		}
	}

	// Token: 0x0600120B RID: 4619 RVA: 0x0008E4BC File Offset: 0x0008C8BC
	private MenuItemButton CreateMenuItemButton(MenuItemButton _button, Transform _parent, MenuItemButtonDataVO _vo)
	{
		MenuItemButton menuItemButton = UnityEngine.Object.Instantiate<MenuItemButton>(_button);
		menuItemButton.transform.SetParent(_parent);
		menuItemButton.transform.localPosition = Vector3.zero;
		menuItemButton.transform.localEulerAngles = Vector3.zero;
		menuItemButton.transform.localScale = Vector3.one;
		menuItemButton.Init(_vo);
		return menuItemButton;
	}

	// Token: 0x0600120C RID: 4620 RVA: 0x0008E514 File Offset: 0x0008C914
	private void ShowChapterMenu()
	{
		if (this.m_CurrentSelection != TitleScreenController.MenuSelection.CHAPTERS)
		{
			this.m_CurrentSelection = TitleScreenController.MenuSelection.CHAPTERS;
			this.m_ChapterCanvas.alpha = 0f;
			this.m_ChapterMenuItemContainer.gameObject.SetActive(true);
			this.m_ChapterCanvas.DOFade(1f, 0.5f);
		}
	}

	// Token: 0x0600120D RID: 4621 RVA: 0x0008E56B File Offset: 0x0008C96B
	private void HideChapterMenu()
	{
		this.m_CurrentSelection = TitleScreenController.MenuSelection.NONE;
		this.m_ChapterCanvas.DOFade(0f, 0.5f).OnComplete(delegate
		{
			this.m_ChapterMenuItemContainer.gameObject.SetActive(false);
		});
	}

	// Token: 0x0600120E RID: 4622 RVA: 0x0008E59B File Offset: 0x0008C99B
	private void ShowGameJoltSignIn()
	{
		//MonoSingleton<GameJoltAPI>.Instance.ShowSignIn(new Action<bool>(this.HandleGameJoltSignInSuccess));
	}

	// Token: 0x0600120F RID: 4623 RVA: 0x0008E5B3 File Offset: 0x0008C9B3
	private void HandleGameJoltSignInSuccess(bool success)
	{
		if (success)
		{
			this.m_GameJoltSignInButton.gameObject.SetActive(false);
		}
	}

	// Token: 0x06001210 RID: 4624 RVA: 0x0008E5CC File Offset: 0x0008C9CC
	protected override void OnDisposed()
	{
		this.m_LightFlickerImage.DOKill(false);
		this.m_ChapterCanvas.DOKill(false);
		this.m_WhooshClip = null;
		this.m_SketchesMusicClip = null;
		if (this.TitleMusicAudioObject != null)
		{
			this.TitleMusicAudioObject.Clear();
			this.TitleMusicAudioObject = null;
		}
		if (this.m_MenuItemButtons != null)
		{
			for (int i = 0; i < this.m_MenuItemButtons.Count; i++)
			{
				this.m_MenuItemButtons[i].OnSelected -= this.HandleMenuItemOnSelected;
			}
			this.m_MenuItemButtons.Clear();
			this.m_MenuItemButtons = null;
		}
		base.OnDisposed();
	}

	// Token: 0x040013C5 RID: 5061
	private const string CHAPTER_ONE_TITLE = "Chapter One: Moving Pictures";

	// Token: 0x040013C6 RID: 5062
	private const string CHAPTER_TWO_TITLE = "Chapter Two: The Old Song";

	// Token: 0x040013C7 RID: 5063
	private const string CHAPTER_THREE_TITLE = "Chapter Three: Coming Soon";

	// Token: 0x040013C8 RID: 5064
	private const string CHAPTER_FOUR_TITLE = "Chapter Four: Coming Soon";

	// Token: 0x040013C9 RID: 5065
	private const string CHAPTER_FIVE_TITLE = "Chapter Five: Coming Soon";

	// Token: 0x040013CA RID: 5066
	[Header("RectTransforms")]
	[SerializeField]
	private RectTransform m_BackgroundContainer;

	// Token: 0x040013CB RID: 5067
	[SerializeField]
	private RectTransform m_ForegroundContainer;

	// Token: 0x040013CC RID: 5068
	[SerializeField]
	private RectTransform m_MenuItemContainer;

	// Token: 0x040013CD RID: 5069
	[SerializeField]
	private RectTransform m_ChapterMenuItemContainer;

	// Token: 0x040013CE RID: 5070
	[Header("CanvasGroup")]
	[SerializeField]
	private CanvasGroup m_ChapterCanvas;

	// Token: 0x040013CF RID: 5071
	[Header("TextMeshProUGUI")]
	[SerializeField]
	private TextMeshProUGUI m_VersionLabel;

	// Token: 0x040013D0 RID: 5072
	[Header("< Images >")]
	[SerializeField]
	private Image m_BlackOutImage;

	// Token: 0x040013D1 RID: 5073
	[SerializeField]
	private Image m_LightFlickerImage;

	// Token: 0x040013D2 RID: 5074
	[Header("Backgrounds")]
	[SerializeField]
	private Image m_Background_01;

	// Token: 0x040013D3 RID: 5075
	[SerializeField]
	private Image m_Background_02;

	// Token: 0x040013D4 RID: 5076
	[Header("Foregrounds")]
	[SerializeField]
	private Image m_Foreground_01;

	// Token: 0x040013D5 RID: 5077
	[SerializeField]
	private Image m_Foreground_02;

	// Token: 0x040013D6 RID: 5078
	[Header("Menu Items")]
	[SerializeField]
	private MenuItemButton m_MenuItemButton;

	// Token: 0x040013D7 RID: 5079
	[SerializeField]
	private MenuItemButton m_ChapterMenuItemButton;

	// Token: 0x040013D8 RID: 5080
	private List<MenuItemButton> m_MenuItemButtons = new List<MenuItemButton>();

	// Token: 0x040013D9 RID: 5081
	private List<MenuItemButton> m_ChapterMenuItemButtons = new List<MenuItemButton>();

	// Token: 0x040013DA RID: 5082
	private MenuItemButton m_GameJoltSignInButton;

	// Token: 0x040013DB RID: 5083
	private TitleScreenController.MenuSelection m_CurrentSelection;

	// Token: 0x040013DC RID: 5084
	private List<Image> m_BackgroundImages;

	// Token: 0x040013DD RID: 5085
	private List<Image> m_ForegroundImages;

	// Token: 0x040013DF RID: 5087
	private AudioClip m_WhooshClip;

	// Token: 0x040013E0 RID: 5088
	private AudioClip m_SketchesMusicClip;

	// Token: 0x020002FF RID: 767
	private enum MenuSelection
	{
		// Token: 0x040013E2 RID: 5090
		NONE,
		// Token: 0x040013E3 RID: 5091
		CHAPTERS,
		// Token: 0x040013E4 RID: 5092
		OPTIONS
	}
}
