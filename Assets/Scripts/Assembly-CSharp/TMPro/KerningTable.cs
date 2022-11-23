using System;
using System.Collections.Generic;
using System.Linq;

namespace TMPro
{
	// Token: 0x020005F1 RID: 1521
	[Serializable]
	public class KerningTable
	{
		// Token: 0x06002C10 RID: 11280 RVA: 0x0001FC3C File Offset: 0x0001DE3C
		public KerningTable()
		{
			this.kerningPairs = new List<KerningPair>();
		}

		// Token: 0x06002C11 RID: 11281 RVA: 0x0010DB50 File Offset: 0x0010BD50
		public void AddKerningPair()
		{
			if (this.kerningPairs.Count == 0)
			{
				this.kerningPairs.Add(new KerningPair(0, 0, 0f));
			}
			else
			{
				int ascII_Left = this.kerningPairs.Last<KerningPair>().AscII_Left;
				int ascII_Right = this.kerningPairs.Last<KerningPair>().AscII_Right;
				float xadvanceOffset = this.kerningPairs.Last<KerningPair>().XadvanceOffset;
				this.kerningPairs.Add(new KerningPair(ascII_Left, ascII_Right, xadvanceOffset));
			}
		}

		// Token: 0x06002C12 RID: 11282 RVA: 0x0010DBD0 File Offset: 0x0010BDD0
		public int AddKerningPair(int left, int right, float offset)
		{
			int num = this.kerningPairs.FindIndex((KerningPair item) => item.AscII_Left == left && item.AscII_Right == right);
			if (num == -1)
			{
				this.kerningPairs.Add(new KerningPair(left, right, offset));
				return 0;
			}
			return -1;
		}

		// Token: 0x06002C13 RID: 11283 RVA: 0x0010DC30 File Offset: 0x0010BE30
		public void RemoveKerningPair(int left, int right)
		{
			int num = this.kerningPairs.FindIndex((KerningPair item) => item.AscII_Left == left && item.AscII_Right == right);
			if (num != -1)
			{
				this.kerningPairs.RemoveAt(num);
			}
		}

		// Token: 0x06002C14 RID: 11284 RVA: 0x0001FC4F File Offset: 0x0001DE4F
		public void RemoveKerningPair(int index)
		{
			this.kerningPairs.RemoveAt(index);
		}

		// Token: 0x06002C15 RID: 11285 RVA: 0x0010DC7C File Offset: 0x0010BE7C
		public void SortKerningPairs()
		{
			if (this.kerningPairs.Count > 0)
			{
				this.kerningPairs = (from s in this.kerningPairs
				orderby s.AscII_Left, s.AscII_Right
				select s).ToList<KerningPair>();
			}
		}

		// Token: 0x04003118 RID: 12568
		public List<KerningPair> kerningPairs;
	}
}
