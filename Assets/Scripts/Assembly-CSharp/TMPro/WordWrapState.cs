using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005FE RID: 1534
	public struct WordWrapState
	{
		// Token: 0x04003167 RID: 12647
		public int previous_WordBreak;

		// Token: 0x04003168 RID: 12648
		public int total_CharacterCount;

		// Token: 0x04003169 RID: 12649
		public int visible_CharacterCount;

		// Token: 0x0400316A RID: 12650
		public int visible_SpriteCount;

		// Token: 0x0400316B RID: 12651
		public int visible_LinkCount;

		// Token: 0x0400316C RID: 12652
		public int firstCharacterIndex;

		// Token: 0x0400316D RID: 12653
		public int firstVisibleCharacterIndex;

		// Token: 0x0400316E RID: 12654
		public int lastCharacterIndex;

		// Token: 0x0400316F RID: 12655
		public int lastVisibleCharIndex;

		// Token: 0x04003170 RID: 12656
		public int lineNumber;

		// Token: 0x04003171 RID: 12657
		public float maxCapHeight;

		// Token: 0x04003172 RID: 12658
		public float maxAscender;

		// Token: 0x04003173 RID: 12659
		public float maxDescender;

		// Token: 0x04003174 RID: 12660
		public float maxLineAscender;

		// Token: 0x04003175 RID: 12661
		public float maxLineDescender;

		// Token: 0x04003176 RID: 12662
		public float previousLineAscender;

		// Token: 0x04003177 RID: 12663
		public float xAdvance;

		// Token: 0x04003178 RID: 12664
		public float preferredWidth;

		// Token: 0x04003179 RID: 12665
		public float preferredHeight;

		// Token: 0x0400317A RID: 12666
		public float previousLineScale;

		// Token: 0x0400317B RID: 12667
		public int wordCount;

		// Token: 0x0400317C RID: 12668
		public FontStyles fontStyle;

		// Token: 0x0400317D RID: 12669
		public float fontScale;

		// Token: 0x0400317E RID: 12670
		public float fontScaleMultiplier;

		// Token: 0x0400317F RID: 12671
		public float currentFontSize;

		// Token: 0x04003180 RID: 12672
		public float baselineOffset;

		// Token: 0x04003181 RID: 12673
		public float lineOffset;

		// Token: 0x04003182 RID: 12674
		public TMP_TextInfo textInfo;

		// Token: 0x04003183 RID: 12675
		public TMP_LineInfo lineInfo;

		// Token: 0x04003184 RID: 12676
		public Color32 vertexColor;

		// Token: 0x04003185 RID: 12677
		public TMP_XmlTagStack<Color32> colorStack;

		// Token: 0x04003186 RID: 12678
		public TMP_XmlTagStack<float> sizeStack;

		// Token: 0x04003187 RID: 12679
		public TMP_XmlTagStack<int> fontWeightStack;

		// Token: 0x04003188 RID: 12680
		public TMP_XmlTagStack<int> styleStack;

		// Token: 0x04003189 RID: 12681
		public TMP_XmlTagStack<int> actionStack;

		// Token: 0x0400318A RID: 12682
		public TMP_XmlTagStack<MaterialReference> materialReferenceStack;

		// Token: 0x0400318B RID: 12683
		public TMP_FontAsset currentFontAsset;

		// Token: 0x0400318C RID: 12684
		public TMP_SpriteAsset currentSpriteAsset;

		// Token: 0x0400318D RID: 12685
		public Material currentMaterial;

		// Token: 0x0400318E RID: 12686
		public int currentMaterialIndex;

		// Token: 0x0400318F RID: 12687
		public Extents meshExtents;

		// Token: 0x04003190 RID: 12688
		public bool tagNoParsing;
	}
}
