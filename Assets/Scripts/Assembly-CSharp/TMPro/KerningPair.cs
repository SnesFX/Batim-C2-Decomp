using System;

namespace TMPro
{
	// Token: 0x020005F0 RID: 1520
	[Serializable]
	public class KerningPair
	{
		// Token: 0x06002C0F RID: 11279 RVA: 0x0001FC1F File Offset: 0x0001DE1F
		public KerningPair(int left, int right, float offset)
		{
			this.AscII_Left = left;
			this.AscII_Right = right;
			this.XadvanceOffset = offset;
		}

		// Token: 0x04003115 RID: 12565
		public int AscII_Left;

		// Token: 0x04003116 RID: 12566
		public int AscII_Right;

		// Token: 0x04003117 RID: 12567
		public float XadvanceOffset;
	}
}
