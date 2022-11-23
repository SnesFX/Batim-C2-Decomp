using System;
using System.Collections.Generic;
using UnityEngine;

namespace ProCore.Decals
{
	// Token: 0x02000178 RID: 376
	[Serializable]
	public class DecalGroup
	{
		// Token: 0x0600063D RID: 1597 RVA: 0x0003A6C4 File Offset: 0x00038AC4
		public DecalGroup(string name, List<Decal> decals, bool isPacked, Shader shader, Material material, int maxAtlasSize, int padding)
		{
			this.name = name;
			this.decals = decals;
			this.shader = shader;
			this.isPacked = isPacked;
			this.material = material;
			this.maxAtlasSize = maxAtlasSize;
			this.padding = padding;
		}

		// Token: 0x0600063E RID: 1598 RVA: 0x0003A704 File Offset: 0x00038B04
		public bool ContainsTexture(Texture2D tex)
		{
			foreach (Decal decal in this.decals)
			{
				if (decal.texture == tex)
				{
					return true;
				}
			}
			return false;
		}

		// Token: 0x0400051F RID: 1311
		public const int MAX_ATLAS_SIZE_DEFAULT = 4096;

		// Token: 0x04000520 RID: 1312
		public const int ATLAS_PADDING_DEFAULT = 4;

		// Token: 0x04000521 RID: 1313
		public List<Decal> decals;

		// Token: 0x04000522 RID: 1314
		public string name;

		// Token: 0x04000523 RID: 1315
		public Shader shader;

		// Token: 0x04000524 RID: 1316
		public bool isPacked;

		// Token: 0x04000525 RID: 1317
		public Material material;

		// Token: 0x04000526 RID: 1318
		public int maxAtlasSize;

		// Token: 0x04000527 RID: 1319
		public int padding;
	}
}
