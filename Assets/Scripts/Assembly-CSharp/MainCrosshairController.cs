using System;
using DG.Tweening;
using TMG.UI;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x020002EB RID: 747
public class MainCrosshairController : BaseUIController
{
	// Token: 0x0600116D RID: 4461 RVA: 0x0008B4C8 File Offset: 0x000898C8
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_Crosshair.color = new Color(this.m_Crosshair.color.r, this.m_Crosshair.color.g, this.m_Crosshair.color.b, 0f);
	}

	// Token: 0x0600116E RID: 4462 RVA: 0x0008B52A File Offset: 0x0008992A
	public override void PlayIn()
	{
		this.Show();
		this.PlayInComplete();
	}

	// Token: 0x0600116F RID: 4463 RVA: 0x0008B538 File Offset: 0x00089938
	public void Show()
	{
		this.m_Crosshair.gameObject.SetActive(true);
		this.m_Crosshair.DOKill(false);
		this.m_Crosshair.DOFade(0.6f, 0.5f);
	}

	// Token: 0x06001170 RID: 4464 RVA: 0x0008B56E File Offset: 0x0008996E
	public void Hide()
	{
		this.m_Crosshair.DOKill(false);
		this.m_Crosshair.DOFade(0f, 0.5f).OnComplete(delegate
		{
			this.m_Crosshair.gameObject.SetActive(false);
		});
	}

	// Token: 0x06001171 RID: 4465 RVA: 0x0008B5A4 File Offset: 0x000899A4
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400134D RID: 4941
	[SerializeField]
	private Image m_Crosshair;
}
