using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005AD RID: 1453
	[Serializable]
	public class TMP_FontAsset : TMP_Asset
	{
		// Token: 0x17000438 RID: 1080
		// (get) Token: 0x06002965 RID: 10597 RVA: 0x0001DC19 File Offset: 0x0001BE19
		public static TMP_FontAsset defaultFontAsset
		{
			get
			{
				if (TMP_FontAsset.s_defaultFontAsset == null)
				{
					TMP_FontAsset.s_defaultFontAsset = Resources.Load<TMP_FontAsset>("Fonts & Materials/ARIAL SDF");
				}
				return TMP_FontAsset.s_defaultFontAsset;
			}
		}

		// Token: 0x17000439 RID: 1081
		// (get) Token: 0x06002966 RID: 10598 RVA: 0x0001DC3F File Offset: 0x0001BE3F
		public FaceInfo fontInfo
		{
			get
			{
				return this.m_fontInfo;
			}
		}

		// Token: 0x1700043A RID: 1082
		// (get) Token: 0x06002967 RID: 10599 RVA: 0x0001DC47 File Offset: 0x0001BE47
		public Dictionary<int, TMP_Glyph> characterDictionary
		{
			get
			{
				if (this.m_characterDictionary == null)
				{
					this.ReadFontDefinition();
				}
				return this.m_characterDictionary;
			}
		}

		// Token: 0x1700043B RID: 1083
		// (get) Token: 0x06002968 RID: 10600 RVA: 0x0001DC60 File Offset: 0x0001BE60
		public Dictionary<int, KerningPair> kerningDictionary
		{
			get
			{
				return this.m_kerningDictionary;
			}
		}

		// Token: 0x1700043C RID: 1084
		// (get) Token: 0x06002969 RID: 10601 RVA: 0x0001DC68 File Offset: 0x0001BE68
		public KerningTable kerningInfo
		{
			get
			{
				return this.m_kerningInfo;
			}
		}

		// Token: 0x0600296A RID: 10602 RVA: 0x00002482 File Offset: 0x00000682
		private void OnEnable()
		{
		}

		// Token: 0x0600296B RID: 10603 RVA: 0x00002482 File Offset: 0x00000682
		private void OnDisable()
		{
		}

		// Token: 0x0600296C RID: 10604 RVA: 0x0001DC70 File Offset: 0x0001BE70
		public void AddFaceInfo(FaceInfo faceInfo)
		{
			this.m_fontInfo = faceInfo;
		}

		// Token: 0x0600296D RID: 10605 RVA: 0x000FC9C4 File Offset: 0x000FABC4
		public void AddGlyphInfo(TMP_Glyph[] glyphInfo)
		{
			this.m_glyphInfoList = new List<TMP_Glyph>();
			int num = glyphInfo.Length;
			this.m_fontInfo.CharacterCount = num;
			this.m_characterSet = new int[num];
			for (int i = 0; i < num; i++)
			{
				TMP_Glyph tmp_Glyph = new TMP_Glyph();
				tmp_Glyph.id = glyphInfo[i].id;
				tmp_Glyph.x = glyphInfo[i].x;
				tmp_Glyph.y = glyphInfo[i].y;
				tmp_Glyph.width = glyphInfo[i].width;
				tmp_Glyph.height = glyphInfo[i].height;
				tmp_Glyph.xOffset = glyphInfo[i].xOffset;
				tmp_Glyph.yOffset = glyphInfo[i].yOffset;
				tmp_Glyph.xAdvance = glyphInfo[i].xAdvance;
				tmp_Glyph.scale = 1f;
				this.m_glyphInfoList.Add(tmp_Glyph);
				this.m_characterSet[i] = tmp_Glyph.id;
			}
			this.m_glyphInfoList = (from s in this.m_glyphInfoList
			orderby s.id
			select s).ToList<TMP_Glyph>();
		}

		// Token: 0x0600296E RID: 10606 RVA: 0x0001DC79 File Offset: 0x0001BE79
		public void AddKerningInfo(KerningTable kerningTable)
		{
			this.m_kerningInfo = kerningTable;
		}

		// Token: 0x0600296F RID: 10607 RVA: 0x000FCAD8 File Offset: 0x000FACD8
		public void ReadFontDefinition()
		{
			if (this.m_fontInfo == null)
			{
				return;
			}
			this.m_characterDictionary = new Dictionary<int, TMP_Glyph>();
			for (int i = 0; i < this.m_glyphInfoList.Count; i++)
			{
				TMP_Glyph tmp_Glyph = this.m_glyphInfoList[i];
				if (!this.m_characterDictionary.ContainsKey(tmp_Glyph.id))
				{
					this.m_characterDictionary.Add(tmp_Glyph.id, tmp_Glyph);
				}
				if (tmp_Glyph.scale == 0f)
				{
					tmp_Glyph.scale = 1f;
				}
			}
			TMP_Glyph tmp_Glyph2 = new TMP_Glyph();
			if (this.m_characterDictionary.ContainsKey(32))
			{
				this.m_characterDictionary[32].width = this.m_characterDictionary[32].xAdvance;
				this.m_characterDictionary[32].height = this.m_fontInfo.Ascender - this.m_fontInfo.Descender;
				this.m_characterDictionary[32].yOffset = this.m_fontInfo.Ascender;
				this.m_characterDictionary[32].scale = 1f;
			}
			else
			{
				tmp_Glyph2 = new TMP_Glyph();
				tmp_Glyph2.id = 32;
				tmp_Glyph2.x = 0f;
				tmp_Glyph2.y = 0f;
				tmp_Glyph2.width = this.m_fontInfo.Ascender / 5f;
				tmp_Glyph2.height = this.m_fontInfo.Ascender - this.m_fontInfo.Descender;
				tmp_Glyph2.xOffset = 0f;
				tmp_Glyph2.yOffset = this.m_fontInfo.Ascender;
				tmp_Glyph2.xAdvance = this.m_fontInfo.PointSize / 4f;
				tmp_Glyph2.scale = 1f;
				this.m_characterDictionary.Add(32, tmp_Glyph2);
			}
			if (!this.m_characterDictionary.ContainsKey(160))
			{
				tmp_Glyph2 = TMP_Glyph.Clone(this.m_characterDictionary[32]);
				this.m_characterDictionary.Add(160, tmp_Glyph2);
			}
			if (!this.m_characterDictionary.ContainsKey(8203))
			{
				tmp_Glyph2 = TMP_Glyph.Clone(this.m_characterDictionary[32]);
				tmp_Glyph2.width = 0f;
				tmp_Glyph2.xAdvance = 0f;
				this.m_characterDictionary.Add(8203, tmp_Glyph2);
			}
			if (!this.m_characterDictionary.ContainsKey(8288))
			{
				tmp_Glyph2 = TMP_Glyph.Clone(this.m_characterDictionary[32]);
				tmp_Glyph2.width = 0f;
				tmp_Glyph2.xAdvance = 0f;
				this.m_characterDictionary.Add(8288, tmp_Glyph2);
			}
			if (!this.m_characterDictionary.ContainsKey(10))
			{
				tmp_Glyph2 = new TMP_Glyph();
				tmp_Glyph2.id = 10;
				tmp_Glyph2.x = 0f;
				tmp_Glyph2.y = 0f;
				tmp_Glyph2.width = 10f;
				tmp_Glyph2.height = this.m_characterDictionary[32].height;
				tmp_Glyph2.xOffset = 0f;
				tmp_Glyph2.yOffset = this.m_characterDictionary[32].yOffset;
				tmp_Glyph2.xAdvance = 0f;
				tmp_Glyph2.scale = 1f;
				this.m_characterDictionary.Add(10, tmp_Glyph2);
				if (!this.m_characterDictionary.ContainsKey(13))
				{
					this.m_characterDictionary.Add(13, tmp_Glyph2);
				}
			}
			if (!this.m_characterDictionary.ContainsKey(9))
			{
				tmp_Glyph2 = new TMP_Glyph();
				tmp_Glyph2.id = 9;
				tmp_Glyph2.x = this.m_characterDictionary[32].x;
				tmp_Glyph2.y = this.m_characterDictionary[32].y;
				tmp_Glyph2.width = this.m_characterDictionary[32].width * (float)this.tabSize + (this.m_characterDictionary[32].xAdvance - this.m_characterDictionary[32].width) * (float)(this.tabSize - 1);
				tmp_Glyph2.height = this.m_characterDictionary[32].height;
				tmp_Glyph2.xOffset = this.m_characterDictionary[32].xOffset;
				tmp_Glyph2.yOffset = this.m_characterDictionary[32].yOffset;
				tmp_Glyph2.xAdvance = this.m_characterDictionary[32].xAdvance * (float)this.tabSize;
				tmp_Glyph2.scale = 1f;
				this.m_characterDictionary.Add(9, tmp_Glyph2);
			}
			this.m_fontInfo.TabWidth = this.m_characterDictionary[9].xAdvance;
			if (this.m_fontInfo.CapHeight == 0f && this.m_characterDictionary.ContainsKey(65))
			{
				this.m_fontInfo.CapHeight = this.m_characterDictionary[65].yOffset;
			}
			if (this.m_fontInfo.Scale == 0f)
			{
				this.m_fontInfo.Scale = 1f;
			}
			this.m_kerningDictionary = new Dictionary<int, KerningPair>();
			List<KerningPair> kerningPairs = this.m_kerningInfo.kerningPairs;
			for (int j = 0; j < kerningPairs.Count; j++)
			{
				KerningPair kerningPair = kerningPairs[j];
				KerningPairKey kerningPairKey = new KerningPairKey(kerningPair.AscII_Left, kerningPair.AscII_Right);
				if (!this.m_kerningDictionary.ContainsKey(kerningPairKey.key))
				{
					this.m_kerningDictionary.Add(kerningPairKey.key, kerningPair);
				}
				else if (!TMP_Settings.warningsDisabled)
				{
					Debug.LogWarning(string.Concat(new object[]
					{
						"Kerning Key for [",
						kerningPairKey.ascii_Left,
						"] and [",
						kerningPairKey.ascii_Right,
						"] already exists."
					}));
				}
			}
			this.hashCode = TMP_TextUtilities.GetSimpleHashCode(base.name);
			this.materialHashCode = TMP_TextUtilities.GetSimpleHashCode(this.material.name);
		}

		// Token: 0x06002970 RID: 10608 RVA: 0x0001DC82 File Offset: 0x0001BE82
		public bool HasCharacter(int character)
		{
			return this.m_characterDictionary != null && this.m_characterDictionary.ContainsKey(character);
		}

		// Token: 0x06002971 RID: 10609 RVA: 0x0001DC82 File Offset: 0x0001BE82
		public bool HasCharacter(char character)
		{
			return this.m_characterDictionary != null && this.m_characterDictionary.ContainsKey((int)character);
		}

		// Token: 0x06002972 RID: 10610 RVA: 0x000FD0E0 File Offset: 0x000FB2E0
		public bool HasCharacter(char character, bool searchFallbacks)
		{
			if (this.m_characterDictionary == null)
			{
				return false;
			}
			if (this.m_characterDictionary.ContainsKey((int)character))
			{
				return true;
			}
			if (searchFallbacks)
			{
				if (this.fallbackFontAssets != null && this.fallbackFontAssets.Count > 0)
				{
					for (int i = 0; i < this.fallbackFontAssets.Count; i++)
					{
						if (this.fallbackFontAssets[i].characterDictionary != null && this.fallbackFontAssets[i].characterDictionary.ContainsKey((int)character))
						{
							return true;
						}
					}
				}
				if (TMP_Settings.fallbackFontAssets != null && TMP_Settings.fallbackFontAssets.Count > 0)
				{
					for (int j = 0; j < TMP_Settings.fallbackFontAssets.Count; j++)
					{
						if (TMP_Settings.fallbackFontAssets[j].characterDictionary != null && TMP_Settings.fallbackFontAssets[j].characterDictionary.ContainsKey((int)character))
						{
							return true;
						}
					}
				}
			}
			return false;
		}

		// Token: 0x06002973 RID: 10611 RVA: 0x000FD1E8 File Offset: 0x000FB3E8
		public bool HasCharacters(string text, out List<char> missingCharacters)
		{
			if (this.m_characterDictionary == null)
			{
				missingCharacters = null;
				return false;
			}
			missingCharacters = new List<char>();
			for (int i = 0; i < text.Length; i++)
			{
				if (!this.m_characterDictionary.ContainsKey((int)text[i]))
				{
					missingCharacters.Add(text[i]);
				}
			}
			return missingCharacters.Count == 0;
		}

		// Token: 0x06002974 RID: 10612 RVA: 0x000FD258 File Offset: 0x000FB458
		public static string GetCharacters(TMP_FontAsset fontAsset)
		{
			string text = string.Empty;
			for (int i = 0; i < fontAsset.m_glyphInfoList.Count; i++)
			{
				text += (char)fontAsset.m_glyphInfoList[i].id;
			}
			return text;
		}

		// Token: 0x06002975 RID: 10613 RVA: 0x000FD2A8 File Offset: 0x000FB4A8
		public static int[] GetCharactersArray(TMP_FontAsset fontAsset)
		{
			int[] array = new int[fontAsset.m_glyphInfoList.Count];
			for (int i = 0; i < fontAsset.m_glyphInfoList.Count; i++)
			{
				array[i] = fontAsset.m_glyphInfoList[i].id;
			}
			return array;
		}

		// Token: 0x04002EA7 RID: 11943
		private static TMP_FontAsset s_defaultFontAsset;

		// Token: 0x04002EA8 RID: 11944
		public TMP_FontAsset.FontAssetTypes fontAssetType;

		// Token: 0x04002EA9 RID: 11945
		[SerializeField]
		private FaceInfo m_fontInfo;

		// Token: 0x04002EAA RID: 11946
		[SerializeField]
		public Texture2D atlas;

		// Token: 0x04002EAB RID: 11947
		[SerializeField]
		private List<TMP_Glyph> m_glyphInfoList;

		// Token: 0x04002EAC RID: 11948
		private Dictionary<int, TMP_Glyph> m_characterDictionary;

		// Token: 0x04002EAD RID: 11949
		private Dictionary<int, KerningPair> m_kerningDictionary;

		// Token: 0x04002EAE RID: 11950
		[SerializeField]
		private KerningTable m_kerningInfo;

		// Token: 0x04002EAF RID: 11951
		[SerializeField]
		private KerningPair m_kerningPair;

		// Token: 0x04002EB0 RID: 11952
		[SerializeField]
		public List<TMP_FontAsset> fallbackFontAssets;

		// Token: 0x04002EB1 RID: 11953
		[SerializeField]
		public FontCreationSetting fontCreationSettings;

		// Token: 0x04002EB2 RID: 11954
		[SerializeField]
		public TMP_FontWeights[] fontWeights = new TMP_FontWeights[10];

		// Token: 0x04002EB3 RID: 11955
		private int[] m_characterSet;

		// Token: 0x04002EB4 RID: 11956
		public float normalStyle;

		// Token: 0x04002EB5 RID: 11957
		public float normalSpacingOffset;

		// Token: 0x04002EB6 RID: 11958
		public float boldStyle = 0.75f;

		// Token: 0x04002EB7 RID: 11959
		public float boldSpacing = 7f;

		// Token: 0x04002EB8 RID: 11960
		public byte italicStyle = 35;

		// Token: 0x04002EB9 RID: 11961
		public byte tabSize = 10;

		// Token: 0x04002EBA RID: 11962
		private byte m_oldTabSize;

		// Token: 0x020005AE RID: 1454
		public enum FontAssetTypes
		{
			// Token: 0x04002EBD RID: 11965
			None,
			// Token: 0x04002EBE RID: 11966
			SDF,
			// Token: 0x04002EBF RID: 11967
			Bitmap
		}
	}
}
