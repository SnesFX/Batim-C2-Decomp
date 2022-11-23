using System;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x020002DF RID: 735
public class InkPipeController : TMGMonoBehaviour
{
	// Token: 0x0600111B RID: 4379 RVA: 0x00089F94 File Offset: 0x00088394
	public void TurnOn()
	{
		this.m_PipeContainer.DOKill(false);
		this.m_PipeContainer.DOScaleZ(this.m_ScaleAmount, 0.2f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
	}

	// Token: 0x0600111C RID: 4380 RVA: 0x00089FC7 File Offset: 0x000883C7
	public void TurnOff()
	{
		this.m_PipeContainer.DOKill(false);
		this.m_PipeContainer.DOScale(1f, 0.5f).SetEase(Ease.OutQuad);
	}

	// Token: 0x0600111D RID: 4381 RVA: 0x00089FF2 File Offset: 0x000883F2
	protected override void OnDisposed()
	{
		this.m_PipeContainer.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x040012F6 RID: 4854
	[Header("Transforms")]
	[SerializeField]
	private Transform m_PipeContainer;

	// Token: 0x040012F7 RID: 4855
	[Header("Options")]
	[SerializeField]
	private float m_ScaleAmount = 1.05f;
}
