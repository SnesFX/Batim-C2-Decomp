using System;
using DG.Tweening;
using TMG.UI;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x02000281 RID: 641
public class SplashScreenController : BaseUIController
{
	// Token: 0x06000E43 RID: 3651 RVA: 0x00080768 File Offset: 0x0007EB68
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_AudioSource = base.GetComponent<AudioSource>();
		this.Logo.color = new Color(this.Logo.color.r, this.Logo.color.g, this.Logo.color.b, 0f);
		this.WarningLbl.alpha = 0f;
		this.ShowLogo();
	}

	// Token: 0x06000E44 RID: 3652 RVA: 0x000807EC File Offset: 0x0007EBEC
	private void ShowLogo()
	{
		Sequence sequence = DOTween.Sequence();
		sequence.InsertCallback(1f, delegate
		{
			this.m_AudioSource.Play();
		});
		sequence.Insert(1f, this.Logo.rectTransform.DOScale(0.4f, 5f).SetEase(Ease.Linear));
		sequence.Insert(1f, this.Logo.DOFade(1f, 1f));
		sequence.Insert(4f, this.Logo.DOFade(0f, 1f));
		sequence.OnComplete(new TweenCallback(this.ShowWarning));
	}

	// Token: 0x06000E45 RID: 3653 RVA: 0x00080898 File Offset: 0x0007EC98
	private void ShowWarning()
	{
		Sequence sequence = DOTween.Sequence();
		sequence.InsertCallback(1f, delegate
		{
			this.m_AudioSource.Stop();
			this.m_AudioSource.Play();
		});
		sequence.Insert(1f, this.WarningLbl.rectTransform.DOScale(1.05f, 8f).SetEase(Ease.Linear));
		sequence.Insert(1f, this.WarningLbl.DOFade(1f, 1f));
		sequence.Insert(7f, this.WarningLbl.DOFade(0f, 1f));
		sequence.OnComplete(new TweenCallback(this.PlayOut));
	}

	// Token: 0x06000E46 RID: 3654 RVA: 0x00080945 File Offset: 0x0007ED45
	public override void PlayOutComplete()
	{
		GameManager.Instance.UIManager.Show<TitleScreenController>("UI/Views/TitleScreen", "VIEW", null);
		base.PlayOutComplete();
	}

	// Token: 0x06000E47 RID: 3655 RVA: 0x00080968 File Offset: 0x0007ED68
	protected override void OnDisposed()
	{
		this.m_AudioSource = null;
		base.OnDisposed();
	}

	// Token: 0x04001070 RID: 4208
	[SerializeField]
	private Image Logo;

	// Token: 0x04001071 RID: 4209
	[SerializeField]
	private TextMeshProUGUI WarningLbl;

	// Token: 0x04001072 RID: 4210
	private AudioSource m_AudioSource;
}
