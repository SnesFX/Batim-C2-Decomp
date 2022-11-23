using System;

namespace TMPro
{
	// Token: 0x020005EF RID: 1519
	public struct KerningPairKey
	{
		// Token: 0x06002C0E RID: 11278 RVA: 0x0001FC03 File Offset: 0x0001DE03
		public KerningPairKey(int ascii_left, int ascii_right)
		{
			this.ascii_Left = ascii_left;
			this.ascii_Right = ascii_right;
			this.key = (ascii_right << 16) + ascii_left;
		}

		// Token: 0x04003112 RID: 12562
		public int ascii_Left;

		// Token: 0x04003113 RID: 12563
		public int ascii_Right;

		// Token: 0x04003114 RID: 12564
		public int key;
	}
}
