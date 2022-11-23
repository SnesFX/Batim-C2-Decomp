using System;
using System.Collections.Generic;
using UnityEngine;

namespace TMPro
{
	// Token: 0x02000592 RID: 1426
	public struct MaterialReference
	{
		// Token: 0x06002825 RID: 10277 RVA: 0x000E90B0 File Offset: 0x000E72B0
		public MaterialReference(int index, TMP_FontAsset fontAsset, TMP_SpriteAsset spriteAsset, Material material, float padding)
		{
			this.index = index;
			this.fontAsset = fontAsset;
			this.spriteAsset = spriteAsset;
			this.material = material;
			this.isDefaultMaterial = (material.GetInstanceID() == fontAsset.material.GetInstanceID());
			this.isFallbackMaterial = false;
			this.fallbackMaterial = null;
			this.padding = padding;
			this.referenceCount = 0;
		}

		// Token: 0x06002826 RID: 10278 RVA: 0x000E911C File Offset: 0x000E731C
		public static bool Contains(MaterialReference[] materialReferences, TMP_FontAsset fontAsset)
		{
			int instanceID = fontAsset.GetInstanceID();
			int num = 0;
			while (num < materialReferences.Length && materialReferences[num].fontAsset != null)
			{
				if (materialReferences[num].fontAsset.GetInstanceID() == instanceID)
				{
					return true;
				}
				num++;
			}
			return false;
		}

		// Token: 0x06002827 RID: 10279 RVA: 0x000E9178 File Offset: 0x000E7378
		public static int AddMaterialReference(Material material, TMP_FontAsset fontAsset, MaterialReference[] materialReferences, Dictionary<int, int> materialReferenceIndexLookup)
		{
			int instanceID = material.GetInstanceID();
			int num = 0;
			if (materialReferenceIndexLookup.TryGetValue(instanceID, out num))
			{
				return num;
			}
			num = materialReferenceIndexLookup.Count;
			materialReferenceIndexLookup[instanceID] = num;
			materialReferences[num].index = num;
			materialReferences[num].fontAsset = fontAsset;
			materialReferences[num].spriteAsset = null;
			materialReferences[num].material = material;
			materialReferences[num].isDefaultMaterial = (instanceID == fontAsset.material.GetInstanceID());
			materialReferences[num].referenceCount = 0;
			return num;
		}

		// Token: 0x06002828 RID: 10280 RVA: 0x000E9214 File Offset: 0x000E7414
		public static int AddMaterialReference(Material material, TMP_SpriteAsset spriteAsset, MaterialReference[] materialReferences, Dictionary<int, int> materialReferenceIndexLookup)
		{
			int instanceID = material.GetInstanceID();
			int num = 0;
			if (materialReferenceIndexLookup.TryGetValue(instanceID, out num))
			{
				return num;
			}
			num = materialReferenceIndexLookup.Count;
			materialReferenceIndexLookup[instanceID] = num;
			materialReferences[num].index = num;
			materialReferences[num].fontAsset = materialReferences[0].fontAsset;
			materialReferences[num].spriteAsset = spriteAsset;
			materialReferences[num].material = material;
			materialReferences[num].isDefaultMaterial = true;
			materialReferences[num].referenceCount = 0;
			return num;
		}

		// Token: 0x04002E00 RID: 11776
		public int index;

		// Token: 0x04002E01 RID: 11777
		public TMP_FontAsset fontAsset;

		// Token: 0x04002E02 RID: 11778
		public TMP_SpriteAsset spriteAsset;

		// Token: 0x04002E03 RID: 11779
		public Material material;

		// Token: 0x04002E04 RID: 11780
		public bool isDefaultMaterial;

		// Token: 0x04002E05 RID: 11781
		public bool isFallbackMaterial;

		// Token: 0x04002E06 RID: 11782
		public Material fallbackMaterial;

		// Token: 0x04002E07 RID: 11783
		public float padding;

		// Token: 0x04002E08 RID: 11784
		public int referenceCount;
	}
}
