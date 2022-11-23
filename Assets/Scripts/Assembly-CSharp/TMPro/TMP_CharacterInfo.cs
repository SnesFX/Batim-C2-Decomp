using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005F5 RID: 1525
	public struct TMP_CharacterInfo
	{
		// Token: 0x04003127 RID: 12583
		public char character;

		// Token: 0x04003128 RID: 12584
		public short index;

		// Token: 0x04003129 RID: 12585
		public TMP_TextElementType elementType;

		// Token: 0x0400312A RID: 12586
		public TMP_TextElement textElement;

		// Token: 0x0400312B RID: 12587
		public TMP_FontAsset fontAsset;

		// Token: 0x0400312C RID: 12588
		public TMP_SpriteAsset spriteAsset;

		// Token: 0x0400312D RID: 12589
		public int spriteIndex;

		// Token: 0x0400312E RID: 12590
		public Material material;

		// Token: 0x0400312F RID: 12591
		public int materialReferenceIndex;

		// Token: 0x04003130 RID: 12592
		public bool isUsingAlternateTypeface;

		// Token: 0x04003131 RID: 12593
		public float pointSize;

		// Token: 0x04003132 RID: 12594
		public short lineNumber;

		// Token: 0x04003133 RID: 12595
		public short pageNumber;

		// Token: 0x04003134 RID: 12596
		public int vertexIndex;

		// Token: 0x04003135 RID: 12597
		public TMP_Vertex vertex_TL;

		// Token: 0x04003136 RID: 12598
		public TMP_Vertex vertex_BL;

		// Token: 0x04003137 RID: 12599
		public TMP_Vertex vertex_TR;

		// Token: 0x04003138 RID: 12600
		public TMP_Vertex vertex_BR;

		// Token: 0x04003139 RID: 12601
		public Vector3 topLeft;

		// Token: 0x0400313A RID: 12602
		public Vector3 bottomLeft;

		// Token: 0x0400313B RID: 12603
		public Vector3 topRight;

		// Token: 0x0400313C RID: 12604
		public Vector3 bottomRight;

		// Token: 0x0400313D RID: 12605
		public float origin;

		// Token: 0x0400313E RID: 12606
		public float ascender;

		// Token: 0x0400313F RID: 12607
		public float baseLine;

		// Token: 0x04003140 RID: 12608
		public float descender;

		// Token: 0x04003141 RID: 12609
		public float xAdvance;

		// Token: 0x04003142 RID: 12610
		public float aspectRatio;

		// Token: 0x04003143 RID: 12611
		public float scale;

		// Token: 0x04003144 RID: 12612
		public Color32 color;

		// Token: 0x04003145 RID: 12613
		public FontStyles style;

		// Token: 0x04003146 RID: 12614
		public bool isVisible;
	}
}
