using System;
using DG.Tweening;
using TMG.UI;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x020002F4 RID: 756
public class ChapterTitleModalController : BaseUIController
{
	// Token: 0x060011B4 RID: 4532 RVA: 0x0008CC48 File Offset: 0x0008B048
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_DataVO = (ChapterTitleDataVO)_data;
		this.m_ChapterLbl.text = this.m_DataVO.Chapter;
		this.m_TitleLbl.text = this.m_DataVO.Title;
		this.m_Blocker.gameObject.SetActive(this.m_DataVO.ShowBlocker);
		this.m_TitleLbl.ForceMeshUpdate();
		float num = this.m_TitleLbl.renderedWidth / 2f;
		float num2 = this.m_QuoteStart.sizeDelta.x / 2f;
		this.m_QuoteStart.anchoredPosition = new Vector2(-num - num2, 0f);
		this.m_QuoteEnd.anchoredPosition = new Vector2(num + num2, 0f);
		this.m_CanvasGroup.alpha = 0f;
		this.m_TitleAnchor.localScale = Vector3.one * 0.8f;
	}

	// Token: 0x060011B5 RID: 4533 RVA: 0x0008CD44 File Offset: 0x0008B144
	public override void PlayIn()
	{
		this.m_Sequence = DOTween.Sequence();
		this.m_Sequence.Insert(0f, this.m_CanvasGroup.DOFade(1f, 2f));
		this.m_Sequence.Insert(0f, this.m_TitleAnchor.DOScale(1f, 5f));
		if (this.m_DataVO.ShowBlocker)
		{
			this.m_Sequence.Insert(2f, this.m_Blocker.DOFade(0f, 2.5f));
		}
		this.m_Sequence.Insert(4f, this.m_CanvasGroup.DOFade(0f, 1f));
		this.m_Sequence.OnComplete(new TweenCallback(this.PlayInComplete));
	}

	// Token: 0x060011B6 RID: 4534 RVA: 0x0008CE1D File Offset: 0x0008B21D
	public override void PlayInComplete()
	{
		base.Kill();
	}

	// Token: 0x060011B7 RID: 4535 RVA: 0x0008CE25 File Offset: 0x0008B225
	public override void PlayOutComplete()
	{
		base.PlayOutComplete();
	}

	// Token: 0x060011B8 RID: 4536 RVA: 0x0008CE2D File Offset: 0x0008B22D
	protected override void OnDisposed()
	{
		if (this.m_Sequence != null)
		{
			this.m_Sequence.Kill(false);
			this.m_Sequence = null;
		}
		base.OnDisposed();
	}

	// Token: 0x0400138F RID: 5007
	[Header("RectTransforms")]
	[SerializeField]
	private RectTransform m_TitleAnchor;

	// Token: 0x04001390 RID: 5008
	[SerializeField]
	private RectTransform m_QuoteStart;

	// Token: 0x04001391 RID: 5009
	[SerializeField]
	private RectTransform m_QuoteEnd;

	// Token: 0x04001392 RID: 5010
	[Header("CanvasGroup")]
	[SerializeField]
	private CanvasGroup m_CanvasGroup;

	// Token: 0x04001393 RID: 5011
	[Header("Images")]
	[SerializeField]
	private Image m_Blocker;

	// Token: 0x04001394 RID: 5012
	[Header("TextMeshProUGUI")]
	[SerializeField]
	private TextMeshProUGUI m_ChapterLbl;

	// Token: 0x04001395 RID: 5013
	[SerializeField]
	private TextMeshProUGUI m_TitleLbl;

	// Token: 0x04001396 RID: 5014
	private ChapterTitleDataVO m_DataVO;

	// Token: 0x04001397 RID: 5015
	private Sequence m_Sequence;
}
