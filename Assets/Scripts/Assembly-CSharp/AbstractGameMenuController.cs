using System;
using DG.Tweening;
using TMG.UI;
using UnityEngine;

// Token: 0x020002ED RID: 749
public abstract class AbstractGameMenuController : BaseUIController
{
	// Token: 0x0600117F RID: 4479 RVA: 0x0008BA74 File Offset: 0x00089E74
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_Content = base.GetComponent<RectTransform>();
		this.m_VisualsOriginScale = this.m_Visuals.localScale;
		this.m_VisualsStartScale = this.m_Visuals.localScale;
		this.m_VisualsOriginPosition = this.m_Visuals.anchoredPosition;
		this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition;
		Vector2 zero = Vector2.zero;
		if (this.m_AnchorSizeType == AbstractGameMenuController.AnchorSizeType.CONTENT)
		{
			zero = new Vector2(0f, this.m_Content.sizeDelta.y);
		}
		else if (this.m_AnchorSizeType == AbstractGameMenuController.AnchorSizeType.VISUALS)
		{
			zero = new Vector2(0f, this.m_Visuals.sizeDelta.y);
		}
		if (this.m_PlayInType == AbstractGameMenuController.PlayInType.SCALE)
		{
			this.m_VisualsStartScale = Vector2.zero;
		}
		else if (this.m_PlayInType == AbstractGameMenuController.PlayInType.TOP_BOTTOM)
		{
			this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition + zero;
		}
		else if (this.m_PlayInType == AbstractGameMenuController.PlayInType.BOTTOM_TOP)
		{
			this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition - zero;
		}
		this.m_Visuals.anchoredPosition = this.m_VisualsStartPosition;
		this.m_Visuals.localScale = this.m_VisualsStartScale;
	}

	// Token: 0x06001180 RID: 4480 RVA: 0x0008BBC8 File Offset: 0x00089FC8
	public override void PlayIn()
	{
		if (this.m_PlayInType == AbstractGameMenuController.PlayInType.SCALE)
		{
			this.m_Visuals.DOScale(this.m_VisualsOriginScale, 0.5f).SetEase(Ease.OutQuad).OnComplete(new TweenCallback(this.PlayInComplete));
		}
		else
		{
			this.m_Visuals.DOAnchorPos(this.m_VisualsOriginPosition, 0.5f, false).SetEase(Ease.OutQuad).OnComplete(new TweenCallback(this.PlayInComplete));
		}
	}

	// Token: 0x06001181 RID: 4481 RVA: 0x0008BC44 File Offset: 0x0008A044
	public override void PlayOut()
	{
		if (this.m_PlayInType == AbstractGameMenuController.PlayInType.SCALE)
		{
			this.m_Visuals.DOScale(this.m_VisualsStartScale, 0.5f).SetEase(Ease.InQuad).SetDelay(this.m_PlayoutDelay).OnComplete(new TweenCallback(this.PlayOutComplete));
		}
		else
		{
			this.m_Visuals.DOAnchorPos(this.m_VisualsStartPosition, 0.5f, false).SetEase(Ease.InQuad).SetDelay(this.m_PlayoutDelay).OnComplete(new TweenCallback(this.PlayOutComplete));
		}
	}

	// Token: 0x06001182 RID: 4482 RVA: 0x0008BCD6 File Offset: 0x0008A0D6
	protected override void OnDisposed()
	{
		this.m_Visuals.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x04001359 RID: 4953
	[Header("PlayIn Options")]
	[SerializeField]
	protected AbstractGameMenuController.PlayInType m_PlayInType;

	// Token: 0x0400135A RID: 4954
	[SerializeField]
	protected AbstractGameMenuController.AnchorSizeType m_AnchorSizeType;

	// Token: 0x0400135B RID: 4955
	[Header("Visuals")]
	[SerializeField]
	protected RectTransform m_Visuals;

	// Token: 0x0400135C RID: 4956
	protected RectTransform m_Content;

	// Token: 0x0400135D RID: 4957
	protected Vector2 m_VisualsOriginPosition;

	// Token: 0x0400135E RID: 4958
	protected Vector2 m_VisualsStartPosition;

	// Token: 0x0400135F RID: 4959
	protected Vector3 m_VisualsOriginScale;

	// Token: 0x04001360 RID: 4960
	protected Vector3 m_VisualsStartScale;

	// Token: 0x04001361 RID: 4961
	protected float m_PlayoutDelay;

	// Token: 0x020002EE RID: 750
	protected enum PlayInType
	{
		// Token: 0x04001363 RID: 4963
		SCALE,
		// Token: 0x04001364 RID: 4964
		TOP_BOTTOM,
		// Token: 0x04001365 RID: 4965
		BOTTOM_TOP
	}

	// Token: 0x020002EF RID: 751
	protected enum AnchorSizeType
	{
		// Token: 0x04001367 RID: 4967
		VISUALS,
		// Token: 0x04001368 RID: 4968
		CONTENT
	}
}
