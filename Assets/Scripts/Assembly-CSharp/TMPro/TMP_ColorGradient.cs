using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x02000598 RID: 1432
	[Serializable]
	public class TMP_ColorGradient : ScriptableObject
	{
		// Token: 0x060028E0 RID: 10464 RVA: 0x000FAD48 File Offset: 0x000F8F48
		public TMP_ColorGradient()
		{
			Color white = Color.white;
			this.topLeft = white;
			this.topRight = white;
			this.bottomLeft = white;
			this.bottomRight = white;
		}

		// Token: 0x060028E1 RID: 10465 RVA: 0x0001D7C4 File Offset: 0x0001B9C4
		public TMP_ColorGradient(Color color)
		{
			this.topLeft = color;
			this.topRight = color;
			this.bottomLeft = color;
			this.bottomRight = color;
		}

		// Token: 0x060028E2 RID: 10466 RVA: 0x0001D7E8 File Offset: 0x0001B9E8
		public TMP_ColorGradient(Color color0, Color color1, Color color2, Color color3)
		{
			this.topLeft = color0;
			this.topRight = color1;
			this.bottomLeft = color2;
			this.bottomRight = color3;
		}

		// Token: 0x04002E54 RID: 11860
		public Color topLeft;

		// Token: 0x04002E55 RID: 11861
		public Color topRight;

		// Token: 0x04002E56 RID: 11862
		public Color bottomLeft;

		// Token: 0x04002E57 RID: 11863
		public Color bottomRight;
	}
}
