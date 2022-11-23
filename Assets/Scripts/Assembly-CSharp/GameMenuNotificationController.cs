using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002F6 RID: 758
public class GameMenuNotificationController : AbstractGameMenuController
{
	// Token: 0x060011C2 RID: 4546 RVA: 0x0008D0CC File Offset: 0x0008B4CC
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_Delay = (float)_data;
	}

	// Token: 0x060011C3 RID: 4547 RVA: 0x0008D0E1 File Offset: 0x0008B4E1
	public override void PlayInComplete()
	{
		base.StartCoroutine(this.PlayOutDelay());
	}

	// Token: 0x060011C4 RID: 4548 RVA: 0x0008D0F0 File Offset: 0x0008B4F0
	private IEnumerator PlayOutDelay()
	{
		yield return new WaitForSeconds(this.m_Delay);
		base.Kill();
		yield break;
	}

	// Token: 0x060011C5 RID: 4549 RVA: 0x0008D10B File Offset: 0x0008B50B
	public override void PlayOutComplete()
	{
		GameManager.Instance.UnlockPause();
		base.PlayOutComplete();
	}

	// Token: 0x060011C6 RID: 4550 RVA: 0x0008D11D File Offset: 0x0008B51D
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400139B RID: 5019
	private float m_Delay;
}
