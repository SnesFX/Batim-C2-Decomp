using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005FC RID: 1532
	public struct Extents
	{
		// Token: 0x06002C22 RID: 11298 RVA: 0x0001FD1D File Offset: 0x0001DF1D
		public Extents(Vector2 min, Vector2 max)
		{
			this.min = min;
			this.max = max;
		}

		// Token: 0x06002C23 RID: 11299 RVA: 0x0010DE00 File Offset: 0x0010C000
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

		// Token: 0x04003163 RID: 12643
		public Vector2 min;

		// Token: 0x04003164 RID: 12644
		public Vector2 max;
	}
}
