using System;
using UnityEngine;

// Token: 0x020002CC RID: 716
public class CannedSoupEdibleStack : CannedSoupEdible
{
	// Token: 0x06001036 RID: 4150 RVA: 0x00086FA3 File Offset: 0x000853A3
	public override void Init()
	{
		base.Init();
		if (this.m_StackedCan != null)
		{
			this.m_Active = false;
			this.m_StackedCan.OnInteracted += this.HandleStackedCanOnInteracted;
		}
	}

	// Token: 0x06001037 RID: 4151 RVA: 0x00086FDA File Offset: 0x000853DA
	private void HandleStackedCanOnInteracted(object sender, EventArgs e)
	{
		this.m_StackedCan.OnInteracted += this.HandleStackedCanOnInteracted;
		this.m_Active = true;
	}

	// Token: 0x06001038 RID: 4152 RVA: 0x00086FFA File Offset: 0x000853FA
	public override void OnInteract()
	{
		if (this.m_StackedCan != null)
		{
			this.m_StackedCan.OnInteracted += this.HandleStackedCanOnInteracted;
		}
		base.PlayEatSound();
		base.Dispose();
	}

	// Token: 0x04001274 RID: 4724
	[Header("Stacked Options")]
	[SerializeField]
	private CannedSoupEdible m_StackedCan;
}
