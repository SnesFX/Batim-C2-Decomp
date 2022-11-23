using System;
using System.Collections.Generic;

namespace TMPro
{
	// Token: 0x020005BC RID: 1468
	internal static class TMP_ListPool<T>
	{
		// Token: 0x06002A1F RID: 10783 RVA: 0x0001E4D4 File Offset: 0x0001C6D4
		public static List<T> Get()
		{
			return TMP_ListPool<T>.s_ListPool.Get();
		}

		// Token: 0x06002A20 RID: 10784 RVA: 0x0001E4E0 File Offset: 0x0001C6E0
		public static void Release(List<T> toRelease)
		{
			TMP_ListPool<T>.s_ListPool.Release(toRelease);
		}

		// Token: 0x04002F35 RID: 12085
		private static readonly TMP_ObjectPool<List<T>> s_ListPool = new TMP_ObjectPool<List<T>>(null, delegate(List<T> l)
		{
			l.Clear();
		});
	}
}
