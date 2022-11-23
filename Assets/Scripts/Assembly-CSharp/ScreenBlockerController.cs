using System;
using DG.Tweening;
using TMG.UI;
using UnityEngine;

// Token: 0x020002E9 RID: 745
public class ScreenBlockerController : BaseUIController
{
	// Token: 0x14000024 RID: 36
	// (add) Token: 0x06001156 RID: 4438 RVA: 0x0008ADC0 File Offset: 0x000891C0
	// (remove) Token: 0x06001157 RID: 4439 RVA: 0x0008ADF8 File Offset: 0x000891F8
	public event EventHandler OnShow;

	// Token: 0x14000025 RID: 37
	// (add) Token: 0x06001158 RID: 4440 RVA: 0x0008AE30 File Offset: 0x00089230
	// (remove) Token: 0x06001159 RID: 4441 RVA: 0x0008AE68 File Offset: 0x00089268
	public event EventHandler OnHide;

	// Token: 0x0600115A RID: 4442 RVA: 0x0008AE9E File Offset: 0x0008929E
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_Blocker.alpha = 0f;
		this.DisableBlocker();
	}

	// Token: 0x0600115B RID: 4443 RVA: 0x0008AEBD File Offset: 0x000892BD
	public void Show(float duration = 0.5f, float delay = 0f)
	{
		this.DOFade(1f, duration, delay).OnComplete(delegate
		{
			this.OnShow.Send(this);
		});
	}

	// Token: 0x0600115C RID: 4444 RVA: 0x0008AEDE File Offset: 0x000892DE
	public void Hide(float duration = 0.5f, float delay = 0f)
	{
		this.DOFade(0f, duration, delay).OnComplete(new TweenCallback(this.DisableBlocker));
	}

	// Token: 0x0600115D RID: 4445 RVA: 0x0008AEFF File Offset: 0x000892FF
	private Tweener DOFade(float alpha, float duration, float delay)
	{
		this.m_Blocker.gameObject.SetActive(true);
		return this.m_Blocker.DOFade(alpha, duration).SetDelay(delay).SetEase(Ease.Linear);
	}

	// Token: 0x0600115E RID: 4446 RVA: 0x0008AF2B File Offset: 0x0008932B
	private void DisableBlocker()
	{
		this.m_Blocker.gameObject.SetActive(false);
		this.OnHide.Send(this);
	}

	// Token: 0x0600115F RID: 4447 RVA: 0x0008AF4A File Offset: 0x0008934A
	protected override void OnDisposed()
	{
		this.m_Blocker.DOKill(false);
		this.OnShow = null;
		this.OnHide = null;
		base.OnDisposed();
	}

	// Token: 0x04001341 RID: 4929
	[Header("Canvas Groups")]
	[SerializeField]
	private CanvasGroup m_Blocker;
}
