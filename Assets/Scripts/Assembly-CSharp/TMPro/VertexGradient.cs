using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005F7 RID: 1527
	[Serializable]
	public struct VertexGradient
	{
		// Token: 0x06002C1C RID: 11292 RVA: 0x0001FCB5 File Offset: 0x0001DEB5
		public VertexGradient(Color color)
		{
			this.topLeft = color;
			this.topRight = color;
			this.bottomLeft = color;
			this.bottomRight = color;
		}

		// Token: 0x06002C1D RID: 11293 RVA: 0x0001FCD3 File Offset: 0x0001DED3
		public VertexGradient(Color color0, Color color1, Color color2, Color color3)
		{
			this.topLeft = color0;
			this.topRight = color1;
			this.bottomLeft = color2;
			this.bottomRight = color3;
		}

		// Token: 0x0400314C RID: 12620
		public Color topLeft;

		// Token: 0x0400314D RID: 12621
		public Color topRight;

		// Token: 0x0400314E RID: 12622
		public Color bottomLeft;

		// Token: 0x0400314F RID: 12623
		public Color bottomRight;
	}
}
