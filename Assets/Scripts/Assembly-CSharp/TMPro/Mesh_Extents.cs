using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005FD RID: 1533
	[Serializable]
	public struct Mesh_Extents
	{
		// Token: 0x06002C24 RID: 11300 RVA: 0x0001FD2D File Offset: 0x0001DF2D
		public Mesh_Extents(Vector2 min, Vector2 max)
		{
			this.min = min;
			this.max = max;
		}

		// Token: 0x06002C25 RID: 11301 RVA: 0x0010DEA4 File Offset: 0x0010C0A4
		public override string ToString()
		{
			return string.Concat(new string[]
			{
				"Min (",
				this.min.x.ToString("f2"),
				", ",
				this.min.y.ToString("f2"),
				")   Max (",
				this.max.x.ToString("f2"),
				", ",
				this.max.y.ToString("f2"),
				")"
			});
		}

		// Token: 0x04003165 RID: 12645
		public Vector2 min;

		// Token: 0x04003166 RID: 12646
		public Vector2 max;
	}
}
