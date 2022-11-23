using System;

namespace TMPro
{
	// Token: 0x020005EC RID: 1516
	[Serializable]
	public class TMP_Glyph : TMP_TextElement
	{
		// Token: 0x06002C0C RID: 11276 RVA: 0x0010DAD0 File Offset: 0x0010BCD0
		public static TMP_Glyph Clone(TMP_Glyph source)
		{
			return new TMP_Glyph
			{
				id = source.id,
				x = source.x,
				y = source.y,
				width = source.width,
				height = source.height,
				xOffset = source.xOffset,
				yOffset = source.yOffset,
				xAdvance = source.xAdvance,
				scale = source.scale
			};
		}
	}
}
