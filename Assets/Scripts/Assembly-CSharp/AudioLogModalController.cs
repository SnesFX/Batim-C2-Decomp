using System;
using DG.Tweening;
using TMG.UI;
using TMPro;
using UnityEngine;

// Token: 0x020002F1 RID: 753
public class AudioLogModalController : BaseUIController
{
	// Token: 0x0600119B RID: 4507 RVA: 0x0008C644 File Offset: 0x0008AA44
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_DataVO = (AudioLogDataVO)_data;
		this.m_CanvasGroup.alpha = 0f;
		this.m_IsInRange = true;
		this.InitText();
	}

	// Token: 0x0600119C RID: 4508 RVA: 0x0008C676 File Offset: 0x0008AA76
	private void InitText()
	{
		this.m_NameLbl.text = this.m_DataVO.Name;
		this.m_LogLbl.text = this.m_DataVO.Log;
	}

	// Token: 0x0600119D RID: 4509 RVA: 0x0008C6A4 File Offset: 0x0008AAA4
	public override void PlayIn()
	{
		this.m_CanvasGroup.DOKill(false);
		this.m_CanvasGroup.DOFade(1f, 0.5f);
	}

	// Token: 0x0600119E RID: 4510 RVA: 0x0008C6CC File Offset: 0x0008AACC
	private void Update()
	{
		if (Vector3.Distance(GameManager.Instance.Player.transform.position, this.m_DataVO.LogWorldPosition) > 15f)
		{
			this.Hide();
		}
		else
		{
			this.Show();
		}
	}

	// Token: 0x0600119F RID: 4511 RVA: 0x0008C718 File Offset: 0x0008AB18
	private void Show()
	{
		if (!this.m_IsInRange)
		{
			this.m_IsInRange = true;
			this.m_CanvasGroup.DOKill(false);
			this.m_CanvasGroup.DOFade(1f, 0.5f);
		}
	}

	// Token: 0x060011A0 RID: 4512 RVA: 0x0008C74F File Offset: 0x0008AB4F
	private void Hide()
	{
		if (this.m_IsInRange)
		{
			this.m_IsInRange = false;
			this.m_CanvasGroup.DOKill(false);
			this.m_CanvasGroup.DOFade(0f, 0.5f);
		}
	}

	// Token: 0x060011A1 RID: 4513 RVA: 0x0008C786 File Offset: 0x0008AB86
	public override void PlayOut()
	{
		this.m_CanvasGroup.DOKill(false);
		this.m_CanvasGroup.DOFade(0f, 0.5f).OnComplete(new TweenCallback(this.PlayOutComplete));
	}

	// Token: 0x060011A2 RID: 4514 RVA: 0x0008C7BD File Offset: 0x0008ABBD
	public override void PlayOutComplete()
	{
		base.PlayOutComplete();
	}

	// Token: 0x060011A3 RID: 4515 RVA: 0x0008C7C5 File Offset: 0x0008ABC5
	protected override void OnDisposed()
	{
		this.m_DataVO = null;
		this.m_CanvasGroup.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x0400137D RID: 4989
	private const float MAX_DISTANCE = 15f;

	// Token: 0x0400137E RID: 4990
	[Header("Canvas")]
	[SerializeField]
	private CanvasGroup m_CanvasGroup;

	// Token: 0x0400137F RID: 4991
	[Header("Text")]
	[SerializeField]
	private TextMeshProUGUI m_NameLbl;

	// Token: 0x04001380 RID: 4992
	[SerializeField]
	private TextMeshProUGUI m_LogLbl;

	// Token: 0x04001381 RID: 4993
	private AudioLogDataVO m_DataVO;

	// Token: 0x04001382 RID: 4994
	private bool m_IsInRange;
}
