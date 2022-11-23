using System;

namespace TMPro
{
	// Token: 0x020005F9 RID: 1529
	public struct TMP_LinkInfo
	{
		// Token: 0x06002C1E RID: 11294 RVA: 0x0010DCF0 File Offset: 0x0010BEF0
		internal void SetLinkID(char[] text, int startIndex, int length)
		{
			if (this.linkID == null || this.linkID.Length < length)
			{
				this.linkID = new char[length];
			}
			for (int i = 0; i < length; i++)
			{
				this.linkID[i] = text[startIndex + i];
			}
		}

		// Token: 0x06002C1F RID: 11295 RVA: 0x0010DD44 File Offset: 0x0010BF44
		public string GetLinkText()
		{
			string text = string.Empty;
			TMP_TextInfo textInfo = this.textComponent.textInfo;
			for (int i = this.linkTextfirstCharacterIndex; i < this.linkTextfirstCharacterIndex + this.linkTextLength; i++)
			{
				text += textInfo.characterInfo[i].character;
			}
			return text;
		}

		// Token: 0x06002C20 RID: 11296 RVA: 0x0001FCF2 File Offset: 0x0001DEF2
		public string GetLinkID()
		{
			if (this.textComponent == null)
			{
				return string.Empty;
			}
			return new string(this.linkID, 0, this.linkIdLength);
		}

		// Token: 0x04003155 RID: 12629
		public TMP_Text textComponent;

		// Token: 0x04003156 RID: 12630
		public int hashCode;

		// Token: 0x04003157 RID: 12631
		public int linkIdFirstCharacterIndex;

		// Token: 0x04003158 RID: 12632
		public int linkIdLength;

		// Token: 0x04003159 RID: 12633
		public int linkTextfirstCharacterIndex;

		// Token: 0x0400315A RID: 12634
		public int linkTextLength;

		// Token: 0x0400315B RID: 12635
		internal char[] linkID;
	}
}
