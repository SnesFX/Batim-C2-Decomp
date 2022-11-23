using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005CD RID: 1485
	[ExecuteInEditMode]
	[RequireComponent(typeof(MeshRenderer))]
	[RequireComponent(typeof(MeshFilter))]
	public class TMP_SubMesh : MonoBehaviour
	{
		// Token: 0x17000486 RID: 1158
		// (get) Token: 0x06002A88 RID: 10888 RVA: 0x0001E8AD File Offset: 0x0001CAAD
		// (set) Token: 0x06002A89 RID: 10889 RVA: 0x0001E8B5 File Offset: 0x0001CAB5
		public TMP_FontAsset fontAsset
		{
			get
			{
				return this.m_fontAsset;
			}
			set
			{
				this.m_fontAsset = value;
			}
		}

		// Token: 0x17000487 RID: 1159
		// (get) Token: 0x06002A8A RID: 10890 RVA: 0x0001E8BE File Offset: 0x0001CABE
		// (set) Token: 0x06002A8B RID: 10891 RVA: 0x0001E8C6 File Offset: 0x0001CAC6
		public TMP_SpriteAsset spriteAsset
		{
			get
			{
				return this.m_spriteAsset;
			}
			set
			{
				this.m_spriteAsset = value;
			}
		}

		// Token: 0x17000488 RID: 1160
		// (get) Token: 0x06002A8C RID: 10892 RVA: 0x0001E8CF File Offset: 0x0001CACF
		// (set) Token: 0x06002A8D RID: 10893 RVA: 0x00102664 File Offset: 0x00100864
		public Material material
		{
			get
			{
				return this.GetMaterial(this.m_sharedMaterial);
			}
			set
			{
				if (this.m_sharedMaterial.GetInstanceID() == value.GetInstanceID())
				{
					return;
				}
				this.m_material = value;
				this.m_sharedMaterial = value;
				this.m_padding = this.GetPaddingForMaterial();
				this.SetVerticesDirty();
				this.SetMaterialDirty();
			}
		}

		// Token: 0x17000489 RID: 1161
		// (get) Token: 0x06002A8E RID: 10894 RVA: 0x0001E8DD File Offset: 0x0001CADD
		// (set) Token: 0x06002A8F RID: 10895 RVA: 0x0001E8E5 File Offset: 0x0001CAE5
		public Material sharedMaterial
		{
			get
			{
				return this.m_sharedMaterial;
			}
			set
			{
				this.SetSharedMaterial(value);
			}
		}

		// Token: 0x1700048A RID: 1162
		// (get) Token: 0x06002A90 RID: 10896 RVA: 0x0001E8EE File Offset: 0x0001CAEE
		// (set) Token: 0x06002A91 RID: 10897 RVA: 0x001026B0 File Offset: 0x001008B0
		public Material fallbackMaterial
		{
			get
			{
				return this.m_fallbackMaterial;
			}
			set
			{
				if (this.m_fallbackMaterial == value)
				{
					return;
				}
				if (this.m_fallbackMaterial != null && this.m_fallbackMaterial != value)
				{
					TMP_MaterialManager.ReleaseFallbackMaterial(this.m_fallbackMaterial);
				}
				this.m_fallbackMaterial = value;
				TMP_MaterialManager.AddFallbackMaterialReference(this.m_fallbackMaterial);
				this.SetSharedMaterial(this.m_fallbackMaterial);
			}
		}

		// Token: 0x1700048B RID: 1163
		// (get) Token: 0x06002A92 RID: 10898 RVA: 0x0001E8F6 File Offset: 0x0001CAF6
		// (set) Token: 0x06002A93 RID: 10899 RVA: 0x0001E8FE File Offset: 0x0001CAFE
		public Material fallbackSourceMaterial
		{
			get
			{
				return this.m_fallbackSourceMaterial;
			}
			set
			{
				this.m_fallbackSourceMaterial = value;
			}
		}

		// Token: 0x1700048C RID: 1164
		// (get) Token: 0x06002A94 RID: 10900 RVA: 0x0001E907 File Offset: 0x0001CB07
		// (set) Token: 0x06002A95 RID: 10901 RVA: 0x0001E90F File Offset: 0x0001CB0F
		public bool isDefaultMaterial
		{
			get
			{
				return this.m_isDefaultMaterial;
			}
			set
			{
				this.m_isDefaultMaterial = value;
			}
		}

		// Token: 0x1700048D RID: 1165
		// (get) Token: 0x06002A96 RID: 10902 RVA: 0x0001E918 File Offset: 0x0001CB18
		// (set) Token: 0x06002A97 RID: 10903 RVA: 0x0001E920 File Offset: 0x0001CB20
		public float padding
		{
			get
			{
				return this.m_padding;
			}
			set
			{
				this.m_padding = value;
			}
		}

		// Token: 0x1700048E RID: 1166
		// (get) Token: 0x06002A98 RID: 10904 RVA: 0x0001E929 File Offset: 0x0001CB29
		public Renderer Renderer
		{
			get
			{
				if (this.m_renderer == null)
				{
					this.m_renderer = base.GetComponent<Renderer>();
				}
				return this.m_renderer;
			}
		}

		// Token: 0x1700048F RID: 1167
		// (get) Token: 0x06002A99 RID: 10905 RVA: 0x0001E94E File Offset: 0x0001CB4E
		public MeshFilter meshFilter
		{
			get
			{
				if (this.m_meshFilter == null)
				{
					this.m_meshFilter = base.GetComponent<MeshFilter>();
				}
				return this.m_meshFilter;
			}
		}

		// Token: 0x17000490 RID: 1168
		// (get) Token: 0x06002A9A RID: 10906 RVA: 0x0010271C File Offset: 0x0010091C
		// (set) Token: 0x06002A9B RID: 10907 RVA: 0x0001E973 File Offset: 0x0001CB73
		public Mesh mesh
		{
			get
			{
				if (this.m_mesh == null)
				{
					this.m_mesh = new Mesh();
					this.m_mesh.hideFlags = HideFlags.HideAndDontSave;
					this.meshFilter.mesh = this.m_mesh;
				}
				return this.m_mesh;
			}
			set
			{
				this.m_mesh = value;
			}
		}

		// Token: 0x06002A9C RID: 10908 RVA: 0x0010276C File Offset: 0x0010096C
		private void OnEnable()
		{
			if (!this.m_isRegisteredForEvents)
			{
				this.m_isRegisteredForEvents = true;
			}
			this.meshFilter.sharedMesh = this.mesh;
			if (this.m_sharedMaterial != null)
			{
				this.m_sharedMaterial.SetVector(ShaderUtilities.ID_ClipRect, new Vector4(-10000f, -10000f, 10000f, 10000f));
			}
		}

		// Token: 0x06002A9D RID: 10909 RVA: 0x0001E97C File Offset: 0x0001CB7C
		private void OnDisable()
		{
			this.m_meshFilter.sharedMesh = null;
			if (this.m_fallbackMaterial != null)
			{
				TMP_MaterialManager.ReleaseFallbackMaterial(this.m_fallbackMaterial);
				this.m_fallbackMaterial = null;
			}
		}

		// Token: 0x06002A9E RID: 10910 RVA: 0x001027D8 File Offset: 0x001009D8
		private void OnDestroy()
		{
			if (this.m_mesh != null)
			{
				UnityEngine.Object.DestroyImmediate(this.m_mesh);
			}
			if (this.m_fallbackMaterial != null)
			{
				TMP_MaterialManager.ReleaseFallbackMaterial(this.m_fallbackMaterial);
				this.m_fallbackMaterial = null;
			}
			this.m_isRegisteredForEvents = false;
		}

		// Token: 0x06002A9F RID: 10911 RVA: 0x0010282C File Offset: 0x00100A2C
		public static TMP_SubMesh AddSubTextObject(TextMeshPro textComponent, MaterialReference materialReference)
		{
			GameObject gameObject = new GameObject("TMP SubMesh [" + materialReference.material.name + "]");
			TMP_SubMesh tmp_SubMesh = gameObject.AddComponent<TMP_SubMesh>();
			gameObject.transform.SetParent(textComponent.transform, false);
			gameObject.transform.localPosition = Vector3.zero;
			gameObject.transform.localRotation = Quaternion.identity;
			gameObject.transform.localScale = Vector3.one;
			gameObject.layer = textComponent.gameObject.layer;
			tmp_SubMesh.m_meshFilter = gameObject.GetComponent<MeshFilter>();
			tmp_SubMesh.m_TextComponent = textComponent;
			tmp_SubMesh.m_fontAsset = materialReference.fontAsset;
			tmp_SubMesh.m_spriteAsset = materialReference.spriteAsset;
			tmp_SubMesh.m_isDefaultMaterial = materialReference.isDefaultMaterial;
			tmp_SubMesh.SetSharedMaterial(materialReference.material);
			tmp_SubMesh.Renderer.sortingLayerID = textComponent.Renderer.sortingLayerID;
			tmp_SubMesh.Renderer.sortingOrder = textComponent.Renderer.sortingOrder;
			return tmp_SubMesh;
		}

		// Token: 0x06002AA0 RID: 10912 RVA: 0x0001E9AD File Offset: 0x0001CBAD
		public void DestroySelf()
		{
			UnityEngine.Object.Destroy(base.gameObject, 1f);
		}

		// Token: 0x06002AA1 RID: 10913 RVA: 0x00102928 File Offset: 0x00100B28
		private Material GetMaterial(Material mat)
		{
			if (this.m_renderer == null)
			{
				this.m_renderer = base.GetComponent<Renderer>();
			}
			if (this.m_material == null || this.m_material.GetInstanceID() != mat.GetInstanceID())
			{
				this.m_material = this.CreateMaterialInstance(mat);
			}
			this.m_sharedMaterial = this.m_material;
			this.m_padding = this.GetPaddingForMaterial();
			this.SetVerticesDirty();
			this.SetMaterialDirty();
			return this.m_sharedMaterial;
		}

		// Token: 0x06002AA2 RID: 10914 RVA: 0x001029B0 File Offset: 0x00100BB0
		private Material CreateMaterialInstance(Material source)
		{
			Material material = new Material(source);
			material.shaderKeywords = source.shaderKeywords;
			Material material2 = material;
			material2.name += " (Instance)";
			return material;
		}

		// Token: 0x06002AA3 RID: 10915 RVA: 0x0001E9BF File Offset: 0x0001CBBF
		private Material GetSharedMaterial()
		{
			if (this.m_renderer == null)
			{
				this.m_renderer = base.GetComponent<Renderer>();
			}
			return this.m_renderer.sharedMaterial;
		}

		// Token: 0x06002AA4 RID: 10916 RVA: 0x0001E9E9 File Offset: 0x0001CBE9
		private void SetSharedMaterial(Material mat)
		{
			this.m_sharedMaterial = mat;
			this.m_padding = this.GetPaddingForMaterial();
			this.SetMaterialDirty();
		}

		// Token: 0x06002AA5 RID: 10917 RVA: 0x001029E8 File Offset: 0x00100BE8
		public float GetPaddingForMaterial()
		{
			return ShaderUtilities.GetPadding(this.m_sharedMaterial, this.m_TextComponent.extraPadding, this.m_TextComponent.isUsingBold);
		}

		// Token: 0x06002AA6 RID: 10918 RVA: 0x0001EA04 File Offset: 0x0001CC04
		public void UpdateMeshPadding(bool isExtraPadding, bool isUsingBold)
		{
			this.m_padding = ShaderUtilities.GetPadding(this.m_sharedMaterial, isExtraPadding, isUsingBold);
		}

		// Token: 0x06002AA7 RID: 10919 RVA: 0x0001EA19 File Offset: 0x0001CC19
		public void SetVerticesDirty()
		{
			if (!base.enabled)
			{
				return;
			}
			if (this.m_TextComponent != null)
			{
				this.m_TextComponent.havePropertiesChanged = true;
				this.m_TextComponent.SetVerticesDirty();
			}
		}

		// Token: 0x06002AA8 RID: 10920 RVA: 0x0001EA4F File Offset: 0x0001CC4F
		public void SetMaterialDirty()
		{
			this.UpdateMaterial();
		}

		// Token: 0x06002AA9 RID: 10921 RVA: 0x0001EA57 File Offset: 0x0001CC57
		protected void UpdateMaterial()
		{
			if (this.m_renderer == null)
			{
				this.m_renderer = this.Renderer;
			}
			this.m_renderer.sharedMaterial = this.m_sharedMaterial;
		}

		// Token: 0x04002F82 RID: 12162
		[SerializeField]
		private TMP_FontAsset m_fontAsset;

		// Token: 0x04002F83 RID: 12163
		[SerializeField]
		private TMP_SpriteAsset m_spriteAsset;

		// Token: 0x04002F84 RID: 12164
		[SerializeField]
		private Material m_material;

		// Token: 0x04002F85 RID: 12165
		[SerializeField]
		private Material m_sharedMaterial;

		// Token: 0x04002F86 RID: 12166
		private Material m_fallbackMaterial;

		// Token: 0x04002F87 RID: 12167
		private Material m_fallbackSourceMaterial;

		// Token: 0x04002F88 RID: 12168
		[SerializeField]
		private bool m_isDefaultMaterial;

		// Token: 0x04002F89 RID: 12169
		[SerializeField]
		private float m_padding;

		// Token: 0x04002F8A RID: 12170
		[SerializeField]
		private Renderer m_renderer;

		// Token: 0x04002F8B RID: 12171
		[SerializeField]
		private MeshFilter m_meshFilter;

		// Token: 0x04002F8C RID: 12172
		private Mesh m_mesh;

		// Token: 0x04002F8D RID: 12173
		[SerializeField]
		private TextMeshPro m_TextComponent;

		// Token: 0x04002F8E RID: 12174
		[NonSerialized]
		private bool m_isRegisteredForEvents;
	}
}
