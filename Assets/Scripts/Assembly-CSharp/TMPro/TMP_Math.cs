using System;

namespace TMPro
{
	// Token: 0x020005EA RID: 1514
	public static class TMP_Math
	{
		// Token: 0x06002C09 RID: 11273 RVA: 0x0001FBE7 File Offset: 0x0001DDE7
		public static bool Approximately(float a, float b)
		{
			return b - 0.0001f < a && a < b + 0.0001f;
		}

		// Token: 0x040030E7 RID: 12519
		public const float FLOAT_MAX = 32768f;

		// Token: 0x040030E8 RID: 12520
		public const float FLOAT_MIN = -32768f;

		// Token: 0x040030E9 RID: 12521
		public const int INT_MAX = 2147483647;

		// Token: 0x040030EA RID: 12522
		public const int INT_MIN = -2147483647;
	}
}
