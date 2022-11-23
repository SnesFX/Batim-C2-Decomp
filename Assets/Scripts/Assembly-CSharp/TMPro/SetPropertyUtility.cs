using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005BA RID: 1466
	internal static class SetPropertyUtility
	{
		// Token: 0x06002A1B RID: 10779 RVA: 0x001003C4 File Offset: 0x000FE5C4
		public static bool SetColor(ref Color currentValue, Color newValue)
		{
			if (currentValue.r == newValue.r && currentValue.g == newValue.g && currentValue.b == newValue.b && currentValue.a == newValue.a)
			{
				return false;
			}
			currentValue = newValue;
			return true;
		}

		// Token: 0x06002A1C RID: 10780 RVA: 0x0001E493 File Offset: 0x0001C693
		public static bool SetEquatableStruct<T>(ref T currentValue, T newValue) where T : IEquatable<T>
		{
			if (currentValue.Equals(newValue))
			{
				return false;
			}
			currentValue = newValue;
			return true;
		}

		// Token: 0x06002A1D RID: 10781 RVA: 0x0001E4B1 File Offset: 0x0001C6B1
		public static bool SetStruct<T>(ref T currentValue, T newValue) where T : struct
		{
			if (currentValue.Equals(newValue))
			{
				return false;
			}
			currentValue = newValue;
			return true;
		}

		// Token: 0x06002A1E RID: 10782 RVA: 0x00100424 File Offset: 0x000FE624
		public static bool SetClass<T>(ref T currentValue, T newValue) where T : class
		{
			if ((currentValue == null && newValue == null) || (currentValue != null && currentValue.Equals(newValue)))
			{
				return false;
			}
			currentValue = newValue;
			return true;
		}
	}
}
