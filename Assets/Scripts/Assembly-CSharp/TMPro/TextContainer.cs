using System;
using UnityEngine;
using UnityEngine.EventSystems;

namespace TMPro
{
	// Token: 0x02000594 RID: 1428
	[ExecuteInEditMode]
	[RequireComponent(typeof(RectTransform))]
	[AddComponentMenu("Layout/Text Container")]
	public class TextContainer : UIBehaviour
	{
		// Token: 0x170003FA RID: 1018
		// (get) Token: 0x0600282A RID: 10282 RVA: 0x0001CF10 File Offset: 0x0001B110
		// (set) Token: 0x0600282B RID: 10283 RVA: 0x0001CF18 File Offset: 0x0001B118
		public bool hasChanged
		{
			get
			{
				return this.m_hasChanged;
			}
			set
			{
				this.m_hasChanged = value;
			}
		}

		// Token: 0x170003FB RID: 1019
		// (get) Token: 0x0600282C RID: 10284 RVA: 0x0001CF21 File Offset: 0x0001B121
		// (set) Token: 0x0600282D RID: 10285 RVA: 0x0001CF29 File Offset: 0x0001B129
		public Vector2 pivot
		{
			get
			{
				return this.m_pivot;
			}
			set
			{
				if (this.m_pivot != value)
				{
					this.m_pivot = value;
					this.m_anchorPosition = this.GetAnchorPosition(this.m_pivot);
					this.m_hasChanged = true;
					this.OnContainerChanged();
				}
			}
		}

		// Token: 0x170003FC RID: 1020
		// (get) Token: 0x0600282E RID: 10286 RVA: 0x0001CF62 File Offset: 0x0001B162
		// (set) Token: 0x0600282F RID: 10287 RVA: 0x0001CF6A File Offset: 0x0001B16A
		public TextContainerAnchors anchorPosition
		{
			get
			{
				return this.m_anchorPosition;
			}
			set
			{
				if (this.m_anchorPosition != value)
				{
					this.m_anchorPosition = value;
					this.m_pivot = this.GetPivot(this.m_anchorPosition);
					this.m_hasChanged = true;
					this.OnContainerChanged();
				}
			}
		}

		// Token: 0x170003FD RID: 1021
		// (get) Token: 0x06002830 RID: 10288 RVA: 0x0001CF9E File Offset: 0x0001B19E
		// (set) Token: 0x06002831 RID: 10289 RVA: 0x0001CFA6 File Offset: 0x0001B1A6
		public Rect rect
		{
			get
			{
				return this.m_rect;
			}
			set
			{
				if (this.m_rect != value)
				{
					this.m_rect = value;
					this.m_hasChanged = true;
					this.OnContainerChanged();
				}
			}
		}

		// Token: 0x170003FE RID: 1022
		// (get) Token: 0x06002832 RID: 10290 RVA: 0x0001CFCD File Offset: 0x0001B1CD
		// (set) Token: 0x06002833 RID: 10291 RVA: 0x000E92A4 File Offset: 0x000E74A4
		public Vector2 size
		{
			get
			{
				return new Vector2(this.m_rect.width, this.m_rect.height);
			}
			set
			{
				if (new Vector2(this.m_rect.width, this.m_rect.height) != value)
				{
					this.SetRect(value);
					this.m_hasChanged = true;
					this.m_isDefaultWidth = false;
					this.m_isDefaultHeight = false;
					this.OnContainerChanged();
				}
			}
		}

		// Token: 0x170003FF RID: 1023
		// (get) Token: 0x06002834 RID: 10292 RVA: 0x0001CFEA File Offset: 0x0001B1EA
		// (set) Token: 0x06002835 RID: 10293 RVA: 0x0001CFF7 File Offset: 0x0001B1F7
		public float width
		{
			get
			{
				return this.m_rect.width;
			}
			set
			{
				this.SetRect(new Vector2(value, this.m_rect.height));
				this.m_hasChanged = true;
				this.m_isDefaultWidth = false;
				this.OnContainerChanged();
			}
		}

		// Token: 0x17000400 RID: 1024
		// (get) Token: 0x06002836 RID: 10294 RVA: 0x0001D024 File Offset: 0x0001B224
		// (set) Token: 0x06002837 RID: 10295 RVA: 0x0001D031 File Offset: 0x0001B231
		public float height
		{
			get
			{
				return this.m_rect.height;
			}
			set
			{
				this.SetRect(new Vector2(this.m_rect.width, value));
				this.m_hasChanged = true;
				this.m_isDefaultHeight = false;
				this.OnContainerChanged();
			}
		}

		// Token: 0x17000401 RID: 1025
		// (get) Token: 0x06002838 RID: 10296 RVA: 0x0001D05E File Offset: 0x0001B25E
		public bool isDefaultWidth
		{
			get
			{
				return this.m_isDefaultWidth;
			}
		}

		// Token: 0x17000402 RID: 1026
		// (get) Token: 0x06002839 RID: 10297 RVA: 0x0001D066 File Offset: 0x0001B266
		public bool isDefaultHeight
		{
			get
			{
				return this.m_isDefaultHeight;
			}
		}

		// Token: 0x17000403 RID: 1027
		// (get) Token: 0x0600283A RID: 10298 RVA: 0x0001D06E File Offset: 0x0001B26E
		// (set) Token: 0x0600283B RID: 10299 RVA: 0x0001D076 File Offset: 0x0001B276
		public bool isAutoFitting
		{
			get
			{
				return this.m_isAutoFitting;
			}
			set
			{
				this.m_isAutoFitting = value;
			}
		}

		// Token: 0x17000404 RID: 1028
		// (get) Token: 0x0600283C RID: 10300 RVA: 0x0001D07F File Offset: 0x0001B27F
		public Vector3[] corners
		{
			get
			{
				return this.m_corners;
			}
		}

		// Token: 0x17000405 RID: 1029
		// (get) Token: 0x0600283D RID: 10301 RVA: 0x0001D087 File Offset: 0x0001B287
		public Vector3[] worldCorners
		{
			get
			{
				return this.m_worldCorners;
			}
		}

		// Token: 0x17000406 RID: 1030
		// (get) Token: 0x0600283E RID: 10302 RVA: 0x0001D08F File Offset: 0x0001B28F
		// (set) Token: 0x0600283F RID: 10303 RVA: 0x0001D097 File Offset: 0x0001B297
		public Vector4 margins
		{
			get
			{
				return this.m_margins;
			}
			set
			{
				if (this.m_margins != value)
				{
					this.m_margins = value;
					this.m_hasChanged = true;
					this.OnContainerChanged();
				}
			}
		}

		// Token: 0x17000407 RID: 1031
		// (get) Token: 0x06002840 RID: 10304 RVA: 0x0001D0BE File Offset: 0x0001B2BE
		public RectTransform rectTransform
		{
			get
			{
				if (this.m_rectTransform == null)
				{
					this.m_rectTransform = base.GetComponent<RectTransform>();
				}
				return this.m_rectTransform;
			}
		}

		// Token: 0x17000408 RID: 1032
		// (get) Token: 0x06002841 RID: 10305 RVA: 0x0001D0E3 File Offset: 0x0001B2E3
		public TextMeshPro textMeshPro
		{
			get
			{
				if (this.m_textMeshPro == null)
				{
					this.m_textMeshPro = base.GetComponent<TextMeshPro>();
				}
				return this.m_textMeshPro;
			}
		}

		// Token: 0x06002842 RID: 10306 RVA: 0x000E92FC File Offset: 0x000E74FC
		protected override void Awake()
		{
			this.m_rectTransform = this.rectTransform;
			if (this.m_rectTransform == null)
			{
				Vector2 pivot = this.m_pivot;
				this.m_rectTransform = base.gameObject.AddComponent<RectTransform>();
				this.m_pivot = pivot;
			}
			this.m_textMeshPro = (base.GetComponent(typeof(TextMeshPro)) as TextMeshPro);
			if (this.m_rect.width == 0f || this.m_rect.height == 0f)
			{
				if (this.m_textMeshPro != null && this.m_textMeshPro.anchor != TMP_Compatibility.AnchorPositions.None)
				{
					Debug.LogWarning("Converting from using anchor and lineLength properties to Text Container.", this);
					this.m_isDefaultHeight = true;
					int num = (int)this.m_textMeshPro.anchor;
					this.m_textMeshPro.anchor = TMP_Compatibility.AnchorPositions.None;
					if (num == 9)
					{
						switch (this.m_textMeshPro.alignment)
						{
						case TextAlignmentOptions.TopLeft:
							this.m_textMeshPro.alignment = TextAlignmentOptions.BaselineLeft;
							break;
						case TextAlignmentOptions.Top:
							this.m_textMeshPro.alignment = TextAlignmentOptions.Baseline;
							break;
						case TextAlignmentOptions.TopRight:
							this.m_textMeshPro.alignment = TextAlignmentOptions.BaselineRight;
							break;
						case TextAlignmentOptions.TopJustified:
							this.m_textMeshPro.alignment = TextAlignmentOptions.BaselineJustified;
							break;
						}
						num = 3;
					}
					this.m_anchorPosition = (TextContainerAnchors)num;
					this.m_pivot = this.GetPivot(this.m_anchorPosition);
					if (this.m_textMeshPro.lineLength == 72f)
					{
						this.m_rect.size = this.m_textMeshPro.GetPreferredValues(this.m_textMeshPro.text);
					}
					else
					{
						this.m_rect.width = this.m_textMeshPro.lineLength;
						this.m_rect.height = this.m_textMeshPro.GetPreferredValues(this.m_rect.width, float.PositiveInfinity).y;
					}
				}
				else
				{
					this.m_isDefaultWidth = true;
					this.m_isDefaultHeight = true;
					this.m_pivot = this.GetPivot(this.m_anchorPosition);
					this.m_rect.width = 20f;
					this.m_rect.height = 5f;
					this.m_rectTransform.sizeDelta = this.size;
				}
				this.m_margins = new Vector4(0f, 0f, 0f, 0f);
				this.UpdateCorners();
			}
		}

		// Token: 0x06002843 RID: 10307 RVA: 0x0001D108 File Offset: 0x0001B308
		protected override void OnEnable()
		{
			this.OnContainerChanged();
		}

		// Token: 0x06002844 RID: 10308 RVA: 0x00002482 File Offset: 0x00000682
		protected override void OnDisable()
		{
		}

		// Token: 0x06002845 RID: 10309 RVA: 0x000E9564 File Offset: 0x000E7764
		private void OnContainerChanged()
		{
			this.UpdateCorners();
			if (this.m_rectTransform != null)
			{
				this.m_rectTransform.sizeDelta = this.size;
				this.m_rectTransform.hasChanged = true;
			}
			if (this.textMeshPro != null)
			{
				this.m_textMeshPro.SetVerticesDirty();
				this.m_textMeshPro.margin = this.m_margins;
			}
		}

		// Token: 0x06002846 RID: 10310 RVA: 0x000E95D4 File Offset: 0x000E77D4
		protected override void OnRectTransformDimensionsChange()
		{
			if (this.rectTransform == null)
			{
				this.m_rectTransform = base.gameObject.AddComponent<RectTransform>();
			}
			if (this.m_rectTransform.sizeDelta != TextContainer.k_defaultSize)
			{
				this.size = this.m_rectTransform.sizeDelta;
			}
			this.pivot = this.m_rectTransform.pivot;
			this.m_hasChanged = true;
			this.OnContainerChanged();
		}

		// Token: 0x06002847 RID: 10311 RVA: 0x0001D110 File Offset: 0x0001B310
		private void SetRect(Vector2 size)
		{
			this.m_rect = new Rect(this.m_rect.x, this.m_rect.y, size.x, size.y);
		}

		// Token: 0x06002848 RID: 10312 RVA: 0x000E964C File Offset: 0x000E784C
		private void UpdateCorners()
		{
			this.m_corners[0] = new Vector3(-this.m_pivot.x * this.m_rect.width, -this.m_pivot.y * this.m_rect.height);
			this.m_corners[1] = new Vector3(-this.m_pivot.x * this.m_rect.width, (1f - this.m_pivot.y) * this.m_rect.height);
			this.m_corners[2] = new Vector3((1f - this.m_pivot.x) * this.m_rect.width, (1f - this.m_pivot.y) * this.m_rect.height);
			this.m_corners[3] = new Vector3((1f - this.m_pivot.x) * this.m_rect.width, -this.m_pivot.y * this.m_rect.height);
			if (this.m_rectTransform != null)
			{
				this.m_rectTransform.pivot = this.m_pivot;
			}
		}

		// Token: 0x06002849 RID: 10313 RVA: 0x000E97A8 File Offset: 0x000E79A8
		private Vector2 GetPivot(TextContainerAnchors anchor)
		{
			Vector2 zero = Vector2.zero;
			switch (anchor)
			{
			case TextContainerAnchors.TopLeft:
				zero = new Vector2(0f, 1f);
				break;
			case TextContainerAnchors.Top:
				zero = new Vector2(0.5f, 1f);
				break;
			case TextContainerAnchors.TopRight:
				zero = new Vector2(1f, 1f);
				break;
			case TextContainerAnchors.Left:
				zero = new Vector2(0f, 0.5f);
				break;
			case TextContainerAnchors.Middle:
				zero = new Vector2(0.5f, 0.5f);
				break;
			case TextContainerAnchors.Right:
				zero = new Vector2(1f, 0.5f);
				break;
			case TextContainerAnchors.BottomLeft:
				zero = new Vector2(0f, 0f);
				break;
			case TextContainerAnchors.Bottom:
				zero = new Vector2(0.5f, 0f);
				break;
			case TextContainerAnchors.BottomRight:
				zero = new Vector2(1f, 0f);
				break;
			}
			return zero;
		}

		// Token: 0x0600284A RID: 10314 RVA: 0x000E98B4 File Offset: 0x000E7AB4
		private TextContainerAnchors GetAnchorPosition(Vector2 pivot)
		{
			if (pivot == new Vector2(0f, 1f))
			{
				return TextContainerAnchors.TopLeft;
			}
			if (pivot == new Vector2(0.5f, 1f))
			{
				return TextContainerAnchors.Top;
			}
			if (pivot == new Vector2(1f, 1f))
			{
				return TextContainerAnchors.TopRight;
			}
			if (pivot == new Vector2(0f, 0.5f))
			{
				return TextContainerAnchors.Left;
			}
			if (pivot == new Vector2(0.5f, 0.5f))
			{
				return TextContainerAnchors.Middle;
			}
			if (pivot == new Vector2(1f, 0.5f))
			{
				return TextContainerAnchors.Right;
			}
			if (pivot == new Vector2(0f, 0f))
			{
				return TextContainerAnchors.BottomLeft;
			}
			if (pivot == new Vector2(0.5f, 0f))
			{
				return TextContainerAnchors.Bottom;
			}
			if (pivot == new Vector2(1f, 0f))
			{
				return TextContainerAnchors.BottomRight;
			}
			return TextContainerAnchors.Custom;
		}

		// Token: 0x04002E14 RID: 11796
		private bool m_hasChanged;

		// Token: 0x04002E15 RID: 11797
		[SerializeField]
		private Vector2 m_pivot;

		// Token: 0x04002E16 RID: 11798
		[SerializeField]
		private TextContainerAnchors m_anchorPosition = TextContainerAnchors.Middle;

		// Token: 0x04002E17 RID: 11799
		[SerializeField]
		private Rect m_rect;

		// Token: 0x04002E18 RID: 11800
		private bool m_isDefaultWidth;

		// Token: 0x04002E19 RID: 11801
		private bool m_isDefaultHeight;

		// Token: 0x04002E1A RID: 11802
		private bool m_isAutoFitting;

		// Token: 0x04002E1B RID: 11803
		private Vector3[] m_corners = new Vector3[4];

		// Token: 0x04002E1C RID: 11804
		private Vector3[] m_worldCorners = new Vector3[4];

		// Token: 0x04002E1D RID: 11805
		[SerializeField]
		private Vector4 m_margins;

		// Token: 0x04002E1E RID: 11806
		private RectTransform m_rectTransform;

		// Token: 0x04002E1F RID: 11807
		private static Vector2 k_defaultSize = new Vector2(100f, 100f);

		// Token: 0x04002E20 RID: 11808
		private TextMeshPro m_textMeshPro;
	}
}
