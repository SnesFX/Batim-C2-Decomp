using System;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

namespace ProCore.Decals
{
	// Token: 0x02000179 RID: 377
	public static class qdUtil
	{
		// Token: 0x0600063F RID: 1599 RVA: 0x0003A774 File Offset: 0x00038B74
		public static GameObject[] FindDecalsWithTexture(Texture2D img)
		{
			List<GameObject> list = new List<GameObject>();
			foreach (qd_Decal qd_Decal in UnityEngine.Object.FindObjectsOfType(typeof(qd_Decal)))
			{
				if (qd_Decal.texture == img)
				{
					list.Add(qd_Decal.gameObject);
				}
			}
			return list.ToArray();
		}

		// Token: 0x06000640 RID: 1600 RVA: 0x0003A7D8 File Offset: 0x00038BD8
		public static void RefreshSceneDecals(DecalGroup dg)
		{
			if (!dg.isPacked)
			{
				Debug.LogWarning("Attempting to RefreshSceneDecals without a packed material");
				return;
			}
			qd_Decal[] array = (qd_Decal[])UnityEngine.Object.FindObjectsOfType(typeof(qd_Decal));
			for (int i = 0; i < dg.decals.Count; i++)
			{
				foreach (qd_Decal qd_Decal in array)
				{
					if (dg.decals[i].texture == qd_Decal.texture)
					{
						qd_Decal.GetComponent<MeshRenderer>().sharedMaterial = dg.material;
						qd_Decal.SetUVRect(dg.decals[i].atlasRect);
					}
				}
			}
		}

		// Token: 0x06000641 RID: 1601 RVA: 0x0003A894 File Offset: 0x00038C94
		public static void SortDecalsUsingView(ref List<Decal> decals, DecalView decalView)
		{
			List<Decal> list = new List<Decal>();
			foreach (Decal decal in decals)
			{
				int num = (decalView != DecalView.Organizational) ? decal.atlasIndex : decal.orgIndex;
				int num2 = list.Count;
				for (int i = list.Count - 1; i > -1; i--)
				{
					if (num < ((decalView != DecalView.Atlas) ? list[i].orgIndex : list[i].atlasIndex) && num < num2)
					{
						num2 = num;
					}
				}
				list.Insert(num2, decal);
			}
			decals = list;
		}

		// Token: 0x06000642 RID: 1602 RVA: 0x0003A96C File Offset: 0x00038D6C
		public static bool Contains(this Dictionary<int, List<int>> dic, int key, int val)
		{
			return dic.ContainsKey(key) && dic[key].Contains(val);
		}

		// Token: 0x06000643 RID: 1603 RVA: 0x0003A98C File Offset: 0x00038D8C
		public static void Add(this Dictionary<int, List<int>> dic, int key, int val)
		{
			if (key < 0 || val < 0)
			{
				return;
			}
			if (dic.ContainsKey(key))
			{
				if (!dic[key].Contains(val))
				{
					dic[key].Add(val);
				}
			}
			else
			{
				dic.Add(key, new List<int>
				{
					val
				});
			}
		}

		// Token: 0x06000644 RID: 1604 RVA: 0x0003A9F0 File Offset: 0x00038DF0
		public static string ToFormattedString(this Dictionary<int, List<int>> dic)
		{
			string text = string.Empty;
			foreach (KeyValuePair<int, List<int>> keyValuePair in dic)
			{
				string text2 = text;
				text = string.Concat(new object[]
				{
					text2,
					keyValuePair.Key,
					" : ",
					keyValuePair.Value.ToFormattedString(", "),
					"\n"
				});
			}
			return text;
		}

		// Token: 0x06000645 RID: 1605 RVA: 0x0003AA8C File Offset: 0x00038E8C
		public static string ToFormattedString<T>(this T[] t, string _delimiter)
		{
			if (t == null || t.Length < 1)
			{
				return "Empty Array.";
			}
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.Append(t[0].ToString());
			for (int i = 1; i < t.Length; i++)
			{
				stringBuilder.Append(_delimiter + ((t[i] != null) ? t[i].ToString() : "null"));
			}
			return stringBuilder.ToString();
		}

		// Token: 0x06000646 RID: 1606 RVA: 0x0003AB25 File Offset: 0x00038F25
		public static string ToFormattedString<T>(this List<T> t, string _delimiter)
		{
			return t.ToArray().ToFormattedString(_delimiter);
		}
	}
}
	public enum DecalView
	{
		// Token: 0x0400052E RID: 1326
		Organizational,
		// Token: 0x0400052F RID: 1327
		Atlas
	}