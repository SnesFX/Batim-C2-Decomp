using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x0200030C RID: 780
public class BrokenWeapon : TMGMonoBehaviour
{
	// Token: 0x0600126D RID: 4717 RVA: 0x0008FB50 File Offset: 0x0008DF50
	public void Break(Transform weapon, Vector3 fromPosition)
	{
		base.transform.position = weapon.position;
		base.transform.rotation = weapon.rotation;
		for (int i = 0; i < this.m_Pieces.Count; i++)
		{
			this.m_Pieces[i].transform.SetParent(null);
			this.m_Pieces[i].AddExplosionForce(1000f, fromPosition, 15f);
		}
		base.Dispose();
	}

	// Token: 0x0600126E RID: 4718 RVA: 0x0008FBD4 File Offset: 0x0008DFD4
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400140F RID: 5135
	[SerializeField]
	private List<Rigidbody> m_Pieces;
}
