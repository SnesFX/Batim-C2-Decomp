using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x020002E1 RID: 737
public class LightFixtureController : TMGMonoBehaviour
{
	// Token: 0x06001127 RID: 4391 RVA: 0x0008A364 File Offset: 0x00088764
	public void TurnOn()
	{
		this.m_LightRenderer.material = this.m_OnMaterial;
		for (int i = 0; i < this.m_Lights.Count; i++)
		{
			this.m_Lights[i].enabled = true;
		}
	}

	// Token: 0x06001128 RID: 4392 RVA: 0x0008A3B0 File Offset: 0x000887B0
	public void TurnOff()
	{
		this.m_LightRenderer.material = this.m_OffMaterial;
		for (int i = 0; i < this.m_Lights.Count; i++)
		{
			this.m_Lights[i].enabled = false;
		}
	}

	// Token: 0x06001129 RID: 4393 RVA: 0x0008A3FC File Offset: 0x000887FC
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x040012FE RID: 4862
	[Header("Lights")]
	[SerializeField]
	private List<Light> m_Lights;

	// Token: 0x040012FF RID: 4863
	[Header("Renderer")]
	[SerializeField]
	private Renderer m_LightRenderer;

	// Token: 0x04001300 RID: 4864
	[Header("Materials")]
	[SerializeField]
	private Material m_OnMaterial;

	// Token: 0x04001301 RID: 4865
	[SerializeField]
	private Material m_OffMaterial;
}
