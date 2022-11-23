using System;
using DG.Tweening;
using TMPro;
using UnityEngine;

// Token: 0x020002F7 RID: 759
public class ObjectivesController : AbstractGameMenuController
{
	// Token: 0x060011C8 RID: 4552 RVA: 0x0008D1CC File Offset: 0x0008B5CC
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_DataVO = (ObjectiveDataVO)_data;
		this.m_Header.text = this.m_DataVO.Header;
		this.m_Objective.text = this.m_DataVO.Objective;
		this.m_Tip.text = this.m_DataVO.Tip;
		this.m_PlayoutDelay = this.m_DataVO.Delay;
	}

	// Token: 0x060011C9 RID: 4553 RVA: 0x0008D23F File Offset: 0x0008B63F
	public override void PlayInComplete()
	{
		if (!this.m_DataVO.IsCurrentObjective)
		{
			base.Kill();
		}
	}

	// Token: 0x060011CA RID: 4554 RVA: 0x0008D257 File Offset: 0x0008B657
	public void Hide()
	{
		this.m_PlayoutDelay = 0f;
		this.m_Visuals.DOKill(false);
		base.Kill();
	}

	// Token: 0x060011CB RID: 4555 RVA: 0x0008D277 File Offset: 0x0008B677
	public override void PlayOutComplete()
	{
		base.PlayOutComplete();
	}

	// Token: 0x060011CC RID: 4556 RVA: 0x0008D27F File Offset: 0x0008B67F
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400139C RID: 5020
	[Header("TextMeshProUGUIs")]
	[SerializeField]
	private TextMeshProUGUI m_Header;

	// Token: 0x0400139D RID: 5021
	[SerializeField]
	private TextMeshProUGUI m_Objective;

	// Token: 0x0400139E RID: 5022
	[SerializeField]
	private TextMeshProUGUI m_Tip;

	// Token: 0x0400139F RID: 5023
	private ObjectiveDataVO m_DataVO;
}
