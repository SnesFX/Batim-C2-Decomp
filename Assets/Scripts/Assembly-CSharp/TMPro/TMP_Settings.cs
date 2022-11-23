using System;
using System.Collections.Generic;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005C7 RID: 1479
	[ExecuteInEditMode]
	[Serializable]
	public class TMP_Settings : ScriptableObject
	{
		// Token: 0x17000469 RID: 1129
		// (get) Token: 0x06002A52 RID: 10834 RVA: 0x0001E637 File Offset: 0x0001C837
		public static bool enableWordWrapping
		{
			get
			{
				return TMP_Settings.instance.m_enableWordWrapping;
			}
		}

		// Token: 0x1700046A RID: 1130
		// (get) Token: 0x06002A53 RID: 10835 RVA: 0x0001E643 File Offset: 0x0001C843
		public static bool enableKerning
		{
			get
			{
				return TMP_Settings.instance.m_enableKerning;
			}
		}

		// Token: 0x1700046B RID: 1131
		// (get) Token: 0x06002A54 RID: 10836 RVA: 0x0001E64F File Offset: 0x0001C84F
		public static bool enableExtraPadding
		{
			get
			{
				return TMP_Settings.instance.m_enableExtraPadding;
			}
		}

		// Token: 0x1700046C RID: 1132
		// (get) Token: 0x06002A55 RID: 10837 RVA: 0x0001E65B File Offset: 0x0001C85B
		public static bool enableTintAllSprites
		{
			get
			{
				return TMP_Settings.instance.m_enableTintAllSprites;
			}
		}

		// Token: 0x1700046D RID: 1133
		// (get) Token: 0x06002A56 RID: 10838 RVA: 0x0001E667 File Offset: 0x0001C867
		public static bool enableParseEscapeCharacters
		{
			get
			{
				return TMP_Settings.instance.m_enableParseEscapeCharacters;
			}
		}

		// Token: 0x1700046E RID: 1134
		// (get) Token: 0x06002A57 RID: 10839 RVA: 0x0001E673 File Offset: 0x0001C873
		public static int missingGlyphCharacter
		{
			get
			{
				return TMP_Settings.instance.m_missingGlyphCharacter;
			}
		}

		// Token: 0x1700046F RID: 1135
		// (get) Token: 0x06002A58 RID: 10840 RVA: 0x0001E67F File Offset: 0x0001C87F
		public static bool warningsDisabled
		{
			get
			{
				return TMP_Settings.instance.m_warningsDisabled;
			}
		}

		// Token: 0x17000470 RID: 1136
		// (get) Token: 0x06002A59 RID: 10841 RVA: 0x0001E68B File Offset: 0x0001C88B
		public static TMP_FontAsset defaultFontAsset
		{
			get
			{
				return null;
			}
		}

		// Token: 0x17000471 RID: 1137
		// (get) Token: 0x06002A5A RID: 10842 RVA: 0x0001E697 File Offset: 0x0001C897
		public static string defaultFontAssetPath
		{
			get
			{
				return TMP_Settings.instance.m_defaultFontAssetPath;
			}
		}

		// Token: 0x17000472 RID: 1138
		// (get) Token: 0x06002A5B RID: 10843 RVA: 0x0001E6A3 File Offset: 0x0001C8A3
		public static float defaultFontSize
		{
			get
			{
				return TMP_Settings.instance.m_defaultFontSize;
			}
		}

		// Token: 0x17000473 RID: 1139
		// (get) Token: 0x06002A5C RID: 10844 RVA: 0x0001E6AF File Offset: 0x0001C8AF
		public static float defaultTextContainerWidth
		{
			get
			{
				return TMP_Settings.instance.m_defaultTextContainerWidth;
			}
		}

		// Token: 0x17000474 RID: 1140
		// (get) Token: 0x06002A5D RID: 10845 RVA: 0x0001E6BB File Offset: 0x0001C8BB
		public static float defaultTextContainerHeight
		{
			get
			{
				return TMP_Settings.instance.m_defaultTextContainerHeight;
			}
		}

		// Token: 0x17000475 RID: 1141
		// (get) Token: 0x06002A5E RID: 10846 RVA: 0x0001E6C7 File Offset: 0x0001C8C7
		public static List<TMP_FontAsset> fallbackFontAssets
		{
			get
			{
				return TMP_Settings.instance.m_fallbackFontAssets;
			}
		}

		// Token: 0x17000476 RID: 1142
		// (get) Token: 0x06002A5F RID: 10847 RVA: 0x0001E6D3 File Offset: 0x0001C8D3
		public static bool matchMaterialPreset
		{
			get
			{
				return TMP_Settings.instance.m_matchMaterialPreset;
			}
		}

		// Token: 0x17000477 RID: 1143
		// (get) Token: 0x06002A60 RID: 10848 RVA: 0x0001E6DF File Offset: 0x0001C8DF
		public static TMP_SpriteAsset defaultSpriteAsset
		{
			get
			{
				return TMP_Settings.instance.m_defaultSpriteAsset;
			}
		}

		// Token: 0x17000478 RID: 1144
		// (get) Token: 0x06002A61 RID: 10849 RVA: 0x0001E6EB File Offset: 0x0001C8EB
		public static string defaultSpriteAssetPath
		{
			get
			{
				return TMP_Settings.instance.m_defaultSpriteAssetPath;
			}
		}

		// Token: 0x17000479 RID: 1145
		// (get) Token: 0x06002A62 RID: 10850 RVA: 0x0001E6F7 File Offset: 0x0001C8F7
		public static TMP_StyleSheet defaultStyleSheet
		{
			get
			{
				return null;
			}
		}

		// Token: 0x1700047A RID: 1146
		// (get) Token: 0x06002A63 RID: 10851 RVA: 0x0001E703 File Offset: 0x0001C903
		public static TextAsset leadingCharacters
		{
			get
			{
				return TMP_Settings.instance.m_leadingCharacters;
			}
		}

		// Token: 0x1700047B RID: 1147
		// (get) Token: 0x06002A64 RID: 10852 RVA: 0x0001E70F File Offset: 0x0001C90F
		public static TextAsset followingCharacters
		{
			get
			{
				return TMP_Settings.instance.m_followingCharacters;
			}
		}

		// Token: 0x1700047C RID: 1148
		// (get) Token: 0x06002A65 RID: 10853 RVA: 0x0001E71B File Offset: 0x0001C91B
		public static TMP_Settings.LineBreakingTable linebreakingRules
		{
			get
			{
				if (TMP_Settings.instance.m_linebreakingRules == null)
				{
					TMP_Settings.LoadLinebreakingRules();
				}
				return TMP_Settings.instance.m_linebreakingRules;
			}
		}

		// Token: 0x1700047D RID: 1149
		// (get) Token: 0x06002A66 RID: 10854 RVA: 0x0001E73B File Offset: 0x0001C93B
		public static TMP_Settings instance
		{
			get
			{
				if (TMP_Settings.s_Instance == null)
				{
					TMP_Settings.s_Instance = (Resources.Load("TMP Settings") as TMP_Settings);
				}
				return TMP_Settings.s_Instance;
			}
		}

		// Token: 0x06002A67 RID: 10855 RVA: 0x001022C0 File Offset: 0x001004C0
		public static TMP_Settings LoadDefaultSettings()
		{
			if (TMP_Settings.s_Instance == null)
			{
				TMP_Settings x = Resources.Load("TMP Settings") as TMP_Settings;
				if (x != null)
				{
					TMP_Settings.s_Instance = x;
				}
			}
			return TMP_Settings.s_Instance;
		}

		// Token: 0x06002A68 RID: 10856 RVA: 0x0001E766 File Offset: 0x0001C966
		public static TMP_Settings GetSettings()
		{
			if (TMP_Settings.instance == null)
			{
				return null;
			}
			return TMP_Settings.instance;
		}

		// Token: 0x06002A69 RID: 10857 RVA: 0x0001E77F File Offset: 0x0001C97F
		public static TMP_FontAsset GetFontAsset()
		{
			if (TMP_Settings.instance == null)
			{
				return null;
			}
			return TMP_Settings.instance.m_defaultFontAsset;
		}

		// Token: 0x06002A6A RID: 10858 RVA: 0x0001E79D File Offset: 0x0001C99D
		public static TMP_SpriteAsset GetSpriteAsset()
		{
			if (TMP_Settings.instance == null)
			{
				return null;
			}
			return TMP_Settings.instance.m_defaultSpriteAsset;
		}

		// Token: 0x06002A6B RID: 10859 RVA: 0x0001E7BB File Offset: 0x0001C9BB
		public static TMP_StyleSheet GetStyleSheet()
		{
			if (TMP_Settings.instance == null)
			{
				return null;
			}
			return TMP_Settings.instance.m_defaultStyleSheet;
		}

		// Token: 0x06002A6C RID: 10860 RVA: 0x00102304 File Offset: 0x00100504
		public static void LoadLinebreakingRules()
		{
			if (TMP_Settings.instance == null)
			{
				return;
			}
			if (TMP_Settings.s_Instance.m_linebreakingRules == null)
			{
				TMP_Settings.s_Instance.m_linebreakingRules = new TMP_Settings.LineBreakingTable();
			}
			TMP_Settings.s_Instance.m_linebreakingRules.leadingCharacters = TMP_Settings.GetCharacters(TMP_Settings.s_Instance.m_leadingCharacters);
			TMP_Settings.s_Instance.m_linebreakingRules.followingCharacters = TMP_Settings.GetCharacters(TMP_Settings.s_Instance.m_followingCharacters);
		}

		// Token: 0x06002A6D RID: 10861 RVA: 0x0010237C File Offset: 0x0010057C
		private static Dictionary<int, char> GetCharacters(TextAsset file)
		{
			Dictionary<int, char> dictionary = new Dictionary<int, char>();
			foreach (char c in file.text)
			{
				if (!dictionary.ContainsKey((int)c))
				{
					dictionary.Add((int)c, c);
				}
			}
			return dictionary;
		}

		// Token: 0x04002F5A RID: 12122
		private static TMP_Settings s_Instance;

		// Token: 0x04002F5B RID: 12123
		[SerializeField]
		private bool m_enableWordWrapping;

		// Token: 0x04002F5C RID: 12124
		[SerializeField]
		private bool m_enableKerning;

		// Token: 0x04002F5D RID: 12125
		[SerializeField]
		private bool m_enableExtraPadding;

		// Token: 0x04002F5E RID: 12126
		[SerializeField]
		private bool m_enableTintAllSprites;

		// Token: 0x04002F5F RID: 12127
		[SerializeField]
		private bool m_enableParseEscapeCharacters;

		// Token: 0x04002F60 RID: 12128
		[SerializeField]
		private int m_missingGlyphCharacter;

		// Token: 0x04002F61 RID: 12129
		[SerializeField]
		private bool m_warningsDisabled;

		// Token: 0x04002F62 RID: 12130
		[SerializeField]
		private TMP_FontAsset m_defaultFontAsset;

		// Token: 0x04002F63 RID: 12131
		[SerializeField]
		private string m_defaultFontAssetPath;

		// Token: 0x04002F64 RID: 12132
		[SerializeField]
		private float m_defaultFontSize;

		// Token: 0x04002F65 RID: 12133
		[SerializeField]
		private float m_defaultTextContainerWidth;

		// Token: 0x04002F66 RID: 12134
		[SerializeField]
		private float m_defaultTextContainerHeight;

		// Token: 0x04002F67 RID: 12135
		[SerializeField]
		private List<TMP_FontAsset> m_fallbackFontAssets;

		// Token: 0x04002F68 RID: 12136
		[SerializeField]
		private bool m_matchMaterialPreset;

		// Token: 0x04002F69 RID: 12137
		[SerializeField]
		private TMP_SpriteAsset m_defaultSpriteAsset;

		// Token: 0x04002F6A RID: 12138
		[SerializeField]
		private string m_defaultSpriteAssetPath;

		// Token: 0x04002F6B RID: 12139
		[SerializeField]
		private TMP_StyleSheet m_defaultStyleSheet;

		// Token: 0x04002F6C RID: 12140
		[SerializeField]
		private TextAsset m_leadingCharacters;

		// Token: 0x04002F6D RID: 12141
		[SerializeField]
		private TextAsset m_followingCharacters;

		// Token: 0x04002F6E RID: 12142
		[SerializeField]
		private TMP_Settings.LineBreakingTable m_linebreakingRules;

		// Token: 0x020005C8 RID: 1480
		public class LineBreakingTable
		{
			// Token: 0x04002F6F RID: 12143
			public Dictionary<int, char> leadingCharacters;

			// Token: 0x04002F70 RID: 12144
			public Dictionary<int, char> followingCharacters;
		}
	}
}
