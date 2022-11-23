using System;
using DG.Tweening;
using TMG.UI;
using UnityEngine;

// Token: 0x020002E5 RID: 741
public abstract class AbstractPlayInUIController : BaseUIController
{
	// Token: 0x06001145 RID: 4421 RVA: 0x0008AA18 File Offset: 0x00088E18
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_Content = base.GetComponent<RectTransform>();
		this.m_VisualsOriginScale = this.m_Visuals.localScale;
		this.m_VisualsStartScale = this.m_Visuals.localScale;
		this.m_VisualsOriginPosition = this.m_Visuals.anchoredPosition;
		this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition;
		if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.NONE)
		{
			return;
		}
		Vector2 zero = Vector2.zero;
		if (this.m_AnchorSizeType == AbstractPlayInUIController.AnchorSizeType.CONTENT)
		{
			zero = new Vector2(0f, this.m_Content.sizeDelta.y);
		}
		else if (this.m_AnchorSizeType == AbstractPlayInUIController.AnchorSizeType.VISUALS)
		{
			zero = new Vector2(0f, this.m_Visuals.sizeDelta.y);
		}
		if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.SCALE)
		{
			this.m_VisualsStartScale = Vector2.zero;
		}
		else if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.TOP_BOTTOM)
		{
			this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition + zero;
		}
		else if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.BOTTOM_TOP)
		{
			this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition - zero;
		}
		else if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.FADE)
		{
			this.m_CanvasGroup = this.m_Visuals.GetComponent<CanvasGroup>();
			if (this.m_CanvasGroup != null)
			{
				this.m_CanvasGroup.alpha = 0f;
			}
		}
		this.m_Visuals.anchoredPosition = this.m_VisualsStartPosition;
		this.m_Visuals.localScale = this.m_VisualsStartScale;
	}

	// Token: 0x06001146 RID: 4422 RVA: 0x0008ABBC File Offset: 0x00088FBC
	public override void PlayIn()
	{
		if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.NONE)
		{
			this.PlayInComplete();
			return;
		}
		if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.SCALE)
		{
			this.m_Visuals.DOScale(this.m_VisualsOriginScale, 0.5f).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.PlayInComplete));
		}
		else if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.FADE)
		{
			if (this.m_CanvasGroup != null)
			{
				this.m_CanvasGroup.DOFade(1f, 0.5f).SetEase(Ease.Linear).OnComplete(new TweenCallback(this.PlayInComplete));
			}
			else
			{
				this.PlayInComplete();
			}
		}
		else
		{
			this.m_Visuals.DOAnchorPos(this.m_VisualsOriginPosition, 0.5f, false).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.PlayInComplete));
		}
	}

	// Token: 0x06001147 RID: 4423 RVA: 0x0008ACA8 File Offset: 0x000890A8
	public override void PlayOut()
	{
		if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.NONE)
		{
			this.PlayInComplete();
			return;
		}
		if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.SCALE)
		{
			this.m_Visuals.DOScale(this.m_VisualsStartScale, 0.5f).SetEase(Ease.InBack).OnComplete(new TweenCallback(this.PlayOutComplete));
		}
		else if (this.m_PlayInType == AbstractPlayInUIController.PlayInType.FADE)
		{
			if (this.m_CanvasGroup != null)
			{
				this.m_CanvasGroup.DOFade(0f, 0.5f).SetEase(Ease.Linear).OnComplete(new TweenCallback(this.PlayOutComplete));
			}
			else
			{
				this.PlayOutComplete();
			}
		}
		else
		{
			this.m_Visuals.DOAnchorPos(this.m_VisualsStartPosition, 0.5f, false).SetEase(Ease.InBack).OnComplete(new TweenCallback(this.PlayOutComplete));
		}
	}

	// Token: 0x06001148 RID: 4424 RVA: 0x0008AD94 File Offset: 0x00089194
	protected override void OnDisposed()
	{
		this.m_Visuals.DOKill(false);
		this.m_Content = null;
		this.m_CanvasGroup = null;
		base.OnDisposed();
	}

	// Token: 0x0400132A RID: 4906
	[Header("PlayIn Options")]
	[SerializeField]
	protected AbstractPlayInUIController.PlayInType m_PlayInType;

	// Token: 0x0400132B RID: 4907
	[SerializeField]
	protected AbstractPlayInUIController.AnchorSizeType m_AnchorSizeType;

	// Token: 0x0400132C RID: 4908
	[Header("Visuals")]
	[SerializeField]
	protected RectTransform m_Visuals;

	// Token: 0x0400132D RID: 4909
	protected RectTransform m_Content;

	// Token: 0x0400132E RID: 4910
	protected Vector2 m_VisualsOriginPosition;

	// Token: 0x0400132F RID: 4911
	protected Vector2 m_VisualsStartPosition;

	// Token: 0x04001330 RID: 4912
	protected Vector3 m_VisualsOriginScale;

	// Token: 0x04001331 RID: 4913
	protected Vector3 m_VisualsStartScale;

	// Token: 0x04001332 RID: 4914
	private CanvasGroup m_CanvasGroup;

	// Token: 0x020002E6 RID: 742
	protected enum PlayInType
	{
		// Token: 0x04001334 RID: 4916
		SCALE,
		// Token: 0x04001335 RID: 4917
		TOP_BOTTOM,
		// Token: 0x04001336 RID: 4918
		BOTTOM_TOP,
		// Token: 0x04001337 RID: 4919
		FADE,
		// Token: 0x04001338 RID: 4920
		NONE
	}

	// Token: 0x020002E7 RID: 743
	protected enum AnchorSizeType
	{
		// Token: 0x0400133A RID: 4922
		VISUALS,
		// Token: 0x0400133B RID: 4923
		CONTENT
	}
}
