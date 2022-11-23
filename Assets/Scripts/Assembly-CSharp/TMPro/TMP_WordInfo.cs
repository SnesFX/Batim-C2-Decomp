using System;

namespace TMPro
{
	// Token: 0x020005FA RID: 1530
	public struct TMP_WordInfo
	{
		// Token: 0x06002C21 RID: 11297 RVA: 0x0010DDA4 File Offset: 0x0010BFA4
		public string GetWord()
		{
			string text = string.Empty;
			TMP_CharacterInfo[] characterInfo = this.textComponent.textInfo.characterInfo;
			for (int i = this.firstCharacterIndex; i < this.lastCharacterIndex + 1; i++)
			{
				text += characterInfo[i].character;
			}
			return text;
		}

		// Token: 0x0400315C RID: 12636
		public TMP_Text textComponent;

		// Token: 0x0400315D RID: 12637
		public int firstCharacterIndex;

		// Token: 0x0400315E RID: 12638
		public int lastCharacterIndex;

		// Token: 0x0400315F RID: 12639
		public int characterCount;
	}
}
