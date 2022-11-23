using System;
using DG.Tweening;
using UnityEngine;

// Token: 0x020002FA RID: 762
public class QuitPrompt : MonoBehaviour
{
	// Token: 0x060011D2 RID: 4562 RVA: 0x0008D4C2 File Offset: 0x0008B8C2
	private void Awake()
	{
		this.HideOnComplete();
	}

	// Token: 0x060011D3 RID: 4563 RVA: 0x0008D4CC File Offset: 0x0008B8CC
	public void Show()
	{
		this.Visuals.gameObject.SetActive(true);
		this.Blocker.SetActive(true);
		this.Visuals.localScale = Vector3.zero;
		this.Visuals.DOScale(1f, 0.5f).SetEase(Ease.OutBack);
	}

	// Token: 0x060011D4 RID: 4564 RVA: 0x0008D523 File Offset: 0x0008B923
	public void Hide()
	{
		this.Visuals.DOScale(0f, 0.5f).SetEase(Ease.InBack).OnComplete(new TweenCallback(this.HideOnComplete));
	}

	// Token: 0x060011D5 RID: 4565 RVA: 0x0008D553 File Offset: 0x0008B953
	private void HideOnComplete()
	{
		this.Visuals.gameObject.SetActive(false);
		this.Blocker.SetActive(false);
	}

	// Token: 0x040013AB RID: 5035
	public GameObject Blocker;

	// Token: 0x040013AC RID: 5036
	public RectTransform Visuals;
}
