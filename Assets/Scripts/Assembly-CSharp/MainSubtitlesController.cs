using System;
using System.Collections.Generic;
using DG.Tweening;
using TMG.UI;
using TMPro;
using UnityEngine;

// Token: 0x020002FC RID: 764
public class MainSubtitlesController : BaseUIController
{
	// Token: 0x060011E1 RID: 4577 RVA: 0x0008D7A1 File Offset: 0x0008BBA1
	public override void Init()
	{
		base.Init();
		this.m_SubtitleText.text = string.Empty;
		this.m_SubtitleText.alpha = 0f;
	}

	// Token: 0x060011E2 RID: 4578 RVA: 0x0008D7C9 File Offset: 0x0008BBC9
	public override void InitController(object _data)
	{
		base.InitController(_data);
	}

	// Token: 0x060011E3 RID: 4579 RVA: 0x0008D7D4 File Offset: 0x0008BBD4
	public void Update()
	{
		if (this.m_SubtitleQueue.Count <= 0)
		{
			return;
		}
		this.m_SubtitleTimer += Time.deltaTime;
		if (this.m_SubtitleTimer >= this.m_SubtitleDuration)
		{
			this.m_SubtitleTimer = 0f;
			this.m_SubtitleDuration = 0f;
			SubtitleDataVO subtitleDataVO = this.m_SubtitleQueue[0];
			this.m_SubtitleDuration = subtitleDataVO.Duration;
			this.m_SubtitleQueue.RemoveAt(0);
			this.m_SubtitleText.text = subtitleDataVO.Subtitles;
			this.m_SubtitleText.alpha = 0f;
			float num = 0.5f;
			float atPosition = subtitleDataVO.Duration - ((!subtitleDataVO.IsTrimmed) ? 0f : num);
			this.KillSubtitleSequence();
			this.m_SubtitleSequence = DOTween.Sequence();
			this.m_SubtitleSequence.Insert(0f, this.m_SubtitleText.DOFade(1f, num));
			this.m_SubtitleSequence.Insert(atPosition, this.m_SubtitleText.DOFade(0f, num));
			this.m_SubtitleSequence.OnComplete(new TweenCallback(this.HandleSubtitleOnComplete));
		}
	}

	// Token: 0x060011E4 RID: 4580 RVA: 0x0008D8FF File Offset: 0x0008BCFF
	private void HandleSubtitleOnComplete()
	{
		this.KillSubtitleSequence();
		this.m_SubtitleText.text = string.Empty;
		this.m_SubtitleDuration = 0f;
	}

	// Token: 0x060011E5 RID: 4581 RVA: 0x0008D922 File Offset: 0x0008BD22
	public void ShowSubtitles(string subtitles, float duration, bool isTrimmed = false)
	{
		this.m_SubtitleQueue.Add(SubtitleDataVO.Create(subtitles, duration, isTrimmed));
	}

	// Token: 0x060011E6 RID: 4582 RVA: 0x0008D937 File Offset: 0x0008BD37
	private void KillSubtitleSequence()
	{
		if (this.m_SubtitleSequence != null)
		{
			this.m_SubtitleSequence.Kill(false);
			this.m_SubtitleSequence = null;
		}
	}

	// Token: 0x060011E7 RID: 4583 RVA: 0x0008D958 File Offset: 0x0008BD58
	protected override void OnDisposed()
	{
		this.KillSubtitleSequence();
		if (this.m_SubtitleQueue != null)
		{
			for (int i = this.m_SubtitleQueue.Count - 1; i >= 0; i--)
			{
				this.m_SubtitleQueue[i].Dispose();
			}
			this.m_SubtitleQueue.Clear();
			this.m_SubtitleQueue = null;
		}
		base.OnDisposed();
	}

	// Token: 0x040013B1 RID: 5041
	[Header("TextMeshProUGUIs")]
	[SerializeField]
	private TextMeshProUGUI m_SubtitleText;

	// Token: 0x040013B2 RID: 5042
	private List<SubtitleDataVO> m_SubtitleQueue = new List<SubtitleDataVO>();

	// Token: 0x040013B3 RID: 5043
	private Sequence m_SubtitleSequence;

	// Token: 0x040013B4 RID: 5044
	private float m_SubtitleTimer;

	// Token: 0x040013B5 RID: 5045
	private float m_SubtitleDuration;
}
