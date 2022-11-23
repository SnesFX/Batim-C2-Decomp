using System;

namespace TMPro
{
	// Token: 0x020005E5 RID: 1509
	public struct TMP_XmlTagStack<T>
	{
		// Token: 0x06002BE8 RID: 11240 RVA: 0x0001F9E3 File Offset: 0x0001DBE3
		public TMP_XmlTagStack(T[] tagStack)
		{
			this.itemStack = tagStack;
			this.index = 0;
		}

		// Token: 0x06002BE9 RID: 11241 RVA: 0x0001F9F3 File Offset: 0x0001DBF3
		public void Clear()
		{
			this.index = 0;
		}

		// Token: 0x06002BEA RID: 11242 RVA: 0x0001F9FC File Offset: 0x0001DBFC
		public void SetDefault(T item)
		{
			this.itemStack[0] = item;
			this.index = 1;
		}

		// Token: 0x06002BEB RID: 11243 RVA: 0x0001FA12 File Offset: 0x0001DC12
		public void Add(T item)
		{
			if (this.index < this.itemStack.Length)
			{
				this.itemStack[this.index] = item;
				this.index++;
			}
		}

		// Token: 0x06002BEC RID: 11244 RVA: 0x0010D660 File Offset: 0x0010B860
		public T Remove()
		{
			this.index--;
			if (this.index <= 0)
			{
				this.index = 0;
				return this.itemStack[0];
			}
			return this.itemStack[this.index - 1];
		}

		// Token: 0x06002BED RID: 11245 RVA: 0x0001FA47 File Offset: 0x0001DC47
		public T CurrentItem()
		{
			if (this.index > 0)
			{
				return this.itemStack[this.index - 1];
			}
			return this.itemStack[0];
		}

		// Token: 0x06002BEE RID: 11246 RVA: 0x0001FA75 File Offset: 0x0001DC75
		public T PreviousItem()
		{
			if (this.index > 1)
			{
				return this.itemStack[this.index - 2];
			}
			return this.itemStack[0];
		}

		// Token: 0x040030D3 RID: 12499
		public T[] itemStack;

		// Token: 0x040030D4 RID: 12500
		public int index;
	}
}
