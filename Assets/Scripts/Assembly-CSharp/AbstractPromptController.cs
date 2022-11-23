using System;
using DG.Tweening;
using TMG.UI;
using UnityEngine;

// Token: 0x020002F8 RID: 760
public abstract class AbstractPromptController : BaseUIController
{
	// Token: 0x060011CE RID: 4558 RVA: 0x0008D290 File Offset: 0x0008B690
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_Content = base.GetComponent<RectTransform>();
		this.m_VisualsOriginScale = this.m_Visuals.localScale;
		this.m_VisualsStartScale = this.m_Visuals.localScale;
		this.m_VisualsOriginPosition = this.m_Visuals.anchoredPosition;
		this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition;
		if (this.m_PlayInType == AbstractPromptController.PlayInType.SCALE)
		{
			this.m_VisualsStartScale = Vector2.zero;
		}
		else if (this.m_PlayInType == AbstractPromptController.PlayInType.TOP_BOTTOM)
		{
			this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition + new Vector2(0f, this.m_Content.sizeDelta.y);
		}
		else if (this.m_PlayInType == AbstractPromptController.PlayInType.BOTTOM_TOP)
		{
			this.m_VisualsStartPosition = this.m_Visuals.anchoredPosition - new Vector2(0f, this.m_Content.sizeDelta.y);
		}
		this.m_Visuals.anchoredPosition = this.m_VisualsStartPosition;
		this.m_Visuals.localScale = this.m_VisualsStartScale;
	}

	// Token: 0x060011CF RID: 4559 RVA: 0x0008D3BC File Offset: 0x0008B7BC
	public override void PlayIn()
	{
		if (this.m_PlayInType == AbstractPromptController.PlayInType.SCALE)
		{
			this.m_Visuals.DOScale(this.m_VisualsOriginScale, 0.5f).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.PlayInComplete));
		}
		else
		{
			this.m_Visuals.DOAnchorPos(this.m_VisualsOriginPosition, 0.5f, false).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.PlayInComplete));
		}
	}

	// Token: 0x060011D0 RID: 4560 RVA: 0x0008D43C File Offset: 0x0008B83C
	public override void PlayOut()
	{
		if (this.m_PlayInType == AbstractPromptController.PlayInType.SCALE)
		{
			this.m_Visuals.DOScale(this.m_VisualsStartScale, 0.5f).SetEase(Ease.InBack).OnComplete(new TweenCallback(this.PlayOutComplete));
		}
		else
		{
			this.m_Visuals.DOAnchorPos(this.m_VisualsStartPosition, 0.5f, false).SetEase(Ease.InBack).OnComplete(new TweenCallback(this.PlayOutComplete));
		}
	}

	// Token: 0x040013A0 RID: 5024
	[Header("PlayIn Options")]
	[SerializeField]
	protected AbstractPromptController.PlayInType m_PlayInType;

	// Token: 0x040013A1 RID: 5025
	[Header("Visuals")]
	[SerializeField]
	protected RectTransform m_Visuals;

	// Token: 0x040013A2 RID: 5026
	protected RectTransform m_Content;

	// Token: 0x040013A3 RID: 5027
	protected Vector2 m_VisualsOriginPosition;

	// Token: 0x040013A4 RID: 5028
	protected Vector2 m_VisualsStartPosition;

	// Token: 0x040013A5 RID: 5029
	protected Vector3 m_VisualsOriginScale;

	// Token: 0x040013A6 RID: 5030
	protected Vector3 m_VisualsStartScale;

	// Token: 0x020002F9 RID: 761
	protected enum PlayInType
	{
		// Token: 0x040013A8 RID: 5032
		SCALE,
		// Token: 0x040013A9 RID: 5033
		TOP_BOTTOM,
		// Token: 0x040013AA RID: 5034
		BOTTOM_TOP
	}
}
