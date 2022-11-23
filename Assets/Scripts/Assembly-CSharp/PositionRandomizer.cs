using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x02000308 RID: 776
public class PositionRandomizer : TMGMonoBehaviour
{
	// Token: 0x06001258 RID: 4696 RVA: 0x0008F5BC File Offset: 0x0008D9BC
	public override void Init()
	{
		base.Init();
		if (this.movableObject == null || this.positions.Count <= 0)
		{
			return;
		}
		int index = UnityEngine.Random.Range(0, this.positions.Count);
		Transform transform = this.positions[index];
		this.movableObject.position = transform.position;
		this.movableObject.rotation = transform.rotation;
	}

	// Token: 0x06001259 RID: 4697 RVA: 0x0008F633 File Offset: 0x0008DA33
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x040013FD RID: 5117
	[SerializeField]
	private Transform movableObject;

	// Token: 0x040013FE RID: 5118
	[SerializeField]
	private List<Transform> positions = new List<Transform>();
}
