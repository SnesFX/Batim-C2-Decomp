using System;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.UI;

namespace TMPro
{
	// Token: 0x02000595 RID: 1429
	[ExecuteInEditMode]
	[DisallowMultipleComponent]
	[RequireComponent(typeof(TextContainer))]
	[RequireComponent(typeof(MeshRenderer))]
	[RequireComponent(typeof(MeshFilter))]
	[AddComponentMenu("Mesh/TextMeshPro - Text")]
	[SelectionBase]
	public class TextMeshPro : TMP_Text, ILayoutElement
	{
		// Token: 0x17000409 RID: 1033
		// (get) Token: 0x0600284D RID: 10317 RVA: 0x0001D157 File Offset: 0x0001B357
		// (set) Token: 0x0600284E RID: 10318 RVA: 0x0001D15F File Offset: 0x0001B35F
		[Obsolete("The length of the line is now controlled by the size of the text container and margins.")]
		public float lineLength
		{
			get
			{
				return this.m_lineLength;
			}
			set
			{
				Debug.Log("lineLength set called.");
			}
		}

		// Token: 0x1700040A RID: 1034
		// (get) Token: 0x0600284F RID: 10319 RVA: 0x0001D16B File Offset: 0x0001B36B
		// (set) Token: 0x06002850 RID: 10320 RVA: 0x0001D173 File Offset: 0x0001B373
		[Obsolete("The length of the line is now controlled by the size of the text container and margins.")]
		public TMP_Compatibility.AnchorPositions anchor
		{
			get
			{
				return this.m_anchor;
			}
			set
			{
				this.m_anchor = value;
			}
		}

		// Token: 0x1700040B RID: 1035
		// (get) Token: 0x06002851 RID: 10321 RVA: 0x0001D17C File Offset: 0x0001B37C
		// (set) Token: 0x06002852 RID: 10322 RVA: 0x0001D184 File Offset: 0x0001B384
		public override Vector4 margin
		{
			get
			{
				return this.m_margin;
			}
			set
			{
				if (this.m_margin == value)
				{
					return;
				}
				this.m_margin = value;
				this.textContainer.margins = this.m_margin;
				this.ComputeMarginSize();
				this.m_havePropertiesChanged = true;
				this.SetVerticesDirty();
			}
		}

		// Token: 0x1700040C RID: 1036
		// (get) Token: 0x06002853 RID: 10323 RVA: 0x0001D1C3 File Offset: 0x0001B3C3
		// (set) Token: 0x06002854 RID: 10324 RVA: 0x0001D1D0 File Offset: 0x0001B3D0
		public int sortingLayerID
		{
			get
			{
				return this.m_renderer.sortingLayerID;
			}
			set
			{
				this.m_renderer.sortingLayerID = value;
			}
		}

		// Token: 0x1700040D RID: 1037
		// (get) Token: 0x06002855 RID: 10325 RVA: 0x0001D1DE File Offset: 0x0001B3DE
		// (set) Token: 0x06002856 RID: 10326 RVA: 0x0001D1EB File Offset: 0x0001B3EB
		public int sortingOrder
		{
			get
			{
				return this.m_renderer.sortingOrder;
			}
			set
			{
				this.m_renderer.sortingOrder = value;
			}
		}

		// Token: 0x1700040E RID: 1038
		// (get) Token: 0x06002857 RID: 10327 RVA: 0x0001D1F9 File Offset: 0x0001B3F9
		// (set) Token: 0x06002858 RID: 10328 RVA: 0x0001D201 File Offset: 0x0001B401
		public override bool autoSizeTextContainer
		{
			get
			{
				return this.m_autoSizeTextContainer;
			}
			set
			{
				if (this.m_autoSizeTextContainer == value)
				{
					return;
				}
				this.m_autoSizeTextContainer = value;
				if (this.m_autoSizeTextContainer)
				{
					TMP_UpdateManager.RegisterTextElementForLayoutRebuild(this);
					this.SetLayoutDirty();
				}
			}
		}

		// Token: 0x1700040F RID: 1039
		// (get) Token: 0x06002859 RID: 10329 RVA: 0x0001D22E File Offset: 0x0001B42E
		public TextContainer textContainer
		{
			get
			{
				if (this.m_textContainer == null)
				{
					this.m_textContainer = base.GetComponent<TextContainer>();
				}
				return this.m_textContainer;
			}
		}

		// Token: 0x17000410 RID: 1040
		// (get) Token: 0x0600285A RID: 10330 RVA: 0x0001D253 File Offset: 0x0001B453
		public new Transform transform
		{
			get
			{
				if (this.m_transform == null)
				{
					this.m_transform = base.GetComponent<Transform>();
				}
				return this.m_transform;
			}
		}

		// Token: 0x17000411 RID: 1041
		// (get) Token: 0x0600285B RID: 10331 RVA: 0x0001D278 File Offset: 0x0001B478
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

		// Token: 0x17000412 RID: 1042
		// (get) Token: 0x0600285C RID: 10332 RVA: 0x000E9A60 File Offset: 0x000E7C60
		public override Mesh mesh
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
		}

		// Token: 0x17000413 RID: 1043
		// (get) Token: 0x0600285D RID: 10333 RVA: 0x0001D29D File Offset: 0x0001B49D
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

		// Token: 0x17000414 RID: 1044
		// (get) Token: 0x0600285E RID: 10334 RVA: 0x0001D2C2 File Offset: 0x0001B4C2
		// (set) Token: 0x0600285F RID: 10335 RVA: 0x0001D2CA File Offset: 0x0001B4CA
		public MaskingTypes maskType
		{
			get
			{
				return this.m_maskType;
			}
			set
			{
				this.m_maskType = value;
				this.SetMask(this.m_maskType);
			}
		}

		// Token: 0x06002860 RID: 10336 RVA: 0x0001D2DF File Offset: 0x0001B4DF
		public void SetMask(MaskingTypes type, Vector4 maskCoords)
		{
			this.SetMask(type);
			this.SetMaskCoordinates(maskCoords);
		}

		// Token: 0x06002861 RID: 10337 RVA: 0x0001D2EF File Offset: 0x0001B4EF
		public void SetMask(MaskingTypes type, Vector4 maskCoords, float softnessX, float softnessY)
		{
			this.SetMask(type);
			this.SetMaskCoordinates(maskCoords, softnessX, softnessY);
		}

		// Token: 0x06002862 RID: 10338 RVA: 0x0001D302 File Offset: 0x0001B502
		public override void SetVerticesDirty()
		{
			if (this.m_verticesAlreadyDirty || this == null || !this.IsActive())
			{
				return;
			}
			TMP_UpdateManager.RegisterTextElementForGraphicRebuild(this);
			this.m_verticesAlreadyDirty = true;
		}

		// Token: 0x06002863 RID: 10339 RVA: 0x0001D334 File Offset: 0x0001B534
		public override void SetLayoutDirty()
		{
			if (this.m_layoutAlreadyDirty || this == null || !this.IsActive())
			{
				return;
			}
			this.m_layoutAlreadyDirty = true;
			this.m_isLayoutDirty = true;
		}

		// Token: 0x06002864 RID: 10340 RVA: 0x0001D367 File Offset: 0x0001B567
		public override void SetMaterialDirty()
		{
			this.UpdateMaterial();
		}

		// Token: 0x06002865 RID: 10341 RVA: 0x0001D36F File Offset: 0x0001B56F
		public override void SetAllDirty()
		{
			this.SetLayoutDirty();
			this.SetVerticesDirty();
			this.SetMaterialDirty();
		}

		// Token: 0x06002866 RID: 10342 RVA: 0x000E9AB0 File Offset: 0x000E7CB0
		public override void Rebuild(CanvasUpdate update)
		{
			if (this == null)
			{
				return;
			}
			if (update == CanvasUpdate.Prelayout)
			{
				if (this.m_autoSizeTextContainer)
				{
					this.CalculateLayoutInputHorizontal();
					if (this.m_textContainer.isDefaultWidth)
					{
						this.m_textContainer.width = this.m_preferredWidth;
					}
					this.CalculateLayoutInputVertical();
					if (this.m_textContainer.isDefaultHeight)
					{
						this.m_textContainer.height = this.m_preferredHeight;
					}
				}
			}
			else if (update == CanvasUpdate.PreRender)
			{
				this.OnPreRenderObject();
				this.m_verticesAlreadyDirty = false;
				this.m_layoutAlreadyDirty = false;
				if (!this.m_isMaterialDirty)
				{
					return;
				}
				this.UpdateMaterial();
				this.m_isMaterialDirty = false;
			}
		}

		// Token: 0x06002867 RID: 10343 RVA: 0x0001D383 File Offset: 0x0001B583
		protected override void UpdateMaterial()
		{
			if (this.m_renderer == null)
			{
				this.m_renderer = this.Renderer;
			}
			this.m_renderer.sharedMaterial = this.m_sharedMaterial;
		}

		// Token: 0x06002868 RID: 10344 RVA: 0x000E9B64 File Offset: 0x000E7D64
		public override void UpdateMeshPadding()
		{
			this.m_padding = ShaderUtilities.GetPadding(this.m_sharedMaterial, this.m_enableExtraPadding, this.m_isUsingBold);
			this.m_isMaskingEnabled = ShaderUtilities.IsMaskingEnabled(this.m_sharedMaterial);
			this.m_havePropertiesChanged = true;
			this.checkPaddingRequired = false;
			for (int i = 1; i < this.m_textInfo.materialCount; i++)
			{
				this.m_subTextObjects[i].UpdateMeshPadding(this.m_enableExtraPadding, this.m_isUsingBold);
			}
		}

		// Token: 0x06002869 RID: 10345 RVA: 0x0001D3B3 File Offset: 0x0001B5B3
		public override void ForceMeshUpdate()
		{
			this.m_havePropertiesChanged = true;
			this.OnPreRenderObject();
		}

		// Token: 0x0600286A RID: 10346 RVA: 0x0001D3C2 File Offset: 0x0001B5C2
		public override void ForceMeshUpdate(bool ignoreInactive)
		{
			this.m_havePropertiesChanged = true;
			this.m_ignoreActiveState = true;
			this.OnPreRenderObject();
		}

		// Token: 0x0600286B RID: 10347 RVA: 0x0001D3D8 File Offset: 0x0001B5D8
		public override TMP_TextInfo GetTextInfo(string text)
		{
			base.StringToCharArray(text, ref this.m_char_buffer);
			this.SetArraySizes(this.m_char_buffer);
			this.m_renderMode = TextRenderFlags.DontRender;
			this.ComputeMarginSize();
			this.GenerateTextMesh();
			this.m_renderMode = TextRenderFlags.Render;
			return base.textInfo;
		}

		// Token: 0x0600286C RID: 10348 RVA: 0x0001D418 File Offset: 0x0001B618
		public override void UpdateGeometry(Mesh mesh, int index)
		{
			mesh.RecalculateBounds();
		}

		// Token: 0x0600286D RID: 10349 RVA: 0x000E9BE4 File Offset: 0x000E7DE4
		public override void UpdateVertexData(TMP_VertexDataUpdateFlags flags)
		{
			int materialCount = this.m_textInfo.materialCount;
			for (int i = 0; i < materialCount; i++)
			{
				Mesh mesh;
				if (i == 0)
				{
					mesh = this.m_mesh;
				}
				else
				{
					mesh = this.m_subTextObjects[i].mesh;
				}
				if ((flags & TMP_VertexDataUpdateFlags.Vertices) == TMP_VertexDataUpdateFlags.Vertices)
				{
					mesh.vertices = this.m_textInfo.meshInfo[i].vertices;
				}
				if ((flags & TMP_VertexDataUpdateFlags.Uv0) == TMP_VertexDataUpdateFlags.Uv0)
				{
					mesh.uv = this.m_textInfo.meshInfo[i].uvs0;
				}
				if ((flags & TMP_VertexDataUpdateFlags.Uv2) == TMP_VertexDataUpdateFlags.Uv2)
				{
					mesh.uv2 = this.m_textInfo.meshInfo[i].uvs2;
				}
				if ((flags & TMP_VertexDataUpdateFlags.Colors32) == TMP_VertexDataUpdateFlags.Colors32)
				{
					mesh.colors32 = this.m_textInfo.meshInfo[i].colors32;
				}
				mesh.RecalculateBounds();
			}
		}

		// Token: 0x0600286E RID: 10350 RVA: 0x000E9CCC File Offset: 0x000E7ECC
		public override void UpdateVertexData()
		{
			int materialCount = this.m_textInfo.materialCount;
			for (int i = 0; i < materialCount; i++)
			{
				Mesh mesh;
				if (i == 0)
				{
					mesh = this.m_mesh;
				}
				else
				{
					mesh = this.m_subTextObjects[i].mesh;
				}
				mesh.vertices = this.m_textInfo.meshInfo[i].vertices;
				mesh.uv = this.m_textInfo.meshInfo[i].uvs0;
				mesh.uv2 = this.m_textInfo.meshInfo[i].uvs2;
				mesh.colors32 = this.m_textInfo.meshInfo[i].colors32;
				mesh.RecalculateBounds();
			}
		}

		// Token: 0x0600286F RID: 10351 RVA: 0x0001D420 File Offset: 0x0001B620
		public void UpdateFontAsset()
		{
			this.LoadFontAsset();
		}

		// Token: 0x06002870 RID: 10352 RVA: 0x000E9D90 File Offset: 0x000E7F90
		public void CalculateLayoutInputHorizontal()
		{
			if (!base.gameObject.activeInHierarchy)
			{
				return;
			}
			this.m_currentAutoSizeMode = this.m_enableAutoSizing;
			if (this.m_isCalculateSizeRequired || this.m_rectTransform.hasChanged)
			{
				this.m_minWidth = 0f;
				this.m_flexibleWidth = 0f;
				if (this.m_enableAutoSizing)
				{
					this.m_fontSize = this.m_fontSizeMax;
				}
				this.m_marginWidth = TMP_Text.k_LargePositiveFloat;
				this.m_marginHeight = TMP_Text.k_LargePositiveFloat;
				if (this.m_isInputParsingRequired || this.m_isTextTruncated)
				{
					base.ParseInputText();
				}
				this.GenerateTextMesh();
				this.m_renderMode = TextRenderFlags.Render;
				this.ComputeMarginSize();
				this.m_isLayoutDirty = true;
			}
		}

		// Token: 0x06002871 RID: 10353 RVA: 0x000E9E54 File Offset: 0x000E8054
		public void CalculateLayoutInputVertical()
		{
			if (!base.gameObject.activeInHierarchy)
			{
				return;
			}
			if (this.m_isCalculateSizeRequired || this.m_rectTransform.hasChanged)
			{
				this.m_minHeight = 0f;
				this.m_flexibleHeight = 0f;
				if (this.m_enableAutoSizing)
				{
					this.m_currentAutoSizeMode = true;
					this.m_enableAutoSizing = false;
				}
				this.m_marginHeight = TMP_Text.k_LargePositiveFloat;
				this.GenerateTextMesh();
				this.m_enableAutoSizing = this.m_currentAutoSizeMode;
				this.m_renderMode = TextRenderFlags.Render;
				this.ComputeMarginSize();
				this.m_isLayoutDirty = true;
			}
			this.m_isCalculateSizeRequired = false;
		}

		// Token: 0x06002872 RID: 10354 RVA: 0x000E9EF8 File Offset: 0x000E80F8
		protected override void Awake()
		{
			if (this.m_fontColor == Color.white && this.m_fontColor32 != Color.white)
			{
				Debug.LogWarning("Converting Vertex Colors from Color32 to Color.", this);
				this.m_fontColor = this.m_fontColor32;
			}
			this.m_textContainer = base.GetComponent<TextContainer>();
			if (this.m_textContainer == null)
			{
				this.m_textContainer = base.gameObject.AddComponent<TextContainer>();
			}
			this.m_renderer = base.GetComponent<Renderer>();
			if (this.m_renderer == null)
			{
				this.m_renderer = base.gameObject.AddComponent<Renderer>();
			}
			if (base.canvasRenderer != null)
			{
				base.canvasRenderer.hideFlags = HideFlags.HideInInspector;
			}
			else
			{
				CanvasRenderer canvasRenderer = base.gameObject.AddComponent<CanvasRenderer>();
				canvasRenderer.hideFlags = HideFlags.HideInInspector;
			}
			this.m_rectTransform = base.rectTransform;
			this.m_transform = this.transform;
			this.m_meshFilter = base.GetComponent<MeshFilter>();
			if (this.m_meshFilter == null)
			{
				this.m_meshFilter = base.gameObject.AddComponent<MeshFilter>();
			}
			if (this.m_mesh == null)
			{
				this.m_mesh = new Mesh();
				this.m_mesh.hideFlags = HideFlags.HideAndDontSave;
				this.m_meshFilter.mesh = this.m_mesh;
			}
			this.m_meshFilter.hideFlags = HideFlags.HideInInspector;
			if (this.m_text == null)
			{
				this.m_enableWordWrapping = TMP_Settings.enableWordWrapping;
				this.m_enableKerning = TMP_Settings.enableKerning;
				this.m_enableExtraPadding = TMP_Settings.enableExtraPadding;
				this.m_tintAllSprites = TMP_Settings.enableTintAllSprites;
				this.m_parseCtrlCharacters = TMP_Settings.enableParseEscapeCharacters;
				this.m_fontSize = (this.m_fontSizeBase = TMP_Settings.defaultFontSize);
			}
			this.LoadFontAsset();
			TMP_StyleSheet.LoadDefaultStyleSheet();
			this.m_char_buffer = new int[this.m_max_characters];
			this.m_cached_TextElement = new TMP_Glyph();
			this.m_isFirstAllocation = true;
			if (this.m_textInfo == null)
			{
				this.m_textInfo = new TMP_TextInfo(this);
			}
			if (this.m_fontAsset == null)
			{
				Debug.LogWarning("Please assign a Font Asset to this " + this.transform.name + " gameobject.", this);
				return;
			}
			if (this.m_fontSizeMin == 0f)
			{
				this.m_fontSizeMin = this.m_fontSize / 2f;
			}
			if (this.m_fontSizeMax == 0f)
			{
				this.m_fontSizeMax = this.m_fontSize * 2f;
			}
			this.m_isInputParsingRequired = true;
			this.m_havePropertiesChanged = true;
			this.m_isCalculateSizeRequired = true;
			this.m_isAwake = true;
		}

		// Token: 0x06002873 RID: 10355 RVA: 0x000EA19C File Offset: 0x000E839C
		protected override void OnEnable()
		{
			if (!this.m_isRegisteredForEvents)
			{
				this.m_isRegisteredForEvents = true;
			}
			this.meshFilter.sharedMesh = this.mesh;
			this.SetActiveSubMeshes(true);
			this.ComputeMarginSize();
			this.m_isInputParsingRequired = true;
			this.m_havePropertiesChanged = true;
			this.m_verticesAlreadyDirty = false;
			this.SetVerticesDirty();
		}

		// Token: 0x06002874 RID: 10356 RVA: 0x0001D428 File Offset: 0x0001B628
		protected override void OnDisable()
		{
			TMP_UpdateManager.UnRegisterTextElementForRebuild(this);
			this.m_meshFilter.sharedMesh = null;
			this.SetActiveSubMeshes(false);
		}

		// Token: 0x06002875 RID: 10357 RVA: 0x0001D443 File Offset: 0x0001B643
		protected override void OnDestroy()
		{
			if (this.m_mesh != null)
			{
				UnityEngine.Object.DestroyImmediate(this.m_mesh);
			}
			this.m_isRegisteredForEvents = false;
			TMP_UpdateManager.UnRegisterTextElementForRebuild(this);
		}

		// Token: 0x06002876 RID: 10358 RVA: 0x000EA1F4 File Offset: 0x000E83F4
		protected override void LoadFontAsset()
		{
			ShaderUtilities.GetShaderPropertyIDs();
			if (this.m_fontAsset == null)
			{
				if (TMP_Settings.defaultFontAsset != null)
				{
					this.m_fontAsset = TMP_Settings.defaultFontAsset;
				}
				else
				{
					this.m_fontAsset = (Resources.Load("Fonts & Materials/ARIAL SDF", typeof(TMP_FontAsset)) as TMP_FontAsset);
				}
				if (this.m_fontAsset == null)
				{
					Debug.LogWarning("The ARIAL SDF Font Asset was not found. There is no Font Asset assigned to " + base.gameObject.name + ".", this);
					return;
				}
				if (this.m_fontAsset.characterDictionary == null)
				{
					Debug.Log("Dictionary is Null!");
				}
				this.m_renderer.sharedMaterial = this.m_fontAsset.material;
				this.m_sharedMaterial = this.m_fontAsset.material;
				this.m_sharedMaterial.SetFloat("_CullMode", 0f);
				this.m_sharedMaterial.SetFloat(ShaderUtilities.ShaderTag_ZTestMode, 4f);
				this.m_renderer.receiveShadows = false;
				this.m_renderer.shadowCastingMode = ShadowCastingMode.Off;
			}
			else
			{
				if (this.m_fontAsset.characterDictionary == null)
				{
					this.m_fontAsset.ReadFontDefinition();
				}
				if (this.m_renderer.sharedMaterial == null || this.m_renderer.sharedMaterial.mainTexture == null || this.m_fontAsset.atlas.GetInstanceID() != this.m_renderer.sharedMaterial.GetTexture(ShaderUtilities.ID_MainTex).GetInstanceID())
				{
					this.m_renderer.sharedMaterial = this.m_fontAsset.material;
					this.m_sharedMaterial = this.m_fontAsset.material;
				}
				else
				{
					this.m_sharedMaterial = this.m_renderer.sharedMaterial;
				}
				this.m_sharedMaterial.SetFloat(ShaderUtilities.ShaderTag_ZTestMode, 4f);
				if (this.m_sharedMaterial.passCount == 1)
				{
					this.m_renderer.receiveShadows = false;
					this.m_renderer.shadowCastingMode = ShadowCastingMode.Off;
				}
			}
			this.m_padding = this.GetPaddingForMaterial();
			this.m_isMaskingEnabled = ShaderUtilities.IsMaskingEnabled(this.m_sharedMaterial);
			base.GetSpecialCharacters(this.m_fontAsset);
		}

		// Token: 0x06002877 RID: 10359 RVA: 0x000EA430 File Offset: 0x000E8630
		private void UpdateEnvMapMatrix()
		{
			if (!this.m_sharedMaterial.HasProperty(ShaderUtilities.ID_EnvMap) || this.m_sharedMaterial.GetTexture(ShaderUtilities.ID_EnvMap) == null)
			{
				return;
			}
			Vector3 euler = this.m_sharedMaterial.GetVector(ShaderUtilities.ID_EnvMatrixRotation);
			this.m_EnvMapMatrix = Matrix4x4.TRS(Vector3.zero, Quaternion.Euler(euler), Vector3.one);
			this.m_sharedMaterial.SetMatrix(ShaderUtilities.ID_EnvMatrix, this.m_EnvMapMatrix);
		}

		// Token: 0x06002878 RID: 10360 RVA: 0x000EA4B8 File Offset: 0x000E86B8
		private void SetMask(MaskingTypes maskType)
		{
			if (maskType != MaskingTypes.MaskOff)
			{
				if (maskType != MaskingTypes.MaskSoft)
				{
					if (maskType == MaskingTypes.MaskHard)
					{
						this.m_sharedMaterial.EnableKeyword(ShaderUtilities.Keyword_MASK_HARD);
						this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_SOFT);
						this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_TEX);
					}
				}
				else
				{
					this.m_sharedMaterial.EnableKeyword(ShaderUtilities.Keyword_MASK_SOFT);
					this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_HARD);
					this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_TEX);
				}
			}
			else
			{
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_SOFT);
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_HARD);
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_TEX);
			}
		}

		// Token: 0x06002879 RID: 10361 RVA: 0x0001D46E File Offset: 0x0001B66E
		private void SetMaskCoordinates(Vector4 coords)
		{
			this.m_sharedMaterial.SetVector(ShaderUtilities.ID_ClipRect, coords);
		}

		// Token: 0x0600287A RID: 10362 RVA: 0x0001D481 File Offset: 0x0001B681
		private void SetMaskCoordinates(Vector4 coords, float softX, float softY)
		{
			this.m_sharedMaterial.SetVector(ShaderUtilities.ID_ClipRect, coords);
			this.m_sharedMaterial.SetFloat(ShaderUtilities.ID_MaskSoftnessX, softX);
			this.m_sharedMaterial.SetFloat(ShaderUtilities.ID_MaskSoftnessY, softY);
		}

		// Token: 0x0600287B RID: 10363 RVA: 0x000EA580 File Offset: 0x000E8780
		private void EnableMasking()
		{
			if (this.m_sharedMaterial.HasProperty(ShaderUtilities.ID_ClipRect))
			{
				this.m_sharedMaterial.EnableKeyword(ShaderUtilities.Keyword_MASK_SOFT);
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_HARD);
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_TEX);
				this.m_isMaskingEnabled = true;
				this.UpdateMask();
			}
		}

		// Token: 0x0600287C RID: 10364 RVA: 0x000EA5E0 File Offset: 0x000E87E0
		private void DisableMasking()
		{
			if (this.m_sharedMaterial.HasProperty(ShaderUtilities.ID_ClipRect))
			{
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_SOFT);
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_HARD);
				this.m_sharedMaterial.DisableKeyword(ShaderUtilities.Keyword_MASK_TEX);
				this.m_isMaskingEnabled = false;
				this.UpdateMask();
			}
		}

		// Token: 0x0600287D RID: 10365 RVA: 0x000EA640 File Offset: 0x000E8840
		private void UpdateMask()
		{
			if (!this.m_isMaskingEnabled)
			{
				return;
			}
			if (this.m_isMaskingEnabled && this.m_fontMaterial == null)
			{
				this.CreateMaterialInstance();
			}
			float num = Mathf.Min(Mathf.Min(this.m_textContainer.margins.x, this.m_textContainer.margins.z), this.m_sharedMaterial.GetFloat(ShaderUtilities.ID_MaskSoftnessX));
			float num2 = Mathf.Min(Mathf.Min(this.m_textContainer.margins.y, this.m_textContainer.margins.w), this.m_sharedMaterial.GetFloat(ShaderUtilities.ID_MaskSoftnessY));
			num = ((num <= 0f) ? 0f : num);
			num2 = ((num2 <= 0f) ? 0f : num2);
			float z = (this.m_textContainer.width - Mathf.Max(this.m_textContainer.margins.x, 0f) - Mathf.Max(this.m_textContainer.margins.z, 0f)) / 2f + num;
			float w = (this.m_textContainer.height - Mathf.Max(this.m_textContainer.margins.y, 0f) - Mathf.Max(this.m_textContainer.margins.w, 0f)) / 2f + num2;
			Vector2 vector = new Vector2((0.5f - this.m_textContainer.pivot.x) * this.m_textContainer.width + (Mathf.Max(this.m_textContainer.margins.x, 0f) - Mathf.Max(this.m_textContainer.margins.z, 0f)) / 2f, (0.5f - this.m_textContainer.pivot.y) * this.m_textContainer.height + (-Mathf.Max(this.m_textContainer.margins.y, 0f) + Mathf.Max(this.m_textContainer.margins.w, 0f)) / 2f);
			Vector4 value = new Vector4(vector.x, vector.y, z, w);
			this.m_fontMaterial.SetVector(ShaderUtilities.ID_ClipRect, value);
			this.m_fontMaterial.SetFloat(ShaderUtilities.ID_MaskSoftnessX, num);
			this.m_fontMaterial.SetFloat(ShaderUtilities.ID_MaskSoftnessY, num2);
		}

		// Token: 0x0600287E RID: 10366 RVA: 0x000EA8FC File Offset: 0x000E8AFC
		protected override Material GetMaterial(Material mat)
		{
			if (this.m_fontMaterial == null || this.m_fontMaterial.GetInstanceID() != mat.GetInstanceID())
			{
				this.m_fontMaterial = this.CreateMaterialInstance(mat);
			}
			this.m_sharedMaterial = this.m_fontMaterial;
			this.m_padding = this.GetPaddingForMaterial();
			this.SetVerticesDirty();
			this.SetMaterialDirty();
			return this.m_sharedMaterial;
		}

		// Token: 0x0600287F RID: 10367 RVA: 0x000EA968 File Offset: 0x000E8B68
		protected override Material[] GetMaterials(Material[] mats)
		{
			int materialCount = this.m_textInfo.materialCount;
			if (this.m_fontMaterials == null)
			{
				this.m_fontMaterials = new Material[materialCount];
			}
			else if (this.m_fontMaterials.Length != materialCount)
			{
				TMP_TextInfo.Resize<Material>(ref this.m_fontMaterials, materialCount, false);
			}
			for (int i = 0; i < materialCount; i++)
			{
				if (i == 0)
				{
					this.m_fontMaterials[i] = base.fontMaterial;
				}
				else
				{
					this.m_fontMaterials[i] = this.m_subTextObjects[i].material;
				}
			}
			this.m_fontSharedMaterials = this.m_fontMaterials;
			return this.m_fontMaterials;
		}

		// Token: 0x06002880 RID: 10368 RVA: 0x0001D4B6 File Offset: 0x0001B6B6
		protected override void SetSharedMaterial(Material mat)
		{
			this.m_sharedMaterial = mat;
			this.m_padding = this.GetPaddingForMaterial();
			this.SetMaterialDirty();
		}

		// Token: 0x06002881 RID: 10369 RVA: 0x000EAA0C File Offset: 0x000E8C0C
		protected override Material[] GetSharedMaterials()
		{
			int materialCount = this.m_textInfo.materialCount;
			if (this.m_fontSharedMaterials == null)
			{
				this.m_fontSharedMaterials = new Material[materialCount];
			}
			else if (this.m_fontSharedMaterials.Length != materialCount)
			{
				TMP_TextInfo.Resize<Material>(ref this.m_fontSharedMaterials, materialCount, false);
			}
			for (int i = 0; i < materialCount; i++)
			{
				if (i == 0)
				{
					this.m_fontSharedMaterials[i] = this.m_sharedMaterial;
				}
				else
				{
					this.m_fontSharedMaterials[i] = this.m_subTextObjects[i].sharedMaterial;
				}
			}
			return this.m_fontSharedMaterials;
		}

		// Token: 0x06002882 RID: 10370 RVA: 0x000EAAA4 File Offset: 0x000E8CA4
		protected override void SetSharedMaterials(Material[] materials)
		{
			int materialCount = this.m_textInfo.materialCount;
			if (this.m_fontSharedMaterials == null)
			{
				this.m_fontSharedMaterials = new Material[materialCount];
			}
			else if (this.m_fontSharedMaterials.Length != materialCount)
			{
				TMP_TextInfo.Resize<Material>(ref this.m_fontSharedMaterials, materialCount, false);
			}
			for (int i = 0; i < materialCount; i++)
			{
				if (i == 0)
				{
					if (!(materials[i].mainTexture == null) && materials[i].mainTexture.GetInstanceID() == this.m_sharedMaterial.mainTexture.GetInstanceID())
					{
						this.m_sharedMaterial = (this.m_fontSharedMaterials[i] = materials[i]);
						this.m_padding = this.GetPaddingForMaterial(this.m_sharedMaterial);
					}
				}
				else if (!(materials[i].mainTexture == null) && materials[i].mainTexture.GetInstanceID() == this.m_subTextObjects[i].sharedMaterial.mainTexture.GetInstanceID())
				{
					if (this.m_subTextObjects[i].isDefaultMaterial)
					{
						this.m_subTextObjects[i].sharedMaterial = (this.m_fontSharedMaterials[i] = materials[i]);
					}
				}
			}
		}

		// Token: 0x06002883 RID: 10371 RVA: 0x000EABE0 File Offset: 0x000E8DE0
		protected override void SetOutlineThickness(float thickness)
		{
			thickness = Mathf.Clamp01(thickness);
			this.m_renderer.material.SetFloat(ShaderUtilities.ID_OutlineWidth, thickness);
			if (this.m_fontMaterial == null)
			{
				this.m_fontMaterial = this.m_renderer.material;
			}
			this.m_fontMaterial = this.m_renderer.material;
			this.m_sharedMaterial = this.m_fontMaterial;
			this.m_padding = this.GetPaddingForMaterial();
		}

		// Token: 0x06002884 RID: 10372 RVA: 0x000EAC58 File Offset: 0x000E8E58
		protected override void SetFaceColor(Color32 color)
		{
			this.m_renderer.material.SetColor(ShaderUtilities.ID_FaceColor, color);
			if (this.m_fontMaterial == null)
			{
				this.m_fontMaterial = this.m_renderer.material;
			}
			this.m_sharedMaterial = this.m_fontMaterial;
		}

		// Token: 0x06002885 RID: 10373 RVA: 0x000EACB0 File Offset: 0x000E8EB0
		protected override void SetOutlineColor(Color32 color)
		{
			this.m_renderer.material.SetColor(ShaderUtilities.ID_OutlineColor, color);
			if (this.m_fontMaterial == null)
			{
				this.m_fontMaterial = this.m_renderer.material;
			}
			this.m_sharedMaterial = this.m_fontMaterial;
		}

		// Token: 0x06002886 RID: 10374 RVA: 0x000EAD08 File Offset: 0x000E8F08
		private void CreateMaterialInstance()
		{
			Material material = new Material(this.m_sharedMaterial);
			material.shaderKeywords = this.m_sharedMaterial.shaderKeywords;
			Material material2 = material;
			material2.name += " Instance";
			this.m_fontMaterial = material;
		}

		// Token: 0x06002887 RID: 10375 RVA: 0x000EAD50 File Offset: 0x000E8F50
		protected override void SetShaderDepth()
		{
			if (this.m_isOverlay)
			{
				this.m_sharedMaterial.SetFloat(ShaderUtilities.ShaderTag_ZTestMode, 0f);
				this.m_renderer.material.renderQueue = 4000;
				this.m_sharedMaterial = this.m_renderer.material;
			}
			else
			{
				this.m_sharedMaterial.SetFloat(ShaderUtilities.ShaderTag_ZTestMode, 4f);
				this.m_renderer.material.renderQueue = -1;
				this.m_sharedMaterial = this.m_renderer.material;
			}
		}

		// Token: 0x06002888 RID: 10376 RVA: 0x000EADE0 File Offset: 0x000E8FE0
		protected override void SetCulling()
		{
			if (this.m_isCullingEnabled)
			{
				this.m_renderer.material.SetFloat("_CullMode", 2f);
			}
			else
			{
				this.m_renderer.material.SetFloat("_CullMode", 0f);
			}
		}

		// Token: 0x06002889 RID: 10377 RVA: 0x0001D4D1 File Offset: 0x0001B6D1
		private void SetPerspectiveCorrection()
		{
			if (this.m_isOrthographic)
			{
				this.m_sharedMaterial.SetFloat(ShaderUtilities.ID_PerspectiveFilter, 0f);
			}
			else
			{
				this.m_sharedMaterial.SetFloat(ShaderUtilities.ID_PerspectiveFilter, 0.875f);
			}
		}

		// Token: 0x0600288A RID: 10378 RVA: 0x000EAE34 File Offset: 0x000E9034
		protected override float GetPaddingForMaterial(Material mat)
		{
			this.m_padding = ShaderUtilities.GetPadding(mat, this.m_enableExtraPadding, this.m_isUsingBold);
			this.m_isMaskingEnabled = ShaderUtilities.IsMaskingEnabled(this.m_sharedMaterial);
			this.m_isSDFShader = mat.HasProperty(ShaderUtilities.ID_WeightNormal);
			return this.m_padding;
		}

		// Token: 0x0600288B RID: 10379 RVA: 0x000EAE84 File Offset: 0x000E9084
		protected override float GetPaddingForMaterial()
		{
			ShaderUtilities.GetShaderPropertyIDs();
			if (this.m_sharedMaterial == null)
			{
				return 0f;
			}
			this.m_padding = ShaderUtilities.GetPadding(this.m_sharedMaterial, this.m_enableExtraPadding, this.m_isUsingBold);
			this.m_isMaskingEnabled = ShaderUtilities.IsMaskingEnabled(this.m_sharedMaterial);
			this.m_isSDFShader = this.m_sharedMaterial.HasProperty(ShaderUtilities.ID_WeightNormal);
			return this.m_padding;
		}

		// Token: 0x0600288C RID: 10380 RVA: 0x000EAEF8 File Offset: 0x000E90F8
		protected override int SetArraySizes(int[] chars)
		{
			int num = 0;
			int num2 = 0;
			this.m_totalCharacterCount = 0;
			this.m_isUsingBold = false;
			this.m_isParsingText = false;
			this.tag_NoParsing = false;
			this.m_style = this.m_fontStyle;
			this.m_fontWeightInternal = (((this.m_style & FontStyles.Bold) != FontStyles.Bold) ? this.m_fontWeight : 700);
			this.m_fontWeightStack.SetDefault(this.m_fontWeightInternal);
			this.m_currentFontAsset = this.m_fontAsset;
			this.m_currentMaterial = this.m_sharedMaterial;
			this.m_currentMaterialIndex = 0;
			this.m_materialReferenceStack.SetDefault(new MaterialReference(0, this.m_currentFontAsset, null, this.m_currentMaterial, this.m_padding));
			this.m_materialReferenceIndexLookup.Clear();
			MaterialReference.AddMaterialReference(this.m_currentMaterial, this.m_currentFontAsset, this.m_materialReferences, this.m_materialReferenceIndexLookup);
			if (this.m_textInfo == null)
			{
				this.m_textInfo = new TMP_TextInfo();
			}
			this.m_textElementType = TMP_TextElementType.Character;
			int num3 = 0;
			while (chars[num3] != 0)
			{
				if (this.m_textInfo.characterInfo == null || this.m_totalCharacterCount >= this.m_textInfo.characterInfo.Length)
				{
					TMP_TextInfo.Resize<TMP_CharacterInfo>(ref this.m_textInfo.characterInfo, this.m_totalCharacterCount + 1, true);
				}
				int num4 = chars[num3];
				if (!this.m_isRichText || num4 != 60)
				{
					goto IL_233;
				}
				int currentMaterialIndex = this.m_currentMaterialIndex;
				if (!base.ValidateHtmlTag(chars, num3 + 1, out num))
				{
					goto IL_233;
				}
				num3 = num;
				if ((this.m_style & FontStyles.Bold) == FontStyles.Bold)
				{
					this.m_isUsingBold = true;
				}
				if (this.m_textElementType == TMP_TextElementType.Sprite)
				{
					MaterialReference[] materialReferences = this.m_materialReferences;
					int currentMaterialIndex2 = this.m_currentMaterialIndex;
					materialReferences[currentMaterialIndex2].referenceCount = materialReferences[currentMaterialIndex2].referenceCount + 1;
					this.m_textInfo.characterInfo[this.m_totalCharacterCount].character = (char)(57344 + this.m_spriteIndex);
					this.m_textInfo.characterInfo[this.m_totalCharacterCount].fontAsset = this.m_currentFontAsset;
					this.m_textInfo.characterInfo[this.m_totalCharacterCount].materialReferenceIndex = this.m_currentMaterialIndex;
					this.m_textElementType = TMP_TextElementType.Character;
					this.m_currentMaterialIndex = currentMaterialIndex;
					num2++;
					this.m_totalCharacterCount++;
				}
				IL_90C:
				num3++;
				continue;
				IL_233:
				bool flag = false;
				bool isUsingAlternateTypeface = false;
				TMP_FontAsset currentFontAsset = this.m_currentFontAsset;
				Material currentMaterial = this.m_currentMaterial;
				int currentMaterialIndex3 = this.m_currentMaterialIndex;
				if (this.m_textElementType == TMP_TextElementType.Character)
				{
					if ((this.m_style & FontStyles.UpperCase) == FontStyles.UpperCase)
					{
						if (char.IsLower((char)num4))
						{
							num4 = (int)char.ToUpper((char)num4);
						}
					}
					else if ((this.m_style & FontStyles.LowerCase) == FontStyles.LowerCase)
					{
						if (char.IsUpper((char)num4))
						{
							num4 = (int)char.ToLower((char)num4);
						}
					}
					else if (((this.m_fontStyle & FontStyles.SmallCaps) == FontStyles.SmallCaps || (this.m_style & FontStyles.SmallCaps) == FontStyles.SmallCaps) && char.IsLower((char)num4))
					{
						num4 = (int)char.ToUpper((char)num4);
					}
				}
				TMP_FontAsset tmp_FontAsset = base.GetFontAssetForWeight(this.m_fontWeightInternal);
				if (tmp_FontAsset != null)
				{
					flag = true;
					isUsingAlternateTypeface = true;
					this.m_currentFontAsset = tmp_FontAsset;
				}
				TMP_Glyph tmp_Glyph;
				if (!this.m_currentFontAsset.characterDictionary.TryGetValue(num4, out tmp_Glyph))
				{
					if (this.m_currentFontAsset.fallbackFontAssets != null && this.m_currentFontAsset.fallbackFontAssets.Count > 0)
					{
						for (int i = 0; i < this.m_currentFontAsset.fallbackFontAssets.Count; i++)
						{
							tmp_FontAsset = this.m_currentFontAsset.fallbackFontAssets[i];
							if (!(tmp_FontAsset == null))
							{
								if (tmp_FontAsset.characterDictionary.TryGetValue(num4, out tmp_Glyph))
								{
									flag = true;
									this.m_currentFontAsset = tmp_FontAsset;
									break;
								}
							}
						}
					}
					if (tmp_Glyph == null && TMP_Settings.fallbackFontAssets != null && TMP_Settings.fallbackFontAssets.Count > 0)
					{
						for (int j = 0; j < TMP_Settings.fallbackFontAssets.Count; j++)
						{
							tmp_FontAsset = TMP_Settings.fallbackFontAssets[j];
							if (!(tmp_FontAsset == null))
							{
								if (tmp_FontAsset.characterDictionary.TryGetValue(num4, out tmp_Glyph))
								{
									flag = true;
									this.m_currentFontAsset = tmp_FontAsset;
									break;
								}
							}
						}
					}
					if (tmp_Glyph == null)
					{
						if (char.IsLower((char)num4))
						{
							if (this.m_currentFontAsset.characterDictionary.TryGetValue((int)char.ToUpper((char)num4), out tmp_Glyph))
							{
								num4 = (chars[num3] = (int)char.ToUpper((char)num4));
							}
						}
						else if (char.IsUpper((char)num4) && this.m_currentFontAsset.characterDictionary.TryGetValue((int)char.ToLower((char)num4), out tmp_Glyph))
						{
							num4 = (chars[num3] = (int)char.ToLower((char)num4));
						}
					}
					if (tmp_Glyph == null)
					{
						int num5 = (TMP_Settings.missingGlyphCharacter != 0) ? TMP_Settings.missingGlyphCharacter : 9633;
						if (this.m_currentFontAsset.characterDictionary.TryGetValue(num5, out tmp_Glyph))
						{
							if (!TMP_Settings.warningsDisabled)
							{
								Debug.LogWarning("Character with ASCII value of " + num4 + " was not found in the Font Asset Glyph Table.", this);
							}
							num4 = (chars[num3] = num5);
						}
						else
						{
							if (TMP_Settings.fallbackFontAssets != null && TMP_Settings.fallbackFontAssets.Count > 0)
							{
								for (int k = 0; k < TMP_Settings.fallbackFontAssets.Count; k++)
								{
									tmp_FontAsset = TMP_Settings.fallbackFontAssets[k];
									if (!(tmp_FontAsset == null))
									{
										if (tmp_FontAsset.characterDictionary.TryGetValue(num5, out tmp_Glyph))
										{
											if (!TMP_Settings.warningsDisabled)
											{
												Debug.LogWarning("Character with ASCII value of " + num4 + " was not found in the Font Asset Glyph Table.", this);
											}
											num4 = (chars[num3] = num5);
											flag = true;
											this.m_currentFontAsset = tmp_FontAsset;
											break;
										}
									}
								}
							}
							if (tmp_Glyph == null)
							{
								tmp_FontAsset = TMP_Settings.GetFontAsset();
								if (tmp_FontAsset != null && tmp_FontAsset.characterDictionary.TryGetValue(num5, out tmp_Glyph))
								{
									if (!TMP_Settings.warningsDisabled)
									{
										Debug.LogWarning("Character with ASCII value of " + num4 + " was not found in the Font Asset Glyph Table.", this);
									}
									num4 = (chars[num3] = num5);
									flag = true;
									this.m_currentFontAsset = tmp_FontAsset;
								}
								else
								{
									tmp_FontAsset = TMP_FontAsset.defaultFontAsset;
									if (tmp_FontAsset != null && tmp_FontAsset.characterDictionary.TryGetValue(num5, out tmp_Glyph))
									{
										if (!TMP_Settings.warningsDisabled)
										{
											Debug.LogWarning("Character with ASCII value of " + num4 + " was not found in the Font Asset Glyph Table.", this);
										}
										num4 = (chars[num3] = num5);
										flag = true;
										this.m_currentFontAsset = tmp_FontAsset;
									}
									else if (this.m_currentFontAsset.characterDictionary.TryGetValue(32, out tmp_Glyph))
									{
										if (!TMP_Settings.warningsDisabled)
										{
											Debug.LogWarning("Character with ASCII value of " + num4 + " was not found in the Font Asset Glyph Table. It was replaced by a space.", this);
										}
										num4 = (chars[num3] = 32);
									}
								}
							}
						}
					}
				}
				this.m_textInfo.characterInfo[this.m_totalCharacterCount].textElement = tmp_Glyph;
				this.m_textInfo.characterInfo[this.m_totalCharacterCount].isUsingAlternateTypeface = isUsingAlternateTypeface;
				this.m_textInfo.characterInfo[this.m_totalCharacterCount].character = (char)num4;
				this.m_textInfo.characterInfo[this.m_totalCharacterCount].fontAsset = this.m_currentFontAsset;
				if (flag)
				{
					if (TMP_Settings.matchMaterialPreset)
					{
						this.m_currentMaterial = TMP_MaterialManager.GetFallbackMaterial(this.m_currentMaterial, this.m_currentFontAsset.material);
					}
					else
					{
						this.m_currentMaterial = this.m_currentFontAsset.material;
					}
					this.m_currentMaterialIndex = MaterialReference.AddMaterialReference(this.m_currentMaterial, this.m_currentFontAsset, this.m_materialReferences, this.m_materialReferenceIndexLookup);
				}
				if (!char.IsWhiteSpace((char)num4))
				{
					if (this.m_materialReferences[this.m_currentMaterialIndex].referenceCount < 16383)
					{
						MaterialReference[] materialReferences2 = this.m_materialReferences;
						int currentMaterialIndex4 = this.m_currentMaterialIndex;
						materialReferences2[currentMaterialIndex4].referenceCount = materialReferences2[currentMaterialIndex4].referenceCount + 1;
					}
					else
					{
						this.m_currentMaterialIndex = MaterialReference.AddMaterialReference(new Material(this.m_currentMaterial), this.m_currentFontAsset, this.m_materialReferences, this.m_materialReferenceIndexLookup);
						MaterialReference[] materialReferences3 = this.m_materialReferences;
						int currentMaterialIndex5 = this.m_currentMaterialIndex;
						materialReferences3[currentMaterialIndex5].referenceCount = materialReferences3[currentMaterialIndex5].referenceCount + 1;
					}
				}
				this.m_textInfo.characterInfo[this.m_totalCharacterCount].material = this.m_currentMaterial;
				this.m_textInfo.characterInfo[this.m_totalCharacterCount].materialReferenceIndex = this.m_currentMaterialIndex;
				this.m_materialReferences[this.m_currentMaterialIndex].isFallbackMaterial = flag;
				if (flag)
				{
					this.m_materialReferences[this.m_currentMaterialIndex].fallbackMaterial = currentMaterial;
					this.m_currentFontAsset = currentFontAsset;
					this.m_currentMaterial = currentMaterial;
					this.m_currentMaterialIndex = currentMaterialIndex3;
				}
				this.m_totalCharacterCount++;
				goto IL_90C;
			}
			if (this.m_isCalculatingPreferredValues)
			{
				this.m_isCalculatingPreferredValues = false;
				this.m_isInputParsingRequired = true;
				return this.m_totalCharacterCount;
			}
			this.m_textInfo.spriteCount = num2;
			int num6 = this.m_textInfo.materialCount = this.m_materialReferenceIndexLookup.Count;
			if (num6 > this.m_textInfo.meshInfo.Length)
			{
				TMP_TextInfo.Resize<TMP_MeshInfo>(ref this.m_textInfo.meshInfo, num6, false);
			}
			if (this.m_textInfo.characterInfo.Length - this.m_totalCharacterCount > 256)
			{
				TMP_TextInfo.Resize<TMP_CharacterInfo>(ref this.m_textInfo.characterInfo, Mathf.Max(this.m_totalCharacterCount + 1, 256), true);
			}
			for (int l = 0; l < num6; l++)
			{
				if (l > 0)
				{
					if (this.m_subTextObjects[l] == null)
					{
						this.m_subTextObjects[l] = TMP_SubMesh.AddSubTextObject(this, this.m_materialReferences[l]);
						this.m_textInfo.meshInfo[l].vertices = null;
					}
					if (this.m_subTextObjects[l].sharedMaterial == null || this.m_subTextObjects[l].sharedMaterial.GetInstanceID() != this.m_materialReferences[l].material.GetInstanceID())
					{
						bool isDefaultMaterial = this.m_materialReferences[l].isDefaultMaterial;
						this.m_subTextObjects[l].isDefaultMaterial = isDefaultMaterial;
						if (!isDefaultMaterial || this.m_subTextObjects[l].sharedMaterial == null || this.m_subTextObjects[l].sharedMaterial.mainTexture.GetInstanceID() != this.m_materialReferences[l].material.GetTexture(ShaderUtilities.ID_MainTex).GetInstanceID())
						{
							this.m_subTextObjects[l].sharedMaterial = this.m_materialReferences[l].material;
							this.m_subTextObjects[l].fontAsset = this.m_materialReferences[l].fontAsset;
							this.m_subTextObjects[l].spriteAsset = this.m_materialReferences[l].spriteAsset;
						}
					}
					if (this.m_materialReferences[l].isFallbackMaterial)
					{
						this.m_subTextObjects[l].fallbackMaterial = this.m_materialReferences[l].material;
						this.m_subTextObjects[l].fallbackSourceMaterial = this.m_materialReferences[l].fallbackMaterial;
					}
				}
				int referenceCount = this.m_materialReferences[l].referenceCount;
				if (this.m_textInfo.meshInfo[l].vertices == null || this.m_textInfo.meshInfo[l].vertices.Length < referenceCount * (this.m_isVolumetricText ? 8 : 4))
				{
					if (this.m_textInfo.meshInfo[l].vertices == null)
					{
						if (l == 0)
						{
							this.m_textInfo.meshInfo[l] = new TMP_MeshInfo(this.m_mesh, referenceCount + 1, this.m_isVolumetricText);
						}
						else
						{
							this.m_textInfo.meshInfo[l] = new TMP_MeshInfo(this.m_subTextObjects[l].mesh, referenceCount + 1, this.m_isVolumetricText);
						}
					}
					else
					{
						this.m_textInfo.meshInfo[l].ResizeMeshInfo((referenceCount <= 1024) ? Mathf.NextPowerOfTwo(referenceCount) : (referenceCount + 256), this.m_isVolumetricText);
					}
				}
				else if (this.m_textInfo.meshInfo[l].vertices.Length - referenceCount * (this.m_isVolumetricText ? 8 : 4) > 1024)
				{
					this.m_textInfo.meshInfo[l].ResizeMeshInfo((referenceCount <= 1024) ? Mathf.Max(Mathf.NextPowerOfTwo(referenceCount), 256) : (referenceCount + 256), this.m_isVolumetricText);
				}
			}
			int num7 = num6;
			while (num7 < this.m_subTextObjects.Length && this.m_subTextObjects[num7] != null)
			{
				if (num7 < this.m_textInfo.meshInfo.Length)
				{
					this.m_textInfo.meshInfo[num7].ClearUnusedVertices(0, true);
				}
				num7++;
			}
			return this.m_totalCharacterCount;
		}

		// Token: 0x0600288D RID: 10381 RVA: 0x000EBCD4 File Offset: 0x000E9ED4
		protected override void ComputeMarginSize()
		{
			if (this.m_textContainer != null)
			{
				Vector4 margins = this.m_textContainer.margins;
				this.m_marginWidth = this.m_textContainer.rect.width - margins.z - margins.x;
				this.m_marginHeight = this.m_textContainer.rect.height - margins.y - margins.w;
			}
		}

		// Token: 0x0600288E RID: 10382 RVA: 0x0001D50D File Offset: 0x0001B70D
		protected override void OnDidApplyAnimationProperties()
		{
			this.m_havePropertiesChanged = true;
			this.isMaskUpdateRequired = true;
			this.SetVerticesDirty();
		}

		// Token: 0x0600288F RID: 10383 RVA: 0x0001D523 File Offset: 0x0001B723
		protected override void OnTransformParentChanged()
		{
			this.SetVerticesDirty();
			this.SetLayoutDirty();
		}

		// Token: 0x06002890 RID: 10384 RVA: 0x0001D531 File Offset: 0x0001B731
		protected override void OnRectTransformDimensionsChange()
		{
			this.ComputeMarginSize();
			this.SetVerticesDirty();
			this.SetLayoutDirty();
		}

		// Token: 0x06002891 RID: 10385 RVA: 0x000EBD50 File Offset: 0x000E9F50
		private void LateUpdate()
		{
			if(this.m_rectTransform == null)
			this.m_rectTransform = this.gameObject.GetComponent<RectTransform>();
			
			if (this.m_rectTransform.hasChanged)
			{
				float y = this.m_rectTransform.lossyScale.y;
				if (!this.m_havePropertiesChanged && y != this.m_previousLossyScaleY && this.m_text != string.Empty && this.m_text != null)
				{
					this.UpdateSDFScale(y);
					this.m_previousLossyScaleY = y;
				}
			}
			if (this.m_isUsingLegacyAnimationComponent)
			{
				this.m_havePropertiesChanged = true;
				this.OnPreRenderObject();
			}
		}

		// Token: 0x06002892 RID: 10386 RVA: 0x000EBDE0 File Offset: 0x000E9FE0
		private void OnPreRenderObject()
		{
			if (!this.m_isAwake || (!this.m_ignoreActiveState && !this.IsActive()))
			{
				return;
			}
			this.loopCountA = 0;
			if (this.m_transform.hasChanged)
			{
				this.m_transform.hasChanged = false;
				if (this.m_textContainer != null && this.m_textContainer.hasChanged)
				{
					this.ComputeMarginSize();
					this.isMaskUpdateRequired = true;
					this.m_textContainer.hasChanged = false;
					this.m_havePropertiesChanged = true;
				}
			}
			if (this.m_havePropertiesChanged || this.m_isLayoutDirty)
			{
				if (this.isMaskUpdateRequired)
				{
					this.UpdateMask();
					this.isMaskUpdateRequired = false;
				}
				if (this.checkPaddingRequired)
				{
					this.UpdateMeshPadding();
				}
				if (this.m_isInputParsingRequired || this.m_isTextTruncated)
				{
					base.ParseInputText();
				}
				if (this.m_enableAutoSizing)
				{
					this.m_fontSize = Mathf.Clamp(this.m_fontSize, this.m_fontSizeMin, this.m_fontSizeMax);
				}
				this.m_maxFontSize = this.m_fontSizeMax;
				this.m_minFontSize = this.m_fontSizeMin;
				this.m_lineSpacingDelta = 0f;
				this.m_charWidthAdjDelta = 0f;
				this.m_recursiveCount = 0;
				this.m_isCharacterWrappingEnabled = false;
				this.m_isTextTruncated = false;
				this.m_havePropertiesChanged = false;
				this.m_isLayoutDirty = false;
				this.m_ignoreActiveState = false;
				this.GenerateTextMesh();
			}
		}

		// Token: 0x06002893 RID: 10387 RVA: 0x000EBF54 File Offset: 0x000EA154
		protected override void GenerateTextMesh()
		{
			if (this.m_fontAsset == null || this.m_fontAsset.characterDictionary == null)
			{
				Debug.LogWarning("Can't Generate Mesh! No Font Asset has been assigned to Object ID: " + base.GetInstanceID());
				return;
			}
			if (this.m_textInfo != null)
			{
				this.m_textInfo.Clear();
			}
			if (this.m_char_buffer == null || this.m_char_buffer.Length == 0 || this.m_char_buffer[0] == 0)
			{
				this.ClearMesh(true);
				this.m_preferredWidth = 0f;
				this.m_preferredHeight = 0f;
				TMPro_EventManager.ON_TEXT_CHANGED(this);
				return;
			}
			this.m_currentFontAsset = this.m_fontAsset;
			this.m_currentMaterial = this.m_sharedMaterial;
			this.m_currentMaterialIndex = 0;
			this.m_materialReferenceStack.SetDefault(new MaterialReference(0, this.m_currentFontAsset, null, this.m_currentMaterial, this.m_padding));
			this.m_currentSpriteAsset = this.m_spriteAsset;
			int totalCharacterCount = this.m_totalCharacterCount;
			this.m_fontScale = this.m_fontSize / this.m_currentFontAsset.fontInfo.PointSize * ((!this.m_isOrthographic) ? 0.1f : 1f);
			float num = this.m_fontSize / this.m_fontAsset.fontInfo.PointSize * this.m_fontAsset.fontInfo.Scale * ((!this.m_isOrthographic) ? 0.1f : 1f);
			float num2 = this.m_fontScale;
			this.m_fontScaleMultiplier = 1f;
			this.m_currentFontSize = this.m_fontSize;
			this.m_sizeStack.SetDefault(this.m_currentFontSize);
			this.m_style = this.m_fontStyle;
			this.m_fontWeightInternal = (((this.m_style & FontStyles.Bold) != FontStyles.Bold) ? this.m_fontWeight : 700);
			this.m_fontWeightStack.SetDefault(this.m_fontWeightInternal);
			this.m_lineJustification = this.m_textAlignment;
			float num3 = 0f;
			float num4 = 1f;
			this.m_baselineOffset = 0f;
			bool flag = false;
			Vector3 zero = Vector3.zero;
			Vector3 zero2 = Vector3.zero;
			bool flag2 = false;
			Vector3 zero3 = Vector3.zero;
			Vector3 zero4 = Vector3.zero;
			this.m_fontColor32 = this.m_fontColor;
			this.m_htmlColor = this.m_fontColor32;
			this.m_colorStack.SetDefault(this.m_htmlColor);
			this.m_styleStack.Clear();
			this.m_actionStack.Clear();
			this.m_lineOffset = 0f;
			this.m_lineHeight = 0f;
			float num5 = this.m_currentFontAsset.fontInfo.LineHeight - (this.m_currentFontAsset.fontInfo.Ascender - this.m_currentFontAsset.fontInfo.Descender);
			this.m_cSpacing = 0f;
			this.m_monoSpacing = 0f;
			this.m_xAdvance = 0f;
			this.tag_LineIndent = 0f;
			this.tag_Indent = 0f;
			this.m_indentStack.SetDefault(0f);
			this.tag_NoParsing = false;
			this.m_characterCount = 0;
			this.m_firstCharacterOfLine = 0;
			this.m_lastCharacterOfLine = 0;
			this.m_firstVisibleCharacterOfLine = 0;
			this.m_lastVisibleCharacterOfLine = 0;
			this.m_maxLineAscender = TMP_Text.k_LargeNegativeFloat;
			this.m_maxLineDescender = TMP_Text.k_LargePositiveFloat;
			this.m_lineNumber = 0;
			this.m_lineVisibleCharacterCount = 0;
			bool flag3 = true;
			this.m_pageNumber = 0;
			int num6 = Mathf.Clamp(this.m_pageToDisplay - 1, 0, this.m_textInfo.pageInfo.Length - 1);
			int num7 = 0;
			Vector4 margin = this.m_margin;
			float marginWidth = this.m_marginWidth;
			float marginHeight = this.m_marginHeight;
			this.m_marginLeft = 0f;
			this.m_marginRight = 0f;
			this.m_width = -1f;
			float num8 = marginWidth + 0.0001f - this.m_marginLeft - this.m_marginRight;
			this.m_meshExtents.min = TMP_Text.k_LargePositiveVector2;
			this.m_meshExtents.max = TMP_Text.k_LargeNegativeVector2;
			this.m_textInfo.ClearLineInfo();
			this.m_maxCapHeight = 0f;
			this.m_maxAscender = 0f;
			this.m_maxDescender = 0f;
			float num9 = 0f;
			float num10 = 0f;
			bool flag4 = false;
			this.m_isNewPage = false;
			bool flag5 = true;
			bool flag6 = false;
			int num11 = 0;
			this.loopCountA++;
			int num12 = 0;
			int num13 = 0;
			while (this.m_char_buffer[num13] != 0)
			{
				int num14 = this.m_char_buffer[num13];
				this.m_textElementType = TMP_TextElementType.Character;
				this.m_currentMaterialIndex = this.m_textInfo.characterInfo[this.m_characterCount].materialReferenceIndex;
				this.m_currentFontAsset = this.m_materialReferences[this.m_currentMaterialIndex].fontAsset;
				int currentMaterialIndex = this.m_currentMaterialIndex;
				if (!this.m_isRichText || num14 != 60)
				{
					goto IL_4FE;
				}
				this.m_isParsingText = true;
				if (!base.ValidateHtmlTag(this.m_char_buffer, num13 + 1, out num12))
				{
					goto IL_4FE;
				}
				num13 = num12;
				if (this.m_textElementType != TMP_TextElementType.Character)
				{
					goto IL_4FE;
				}
				IL_2D3F:
				num13++;
				continue;
				IL_4FE:
				this.m_isParsingText = false;
				bool isUsingAlternateTypeface = this.m_textInfo.characterInfo[this.m_characterCount].isUsingAlternateTypeface;
				float num15 = 1f;
				if (this.m_textElementType == TMP_TextElementType.Character)
				{
					if ((this.m_style & FontStyles.UpperCase) == FontStyles.UpperCase)
					{
						if (char.IsLower((char)num14))
						{
							num14 = (int)char.ToUpper((char)num14);
						}
					}
					else if ((this.m_style & FontStyles.LowerCase) == FontStyles.LowerCase)
					{
						if (char.IsUpper((char)num14))
						{
							num14 = (int)char.ToLower((char)num14);
						}
					}
					else if (((this.m_fontStyle & FontStyles.SmallCaps) == FontStyles.SmallCaps || (this.m_style & FontStyles.SmallCaps) == FontStyles.SmallCaps) && char.IsLower((char)num14))
					{
						num15 = 0.8f;
						num14 = (int)char.ToUpper((char)num14);
					}
				}
				if (this.m_textElementType == TMP_TextElementType.Sprite)
				{
					TMP_Sprite tmp_Sprite = this.m_currentSpriteAsset.spriteInfoList[this.m_spriteIndex];
					if (tmp_Sprite == null)
					{
						goto IL_2D3F;
					}
					num14 = 57344 + this.m_spriteIndex;
					this.m_currentFontAsset = this.m_fontAsset;
					float num16 = this.m_currentFontSize / this.m_fontAsset.fontInfo.PointSize * this.m_fontAsset.fontInfo.Scale * ((!this.m_isOrthographic) ? 0.1f : 1f);
					num2 = this.m_fontAsset.fontInfo.Ascender / tmp_Sprite.height * tmp_Sprite.scale * num16;
					this.m_cached_TextElement = tmp_Sprite;
					this.m_textInfo.characterInfo[this.m_characterCount].elementType = TMP_TextElementType.Sprite;
					this.m_textInfo.characterInfo[this.m_characterCount].scale = num16;
					this.m_textInfo.characterInfo[this.m_characterCount].spriteAsset = this.m_currentSpriteAsset;
					this.m_textInfo.characterInfo[this.m_characterCount].fontAsset = this.m_currentFontAsset;
					this.m_textInfo.characterInfo[this.m_characterCount].materialReferenceIndex = this.m_currentMaterialIndex;
					this.m_currentMaterialIndex = currentMaterialIndex;
					num3 = 0f;
				}
				else if (this.m_textElementType == TMP_TextElementType.Character)
				{
					this.m_cached_TextElement = this.m_textInfo.characterInfo[this.m_characterCount].textElement;
					if (this.m_cached_TextElement == null)
					{
						goto IL_2D3F;
					}
					this.m_currentFontAsset = this.m_textInfo.characterInfo[this.m_characterCount].fontAsset;
					this.m_currentMaterial = this.m_textInfo.characterInfo[this.m_characterCount].material;
					this.m_currentMaterialIndex = this.m_textInfo.characterInfo[this.m_characterCount].materialReferenceIndex;
					this.m_fontScale = this.m_currentFontSize * num15 / this.m_currentFontAsset.fontInfo.PointSize * this.m_currentFontAsset.fontInfo.Scale * ((!this.m_isOrthographic) ? 0.1f : 1f);
					num2 = this.m_fontScale * this.m_fontScaleMultiplier * this.m_cached_TextElement.scale;
					this.m_textInfo.characterInfo[this.m_characterCount].elementType = TMP_TextElementType.Character;
					this.m_textInfo.characterInfo[this.m_characterCount].scale = num2;
					num3 = ((this.m_currentMaterialIndex != 0) ? this.m_subTextObjects[this.m_currentMaterialIndex].padding : this.m_padding);
				}
				float num17 = num2;
				if (num14 == 173)
				{
					num2 = 0f;
				}
				if (this.m_isRightToLeft)
				{
					this.m_xAdvance -= ((this.m_cached_TextElement.xAdvance * num4 + this.m_characterSpacing + this.m_currentFontAsset.normalSpacingOffset) * num2 + this.m_cSpacing) * (1f - this.m_charWidthAdjDelta);
				}
				this.m_textInfo.characterInfo[this.m_characterCount].character = (char)num14;
				this.m_textInfo.characterInfo[this.m_characterCount].pointSize = this.m_currentFontSize;
				this.m_textInfo.characterInfo[this.m_characterCount].color = this.m_htmlColor;
				this.m_textInfo.characterInfo[this.m_characterCount].style = this.m_style;
				this.m_textInfo.characterInfo[this.m_characterCount].index = (short)num13;
				if (this.m_enableKerning && this.m_characterCount >= 1)
				{
					int character = (int)this.m_textInfo.characterInfo[this.m_characterCount - 1].character;
					KerningPairKey kerningPairKey = new KerningPairKey(character, num14);
					KerningPair kerningPair;
					this.m_currentFontAsset.kerningDictionary.TryGetValue(kerningPairKey.key, out kerningPair);
					if (kerningPair != null)
					{
						this.m_xAdvance += kerningPair.XadvanceOffset * num2;
					}
				}
				float num18 = 0f;
				if (this.m_monoSpacing != 0f)
				{
					num18 = (this.m_monoSpacing / 2f - (this.m_cached_TextElement.width / 2f + this.m_cached_TextElement.xOffset) * num2) * (1f - this.m_charWidthAdjDelta);
					this.m_xAdvance += num18;
				}
				float num19;
				if (this.m_textElementType == TMP_TextElementType.Character && !isUsingAlternateTypeface && ((this.m_style & FontStyles.Bold) == FontStyles.Bold || (this.m_fontStyle & FontStyles.Bold) == FontStyles.Bold))
				{
					num19 = this.m_currentFontAsset.boldStyle * 2f;
					num4 = 1f + this.m_currentFontAsset.boldSpacing * 0.01f;
				}
				else
				{
					num19 = this.m_currentFontAsset.normalStyle * 2f;
					num4 = 1f;
				}
				float baseline = this.m_currentFontAsset.fontInfo.Baseline;
				Vector3 vector = new Vector3(this.m_xAdvance + (this.m_cached_TextElement.xOffset - num3 - num19) * num2 * (1f - this.m_charWidthAdjDelta), (baseline + this.m_cached_TextElement.yOffset + num3) * num2 - this.m_lineOffset + this.m_baselineOffset, 0f);
				Vector3 vector2 = new Vector3(vector.x, vector.y - (this.m_cached_TextElement.height + num3 * 2f) * num2, 0f);
				Vector3 vector3 = new Vector3(vector2.x + (this.m_cached_TextElement.width + num3 * 2f + num19 * 2f) * num2 * (1f - this.m_charWidthAdjDelta), vector.y, 0f);
				Vector3 vector4 = new Vector3(vector3.x, vector2.y, 0f);
				if (this.m_textElementType == TMP_TextElementType.Character && !isUsingAlternateTypeface && ((this.m_style & FontStyles.Italic) == FontStyles.Italic || (this.m_fontStyle & FontStyles.Italic) == FontStyles.Italic))
				{
					float num20 = (float)this.m_currentFontAsset.italicStyle * 0.01f;
					Vector3 b = new Vector3(num20 * ((this.m_cached_TextElement.yOffset + num3 + num19) * num2), 0f, 0f);
					Vector3 b2 = new Vector3(num20 * ((this.m_cached_TextElement.yOffset - this.m_cached_TextElement.height - num3 - num19) * num2), 0f, 0f);
					vector += b;
					vector2 += b2;
					vector3 += b;
					vector4 += b2;
				}
				this.m_textInfo.characterInfo[this.m_characterCount].bottomLeft = vector2;
				this.m_textInfo.characterInfo[this.m_characterCount].topLeft = vector;
				this.m_textInfo.characterInfo[this.m_characterCount].topRight = vector3;
				this.m_textInfo.characterInfo[this.m_characterCount].bottomRight = vector4;
				this.m_textInfo.characterInfo[this.m_characterCount].origin = this.m_xAdvance;
				this.m_textInfo.characterInfo[this.m_characterCount].baseLine = 0f - this.m_lineOffset + this.m_baselineOffset;
				this.m_textInfo.characterInfo[this.m_characterCount].aspectRatio = (vector3.x - vector2.x) / (vector.y - vector2.y);
				float num21 = this.m_currentFontAsset.fontInfo.Ascender * ((this.m_textElementType != TMP_TextElementType.Character) ? this.m_textInfo.characterInfo[this.m_characterCount].scale : num2) + this.m_baselineOffset;
				this.m_textInfo.characterInfo[this.m_characterCount].ascender = num21 - this.m_lineOffset;
				this.m_maxLineAscender = ((num21 <= this.m_maxLineAscender) ? this.m_maxLineAscender : num21);
				float num22 = this.m_currentFontAsset.fontInfo.Descender * ((this.m_textElementType != TMP_TextElementType.Character) ? this.m_textInfo.characterInfo[this.m_characterCount].scale : num2) + this.m_baselineOffset;
				float num23 = this.m_textInfo.characterInfo[this.m_characterCount].descender = num22 - this.m_lineOffset;
				this.m_maxLineDescender = ((num22 >= this.m_maxLineDescender) ? this.m_maxLineDescender : num22);
				if ((this.m_style & FontStyles.Subscript) == FontStyles.Subscript || (this.m_style & FontStyles.Superscript) == FontStyles.Superscript)
				{
					float num24 = (num21 - this.m_baselineOffset) / this.m_currentFontAsset.fontInfo.SubSize;
					num21 = this.m_maxLineAscender;
					this.m_maxLineAscender = ((num24 <= this.m_maxLineAscender) ? this.m_maxLineAscender : num24);
					float num25 = (num22 - this.m_baselineOffset) / this.m_currentFontAsset.fontInfo.SubSize;
					num22 = this.m_maxLineDescender;
					this.m_maxLineDescender = ((num25 >= this.m_maxLineDescender) ? this.m_maxLineDescender : num25);
				}
				if (this.m_lineNumber == 0)
				{
					this.m_maxAscender = ((this.m_maxAscender <= num21) ? num21 : this.m_maxAscender);
					this.m_maxCapHeight = Mathf.Max(this.m_maxCapHeight, this.m_currentFontAsset.fontInfo.CapHeight * num2);
				}
				if (this.m_lineOffset == 0f)
				{
					num9 = ((num9 <= num21) ? num21 : num9);
				}
				this.m_textInfo.characterInfo[this.m_characterCount].isVisible = false;
				if (num14 == 9 || !char.IsWhiteSpace((char)num14) || this.m_textElementType == TMP_TextElementType.Sprite)
				{
					this.m_textInfo.characterInfo[this.m_characterCount].isVisible = true;
					num8 = ((this.m_width == -1f) ? (marginWidth + 0.0001f - this.m_marginLeft - this.m_marginRight) : Mathf.Min(marginWidth + 0.0001f - this.m_marginLeft - this.m_marginRight, this.m_width));
					this.m_textInfo.lineInfo[this.m_lineNumber].marginLeft = this.m_marginLeft;
					if (Mathf.Abs(this.m_xAdvance) + (this.m_isRightToLeft ? 0f : this.m_cached_TextElement.xAdvance) * (1f - this.m_charWidthAdjDelta) * ((num14 == 173) ? num17 : num2) > num8)
					{
						num7 = this.m_characterCount - 1;
						if (base.enableWordWrapping && this.m_characterCount != this.m_firstCharacterOfLine)
						{
							if (num11 == this.m_SavedWordWrapState.previous_WordBreak || flag5)
							{
								if (this.m_enableAutoSizing && this.m_fontSize > this.m_fontSizeMin)
								{
									if (this.m_charWidthAdjDelta < this.m_charWidthMaxAdj / 100f)
									{
										this.loopCountA = 0;
										this.m_charWidthAdjDelta += 0.01f;
										this.GenerateTextMesh();
										return;
									}
									this.m_maxFontSize = this.m_fontSize;
									this.m_fontSize -= Mathf.Max((this.m_fontSize - this.m_minFontSize) / 2f, 0.05f);
									this.m_fontSize = (float)((int)(Mathf.Max(this.m_fontSize, this.m_fontSizeMin) * 20f + 0.5f)) / 20f;
									if (this.loopCountA > 20)
									{
										return;
									}
									this.GenerateTextMesh();
									return;
								}
								else
								{
									if (!this.m_isCharacterWrappingEnabled)
									{
										this.m_isCharacterWrappingEnabled = true;
									}
									else
									{
										flag6 = true;
									}
									this.m_recursiveCount++;
									if (this.m_recursiveCount > 20)
									{
										goto IL_2D3F;
									}
								}
							}
							num13 = base.RestoreWordWrappingState(ref this.m_SavedWordWrapState);
							num11 = num13;
							if (this.m_char_buffer[num13] == 173)
							{
								this.m_isTextTruncated = true;
								this.m_char_buffer[num13] = 45;
								this.GenerateTextMesh();
								return;
							}
							if (this.m_lineNumber > 0 && !TMP_Math.Approximately(this.m_maxLineAscender, this.m_startOfLineAscender) && this.m_lineHeight == 0f && !this.m_isNewPage)
							{
								float num26 = this.m_maxLineAscender - this.m_startOfLineAscender;
								this.AdjustLineOffset(this.m_firstCharacterOfLine, this.m_characterCount, num26);
								this.m_lineOffset += num26;
								this.m_SavedWordWrapState.lineOffset = this.m_lineOffset;
								this.m_SavedWordWrapState.previousLineAscender = this.m_maxLineAscender;
							}
							this.m_isNewPage = false;
							float num27 = this.m_maxLineAscender - this.m_lineOffset;
							float num28 = this.m_maxLineDescender - this.m_lineOffset;
							this.m_maxDescender = ((this.m_maxDescender >= num28) ? num28 : this.m_maxDescender);
							if (!flag4)
							{
								num10 = this.m_maxDescender;
							}
							if (this.m_useMaxVisibleDescender && (this.m_characterCount >= this.m_maxVisibleCharacters || this.m_lineNumber >= this.m_maxVisibleLines))
							{
								flag4 = true;
							}
							this.m_textInfo.lineInfo[this.m_lineNumber].firstCharacterIndex = this.m_firstCharacterOfLine;
							this.m_textInfo.lineInfo[this.m_lineNumber].firstVisibleCharacterIndex = (this.m_firstVisibleCharacterOfLine = ((this.m_firstCharacterOfLine <= this.m_firstVisibleCharacterOfLine) ? this.m_firstVisibleCharacterOfLine : this.m_firstCharacterOfLine));
							this.m_textInfo.lineInfo[this.m_lineNumber].lastCharacterIndex = (this.m_lastCharacterOfLine = ((this.m_characterCount - 1 <= 0) ? 0 : (this.m_characterCount - 1)));
							this.m_textInfo.lineInfo[this.m_lineNumber].lastVisibleCharacterIndex = (this.m_lastVisibleCharacterOfLine = ((this.m_lastVisibleCharacterOfLine >= this.m_firstVisibleCharacterOfLine) ? this.m_lastVisibleCharacterOfLine : this.m_firstVisibleCharacterOfLine));
							this.m_textInfo.lineInfo[this.m_lineNumber].characterCount = this.m_textInfo.lineInfo[this.m_lineNumber].lastCharacterIndex - this.m_textInfo.lineInfo[this.m_lineNumber].firstCharacterIndex + 1;
							this.m_textInfo.lineInfo[this.m_lineNumber].visibleCharacterCount = this.m_lineVisibleCharacterCount;
							this.m_textInfo.lineInfo[this.m_lineNumber].lineExtents.min = new Vector2(this.m_textInfo.characterInfo[this.m_firstVisibleCharacterOfLine].bottomLeft.x, num28);
							this.m_textInfo.lineInfo[this.m_lineNumber].lineExtents.max = new Vector2(this.m_textInfo.characterInfo[this.m_lastVisibleCharacterOfLine].topRight.x, num27);
							this.m_textInfo.lineInfo[this.m_lineNumber].length = this.m_textInfo.lineInfo[this.m_lineNumber].lineExtents.max.x;
							this.m_textInfo.lineInfo[this.m_lineNumber].width = num8;
							this.m_textInfo.lineInfo[this.m_lineNumber].maxAdvance = this.m_textInfo.characterInfo[this.m_lastVisibleCharacterOfLine].xAdvance - (this.m_characterSpacing + this.m_currentFontAsset.normalSpacingOffset) * num2 - this.m_cSpacing;
							this.m_textInfo.lineInfo[this.m_lineNumber].baseline = 0f - this.m_lineOffset;
							this.m_textInfo.lineInfo[this.m_lineNumber].ascender = num27;
							this.m_textInfo.lineInfo[this.m_lineNumber].descender = num28;
							this.m_textInfo.lineInfo[this.m_lineNumber].lineHeight = num27 - num28 + num5 * num;
							this.m_firstCharacterOfLine = this.m_characterCount;
							this.m_lineVisibleCharacterCount = 0;
							base.SaveWordWrappingState(ref this.m_SavedLineState, num13, this.m_characterCount - 1);
							this.m_lineNumber++;
							flag3 = true;
							if (this.m_lineNumber >= this.m_textInfo.lineInfo.Length)
							{
								base.ResizeLineExtents(this.m_lineNumber);
							}
							if (this.m_lineHeight == 0f)
							{
								float num29 = this.m_textInfo.characterInfo[this.m_characterCount].ascender - this.m_textInfo.characterInfo[this.m_characterCount].baseLine;
								float num30 = 0f - this.m_maxLineDescender + num29 + (num5 + this.m_lineSpacing + this.m_lineSpacingDelta) * num;
								this.m_lineOffset += num30;
								this.m_startOfLineAscender = num29;
							}
							else
							{
								this.m_lineOffset += this.m_lineHeight + this.m_lineSpacing * num;
							}
							this.m_maxLineAscender = TMP_Text.k_LargeNegativeFloat;
							this.m_maxLineDescender = TMP_Text.k_LargePositiveFloat;
							this.m_xAdvance = this.tag_Indent;
							goto IL_2D3F;
						}
						else if (this.m_enableAutoSizing && this.m_fontSize > this.m_fontSizeMin)
						{
							if (this.m_charWidthAdjDelta < this.m_charWidthMaxAdj / 100f)
							{
								this.loopCountA = 0;
								this.m_charWidthAdjDelta += 0.01f;
								this.GenerateTextMesh();
								return;
							}
							this.m_maxFontSize = this.m_fontSize;
							this.m_fontSize -= Mathf.Max((this.m_fontSize - this.m_minFontSize) / 2f, 0.05f);
							this.m_fontSize = (float)((int)(Mathf.Max(this.m_fontSize, this.m_fontSizeMin) * 20f + 0.5f)) / 20f;
							this.m_recursiveCount = 0;
							if (this.loopCountA > 20)
							{
								return;
							}
							this.GenerateTextMesh();
							return;
						}
						else
						{
							switch (this.m_overflowMode)
							{
							case TextOverflowModes.Overflow:
								if (this.m_isMaskingEnabled)
								{
									this.DisableMasking();
								}
								break;
							case TextOverflowModes.Ellipsis:
								if (this.m_isMaskingEnabled)
								{
									this.DisableMasking();
								}
								this.m_isTextTruncated = true;
								if (this.m_characterCount >= 1)
								{
									this.m_char_buffer[num13 - 1] = 8230;
									this.m_char_buffer[num13] = 0;
									if (this.m_cached_Ellipsis_GlyphInfo != null)
									{
										this.m_textInfo.characterInfo[num7].character = '…';
										this.m_textInfo.characterInfo[num7].textElement = this.m_cached_Ellipsis_GlyphInfo;
										this.m_textInfo.characterInfo[num7].fontAsset = this.m_materialReferences[0].fontAsset;
										this.m_textInfo.characterInfo[num7].material = this.m_materialReferences[0].material;
										this.m_textInfo.characterInfo[num7].materialReferenceIndex = 0;
									}
									else
									{
										Debug.LogWarning("Unable to use Ellipsis character since it wasn't found in the current Font Asset [" + this.m_fontAsset.name + "]. Consider regenerating this font asset to include the Ellipsis character (u+2026).\nNote: Warnings can be disabled in the TMP Settings file.", this);
									}
									this.m_totalCharacterCount = num7 + 1;
									this.GenerateTextMesh();
									return;
								}
								this.m_textInfo.characterInfo[this.m_characterCount].isVisible = false;
								break;
							case TextOverflowModes.Masking:
								if (!this.m_isMaskingEnabled)
								{
									this.EnableMasking();
								}
								break;
							case TextOverflowModes.Truncate:
								if (this.m_isMaskingEnabled)
								{
									this.DisableMasking();
								}
								this.m_textInfo.characterInfo[this.m_characterCount].isVisible = false;
								break;
							case TextOverflowModes.ScrollRect:
								if (!this.m_isMaskingEnabled)
								{
									this.EnableMasking();
								}
								break;
							}
						}
					}
					if (num14 != 9)
					{
						Color32 vertexColor;
						if (this.m_overrideHtmlColors)
						{
							vertexColor = this.m_fontColor32;
						}
						else
						{
							vertexColor = this.m_htmlColor;
						}
						if (this.m_textElementType == TMP_TextElementType.Character)
						{
							this.SaveGlyphVertexInfo(num3, num19, vertexColor);
						}
						else if (this.m_textElementType == TMP_TextElementType.Sprite)
						{
							this.SaveSpriteVertexInfo(vertexColor);
						}
					}
					else
					{
						this.m_textInfo.characterInfo[this.m_characterCount].isVisible = false;
						this.m_lastVisibleCharacterOfLine = this.m_characterCount;
						TMP_LineInfo[] lineInfo = this.m_textInfo.lineInfo;
						int lineNumber = this.m_lineNumber;
						lineInfo[lineNumber].spaceCount = lineInfo[lineNumber].spaceCount + 1;
						this.m_textInfo.spaceCount++;
					}
					if (this.m_textInfo.characterInfo[this.m_characterCount].isVisible && num14 != 173)
					{
						if (flag3)
						{
							flag3 = false;
							this.m_firstVisibleCharacterOfLine = this.m_characterCount;
						}
						this.m_lineVisibleCharacterCount++;
						this.m_lastVisibleCharacterOfLine = this.m_characterCount;
					}
				}
				else if ((num14 == 10 || char.IsSeparator((char)num14)) && num14 != 173 && num14 != 8203 && num14 != 8288)
				{
					TMP_LineInfo[] lineInfo2 = this.m_textInfo.lineInfo;
					int lineNumber2 = this.m_lineNumber;
					lineInfo2[lineNumber2].spaceCount = lineInfo2[lineNumber2].spaceCount + 1;
					this.m_textInfo.spaceCount++;
				}
				if (this.m_lineNumber > 0 && !TMP_Math.Approximately(this.m_maxLineAscender, this.m_startOfLineAscender) && this.m_lineHeight == 0f && !this.m_isNewPage)
				{
					float num31 = this.m_maxLineAscender - this.m_startOfLineAscender;
					this.AdjustLineOffset(this.m_firstCharacterOfLine, this.m_characterCount, num31);
					num23 -= num31;
					this.m_lineOffset += num31;
					this.m_startOfLineAscender += num31;
					this.m_SavedWordWrapState.lineOffset = this.m_lineOffset;
					this.m_SavedWordWrapState.previousLineAscender = this.m_startOfLineAscender;
				}
				this.m_textInfo.characterInfo[this.m_characterCount].lineNumber = (short)this.m_lineNumber;
				this.m_textInfo.characterInfo[this.m_characterCount].pageNumber = (short)this.m_pageNumber;
				if ((num14 != 10 && num14 != 13 && num14 != 8230) || this.m_textInfo.lineInfo[this.m_lineNumber].characterCount == 1)
				{
					this.m_textInfo.lineInfo[this.m_lineNumber].alignment = this.m_lineJustification;
				}
				if (this.m_maxAscender - num23 > marginHeight + 0.0001f)
				{
					if (this.m_enableAutoSizing && this.m_lineSpacingDelta > this.m_lineSpacingMax && this.m_lineNumber > 0)
					{
						this.loopCountA = 0;
						this.m_lineSpacingDelta -= 1f;
						this.GenerateTextMesh();
						return;
					}
					if (this.m_enableAutoSizing && this.m_fontSize > this.m_fontSizeMin)
					{
						this.m_maxFontSize = this.m_fontSize;
						this.m_fontSize -= Mathf.Max((this.m_fontSize - this.m_minFontSize) / 2f, 0.05f);
						this.m_fontSize = (float)((int)(Mathf.Max(this.m_fontSize, this.m_fontSizeMin) * 20f + 0.5f)) / 20f;
						this.m_recursiveCount = 0;
						if (this.loopCountA > 20)
						{
							return;
						}
						this.GenerateTextMesh();
						return;
					}
					else
					{
						switch (this.m_overflowMode)
						{
						case TextOverflowModes.Overflow:
							if (this.m_isMaskingEnabled)
							{
								this.DisableMasking();
							}
							break;
						case TextOverflowModes.Ellipsis:
							if (this.m_isMaskingEnabled)
							{
								this.DisableMasking();
							}
							if (this.m_lineNumber > 0)
							{
								this.m_char_buffer[(int)this.m_textInfo.characterInfo[num7].index] = 8230;
								this.m_char_buffer[(int)(this.m_textInfo.characterInfo[num7].index + 1)] = 0;
								if (this.m_cached_Ellipsis_GlyphInfo != null)
								{
									this.m_textInfo.characterInfo[num7].character = '…';
									this.m_textInfo.characterInfo[num7].textElement = this.m_cached_Ellipsis_GlyphInfo;
									this.m_textInfo.characterInfo[num7].fontAsset = this.m_materialReferences[0].fontAsset;
									this.m_textInfo.characterInfo[num7].material = this.m_materialReferences[0].material;
									this.m_textInfo.characterInfo[num7].materialReferenceIndex = 0;
								}
								else
								{
									Debug.LogWarning("Unable to use Ellipsis character since it wasn't found in the current Font Asset [" + this.m_fontAsset.name + "]. Consider regenerating this font asset to include the Ellipsis character (u+2026).\nNote: Warnings can be disabled in the TMP Settings file.", this);
								}
								this.m_totalCharacterCount = num7 + 1;
								this.GenerateTextMesh();
								this.m_isTextTruncated = true;
								return;
							}
							this.ClearMesh(false);
							return;
						case TextOverflowModes.Masking:
							if (!this.m_isMaskingEnabled)
							{
								this.EnableMasking();
							}
							break;
						case TextOverflowModes.Truncate:
							if (this.m_isMaskingEnabled)
							{
								this.DisableMasking();
							}
							if (this.m_lineNumber > 0)
							{
								this.m_char_buffer[(int)(this.m_textInfo.characterInfo[num7].index + 1)] = 0;
								this.m_totalCharacterCount = num7 + 1;
								this.GenerateTextMesh();
								this.m_isTextTruncated = true;
								return;
							}
							this.ClearMesh(false);
							return;
						case TextOverflowModes.ScrollRect:
							if (!this.m_isMaskingEnabled)
							{
								this.EnableMasking();
							}
							break;
						case TextOverflowModes.Page:
							if (this.m_isMaskingEnabled)
							{
								this.DisableMasking();
							}
							if (num14 != 13 && num14 != 10)
							{
								num13 = base.RestoreWordWrappingState(ref this.m_SavedLineState);
								if (num13 == 0)
								{
									this.ClearMesh(false);
									return;
								}
								this.m_isNewPage = true;
								this.m_xAdvance = this.tag_Indent;
								this.m_lineOffset = 0f;
								this.m_lineNumber++;
								this.m_pageNumber++;
								goto IL_2D3F;
							}
							break;
						}
					}
				}
				if (num14 == 9)
				{
					float num32 = this.m_currentFontAsset.fontInfo.TabWidth * num2;
					float num33 = Mathf.Ceil(this.m_xAdvance / num32) * num32;
					this.m_xAdvance = ((num33 <= this.m_xAdvance) ? (this.m_xAdvance + num32) : num33);
				}
				else if (this.m_monoSpacing != 0f)
				{
					this.m_xAdvance += (this.m_monoSpacing - num18 + (this.m_characterSpacing + this.m_currentFontAsset.normalSpacingOffset) * num2 + this.m_cSpacing) * (1f - this.m_charWidthAdjDelta);
				}
				else if (!this.m_isRightToLeft)
				{
					this.m_xAdvance += ((this.m_cached_TextElement.xAdvance * num4 + this.m_characterSpacing + this.m_currentFontAsset.normalSpacingOffset) * num2 + this.m_cSpacing) * (1f - this.m_charWidthAdjDelta);
				}
				this.m_textInfo.characterInfo[this.m_characterCount].xAdvance = this.m_xAdvance;
				if (num14 == 13)
				{
					this.m_xAdvance = this.tag_Indent;
				}
				if (num14 == 10 || this.m_characterCount == totalCharacterCount - 1)
				{
					if (this.m_lineNumber > 0 && !TMP_Math.Approximately(this.m_maxLineAscender, this.m_startOfLineAscender) && this.m_lineHeight == 0f && !this.m_isNewPage)
					{
						float num34 = this.m_maxLineAscender - this.m_startOfLineAscender;
						this.AdjustLineOffset(this.m_firstCharacterOfLine, this.m_characterCount, num34);
						num23 -= num34;
						this.m_lineOffset += num34;
					}
					this.m_isNewPage = false;
					float num35 = this.m_maxLineAscender - this.m_lineOffset;
					float num36 = this.m_maxLineDescender - this.m_lineOffset;
					this.m_maxDescender = ((this.m_maxDescender >= num36) ? num36 : this.m_maxDescender);
					if (!flag4)
					{
						num10 = this.m_maxDescender;
					}
					if (this.m_useMaxVisibleDescender && (this.m_characterCount >= this.m_maxVisibleCharacters || this.m_lineNumber >= this.m_maxVisibleLines))
					{
						flag4 = true;
					}
					this.m_textInfo.lineInfo[this.m_lineNumber].firstCharacterIndex = this.m_firstCharacterOfLine;
					this.m_textInfo.lineInfo[this.m_lineNumber].firstVisibleCharacterIndex = (this.m_firstVisibleCharacterOfLine = ((this.m_firstCharacterOfLine <= this.m_firstVisibleCharacterOfLine) ? this.m_firstVisibleCharacterOfLine : this.m_firstCharacterOfLine));
					this.m_textInfo.lineInfo[this.m_lineNumber].lastCharacterIndex = (this.m_lastCharacterOfLine = this.m_characterCount);
					this.m_textInfo.lineInfo[this.m_lineNumber].lastVisibleCharacterIndex = (this.m_lastVisibleCharacterOfLine = ((this.m_lastVisibleCharacterOfLine >= this.m_firstVisibleCharacterOfLine) ? this.m_lastVisibleCharacterOfLine : this.m_firstVisibleCharacterOfLine));
					this.m_textInfo.lineInfo[this.m_lineNumber].characterCount = this.m_textInfo.lineInfo[this.m_lineNumber].lastCharacterIndex - this.m_textInfo.lineInfo[this.m_lineNumber].firstCharacterIndex + 1;
					this.m_textInfo.lineInfo[this.m_lineNumber].visibleCharacterCount = this.m_lineVisibleCharacterCount;
					this.m_textInfo.lineInfo[this.m_lineNumber].lineExtents.min = new Vector2(this.m_textInfo.characterInfo[this.m_firstVisibleCharacterOfLine].bottomLeft.x, num36);
					this.m_textInfo.lineInfo[this.m_lineNumber].lineExtents.max = new Vector2(this.m_textInfo.characterInfo[this.m_lastVisibleCharacterOfLine].topRight.x, num35);
					this.m_textInfo.lineInfo[this.m_lineNumber].length = this.m_textInfo.lineInfo[this.m_lineNumber].lineExtents.max.x - num3 * num2;
					this.m_textInfo.lineInfo[this.m_lineNumber].width = num8;
					if (this.m_textInfo.lineInfo[this.m_lineNumber].characterCount == 1)
					{
						this.m_textInfo.lineInfo[this.m_lineNumber].alignment = this.m_lineJustification;
					}
					if (this.m_textInfo.characterInfo[this.m_lastVisibleCharacterOfLine].isVisible)
					{
						this.m_textInfo.lineInfo[this.m_lineNumber].maxAdvance = this.m_textInfo.characterInfo[this.m_lastVisibleCharacterOfLine].xAdvance - (this.m_characterSpacing + this.m_currentFontAsset.normalSpacingOffset) * num2 - this.m_cSpacing;
					}
					else
					{
						this.m_textInfo.lineInfo[this.m_lineNumber].maxAdvance = this.m_textInfo.characterInfo[this.m_lastCharacterOfLine].xAdvance - (this.m_characterSpacing + this.m_currentFontAsset.normalSpacingOffset) * num2 - this.m_cSpacing;
					}
					this.m_textInfo.lineInfo[this.m_lineNumber].baseline = 0f - this.m_lineOffset;
					this.m_textInfo.lineInfo[this.m_lineNumber].ascender = num35;
					this.m_textInfo.lineInfo[this.m_lineNumber].descender = num36;
					this.m_textInfo.lineInfo[this.m_lineNumber].lineHeight = num35 - num36 + num5 * num;
					this.m_firstCharacterOfLine = this.m_characterCount + 1;
					this.m_lineVisibleCharacterCount = 0;
					if (num14 == 10)
					{
						base.SaveWordWrappingState(ref this.m_SavedLineState, num13, this.m_characterCount);
						base.SaveWordWrappingState(ref this.m_SavedWordWrapState, num13, this.m_characterCount);
						this.m_lineNumber++;
						flag3 = true;
						if (this.m_lineNumber >= this.m_textInfo.lineInfo.Length)
						{
							base.ResizeLineExtents(this.m_lineNumber);
						}
						if (this.m_lineHeight == 0f)
						{
							float num30 = 0f - this.m_maxLineDescender + num21 + (num5 + this.m_lineSpacing + this.m_paragraphSpacing + this.m_lineSpacingDelta) * num;
							this.m_lineOffset += num30;
						}
						else
						{
							this.m_lineOffset += this.m_lineHeight + (this.m_lineSpacing + this.m_paragraphSpacing) * num;
						}
						this.m_maxLineAscender = TMP_Text.k_LargeNegativeFloat;
						this.m_maxLineDescender = TMP_Text.k_LargePositiveFloat;
						this.m_startOfLineAscender = num21;
						this.m_xAdvance = this.tag_LineIndent + this.tag_Indent;
						num7 = this.m_characterCount - 1;
						this.m_characterCount++;
						goto IL_2D3F;
					}
				}
				if (this.m_textInfo.characterInfo[this.m_characterCount].isVisible)
				{
					this.m_meshExtents.min.x = Mathf.Min(this.m_meshExtents.min.x, this.m_textInfo.characterInfo[this.m_characterCount].bottomLeft.x);
					this.m_meshExtents.min.y = Mathf.Min(this.m_meshExtents.min.y, this.m_textInfo.characterInfo[this.m_characterCount].bottomLeft.y);
					this.m_meshExtents.max.x = Mathf.Max(this.m_meshExtents.max.x, this.m_textInfo.characterInfo[this.m_characterCount].topRight.x);
					this.m_meshExtents.max.y = Mathf.Max(this.m_meshExtents.max.y, this.m_textInfo.characterInfo[this.m_characterCount].topRight.y);
				}
				if (this.m_overflowMode == TextOverflowModes.Page && num14 != 13 && num14 != 10 && this.m_pageNumber < 16)
				{
					this.m_textInfo.pageInfo[this.m_pageNumber].ascender = num9;
					this.m_textInfo.pageInfo[this.m_pageNumber].descender = ((num22 >= this.m_textInfo.pageInfo[this.m_pageNumber].descender) ? this.m_textInfo.pageInfo[this.m_pageNumber].descender : num22);
					if (this.m_pageNumber == 0 && this.m_characterCount == 0)
					{
						this.m_textInfo.pageInfo[this.m_pageNumber].firstCharacterIndex = this.m_characterCount;
					}
					else if (this.m_characterCount > 0 && this.m_pageNumber != (int)this.m_textInfo.characterInfo[this.m_characterCount - 1].pageNumber)
					{
						this.m_textInfo.pageInfo[this.m_pageNumber - 1].lastCharacterIndex = this.m_characterCount - 1;
						this.m_textInfo.pageInfo[this.m_pageNumber].firstCharacterIndex = this.m_characterCount;
					}
					else if (this.m_characterCount == totalCharacterCount - 1)
					{
						this.m_textInfo.pageInfo[this.m_pageNumber].lastCharacterIndex = this.m_characterCount;
					}
				}
				if (this.m_enableWordWrapping || this.m_overflowMode == TextOverflowModes.Truncate || this.m_overflowMode == TextOverflowModes.Ellipsis)
				{
					if ((char.IsWhiteSpace((char)num14) || num14 == 45 || num14 == 173) && !this.m_isNonBreakingSpace && num14 != 160 && num14 != 8209 && num14 != 8239 && num14 != 8288)
					{
						base.SaveWordWrappingState(ref this.m_SavedWordWrapState, num13, this.m_characterCount);
						this.m_isCharacterWrappingEnabled = false;
						flag5 = false;
					}
					else if (((num14 > 4352 && num14 < 4607) || (num14 > 11904 && num14 < 40959) || (num14 > 43360 && num14 < 43391) || (num14 > 44032 && num14 < 55295) || (num14 > 63744 && num14 < 64255) || (num14 > 65072 && num14 < 65103) || (num14 > 65280 && num14 < 65519)) && !this.m_isNonBreakingSpace)
					{
						if (flag5 || flag6 || (!TMP_Settings.linebreakingRules.leadingCharacters.ContainsKey(num14) && this.m_characterCount < totalCharacterCount - 1 && !TMP_Settings.linebreakingRules.followingCharacters.ContainsKey((int)this.m_textInfo.characterInfo[this.m_characterCount + 1].character)))
						{
							base.SaveWordWrappingState(ref this.m_SavedWordWrapState, num13, this.m_characterCount);
							this.m_isCharacterWrappingEnabled = false;
							flag5 = false;
						}
					}
					else if (flag5 || this.m_isCharacterWrappingEnabled || flag6)
					{
						base.SaveWordWrappingState(ref this.m_SavedWordWrapState, num13, this.m_characterCount);
					}
				}
				this.m_characterCount++;
				goto IL_2D3F;
			}
			float num37 = this.m_maxFontSize - this.m_minFontSize;
			if ((!this.m_textContainer.isDefaultWidth || !this.m_textContainer.isDefaultHeight) && !this.m_isCharacterWrappingEnabled && this.m_enableAutoSizing && num37 > 0.051f && this.m_fontSize < this.m_fontSizeMax)
			{
				this.m_minFontSize = this.m_fontSize;
				this.m_fontSize += Mathf.Max((this.m_maxFontSize - this.m_fontSize) / 2f, 0.05f);
				this.m_fontSize = (float)((int)(Mathf.Min(this.m_fontSize, this.m_fontSizeMax) * 20f + 0.5f)) / 20f;
				if (this.loopCountA > 20)
				{
					return;
				}
				this.GenerateTextMesh();
				return;
			}
			else
			{
				this.m_isCharacterWrappingEnabled = false;
				if (this.m_characterCount == 0)
				{
					this.ClearMesh(true);
					TMPro_EventManager.ON_TEXT_CHANGED(this);
					return;
				}
				int num38 = this.m_materialReferences[0].referenceCount * (this.m_isVolumetricText ? 8 : 4);
				this.m_textInfo.meshInfo[0].Clear(false);
				Vector3 a = Vector3.zero;
				Vector3[] textContainerLocalCorners = this.GetTextContainerLocalCorners();
				switch (this.m_textAlignment)
				{
				case TextAlignmentOptions.TopLeft:
				case TextAlignmentOptions.Top:
				case TextAlignmentOptions.TopRight:
				case TextAlignmentOptions.TopJustified:
					if (this.m_overflowMode != TextOverflowModes.Page)
					{
						a = textContainerLocalCorners[1] + new Vector3(margin.x, 0f - this.m_maxAscender - margin.y, 0f);
					}
					else
					{
						a = textContainerLocalCorners[1] + new Vector3(margin.x, 0f - this.m_textInfo.pageInfo[num6].ascender - margin.y, 0f);
					}
					break;
				case TextAlignmentOptions.Left:
				case TextAlignmentOptions.Center:
				case TextAlignmentOptions.Right:
				case TextAlignmentOptions.Justified:
					if (this.m_overflowMode != TextOverflowModes.Page)
					{
						a = (textContainerLocalCorners[0] + textContainerLocalCorners[1]) / 2f + new Vector3(margin.x, 0f - (this.m_maxAscender + margin.y + num10 - margin.w) / 2f, 0f);
					}
					else
					{
						a = (textContainerLocalCorners[0] + textContainerLocalCorners[1]) / 2f + new Vector3(margin.x, 0f - (this.m_textInfo.pageInfo[num6].ascender + margin.y + this.m_textInfo.pageInfo[num6].descender - margin.w) / 2f, 0f);
					}
					break;
				case TextAlignmentOptions.BottomLeft:
				case TextAlignmentOptions.Bottom:
				case TextAlignmentOptions.BottomRight:
				case TextAlignmentOptions.BottomJustified:
					if (this.m_overflowMode != TextOverflowModes.Page)
					{
						a = textContainerLocalCorners[0] + new Vector3(margin.x, 0f - num10 + margin.w, 0f);
					}
					else
					{
						a = textContainerLocalCorners[0] + new Vector3(margin.x, 0f - this.m_textInfo.pageInfo[num6].descender + margin.w, 0f);
					}
					break;
				case TextAlignmentOptions.BaselineLeft:
				case TextAlignmentOptions.Baseline:
				case TextAlignmentOptions.BaselineRight:
				case TextAlignmentOptions.BaselineJustified:
					a = (textContainerLocalCorners[0] + textContainerLocalCorners[1]) / 2f + new Vector3(margin.x, 0f, 0f);
					break;
				case TextAlignmentOptions.MidlineLeft:
				case TextAlignmentOptions.Midline:
				case TextAlignmentOptions.MidlineRight:
				case TextAlignmentOptions.MidlineJustified:
					a = (textContainerLocalCorners[0] + textContainerLocalCorners[1]) / 2f + new Vector3(margin.x, 0f - (this.m_meshExtents.max.y + margin.y + this.m_meshExtents.min.y - margin.w) / 2f, 0f);
					break;
				case TextAlignmentOptions.CaplineLeft:
				case TextAlignmentOptions.Capline:
				case TextAlignmentOptions.CaplineRight:
				case TextAlignmentOptions.CaplineJustified:
					a = (textContainerLocalCorners[0] + textContainerLocalCorners[1]) / 2f + new Vector3(margin.x, 0f - (this.m_maxCapHeight - margin.y - margin.w) / 2f, 0f);
					break;
				}
				Vector3 vector5 = Vector3.zero;
				Vector3 b3 = Vector3.zero;
				int index_X = 0;
				int index_X2 = 0;
				int num39 = 0;
				int num40 = 0;
				int num41 = 0;
				bool flag7 = false;
				int num42 = 0;
				float num43 = this.m_previousLossyScaleY = this.transform.lossyScale.y;
				Color32 underlineColor = Color.white;
				Color32 underlineColor2 = Color.white;
				float num44 = 0f;
				float num45 = 0f;
				float num46 = 0f;
				float num47 = TMP_Text.k_LargePositiveFloat;
				int num48 = 0;
				float num49 = 0f;
				float num50 = 0f;
				float b4 = 0f;
				TMP_CharacterInfo[] characterInfo = this.m_textInfo.characterInfo;
				for (int i = 0; i < this.m_characterCount; i++)
				{
					char character2 = characterInfo[i].character;
					int lineNumber3 = (int)characterInfo[i].lineNumber;
					TMP_LineInfo tmp_LineInfo = this.m_textInfo.lineInfo[lineNumber3];
					num40 = lineNumber3 + 1;
					switch (tmp_LineInfo.alignment)
					{
					case TextAlignmentOptions.TopLeft:
					case TextAlignmentOptions.Left:
					case TextAlignmentOptions.BottomLeft:
					case TextAlignmentOptions.BaselineLeft:
					case TextAlignmentOptions.MidlineLeft:
					case TextAlignmentOptions.CaplineLeft:
						if (!this.m_isRightToLeft)
						{
							vector5 = new Vector3(tmp_LineInfo.marginLeft, 0f, 0f);
						}
						else
						{
							vector5 = new Vector3(0f - tmp_LineInfo.maxAdvance, 0f, 0f);
						}
						break;
					case TextAlignmentOptions.Top:
					case TextAlignmentOptions.Center:
					case TextAlignmentOptions.Bottom:
					case TextAlignmentOptions.Baseline:
					case TextAlignmentOptions.Midline:
					case TextAlignmentOptions.Capline:
						vector5 = new Vector3(tmp_LineInfo.marginLeft + tmp_LineInfo.width / 2f - tmp_LineInfo.maxAdvance / 2f, 0f, 0f);
						break;
					case TextAlignmentOptions.TopRight:
					case TextAlignmentOptions.Right:
					case TextAlignmentOptions.BottomRight:
					case TextAlignmentOptions.BaselineRight:
					case TextAlignmentOptions.MidlineRight:
					case TextAlignmentOptions.CaplineRight:
						if (!this.m_isRightToLeft)
						{
							vector5 = new Vector3(tmp_LineInfo.marginLeft + tmp_LineInfo.width - tmp_LineInfo.maxAdvance, 0f, 0f);
						}
						else
						{
							vector5 = new Vector3(tmp_LineInfo.marginLeft + tmp_LineInfo.width, 0f, 0f);
						}
						break;
					case TextAlignmentOptions.TopJustified:
					case TextAlignmentOptions.Justified:
					case TextAlignmentOptions.BottomJustified:
					case TextAlignmentOptions.BaselineJustified:
					case TextAlignmentOptions.MidlineJustified:
					case TextAlignmentOptions.CaplineJustified:
						if (character2 != '­' && character2 != '​' && character2 != '⁠')
						{
							char character3 = characterInfo[tmp_LineInfo.lastCharacterIndex].character;
							if (!char.IsControl(character3) && lineNumber3 < this.m_lineNumber)
							{
								float num51 = this.m_isRightToLeft ? (tmp_LineInfo.width + tmp_LineInfo.maxAdvance) : (tmp_LineInfo.width - tmp_LineInfo.maxAdvance);
								float num52 = (tmp_LineInfo.spaceCount <= 2) ? 1f : this.m_wordWrappingRatios;
								if (lineNumber3 != num41 || i == 0)
								{
									if (!this.m_isRightToLeft)
									{
										vector5 = new Vector3(tmp_LineInfo.marginLeft, 0f, 0f);
									}
									else
									{
										vector5 = new Vector3(tmp_LineInfo.marginLeft + tmp_LineInfo.width, 0f, 0f);
									}
								}
								else if (character2 == '\t' || char.IsSeparator(character2))
								{
									int num53 = (!characterInfo[tmp_LineInfo.lastCharacterIndex].isVisible) ? (tmp_LineInfo.spaceCount - 1) : tmp_LineInfo.spaceCount;
									if (num53 < 1)
									{
										num53 = 1;
									}
									if (!this.m_isRightToLeft)
									{
										vector5 += new Vector3(num51 * (1f - num52) / (float)num53, 0f, 0f);
									}
									else
									{
										vector5 -= new Vector3(num51 * (1f - num52) / (float)num53, 0f, 0f);
									}
								}
								else if (!this.m_isRightToLeft)
								{
									vector5 += new Vector3(num51 * num52 / (float)(tmp_LineInfo.visibleCharacterCount - 1), 0f, 0f);
								}
								else
								{
									vector5 -= new Vector3(num51 * num52 / (float)(tmp_LineInfo.visibleCharacterCount - 1), 0f, 0f);
								}
							}
							else if (!this.m_isRightToLeft)
							{
								vector5 = new Vector3(tmp_LineInfo.marginLeft, 0f, 0f);
							}
							else
							{
								vector5 = new Vector3(tmp_LineInfo.marginLeft + tmp_LineInfo.width, 0f, 0f);
							}
						}
						break;
					}
					b3 = a + vector5;
					bool isVisible = characterInfo[i].isVisible;
					if (isVisible)
					{
						TMP_TextElementType elementType = characterInfo[i].elementType;
						if (elementType != TMP_TextElementType.Character)
						{
							if (elementType != TMP_TextElementType.Sprite)
							{
							}
						}
						else
						{
							Extents lineExtents = tmp_LineInfo.lineExtents;
							float num54 = this.m_uvLineOffset * (float)lineNumber3 % 1f + this.m_uvOffset.x;
							switch (this.m_horizontalMapping)
							{
							case TextureMappingOptions.Character:
								characterInfo[i].vertex_BL.uv2.x = this.m_uvOffset.x;
								characterInfo[i].vertex_TL.uv2.x = this.m_uvOffset.x;
								characterInfo[i].vertex_TR.uv2.x = 1f + this.m_uvOffset.x;
								characterInfo[i].vertex_BR.uv2.x = 1f + this.m_uvOffset.x;
								break;
							case TextureMappingOptions.Line:
								if (this.m_textAlignment != TextAlignmentOptions.Justified)
								{
									characterInfo[i].vertex_BL.uv2.x = (characterInfo[i].vertex_BL.position.x - lineExtents.min.x) / (lineExtents.max.x - lineExtents.min.x) + num54;
									characterInfo[i].vertex_TL.uv2.x = (characterInfo[i].vertex_TL.position.x - lineExtents.min.x) / (lineExtents.max.x - lineExtents.min.x) + num54;
									characterInfo[i].vertex_TR.uv2.x = (characterInfo[i].vertex_TR.position.x - lineExtents.min.x) / (lineExtents.max.x - lineExtents.min.x) + num54;
									characterInfo[i].vertex_BR.uv2.x = (characterInfo[i].vertex_BR.position.x - lineExtents.min.x) / (lineExtents.max.x - lineExtents.min.x) + num54;
								}
								else
								{
									characterInfo[i].vertex_BL.uv2.x = (characterInfo[i].vertex_BL.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
									characterInfo[i].vertex_TL.uv2.x = (characterInfo[i].vertex_TL.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
									characterInfo[i].vertex_TR.uv2.x = (characterInfo[i].vertex_TR.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
									characterInfo[i].vertex_BR.uv2.x = (characterInfo[i].vertex_BR.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
								}
								break;
							case TextureMappingOptions.Paragraph:
								characterInfo[i].vertex_BL.uv2.x = (characterInfo[i].vertex_BL.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
								characterInfo[i].vertex_TL.uv2.x = (characterInfo[i].vertex_TL.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
								characterInfo[i].vertex_TR.uv2.x = (characterInfo[i].vertex_TR.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
								characterInfo[i].vertex_BR.uv2.x = (characterInfo[i].vertex_BR.position.x + vector5.x - this.m_meshExtents.min.x) / (this.m_meshExtents.max.x - this.m_meshExtents.min.x) + num54;
								break;
							case TextureMappingOptions.MatchAspect:
							{
								switch (this.m_verticalMapping)
								{
								case TextureMappingOptions.Character:
									characterInfo[i].vertex_BL.uv2.y = this.m_uvOffset.y;
									characterInfo[i].vertex_TL.uv2.y = 1f + this.m_uvOffset.y;
									characterInfo[i].vertex_TR.uv2.y = this.m_uvOffset.y;
									characterInfo[i].vertex_BR.uv2.y = 1f + this.m_uvOffset.y;
									break;
								case TextureMappingOptions.Line:
									characterInfo[i].vertex_BL.uv2.y = (characterInfo[i].vertex_BL.position.y - lineExtents.min.y) / (lineExtents.max.y - lineExtents.min.y) + num54;
									characterInfo[i].vertex_TL.uv2.y = (characterInfo[i].vertex_TL.position.y - lineExtents.min.y) / (lineExtents.max.y - lineExtents.min.y) + num54;
									characterInfo[i].vertex_TR.uv2.y = characterInfo[i].vertex_BL.uv2.y;
									characterInfo[i].vertex_BR.uv2.y = characterInfo[i].vertex_TL.uv2.y;
									break;
								case TextureMappingOptions.Paragraph:
									characterInfo[i].vertex_BL.uv2.y = (characterInfo[i].vertex_BL.position.y - this.m_meshExtents.min.y) / (this.m_meshExtents.max.y - this.m_meshExtents.min.y) + num54;
									characterInfo[i].vertex_TL.uv2.y = (characterInfo[i].vertex_TL.position.y - this.m_meshExtents.min.y) / (this.m_meshExtents.max.y - this.m_meshExtents.min.y) + num54;
									characterInfo[i].vertex_TR.uv2.y = characterInfo[i].vertex_BL.uv2.y;
									characterInfo[i].vertex_BR.uv2.y = characterInfo[i].vertex_TL.uv2.y;
									break;
								case TextureMappingOptions.MatchAspect:
									Debug.Log("ERROR: Cannot Match both Vertical & Horizontal.");
									break;
								}
								float num55 = (1f - (characterInfo[i].vertex_BL.uv2.y + characterInfo[i].vertex_TL.uv2.y) * characterInfo[i].aspectRatio) / 2f;
								characterInfo[i].vertex_BL.uv2.x = characterInfo[i].vertex_BL.uv2.y * characterInfo[i].aspectRatio + num55 + num54;
								characterInfo[i].vertex_TL.uv2.x = characterInfo[i].vertex_BL.uv2.x;
								characterInfo[i].vertex_TR.uv2.x = characterInfo[i].vertex_TL.uv2.y * characterInfo[i].aspectRatio + num55 + num54;
								characterInfo[i].vertex_BR.uv2.x = characterInfo[i].vertex_TR.uv2.x;
								break;
							}
							}
							switch (this.m_verticalMapping)
							{
							case TextureMappingOptions.Character:
								characterInfo[i].vertex_BL.uv2.y = this.m_uvOffset.y;
								characterInfo[i].vertex_TL.uv2.y = 1f + this.m_uvOffset.y;
								characterInfo[i].vertex_TR.uv2.y = 1f + this.m_uvOffset.y;
								characterInfo[i].vertex_BR.uv2.y = this.m_uvOffset.y;
								break;
							case TextureMappingOptions.Line:
								characterInfo[i].vertex_BL.uv2.y = (characterInfo[i].vertex_BL.position.y - tmp_LineInfo.descender) / (tmp_LineInfo.ascender - tmp_LineInfo.descender) + this.m_uvOffset.y;
								characterInfo[i].vertex_TL.uv2.y = (characterInfo[i].vertex_TL.position.y - tmp_LineInfo.descender) / (tmp_LineInfo.ascender - tmp_LineInfo.descender) + this.m_uvOffset.y;
								characterInfo[i].vertex_TR.uv2.y = characterInfo[i].vertex_TL.uv2.y;
								characterInfo[i].vertex_BR.uv2.y = characterInfo[i].vertex_BL.uv2.y;
								break;
							case TextureMappingOptions.Paragraph:
								characterInfo[i].vertex_BL.uv2.y = (characterInfo[i].vertex_BL.position.y - this.m_meshExtents.min.y) / (this.m_meshExtents.max.y - this.m_meshExtents.min.y) + this.m_uvOffset.y;
								characterInfo[i].vertex_TL.uv2.y = (characterInfo[i].vertex_TL.position.y - this.m_meshExtents.min.y) / (this.m_meshExtents.max.y - this.m_meshExtents.min.y) + this.m_uvOffset.y;
								characterInfo[i].vertex_TR.uv2.y = characterInfo[i].vertex_TL.uv2.y;
								characterInfo[i].vertex_BR.uv2.y = characterInfo[i].vertex_BL.uv2.y;
								break;
							case TextureMappingOptions.MatchAspect:
							{
								float num56 = (1f - (characterInfo[i].vertex_BL.uv2.x + characterInfo[i].vertex_TR.uv2.x) / characterInfo[i].aspectRatio) / 2f;
								characterInfo[i].vertex_BL.uv2.y = num56 + characterInfo[i].vertex_BL.uv2.x / characterInfo[i].aspectRatio + this.m_uvOffset.y;
								characterInfo[i].vertex_TL.uv2.y = num56 + characterInfo[i].vertex_TR.uv2.x / characterInfo[i].aspectRatio + this.m_uvOffset.y;
								characterInfo[i].vertex_BR.uv2.y = characterInfo[i].vertex_BL.uv2.y;
								characterInfo[i].vertex_TR.uv2.y = characterInfo[i].vertex_TL.uv2.y;
								break;
							}
							}
							num44 = characterInfo[i].scale * num43 * (1f - this.m_charWidthAdjDelta);
							if (!characterInfo[i].isUsingAlternateTypeface && (characterInfo[i].style & FontStyles.Bold) == FontStyles.Bold)
							{
								num44 *= -1f;
							}
							float num57 = characterInfo[i].vertex_BL.uv2.x;
							float num58 = characterInfo[i].vertex_BL.uv2.y;
							float num59 = characterInfo[i].vertex_TR.uv2.x;
							float num60 = characterInfo[i].vertex_TR.uv2.y;
							float num61 = Mathf.Floor(num57);
							float num62 = Mathf.Floor(num58);
							num57 -= num61;
							num59 -= num61;
							num58 -= num62;
							num60 -= num62;
							characterInfo[i].vertex_BL.uv2.x = base.PackUV(num57, num58);
							characterInfo[i].vertex_BL.uv2.y = num44;
							characterInfo[i].vertex_TL.uv2.x = base.PackUV(num57, num60);
							characterInfo[i].vertex_TL.uv2.y = num44;
							characterInfo[i].vertex_TR.uv2.x = base.PackUV(num59, num60);
							characterInfo[i].vertex_TR.uv2.y = num44;
							characterInfo[i].vertex_BR.uv2.x = base.PackUV(num59, num58);
							characterInfo[i].vertex_BR.uv2.y = num44;
						}
						if (i < this.m_maxVisibleCharacters && lineNumber3 < this.m_maxVisibleLines && this.m_overflowMode != TextOverflowModes.Page)
						{
							TMP_CharacterInfo[] array = characterInfo;
							int num63 = i;
							array[num63].vertex_BL.position = array[num63].vertex_BL.position + b3;
							TMP_CharacterInfo[] array2 = characterInfo;
							int num64 = i;
							array2[num64].vertex_TL.position = array2[num64].vertex_TL.position + b3;
							TMP_CharacterInfo[] array3 = characterInfo;
							int num65 = i;
							array3[num65].vertex_TR.position = array3[num65].vertex_TR.position + b3;
							TMP_CharacterInfo[] array4 = characterInfo;
							int num66 = i;
							array4[num66].vertex_BR.position = array4[num66].vertex_BR.position + b3;
						}
						else if (i < this.m_maxVisibleCharacters && lineNumber3 < this.m_maxVisibleLines && this.m_overflowMode == TextOverflowModes.Page && (int)characterInfo[i].pageNumber == num6)
						{
							TMP_CharacterInfo[] array5 = characterInfo;
							int num67 = i;
							array5[num67].vertex_BL.position = array5[num67].vertex_BL.position + b3;
							TMP_CharacterInfo[] array6 = characterInfo;
							int num68 = i;
							array6[num68].vertex_TL.position = array6[num68].vertex_TL.position + b3;
							TMP_CharacterInfo[] array7 = characterInfo;
							int num69 = i;
							array7[num69].vertex_TR.position = array7[num69].vertex_TR.position + b3;
							TMP_CharacterInfo[] array8 = characterInfo;
							int num70 = i;
							array8[num70].vertex_BR.position = array8[num70].vertex_BR.position + b3;
						}
						else
						{
							characterInfo[i].vertex_BL.position = Vector3.zero;
							characterInfo[i].vertex_TL.position = Vector3.zero;
							characterInfo[i].vertex_TR.position = Vector3.zero;
							characterInfo[i].vertex_BR.position = Vector3.zero;
						}
						if (elementType == TMP_TextElementType.Character)
						{
							this.FillCharacterVertexBuffers(i, index_X, this.m_isVolumetricText);
						}
						else if (elementType == TMP_TextElementType.Sprite)
						{
							this.FillSpriteVertexBuffers(i, index_X2);
						}
					}
					TMP_CharacterInfo[] characterInfo2 = this.m_textInfo.characterInfo;
					int num71 = i;
					characterInfo2[num71].bottomLeft = characterInfo2[num71].bottomLeft + b3;
					TMP_CharacterInfo[] characterInfo3 = this.m_textInfo.characterInfo;
					int num72 = i;
					characterInfo3[num72].topLeft = characterInfo3[num72].topLeft + b3;
					TMP_CharacterInfo[] characterInfo4 = this.m_textInfo.characterInfo;
					int num73 = i;
					characterInfo4[num73].topRight = characterInfo4[num73].topRight + b3;
					TMP_CharacterInfo[] characterInfo5 = this.m_textInfo.characterInfo;
					int num74 = i;
					characterInfo5[num74].bottomRight = characterInfo5[num74].bottomRight + b3;
					TMP_CharacterInfo[] characterInfo6 = this.m_textInfo.characterInfo;
					int num75 = i;
					characterInfo6[num75].origin = characterInfo6[num75].origin + b3.x;
					TMP_CharacterInfo[] characterInfo7 = this.m_textInfo.characterInfo;
					int num76 = i;
					characterInfo7[num76].xAdvance = characterInfo7[num76].xAdvance + b3.x;
					TMP_CharacterInfo[] characterInfo8 = this.m_textInfo.characterInfo;
					int num77 = i;
					characterInfo8[num77].ascender = characterInfo8[num77].ascender + b3.y;
					TMP_CharacterInfo[] characterInfo9 = this.m_textInfo.characterInfo;
					int num78 = i;
					characterInfo9[num78].descender = characterInfo9[num78].descender + b3.y;
					TMP_CharacterInfo[] characterInfo10 = this.m_textInfo.characterInfo;
					int num79 = i;
					characterInfo10[num79].baseLine = characterInfo10[num79].baseLine + b3.y;
					if (isVisible)
					{
					}
					if (lineNumber3 != num41 || i == this.m_characterCount - 1)
					{
						if (lineNumber3 != num41)
						{
							TMP_LineInfo[] lineInfo3 = this.m_textInfo.lineInfo;
							int num80 = num41;
							lineInfo3[num80].baseline = lineInfo3[num80].baseline + b3.y;
							TMP_LineInfo[] lineInfo4 = this.m_textInfo.lineInfo;
							int num81 = num41;
							lineInfo4[num81].ascender = lineInfo4[num81].ascender + b3.y;
							TMP_LineInfo[] lineInfo5 = this.m_textInfo.lineInfo;
							int num82 = num41;
							lineInfo5[num82].descender = lineInfo5[num82].descender + b3.y;
							this.m_textInfo.lineInfo[num41].lineExtents.min = new Vector2(this.m_textInfo.characterInfo[this.m_textInfo.lineInfo[num41].firstCharacterIndex].bottomLeft.x, this.m_textInfo.lineInfo[num41].descender);
							this.m_textInfo.lineInfo[num41].lineExtents.max = new Vector2(this.m_textInfo.characterInfo[this.m_textInfo.lineInfo[num41].lastVisibleCharacterIndex].topRight.x, this.m_textInfo.lineInfo[num41].ascender);
						}
						if (i == this.m_characterCount - 1)
						{
							TMP_LineInfo[] lineInfo6 = this.m_textInfo.lineInfo;
							int num83 = lineNumber3;
							lineInfo6[num83].baseline = lineInfo6[num83].baseline + b3.y;
							TMP_LineInfo[] lineInfo7 = this.m_textInfo.lineInfo;
							int num84 = lineNumber3;
							lineInfo7[num84].ascender = lineInfo7[num84].ascender + b3.y;
							TMP_LineInfo[] lineInfo8 = this.m_textInfo.lineInfo;
							int num85 = lineNumber3;
							lineInfo8[num85].descender = lineInfo8[num85].descender + b3.y;
							this.m_textInfo.lineInfo[lineNumber3].lineExtents.min = new Vector2(this.m_textInfo.characterInfo[this.m_textInfo.lineInfo[lineNumber3].firstCharacterIndex].bottomLeft.x, this.m_textInfo.lineInfo[lineNumber3].descender);
							this.m_textInfo.lineInfo[lineNumber3].lineExtents.max = new Vector2(this.m_textInfo.characterInfo[this.m_textInfo.lineInfo[lineNumber3].lastVisibleCharacterIndex].topRight.x, this.m_textInfo.lineInfo[lineNumber3].ascender);
						}
					}
					if (char.IsLetterOrDigit(character2) || character2 == '-' || character2 == '­' || character2 == '‐' || character2 == '‑')
					{
						if (!flag7)
						{
							flag7 = true;
							num42 = i;
						}
						if (flag7 && i == this.m_characterCount - 1)
						{
							int num86 = this.m_textInfo.wordInfo.Length;
							int wordCount = this.m_textInfo.wordCount;
							if (this.m_textInfo.wordCount + 1 > num86)
							{
								TMP_TextInfo.Resize<TMP_WordInfo>(ref this.m_textInfo.wordInfo, num86 + 1);
							}
							int num87 = i;
							this.m_textInfo.wordInfo[wordCount].firstCharacterIndex = num42;
							this.m_textInfo.wordInfo[wordCount].lastCharacterIndex = num87;
							this.m_textInfo.wordInfo[wordCount].characterCount = num87 - num42 + 1;
							this.m_textInfo.wordInfo[wordCount].textComponent = this;
							num39++;
							this.m_textInfo.wordCount++;
							TMP_LineInfo[] lineInfo9 = this.m_textInfo.lineInfo;
							int num88 = lineNumber3;
							lineInfo9[num88].wordCount = lineInfo9[num88].wordCount + 1;
						}
					}
					else if (flag7 || (i == 0 && (!char.IsPunctuation(character2) || char.IsWhiteSpace(character2) || i == this.m_characterCount - 1)))
					{
						if (i <= 0 || i >= characterInfo.Length - 1 || i >= this.m_characterCount || (character2 != '\'' && character2 != '’') || !char.IsLetterOrDigit(characterInfo[i - 1].character) || !char.IsLetterOrDigit(characterInfo[i + 1].character))
						{
							int num87 = (i != this.m_characterCount - 1 || !char.IsLetterOrDigit(character2)) ? (i - 1) : i;
							flag7 = false;
							int num89 = this.m_textInfo.wordInfo.Length;
							int wordCount2 = this.m_textInfo.wordCount;
							if (this.m_textInfo.wordCount + 1 > num89)
							{
								TMP_TextInfo.Resize<TMP_WordInfo>(ref this.m_textInfo.wordInfo, num89 + 1);
							}
							this.m_textInfo.wordInfo[wordCount2].firstCharacterIndex = num42;
							this.m_textInfo.wordInfo[wordCount2].lastCharacterIndex = num87;
							this.m_textInfo.wordInfo[wordCount2].characterCount = num87 - num42 + 1;
							this.m_textInfo.wordInfo[wordCount2].textComponent = this;
							num39++;
							this.m_textInfo.wordCount++;
							TMP_LineInfo[] lineInfo10 = this.m_textInfo.lineInfo;
							int num90 = lineNumber3;
							lineInfo10[num90].wordCount = lineInfo10[num90].wordCount + 1;
						}
					}
					bool flag8 = (this.m_textInfo.characterInfo[i].style & FontStyles.Underline) == FontStyles.Underline;
					if (flag8)
					{
						bool flag9 = true;
						int pageNumber = (int)this.m_textInfo.characterInfo[i].pageNumber;
						if (i > this.m_maxVisibleCharacters || lineNumber3 > this.m_maxVisibleLines || (this.m_overflowMode == TextOverflowModes.Page && pageNumber + 1 != this.m_pageToDisplay))
						{
							flag9 = false;
						}
						if (!char.IsWhiteSpace(character2))
						{
							num46 = Mathf.Max(num46, this.m_textInfo.characterInfo[i].scale);
							num47 = Mathf.Min((pageNumber != num48) ? TMP_Text.k_LargePositiveFloat : num47, this.m_textInfo.characterInfo[i].baseLine + base.font.fontInfo.Underline * num46);
							num48 = pageNumber;
						}
						if (!flag && flag9 && i <= tmp_LineInfo.lastVisibleCharacterIndex && character2 != '\n' && character2 != '\r')
						{
							if (i != tmp_LineInfo.lastVisibleCharacterIndex || !char.IsSeparator(character2))
							{
								flag = true;
								num45 = this.m_textInfo.characterInfo[i].scale;
								if (num46 == 0f)
								{
									num46 = num45;
								}
								zero = new Vector3(this.m_textInfo.characterInfo[i].bottomLeft.x, num47, 0f);
								underlineColor = this.m_textInfo.characterInfo[i].color;
							}
						}
						if (flag && this.m_characterCount == 1)
						{
							flag = false;
							zero2 = new Vector3(this.m_textInfo.characterInfo[i].topRight.x, num47, 0f);
							float scale = this.m_textInfo.characterInfo[i].scale;
							this.DrawUnderlineMesh(zero, zero2, ref num38, num45, scale, num46, num44, underlineColor);
							num46 = 0f;
							num47 = TMP_Text.k_LargePositiveFloat;
						}
						else if (flag && (i == tmp_LineInfo.lastCharacterIndex || i >= tmp_LineInfo.lastVisibleCharacterIndex))
						{
							float scale;
							if (char.IsWhiteSpace(character2))
							{
								int lastVisibleCharacterIndex = tmp_LineInfo.lastVisibleCharacterIndex;
								zero2 = new Vector3(this.m_textInfo.characterInfo[lastVisibleCharacterIndex].topRight.x, num47, 0f);
								scale = this.m_textInfo.characterInfo[lastVisibleCharacterIndex].scale;
							}
							else
							{
								zero2 = new Vector3(this.m_textInfo.characterInfo[i].topRight.x, num47, 0f);
								scale = this.m_textInfo.characterInfo[i].scale;
							}
							flag = false;
							this.DrawUnderlineMesh(zero, zero2, ref num38, num45, scale, num46, num44, underlineColor);
							num46 = 0f;
							num47 = TMP_Text.k_LargePositiveFloat;
						}
						else if (flag && !flag9)
						{
							flag = false;
							zero2 = new Vector3(this.m_textInfo.characterInfo[i - 1].topRight.x, num47, 0f);
							float scale = this.m_textInfo.characterInfo[i - 1].scale;
							this.DrawUnderlineMesh(zero, zero2, ref num38, num45, scale, num46, num44, underlineColor);
							num46 = 0f;
							num47 = TMP_Text.k_LargePositiveFloat;
						}
					}
					else if (flag)
					{
						flag = false;
						zero2 = new Vector3(this.m_textInfo.characterInfo[i - 1].topRight.x, num47, 0f);
						float scale = this.m_textInfo.characterInfo[i - 1].scale;
						this.DrawUnderlineMesh(zero, zero2, ref num38, num45, scale, num46, num44, underlineColor);
						num46 = 0f;
						num47 = TMP_Text.k_LargePositiveFloat;
					}
					bool flag10 = (this.m_textInfo.characterInfo[i].style & FontStyles.Strikethrough) == FontStyles.Strikethrough;
					if (flag10)
					{
						bool flag11 = true;
						if (i > this.m_maxVisibleCharacters || lineNumber3 > this.m_maxVisibleLines || (this.m_overflowMode == TextOverflowModes.Page && (int)(this.m_textInfo.characterInfo[i].pageNumber + 1) != this.m_pageToDisplay))
						{
							flag11 = false;
						}
						if (!flag2 && flag11 && i <= tmp_LineInfo.lastVisibleCharacterIndex && character2 != '\n' && character2 != '\r')
						{
							if (i != tmp_LineInfo.lastVisibleCharacterIndex || !char.IsSeparator(character2))
							{
								flag2 = true;
								num49 = this.m_textInfo.characterInfo[i].pointSize;
								num50 = this.m_textInfo.characterInfo[i].scale;
								zero3 = new Vector3(this.m_textInfo.characterInfo[i].bottomLeft.x, this.m_textInfo.characterInfo[i].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2.75f * num50, 0f);
								underlineColor2 = this.m_textInfo.characterInfo[i].color;
								b4 = this.m_textInfo.characterInfo[i].baseLine;
							}
						}
						if (flag2 && this.m_characterCount == 1)
						{
							flag2 = false;
							zero4 = new Vector3(this.m_textInfo.characterInfo[i].topRight.x, this.m_textInfo.characterInfo[i].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2f * num50, 0f);
							this.DrawUnderlineMesh(zero3, zero4, ref num38, num50, num50, num50, num44, underlineColor2);
						}
						else if (flag2 && i == tmp_LineInfo.lastCharacterIndex)
						{
							if (char.IsWhiteSpace(character2))
							{
								int lastVisibleCharacterIndex2 = tmp_LineInfo.lastVisibleCharacterIndex;
								zero4 = new Vector3(this.m_textInfo.characterInfo[lastVisibleCharacterIndex2].topRight.x, this.m_textInfo.characterInfo[lastVisibleCharacterIndex2].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2f * num50, 0f);
							}
							else
							{
								zero4 = new Vector3(this.m_textInfo.characterInfo[i].topRight.x, this.m_textInfo.characterInfo[i].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2f * num50, 0f);
							}
							flag2 = false;
							this.DrawUnderlineMesh(zero3, zero4, ref num38, num50, num50, num50, num44, underlineColor2);
						}
						else if (flag2 && i < this.m_characterCount && (this.m_textInfo.characterInfo[i + 1].pointSize != num49 || !TMP_Math.Approximately(this.m_textInfo.characterInfo[i + 1].baseLine + b3.y, b4)))
						{
							flag2 = false;
							int lastVisibleCharacterIndex3 = tmp_LineInfo.lastVisibleCharacterIndex;
							if (i > lastVisibleCharacterIndex3)
							{
								zero4 = new Vector3(this.m_textInfo.characterInfo[lastVisibleCharacterIndex3].topRight.x, this.m_textInfo.characterInfo[lastVisibleCharacterIndex3].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2f * num50, 0f);
							}
							else
							{
								zero4 = new Vector3(this.m_textInfo.characterInfo[i].topRight.x, this.m_textInfo.characterInfo[i].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2f * num50, 0f);
							}
							this.DrawUnderlineMesh(zero3, zero4, ref num38, num50, num50, num50, num44, underlineColor2);
						}
						else if (flag2 && !flag11)
						{
							flag2 = false;
							zero4 = new Vector3(this.m_textInfo.characterInfo[i - 1].topRight.x, this.m_textInfo.characterInfo[i - 1].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2f * num50, 0f);
							this.DrawUnderlineMesh(zero3, zero4, ref num38, num50, num50, num50, num44, underlineColor2);
						}
					}
					else if (flag2)
					{
						flag2 = false;
						zero4 = new Vector3(this.m_textInfo.characterInfo[i - 1].topRight.x, this.m_textInfo.characterInfo[i - 1].baseLine + (base.font.fontInfo.Ascender + base.font.fontInfo.Descender) / 2f * num50, 0f);
						this.DrawUnderlineMesh(zero3, zero4, ref num38, num50, num50, num50, num44, underlineColor2);
					}
					num41 = lineNumber3;
				}
				this.m_textInfo.characterCount = (int)((short)this.m_characterCount);
				this.m_textInfo.spriteCount = this.m_spriteCount;
				this.m_textInfo.lineCount = (int)((short)num40);
				this.m_textInfo.wordCount = (int)((num39 == 0 || this.m_characterCount <= 0) ? 1 : ((short)num39));
				this.m_textInfo.pageCount = this.m_pageNumber + 1;
				if (this.m_renderMode == TextRenderFlags.Render)
				{
					this.m_mesh.MarkDynamic();
					this.m_mesh.vertices = this.m_textInfo.meshInfo[0].vertices;
					this.m_mesh.uv = this.m_textInfo.meshInfo[0].uvs0;
					this.m_mesh.uv2 = this.m_textInfo.meshInfo[0].uvs2;
					this.m_mesh.colors32 = this.m_textInfo.meshInfo[0].colors32;
					this.m_mesh.RecalculateBounds();
					for (int j = 1; j < this.m_textInfo.materialCount; j++)
					{
						this.m_textInfo.meshInfo[j].ClearUnusedVertices();
						if (!(this.m_subTextObjects[j] == null))
						{
							this.m_subTextObjects[j].mesh.vertices = this.m_textInfo.meshInfo[j].vertices;
							this.m_subTextObjects[j].mesh.uv = this.m_textInfo.meshInfo[j].uvs0;
							this.m_subTextObjects[j].mesh.uv2 = this.m_textInfo.meshInfo[j].uvs2;
							this.m_subTextObjects[j].mesh.colors32 = this.m_textInfo.meshInfo[j].colors32;
							this.m_subTextObjects[j].mesh.RecalculateBounds();
						}
					}
				}
				TMPro_EventManager.ON_TEXT_CHANGED(this);
				return;
			}
		}

		// Token: 0x06002894 RID: 10388 RVA: 0x0001D545 File Offset: 0x0001B745
		protected override Vector3[] GetTextContainerLocalCorners()
		{
			return this.textContainer.corners;
		}

		// Token: 0x06002895 RID: 10389 RVA: 0x000F1C68 File Offset: 0x000EFE68
		private void ClearMesh(bool updateMesh)
		{
			if (this.m_textInfo.meshInfo[0].mesh == null)
			{
				this.m_textInfo.meshInfo[0].mesh = this.m_mesh;
			}
			this.m_textInfo.ClearMeshInfo(updateMesh);
		}

		// Token: 0x06002896 RID: 10390 RVA: 0x000F1CC0 File Offset: 0x000EFEC0
		private void SetMeshFilters(bool state)
		{
			if (this.m_meshFilter != null)
			{
				if (state)
				{
					this.m_meshFilter.sharedMesh = this.m_mesh;
				}
				else
				{
					this.m_meshFilter.sharedMesh = null;
				}
			}
			int num = 1;
			while (num < this.m_subTextObjects.Length && this.m_subTextObjects[num] != null)
			{
				if (this.m_subTextObjects[num].meshFilter != null)
				{
					if (state)
					{
						this.m_subTextObjects[num].meshFilter.sharedMesh = this.m_subTextObjects[num].mesh;
					}
					else
					{
						this.m_subTextObjects[num].meshFilter.sharedMesh = null;
					}
				}
				num++;
			}
		}

		// Token: 0x06002897 RID: 10391 RVA: 0x000F1D88 File Offset: 0x000EFF88
		protected override void SetActiveSubMeshes(bool state)
		{
			int num = 1;
			while (num < this.m_subTextObjects.Length && this.m_subTextObjects[num] != null)
			{
				if (this.m_subTextObjects[num].enabled != state)
				{
					this.m_subTextObjects[num].enabled = state;
				}
				num++;
			}
		}

		// Token: 0x06002898 RID: 10392 RVA: 0x000F1DE4 File Offset: 0x000EFFE4
		protected override Bounds GetCompoundBounds()
		{
			Bounds bounds = this.m_mesh.bounds;
			Vector2 vector = bounds.min;
			Vector2 vector2 = bounds.max;
			int num = 1;
			while (num < this.m_subTextObjects.Length && this.m_subTextObjects[num] != null)
			{
				Bounds bounds2 = this.m_subTextObjects[num].mesh.bounds;
				vector.x = ((vector.x >= bounds2.min.x) ? bounds2.min.x : vector.x);
				vector.y = ((vector.y >= bounds2.min.y) ? bounds2.min.y : vector.y);
				vector2.x = ((vector2.x <= bounds2.max.x) ? bounds2.max.x : vector2.x);
				vector2.y = ((vector2.y <= bounds2.max.y) ? bounds2.max.y : vector2.y);
				num++;
			}
			Vector2 v = (vector + vector2) / 2f;
			Vector2 v2 = vector2 - vector;
			return new Bounds(v, v2);
		}

		// Token: 0x06002899 RID: 10393 RVA: 0x000F1F84 File Offset: 0x000F0184
		private void UpdateSDFScale(float lossyScale)
		{
			for (int i = 0; i < this.m_textInfo.characterCount; i++)
			{
				if (this.m_textInfo.characterInfo[i].isVisible && this.m_textInfo.characterInfo[i].elementType == TMP_TextElementType.Character)
				{
					float num = lossyScale * this.m_textInfo.characterInfo[i].scale * (1f - this.m_charWidthAdjDelta);
					if (!this.m_textInfo.characterInfo[i].isUsingAlternateTypeface && (this.m_textInfo.characterInfo[i].style & FontStyles.Bold) == FontStyles.Bold)
					{
						num *= -1f;
					}
					int materialReferenceIndex = this.m_textInfo.characterInfo[i].materialReferenceIndex;
					int vertexIndex = this.m_textInfo.characterInfo[i].vertexIndex;
					this.m_textInfo.meshInfo[materialReferenceIndex].uvs2[vertexIndex].y = num;
					this.m_textInfo.meshInfo[materialReferenceIndex].uvs2[vertexIndex + 1].y = num;
					this.m_textInfo.meshInfo[materialReferenceIndex].uvs2[vertexIndex + 2].y = num;
					this.m_textInfo.meshInfo[materialReferenceIndex].uvs2[vertexIndex + 3].y = num;
				}
			}
			for (int j = 0; j < this.m_textInfo.meshInfo.Length; j++)
			{
				if (j == 0)
				{
					this.m_mesh.uv2 = this.m_textInfo.meshInfo[0].uvs2;
				}
				else
				{
					this.m_subTextObjects[j].mesh.uv2 = this.m_textInfo.meshInfo[j].uvs2;
				}
			}
		}

		// Token: 0x0600289A RID: 10394 RVA: 0x000F2180 File Offset: 0x000F0380
		protected override void AdjustLineOffset(int startIndex, int endIndex, float offset)
		{
			Vector3 b = new Vector3(0f, offset, 0f);
			for (int i = startIndex; i <= endIndex; i++)
			{
				TMP_CharacterInfo[] characterInfo = this.m_textInfo.characterInfo;
				int num = i;
				characterInfo[num].bottomLeft = characterInfo[num].bottomLeft - b;
				TMP_CharacterInfo[] characterInfo2 = this.m_textInfo.characterInfo;
				int num2 = i;
				characterInfo2[num2].topLeft = characterInfo2[num2].topLeft - b;
				TMP_CharacterInfo[] characterInfo3 = this.m_textInfo.characterInfo;
				int num3 = i;
				characterInfo3[num3].topRight = characterInfo3[num3].topRight - b;
				TMP_CharacterInfo[] characterInfo4 = this.m_textInfo.characterInfo;
				int num4 = i;
				characterInfo4[num4].bottomRight = characterInfo4[num4].bottomRight - b;
				TMP_CharacterInfo[] characterInfo5 = this.m_textInfo.characterInfo;
				int num5 = i;
				characterInfo5[num5].descender = characterInfo5[num5].descender - b.y;
				TMP_CharacterInfo[] characterInfo6 = this.m_textInfo.characterInfo;
				int num6 = i;
				characterInfo6[num6].baseLine = characterInfo6[num6].baseLine - b.y;
				TMP_CharacterInfo[] characterInfo7 = this.m_textInfo.characterInfo;
				int num7 = i;
				characterInfo7[num7].ascender = characterInfo7[num7].ascender - b.y;
				if (this.m_textInfo.characterInfo[i].isVisible)
				{
					TMP_CharacterInfo[] characterInfo8 = this.m_textInfo.characterInfo;
					int num8 = i;
					characterInfo8[num8].vertex_BL.position = characterInfo8[num8].vertex_BL.position - b;
					TMP_CharacterInfo[] characterInfo9 = this.m_textInfo.characterInfo;
					int num9 = i;
					characterInfo9[num9].vertex_TL.position = characterInfo9[num9].vertex_TL.position - b;
					TMP_CharacterInfo[] characterInfo10 = this.m_textInfo.characterInfo;
					int num10 = i;
					characterInfo10[num10].vertex_TR.position = characterInfo10[num10].vertex_TR.position - b;
					TMP_CharacterInfo[] characterInfo11 = this.m_textInfo.characterInfo;
					int num11 = i;
					characterInfo11[num11].vertex_BR.position = characterInfo11[num11].vertex_BR.position - b;
				}
			}
		}

		// Token: 0x04002E21 RID: 11809
		[SerializeField]
		private float m_lineLength;

		// Token: 0x04002E22 RID: 11810
		[SerializeField]
		private TMP_Compatibility.AnchorPositions m_anchor = TMP_Compatibility.AnchorPositions.None;

		// Token: 0x04002E23 RID: 11811
		private bool m_autoSizeTextContainer;

		// Token: 0x04002E24 RID: 11812
		private bool m_currentAutoSizeMode;

		// Token: 0x04002E25 RID: 11813
		[SerializeField]
		private Vector2 m_uvOffset = Vector2.zero;

		// Token: 0x04002E26 RID: 11814
		[SerializeField]
		private float m_uvLineOffset;

		// Token: 0x04002E27 RID: 11815
		[SerializeField]
		private bool m_hasFontAssetChanged;

		// Token: 0x04002E28 RID: 11816
		private float m_previousLossyScaleY = -1f;

		// Token: 0x04002E29 RID: 11817
		[SerializeField]
		private Renderer m_renderer;

		// Token: 0x04002E2A RID: 11818
		private MeshFilter m_meshFilter;

		// Token: 0x04002E2B RID: 11819
		private bool m_isFirstAllocation;

		// Token: 0x04002E2C RID: 11820
		private int m_max_characters = 8;

		// Token: 0x04002E2D RID: 11821
		private int m_max_numberOfLines = 4;

		// Token: 0x04002E2E RID: 11822
		private WordWrapState m_SavedWordWrapState = default(WordWrapState);

		// Token: 0x04002E2F RID: 11823
		private WordWrapState m_SavedLineState = default(WordWrapState);

		// Token: 0x04002E30 RID: 11824
		private Bounds m_default_bounds = new Bounds(Vector3.zero, new Vector3(1000f, 1000f, 0f));

		// Token: 0x04002E31 RID: 11825
		[SerializeField]
		protected TMP_SubMesh[] m_subTextObjects = new TMP_SubMesh[16];

		// Token: 0x04002E32 RID: 11826
		private bool m_isMaskingEnabled;

		// Token: 0x04002E33 RID: 11827
		private bool isMaskUpdateRequired;

		// Token: 0x04002E34 RID: 11828
		[SerializeField]
		private MaskingTypes m_maskType;

		// Token: 0x04002E35 RID: 11829
		private Matrix4x4 m_EnvMapMatrix = default(Matrix4x4);

		// Token: 0x04002E36 RID: 11830
		private TextContainer m_textContainer;

		// Token: 0x04002E37 RID: 11831
		[NonSerialized]
		private bool m_isRegisteredForEvents;

		// Token: 0x04002E38 RID: 11832
		private int m_recursiveCount;

		// Token: 0x04002E39 RID: 11833
		private int loopCountA;
	}
}
