using System;
using DG.Tweening;
using TMG.Controls;
using TMG.UI;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x020002F3 RID: 755
public class ChapterOneIntroModalController : BaseUIController
{
	// Token: 0x060011A9 RID: 4521 RVA: 0x0008C944 File Offset: 0x0008AD44
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_TitleScreen = (TitleScreenController)_data;
		this.m_Visuals.localScale = Vector3.one * 1.5f;
		this.m_ContinueLbl.alpha = 0f;
		this.m_BlackOut.color = new Color(this.m_BlackOut.color.r, this.m_BlackOut.color.g, this.m_BlackOut.color.b, 1f);
	}

	// Token: 0x060011AA RID: 4522 RVA: 0x0008C9DC File Offset: 0x0008ADDC
	public override void PlayIn()
	{
		this.m_Visuals.DOScale(1.55f, 10f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		this.m_BlackOut.DOFade(0f, 1f);
		this.m_LightFlickerImage.DOFade(0.1f, 0.1f).SetEase(Ease.Linear).SetLoops(-1, LoopType.Yoyo);
		this.m_ContinueLbl.DOFade(0.7f, 0.5f).SetDelay(2f).OnComplete(delegate
		{
			this.m_CanContinue = true;
			this.m_ContinueLbl.DOFade(0.5f, 0.25f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		});
	}

	// Token: 0x060011AB RID: 4523 RVA: 0x0008CA76 File Offset: 0x0008AE76
	public override void PlayInComplete()
	{
		this.m_CanContinue = true;
		base.PlayInComplete();
	}

	// Token: 0x060011AC RID: 4524 RVA: 0x0008CA85 File Offset: 0x0008AE85
	public void SetSceneToLoad(string sceneName)
	{
		this.m_SceneName = sceneName;
		this.m_IsReady = true;
	}

	// Token: 0x060011AD RID: 4525 RVA: 0x0008CA95 File Offset: 0x0008AE95
	private void Update()
	{
		if (base.IsDisposed || !this.m_IsReady || !this.m_CanContinue)
		{
			return;
		}
		if (PlayerInput.Any())
		{
			this.m_IsReady = false;
			base.Kill();
		}
	}

	// Token: 0x060011AE RID: 4526 RVA: 0x0008CAD0 File Offset: 0x0008AED0
	public override void PlayOut()
	{
		if (this.m_TitleScreen.TitleMusicAudioObject != null)
		{
			this.m_TitleScreen.TitleMusicAudioObject.AudioSource.DOFade(0f, 0.49f);
		}
		this.m_ContinueLbl.DOKill(false);
		this.m_ContinueLbl.DOFade(0f, 0.5f);
		this.m_BlackOut.DOFade(1f, 0.5f).OnComplete(new TweenCallback(this.ReadyToLoadScene));
	}

	// Token: 0x060011AF RID: 4527 RVA: 0x0008CB5D File Offset: 0x0008AF5D
	private void ReadyToLoadScene()
	{
		this.m_TitleScreen.OnPlayOutComplete += this.HandleTitleScreenOnPlayOutComplete;
		this.m_TitleScreen.Kill();
	}

	// Token: 0x060011B0 RID: 4528 RVA: 0x0008CB84 File Offset: 0x0008AF84
	private void HandleTitleScreenOnPlayOutComplete(object sender, EventArgs e)
	{
		this.m_TitleScreen.OnPlayOutComplete -= this.HandleTitleScreenOnPlayOutComplete;
		this.m_TitleScreen = null;
		GameManager.Instance.AudioManager.ListenerSetActive(false);
		GameManager.Instance.LoadScene(new GenericLoaderDataVO(this.m_SceneName, true));
		base.PlayOutComplete();
	}

	// Token: 0x060011B1 RID: 4529 RVA: 0x0008CBDB File Offset: 0x0008AFDB
	protected override void OnDisposed()
	{
		this.m_Visuals.DOKill(false);
		this.m_BlackOut.DOKill(false);
		this.m_LightFlickerImage.DOKill(false);
		this.m_TitleScreen = null;
		base.OnDisposed();
	}

	// Token: 0x04001384 RID: 4996
	[Header("RectTransfrm")]
	[SerializeField]
	private RectTransform m_Visuals;

	// Token: 0x04001385 RID: 4997
	[Header("Image")]
	[SerializeField]
	private Image m_Blocker;

	// Token: 0x04001386 RID: 4998
	[SerializeField]
	private Image m_Paper;

	// Token: 0x04001387 RID: 4999
	[SerializeField]
	private Image m_LightFlickerImage;

	// Token: 0x04001388 RID: 5000
	[SerializeField]
	private Image m_BlackOut;

	// Token: 0x04001389 RID: 5001
	[Header("TextMeshPro")]
	[SerializeField]
	private TextMeshProUGUI m_Message;

	// Token: 0x0400138A RID: 5002
	[SerializeField]
	private TextMeshProUGUI m_ContinueLbl;

	// Token: 0x0400138B RID: 5003
	private TitleScreenController m_TitleScreen;

	// Token: 0x0400138C RID: 5004
	private bool m_CanContinue;

	// Token: 0x0400138D RID: 5005
	private bool m_IsReady;

	// Token: 0x0400138E RID: 5006
	private string m_SceneName;
}
