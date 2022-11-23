using System;
using UnityEngine;
using UnityEngine.UI;

namespace TMPro
{
	// Token: 0x020005CE RID: 1486
	[ExecuteInEditMode]
	public class TMP_SubMeshUI : MaskableGraphic, ITextElement, IClippable, IMaskable, IMaterialModifier
	{
		// Token: 0x17000491 RID: 1169
		// (get) Token: 0x06002AAB RID: 10923 RVA: 0x0001EA87 File Offset: 0x0001CC87
		// (set) Token: 0x06002AAC RID: 10924 RVA: 0x0001EA8F File Offset: 0x0001CC8F
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

		// Token: 0x17000492 RID: 1170
		// (get) Token: 0x06002AAD RID: 10925 RVA: 0x0001EA98 File Offset: 0x0001CC98
		// (set) Token: 0x06002AAE RID: 10926 RVA: 0x0001EAA0 File Offset: 0x0001CCA0
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

		// Token: 0x17000493 RID: 1171
		// (get) Token: 0x06002AAF RID: 10927 RVA: 0x0001EAA9 File Offset: 0x0001CCA9
		public override Texture mainTexture
		{
			get
			{
				if (this.sharedMaterial != null)
				{
					return this.sharedMaterial.mainTexture;
				}
				return null;
			}
		}

		// Token: 0x17000494 RID: 1172
		// (get) Token: 0x06002AB0 RID: 10928 RVA: 0x0001EAC9 File Offset: 0x0001CCC9
		// (set) Token: 0x06002AB1 RID: 10929 RVA: 0x00102A18 File Offset: 0x00100C18
		public override Material material
		{
			get
			{
				return this.GetMaterial(this.m_sharedMaterial);
			}
			set
			{
				if (this.m_sharedMaterial != null && this.m_sharedMaterial.GetInstanceID() == value.GetInstanceID())
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

		// Token: 0x17000495 RID: 1173
		// (get) Token: 0x06002AB2 RID: 10930 RVA: 0x0001EAD7 File Offset: 0x0001CCD7
		// (set) Token: 0x06002AB3 RID: 10931 RVA: 0x0001EADF File Offset: 0x0001CCDF
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

		// Token: 0x17000496 RID: 1174
		// (get) Token: 0x06002AB4 RID: 10932 RVA: 0x0001EAE8 File Offset: 0x0001CCE8
		// (set) Token: 0x06002AB5 RID: 10933 RVA: 0x00102A78 File Offset: 0x00100C78
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

		// Token: 0x17000497 RID: 1175
		// (get) Token: 0x06002AB6 RID: 10934 RVA: 0x0001EAF0 File Offset: 0x0001CCF0
		// (set) Token: 0x06002AB7 RID: 10935 RVA: 0x0001EAF8 File Offset: 0x0001CCF8
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

		// Token: 0x17000498 RID: 1176
		// (get) Token: 0x06002AB8 RID: 10936 RVA: 0x0001EB01 File Offset: 0x0001CD01
		public override Material materialForRendering
		{
			get
			{
				if (this.m_sharedMaterial == null)
				{
					return null;
				}
				return this.GetModifiedMaterial(this.m_sharedMaterial);
			}
		}

		// Token: 0x17000499 RID: 1177
		// (get) Token: 0x06002AB9 RID: 10937 RVA: 0x0001EB22 File Offset: 0x0001CD22
		// (set) Token: 0x06002ABA RID: 10938 RVA: 0x0001EB2A File Offset: 0x0001CD2A
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

		// Token: 0x1700049A RID: 1178
		// (get) Token: 0x06002ABB RID: 10939 RVA: 0x0001EB33 File Offset: 0x0001CD33
		// (set) Token: 0x06002ABC RID: 10940 RVA: 0x0001EB3B File Offset: 0x0001CD3B
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

		// Token: 0x1700049B RID: 1179
		// (get) Token: 0x06002ABD RID: 10941 RVA: 0x0001EB44 File Offset: 0x0001CD44
		public new CanvasRenderer canvasRenderer
		{
			get
			{
				if (this.m_canvasRenderer == null)
				{
					this.m_canvasRenderer = base.GetComponent<CanvasRenderer>();
				}
				return this.m_canvasRenderer;
			}
		}

		// Token: 0x1700049C RID: 1180
		// (get) Token: 0x06002ABE RID: 10942 RVA: 0x0001EB69 File Offset: 0x0001CD69
		// (set) Token: 0x06002ABF RID: 10943 RVA: 0x0001EB9A File Offset: 0x0001CD9A
		public Mesh mesh
		{
			get
			{
				if (this.m_mesh == null)
				{
					this.m_mesh = new Mesh();
					this.m_mesh.hideFlags = HideFlags.HideAndDontSave;
				}
				return this.m_mesh;
			}
			set
			{
				this.m_mesh = value;
			}
		}

		// Token: 0x06002AC0 RID: 10944 RVA: 0x00102AE4 File Offset: 0x00100CE4
		public static TMP_SubMeshUI AddSubTextObject(TextMeshProUGUI textComponent, MaterialReference materialReference)
		{
			GameObject gameObject = new GameObject("TMP UI SubObject [" + materialReference.material.name + "]");
			gameObject.transform.SetParent(textComponent.transform, false);
			gameObject.layer = textComponent.gameObject.layer;
			RectTransform rectTransform = gameObject.AddComponent<RectTransform>();
			rectTransform.anchorMin = Vector2.zero;
			rectTransform.anchorMax = Vector2.one;
			rectTransform.sizeDelta = Vector2.zero;
			rectTransform.pivot = textComponent.rectTransform.pivot;
			TMP_SubMeshUI tmp_SubMeshUI = gameObject.AddComponent<TMP_SubMeshUI>();
			tmp_SubMeshUI.m_canvasRenderer = tmp_SubMeshUI.canvasRenderer;
			tmp_SubMeshUI.m_TextComponent = textComponent;
			tmp_SubMeshUI.m_materialReferenceIndex = materialReference.index;
			tmp_SubMeshUI.m_fontAsset = materialReference.fontAsset;
			tmp_SubMeshUI.m_spriteAsset = materialReference.spriteAsset;
			tmp_SubMeshUI.m_isDefaultMaterial = materialReference.isDefaultMaterial;
			tmp_SubMeshUI.SetSharedMaterial(materialReference.material);
			return tmp_SubMeshUI;
		}

		// Token: 0x06002AC1 RID: 10945 RVA: 0x0001EBA3 File Offset: 0x0001CDA3
		protected override void OnEnable()
		{
			if (!this.m_isRegisteredForEvents)
			{
				this.m_isRegisteredForEvents = true;
			}
			this.m_ShouldRecalculateStencil = true;
			this.RecalculateClipping();
			this.RecalculateMasking();
		}

		// Token: 0x06002AC2 RID: 10946 RVA: 0x00102BCC File Offset: 0x00100DCC
		protected override void OnDisable()
		{
			TMP_UpdateRegistry.UnRegisterCanvasElementForRebuild(this);
			if (this.m_MaskMaterial != null)
			{
				TMP_MaterialManager.ReleaseStencilMaterial(this.m_MaskMaterial);
				this.m_MaskMaterial = null;
			}
			if (this.m_fallbackMaterial != null)
			{
				TMP_MaterialManager.ReleaseFallbackMaterial(this.m_fallbackMaterial);
				this.m_fallbackMaterial = null;
			}
			base.OnDisable();
		}

		// Token: 0x06002AC3 RID: 10947 RVA: 0x00102C2C File Offset: 0x00100E2C
		protected override void OnDestroy()
		{
			if (this.m_mesh != null)
			{
				UnityEngine.Object.DestroyImmediate(this.m_mesh);
			}
			if (this.m_MaskMaterial != null)
			{
				TMP_MaterialManager.ReleaseStencilMaterial(this.m_MaskMaterial);
			}
			if (this.m_fallbackMaterial != null)
			{
				TMP_MaterialManager.ReleaseFallbackMaterial(this.m_fallbackMaterial);
				this.m_fallbackMaterial = null;
			}
			this.m_isRegisteredForEvents = false;
			this.RecalculateClipping();
		}

		// Token: 0x06002AC4 RID: 10948 RVA: 0x0001EBCA File Offset: 0x0001CDCA
		protected override void OnTransformParentChanged()
		{
			if (!this.IsActive())
			{
				return;
			}
			this.m_ShouldRecalculateStencil = true;
			this.RecalculateClipping();
			this.RecalculateMasking();
		}

		// Token: 0x06002AC5 RID: 10949 RVA: 0x00102CA4 File Offset: 0x00100EA4
		public override Material GetModifiedMaterial(Material baseMaterial)
		{
			Material material = baseMaterial;
			if (this.m_ShouldRecalculateStencil)
			{
				this.m_StencilValue = TMP_MaterialManager.GetStencilID(base.gameObject);
				this.m_ShouldRecalculateStencil = false;
			}
			if (this.m_StencilValue > 0)
			{
				material = TMP_MaterialManager.GetStencilMaterial(baseMaterial, this.m_StencilValue);
				if (this.m_MaskMaterial != null)
				{
					TMP_MaterialManager.ReleaseStencilMaterial(this.m_MaskMaterial);
				}
				this.m_MaskMaterial = material;
			}
			return material;
		}

		// Token: 0x06002AC6 RID: 10950 RVA: 0x00102D14 File Offset: 0x00100F14
		public float GetPaddingForMaterial()
		{
			return ShaderUtilities.GetPadding(this.m_sharedMaterial, this.m_TextComponent.extraPadding, this.m_TextComponent.isUsingBold);
		}

		// Token: 0x06002AC7 RID: 10951 RVA: 0x00102D44 File Offset: 0x00100F44
		public float GetPaddingForMaterial(Material mat)
		{
			return ShaderUtilities.GetPadding(mat, this.m_TextComponent.extraPadding, this.m_TextComponent.isUsingBold);
		}

		// Token: 0x06002AC8 RID: 10952 RVA: 0x0001EBEB File Offset: 0x0001CDEB
		public void UpdateMeshPadding(bool isExtraPadding, bool isUsingBold)
		{
			this.m_padding = ShaderUtilities.GetPadding(this.m_sharedMaterial, isExtraPadding, isUsingBold);
		}

		// Token: 0x06002AC9 RID: 10953 RVA: 0x00002482 File Offset: 0x00000682
		public override void SetAllDirty()
		{
		}

		// Token: 0x06002ACA RID: 10954 RVA: 0x0001EC00 File Offset: 0x0001CE00
		public override void SetVerticesDirty()
		{
			if (!this.IsActive())
			{
				return;
			}
			if (this.m_TextComponent != null)
			{
				this.m_TextComponent.havePropertiesChanged = true;
				this.m_TextComponent.SetVerticesDirty();
			}
		}

		// Token: 0x06002ACB RID: 10955 RVA: 0x00002482 File Offset: 0x00000682
		public override void SetLayoutDirty()
		{
		}

		// Token: 0x06002ACC RID: 10956 RVA: 0x0001EC36 File Offset: 0x0001CE36
		public override void SetMaterialDirty()
		{
			this.m_materialDirty = true;
			this.UpdateMaterial();
		}

		// Token: 0x06002ACD RID: 10957 RVA: 0x0001EC45 File Offset: 0x0001CE45
		public void SetPivotDirty()
		{
			if (!this.IsActive())
			{
				return;
			}
			base.rectTransform.pivot = this.m_TextComponent.rectTransform.pivot;
		}

		// Token: 0x06002ACE RID: 10958 RVA: 0x00002482 File Offset: 0x00000682
		protected override void UpdateGeometry()
		{
		}

		// Token: 0x06002ACF RID: 10959 RVA: 0x0001EC6E File Offset: 0x0001CE6E
		public override void Rebuild(CanvasUpdate update)
		{
			if (update == CanvasUpdate.PreRender)
			{
				if (!this.m_materialDirty)
				{
					return;
				}
				this.UpdateMaterial();
				this.m_materialDirty = false;
			}
		}

		// Token: 0x06002AD0 RID: 10960 RVA: 0x0001D367 File Offset: 0x0001B567
		public void RefreshMaterial()
		{
			this.UpdateMaterial();
		}

		// Token: 0x06002AD1 RID: 10961 RVA: 0x00102D70 File Offset: 0x00100F70
		protected override void UpdateMaterial()
		{
			if (this.m_canvasRenderer == null)
			{
				this.m_canvasRenderer = this.canvasRenderer;
			}
			this.m_canvasRenderer.materialCount = 1;
			this.m_canvasRenderer.SetMaterial(this.materialForRendering, 0);
			this.m_canvasRenderer.SetTexture(this.mainTexture);
		}

		// Token: 0x06002AD2 RID: 10962 RVA: 0x0001D671 File Offset: 0x0001B871
		public override void RecalculateClipping()
		{
			base.RecalculateClipping();
		}

		// Token: 0x06002AD3 RID: 10963 RVA: 0x0001D679 File Offset: 0x0001B879
		public override void RecalculateMasking()
		{
			this.m_ShouldRecalculateStencil = true;
			this.SetMaterialDirty();
		}

		// Token: 0x06002AD4 RID: 10964 RVA: 0x0001EAD7 File Offset: 0x0001CCD7
		private Material GetMaterial()
		{
			return this.m_sharedMaterial;
		}

		// Token: 0x06002AD5 RID: 10965 RVA: 0x00102DCC File Offset: 0x00100FCC
		private Material GetMaterial(Material mat)
		{
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

		// Token: 0x06002AD6 RID: 10966 RVA: 0x001029B0 File Offset: 0x00100BB0
		private Material CreateMaterialInstance(Material source)
		{
			Material material = new Material(source);
			material.shaderKeywords = source.shaderKeywords;
			Material material2 = material;
			material2.name += " (Instance)";
			return material;
		}

		// Token: 0x06002AD7 RID: 10967 RVA: 0x0001EC90 File Offset: 0x0001CE90
		private Material GetSharedMaterial()
		{
			if (this.m_canvasRenderer == null)
			{
				this.m_canvasRenderer = base.GetComponent<CanvasRenderer>();
			}
			return this.m_canvasRenderer.GetMaterial();
		}

		// Token: 0x06002AD8 RID: 10968 RVA: 0x0001ECBA File Offset: 0x0001CEBA
		private void SetSharedMaterial(Material mat)
		{
			this.m_sharedMaterial = mat;
			this.m_Material = this.m_sharedMaterial;
			this.m_padding = this.GetPaddingForMaterial();
			this.SetMaterialDirty();
		}

		// Token: 0x06002AD9 RID: 10969 RVA: 0x0001ECE1 File Offset: 0x0001CEE1
		int ITextElement.GetInstanceID()
		{
			return base.GetInstanceID();
		}

		// Token: 0x04002F8F RID: 12175
		[SerializeField]
		private TMP_FontAsset m_fontAsset;

		// Token: 0x04002F90 RID: 12176
		[SerializeField]
		private TMP_SpriteAsset m_spriteAsset;

		// Token: 0x04002F91 RID: 12177
		[SerializeField]
		private Material m_material;

		// Token: 0x04002F92 RID: 12178
		[SerializeField]
		private Material m_sharedMaterial;

		// Token: 0x04002F93 RID: 12179
		private Material m_fallbackMaterial;

		// Token: 0x04002F94 RID: 12180
		private Material m_fallbackSourceMaterial;

		// Token: 0x04002F95 RID: 12181
		[SerializeField]
		private bool m_isDefaultMaterial;

		// Token: 0x04002F96 RID: 12182
		[SerializeField]
		private float m_padding;

		// Token: 0x04002F97 RID: 12183
		[SerializeField]
		private CanvasRenderer m_canvasRenderer;

		// Token: 0x04002F98 RID: 12184
		private Mesh m_mesh;

		// Token: 0x04002F99 RID: 12185
		[SerializeField]
		private TextMeshProUGUI m_TextComponent;

		// Token: 0x04002F9A RID: 12186
		[NonSerialized]
		private bool m_isRegisteredForEvents;

		// Token: 0x04002F9B RID: 12187
		private bool m_materialDirty;

		// Token: 0x04002F9C RID: 12188
		[SerializeField]
		private int m_materialReferenceIndex;
	}
}
