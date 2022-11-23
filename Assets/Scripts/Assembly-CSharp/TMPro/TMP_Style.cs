using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005CB RID: 1483
	[Serializable]
	public class TMP_Style
	{
		// Token: 0x1700047F RID: 1151
		// (get) Token: 0x06002A76 RID: 10870 RVA: 0x0001E80F File Offset: 0x0001CA0F
		// (set) Token: 0x06002A77 RID: 10871 RVA: 0x0001E817 File Offset: 0x0001CA17
		public string name
		{
			get
			{
				return this.m_Name;
			}
			set
			{
				if (value != this.m_Name)
				{
					this.m_Name = value;
				}
			}
		}

		// Token: 0x17000480 RID: 1152
		// (get) Token: 0x06002A78 RID: 10872 RVA: 0x0001E831 File Offset: 0x0001CA31
		// (set) Token: 0x06002A79 RID: 10873 RVA: 0x0001E839 File Offset: 0x0001CA39
		public int hashCode
		{
			get
			{
				return this.m_HashCode;
			}
			set
			{
				if (value != this.m_HashCode)
				{
					this.m_HashCode = value;
				}
			}
		}

		// Token: 0x17000481 RID: 1153
		// (get) Token: 0x06002A7A RID: 10874 RVA: 0x0001E84E File Offset: 0x0001CA4E
		public string styleOpeningDefinition
		{
			get
			{
				return this.m_OpeningDefinition;
			}
		}

		// Token: 0x17000482 RID: 1154
		// (get) Token: 0x06002A7B RID: 10875 RVA: 0x0001E856 File Offset: 0x0001CA56
		public string styleClosingDefinition
		{
			get
			{
				return this.m_ClosingDefinition;
			}
		}

		// Token: 0x17000483 RID: 1155
		// (get) Token: 0x06002A7C RID: 10876 RVA: 0x0001E85E File Offset: 0x0001CA5E
		public int[] styleOpeningTagArray
		{
			get
			{
				return this.m_OpeningTagArray;
			}
		}

		// Token: 0x17000484 RID: 1156
		// (get) Token: 0x06002A7D RID: 10877 RVA: 0x0001E866 File Offset: 0x0001CA66
		public int[] styleClosingTagArray
		{
			get
			{
				return this.m_ClosingTagArray;
			}
		}

		// Token: 0x06002A7E RID: 10878 RVA: 0x00102450 File Offset: 0x00100650
		public void RefreshStyle()
		{
			this.m_HashCode = TMP_TextUtilities.GetSimpleHashCode(this.m_Name);
			this.m_OpeningTagArray = new int[this.m_OpeningDefinition.Length];
			for (int i = 0; i < this.m_OpeningDefinition.Length; i++)
			{
				this.m_OpeningTagArray[i] = (int)this.m_OpeningDefinition[i];
			}
			this.m_ClosingTagArray = new int[this.m_ClosingDefinition.Length];
			for (int j = 0; j < this.m_ClosingDefinition.Length; j++)
			{
				this.m_ClosingTagArray[j] = (int)this.m_ClosingDefinition[j];
			}
		}

		// Token: 0x04002F79 RID: 12153
		[SerializeField]
		private string m_Name;

		// Token: 0x04002F7A RID: 12154
		[SerializeField]
		private int m_HashCode;

		// Token: 0x04002F7B RID: 12155
		[SerializeField]
		private string m_OpeningDefinition;

		// Token: 0x04002F7C RID: 12156
		[SerializeField]
		private string m_ClosingDefinition;

		// Token: 0x04002F7D RID: 12157
		[SerializeField]
		private int[] m_OpeningTagArray;

		// Token: 0x04002F7E RID: 12158
		[SerializeField]
		private int[] m_ClosingTagArray;
	}
}
