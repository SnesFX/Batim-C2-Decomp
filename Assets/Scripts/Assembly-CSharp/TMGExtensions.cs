using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000307 RID: 775
public static class TMGExtensions
{
	// Token: 0x06001252 RID: 4690 RVA: 0x0008F49C File Offset: 0x0008D89C
	public static int ParseInt(this string value)
	{
		int num = 0;
		foreach (char c in value)
		{
			num = 10 * num + (int)char.GetNumericValue(c);
		}
		return num;
	}

	// Token: 0x06001253 RID: 4691 RVA: 0x0008F4D8 File Offset: 0x0008D8D8
	public static void Shuffle<T>(this IList<T> list)
	{
		System.Random random = new System.Random();
		int i = list.Count;
		while (i > 1)
		{
			i--;
			int index = random.Next(i + 1);
			T value = list[index];
			list[index] = list[i];
			list[i] = value;
		}
	}

	// Token: 0x06001254 RID: 4692 RVA: 0x0008F52A File Offset: 0x0008D92A
	public static T RandomItem<T>(this IList<T> list)
	{
		if (list.Count == 0)
		{
			throw new IndexOutOfRangeException("Cannot select a random item from an empty list");
		}
		return list[UnityEngine.Random.Range(0, list.Count)];
	}

	// Token: 0x06001255 RID: 4693 RVA: 0x0008F554 File Offset: 0x0008D954
	public static T RemoveRandom<T>(this IList<T> list)
	{
		if (list.Count == 0)
		{
			throw new IndexOutOfRangeException("Cannot remove a random item from an empty list");
		}
		int index = UnityEngine.Random.Range(0, list.Count);
		T result = list[index];
		list.RemoveAt(index);
		return result;
	}

	// Token: 0x06001256 RID: 4694 RVA: 0x0008F594 File Offset: 0x0008D994
	public static void Send(this EventHandler handler, object sender)
	{
		if (handler != null)
		{
			handler(sender, EventArgs.Empty);
		}
	}
}
