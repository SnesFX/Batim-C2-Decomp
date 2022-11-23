using System;
using System.Collections.Generic;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005CA RID: 1482
	public class TMP_SpriteAsset : TMP_Asset
	{
		// Token: 0x1700047E RID: 1150
		// (get) Token: 0x06002A71 RID: 10865 RVA: 0x0001E7E9 File Offset: 0x0001C9E9
		public static TMP_SpriteAsset defaultSpriteAsset
		{
			get
			{
				if (TMP_SpriteAsset.m_defaultSpriteAsset == null)
				{
					TMP_SpriteAsset.m_defaultSpriteAsset = Resources.Load<TMP_SpriteAsset>("Sprite Assets/Default Sprite Asset");
				}
				return TMP_SpriteAsset.m_defaultSpriteAsset;
			}
		}

		// Token: 0x06002A72 RID: 10866 RVA: 0x00002482 File Offset: 0x00000682
		private void OnEnable()
		{
		}

		// Token: 0x06002A73 RID: 10867 RVA: 0x001023CC File Offset: 0x001005CC
		private Material GetDefaultSpriteMaterial()
		{
			ShaderUtilities.GetShaderPropertyIDs();
			Shader shader = Shader.Find("TextMeshPro/Sprite");
			Material material = new Material(shader);
			material.SetTexture(ShaderUtilities.ID_MainTex, this.spriteSheet);
			material.hideFlags = HideFlags.HideInHierarchy;
			return material;
		}

		// Token: 0x06002A74 RID: 10868 RVA: 0x0010240C File Offset: 0x0010060C
		public int GetSpriteIndex(int hashCode)
		{
			for (int i = 0; i < this.spriteInfoList.Count; i++)
			{
				if (this.spriteInfoList[i].hashCode == hashCode)
				{
					return i;
				}
			}
			return -1;
		}

		// Token: 0x04002F75 RID: 12149
		public static TMP_SpriteAsset m_defaultSpriteAsset;

		// Token: 0x04002F76 RID: 12150
		public Texture spriteSheet;

		// Token: 0x04002F77 RID: 12151
		public List<TMP_Sprite> spriteInfoList;

		// Token: 0x04002F78 RID: 12152
		private List<Sprite> m_sprites;
	}
}
