using System;
using System.Collections.Generic;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005CC RID: 1484
	[Serializable]
	public class TMP_StyleSheet : ScriptableObject
	{
		// Token: 0x17000485 RID: 1157
		// (get) Token: 0x06002A80 RID: 10880 RVA: 0x001024FC File Offset: 0x001006FC
		public static TMP_StyleSheet instance
		{
			get
			{
				if (TMP_StyleSheet.s_Instance == null)
				{
					TMP_StyleSheet.s_Instance = TMP_Settings.defaultStyleSheet;
					if (TMP_StyleSheet.s_Instance == null)
					{
						TMP_StyleSheet.s_Instance = (Resources.Load("Style Sheets/TMP Default Style Sheet") as TMP_StyleSheet);
					}
					if (TMP_StyleSheet.s_Instance == null)
					{
						return null;
					}
					TMP_StyleSheet.s_Instance.LoadStyleDictionaryInternal();
				}
				return TMP_StyleSheet.s_Instance;
			}
		}

		// Token: 0x06002A81 RID: 10881 RVA: 0x0001E88D File Offset: 0x0001CA8D
		public static TMP_StyleSheet LoadDefaultStyleSheet()
		{
			return TMP_StyleSheet.instance;
		}

		// Token: 0x06002A82 RID: 10882 RVA: 0x0001E894 File Offset: 0x0001CA94
		public static TMP_Style GetStyle(int hashCode)
		{
			return TMP_StyleSheet.instance.GetStyleInternal(hashCode);
		}

		// Token: 0x06002A83 RID: 10883 RVA: 0x00102568 File Offset: 0x00100768
		private TMP_Style GetStyleInternal(int hashCode)
		{
			TMP_Style result;
			if (this.m_StyleDictionary.TryGetValue(hashCode, out result))
			{
				return result;
			}
			return null;
		}

		// Token: 0x06002A84 RID: 10884 RVA: 0x0010258C File Offset: 0x0010078C
		public void UpdateStyleDictionaryKey(int old_key, int new_key)
		{
			if (this.m_StyleDictionary.ContainsKey(old_key))
			{
				TMP_Style value = this.m_StyleDictionary[old_key];
				this.m_StyleDictionary.Add(new_key, value);
				this.m_StyleDictionary.Remove(old_key);
			}
		}

		// Token: 0x06002A85 RID: 10885 RVA: 0x0001E8A1 File Offset: 0x0001CAA1
		public static void RefreshStyles()
		{
			TMP_StyleSheet.s_Instance.LoadStyleDictionaryInternal();
		}

		// Token: 0x06002A86 RID: 10886 RVA: 0x001025D4 File Offset: 0x001007D4
		private void LoadStyleDictionaryInternal()
		{
			this.m_StyleDictionary.Clear();
			for (int i = 0; i < this.m_StyleList.Count; i++)
			{
				this.m_StyleList[i].RefreshStyle();
				if (!this.m_StyleDictionary.ContainsKey(this.m_StyleList[i].hashCode))
				{
					this.m_StyleDictionary.Add(this.m_StyleList[i].hashCode, this.m_StyleList[i]);
				}
			}
		}

		// Token: 0x04002F7F RID: 12159
		private static TMP_StyleSheet s_Instance;

		// Token: 0x04002F80 RID: 12160
		[SerializeField]
		private List<TMP_Style> m_StyleList = new List<TMP_Style>(1);

		// Token: 0x04002F81 RID: 12161
		private Dictionary<int, TMP_Style> m_StyleDictionary = new Dictionary<int, TMP_Style>();
	}
}
