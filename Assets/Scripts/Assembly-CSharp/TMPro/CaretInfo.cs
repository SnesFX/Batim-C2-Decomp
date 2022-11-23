using System;

namespace TMPro
{
	// Token: 0x020005E0 RID: 1504
	public struct CaretInfo
	{
		// Token: 0x06002BBC RID: 11196 RVA: 0x0001F8F2 File Offset: 0x0001DAF2
		public CaretInfo(int index, CaretPosition position)
		{
			this.index = index;
			this.position = position;
		}

		// Token: 0x040030C2 RID: 12482
		public int index;

		// Token: 0x040030C3 RID: 12483
		public CaretPosition position;
	}
}
