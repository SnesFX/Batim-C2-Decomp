using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x0200058E RID: 1422
	[ExecuteInEditMode]
	public class InlineGraphicManager : MonoBehaviour
	{
		// Token: 0x170003F5 RID: 1013
		// (get) Token: 0x060027FB RID: 10235 RVA: 0x0001CCB0 File Offset: 0x0001AEB0
		// (set) Token: 0x060027FC RID: 10236 RVA: 0x0001CCB8 File Offset: 0x0001AEB8
		public TMP_SpriteAsset spriteAsset
		{
			get
			{
				return this.m_spriteAsset;
			}
			set
			{
				this.LoadSpriteAsset(value);
			}
		}

		// Token: 0x170003F6 RID: 1014
		// (get) Token: 0x060027FD RID: 10237 RVA: 0x0001CCC1 File Offset: 0x0001AEC1
		// (set) Token: 0x060027FE RID: 10238 RVA: 0x0001CCC9 File Offset: 0x0001AEC9
		public InlineGraphic inlineGraphic
		{
			get
			{
				return this.m_inlineGraphic;
			}
			set
			{
				if (this.m_inlineGraphic != value)
				{
					this.m_inlineGraphic = value;
				}
			}
		}

		// Token: 0x170003F7 RID: 1015
		// (get) Token: 0x060027FF RID: 10239 RVA: 0x0001CCE3 File Offset: 0x0001AEE3
		public CanvasRenderer canvasRenderer
		{
			get
			{
				return this.m_inlineGraphicCanvasRenderer;
			}
		}

		// Token: 0x170003F8 RID: 1016
		// (get) Token: 0x06002800 RID: 10240 RVA: 0x0001CCEB File Offset: 0x0001AEEB
		public UIVertex[] uiVertex
		{
			get
			{
				return this.m_uiVertex;
			}
		}

		// Token: 0x06002801 RID: 10241 RVA: 0x000E8C50 File Offset: 0x000E6E50
		private void Awake()
		{
			if (!TMP_Settings.warningsDisabled)
			{
				Debug.LogWarning("InlineGraphicManager component is now Obsolete and has been removed from [" + base.gameObject.name + "] along with its InlineGraphic child.", this);
			}
			if (this.inlineGraphic.gameObject != null)
			{
				UnityEngine.Object.DestroyImmediate(this.inlineGraphic.gameObject);
				this.inlineGraphic = null;
			}
			UnityEngine.Object.DestroyImmediate(this);
		}

		// Token: 0x06002802 RID: 10242 RVA: 0x0001CCF3 File Offset: 0x0001AEF3
		private void OnEnable()
		{
			base.enabled = false;
		}

		// Token: 0x06002803 RID: 10243 RVA: 0x00002482 File Offset: 0x00000682
		private void OnDisable()
		{
		}

		// Token: 0x06002804 RID: 10244 RVA: 0x00002482 File Offset: 0x00000682
		private void OnDestroy()
		{
		}

		// Token: 0x06002805 RID: 10245 RVA: 0x000E8CBC File Offset: 0x000E6EBC
		private void LoadSpriteAsset(TMP_SpriteAsset spriteAsset)
		{
			if (spriteAsset == null)
			{
				if (TMP_Settings.defaultSpriteAsset != null)
				{
					spriteAsset = TMP_Settings.defaultSpriteAsset;
				}
				else
				{
					spriteAsset = (Resources.Load("Sprite Assets/Default Sprite Asset") as TMP_SpriteAsset);
				}
			}
			this.m_spriteAsset = spriteAsset;
			this.m_inlineGraphic.texture = this.m_spriteAsset.spriteSheet;
			if (this.m_textComponent != null && this.m_isInitialized)
			{
				this.m_textComponent.havePropertiesChanged = true;
				this.m_textComponent.SetVerticesDirty();
			}
		}

		// Token: 0x06002806 RID: 10246 RVA: 0x000E8D54 File Offset: 0x000E6F54
		public void AddInlineGraphicsChild()
		{
			if (this.m_inlineGraphic != null)
			{
				return;
			}
			GameObject gameObject = new GameObject("Inline Graphic");
			this.m_inlineGraphic = gameObject.AddComponent<InlineGraphic>();
			this.m_inlineGraphicRectTransform = gameObject.GetComponent<RectTransform>();
			this.m_inlineGraphicCanvasRenderer = gameObject.GetComponent<CanvasRenderer>();
			this.m_inlineGraphicRectTransform.SetParent(base.transform, false);
			this.m_inlineGraphicRectTransform.localPosition = Vector3.zero;
			this.m_inlineGraphicRectTransform.anchoredPosition3D = Vector3.zero;
			this.m_inlineGraphicRectTransform.sizeDelta = Vector2.zero;
			this.m_inlineGraphicRectTransform.anchorMin = Vector2.zero;
			this.m_inlineGraphicRectTransform.anchorMax = Vector2.one;
			this.m_textComponent = base.GetComponent<TMP_Text>();
		}

		// Token: 0x06002807 RID: 10247 RVA: 0x000E8E10 File Offset: 0x000E7010
		public void AllocatedVertexBuffers(int size)
		{
			if (this.m_inlineGraphic == null)
			{
				this.AddInlineGraphicsChild();
				this.LoadSpriteAsset(this.m_spriteAsset);
			}
			if (this.m_uiVertex == null)
			{
				this.m_uiVertex = new UIVertex[4];
			}
			int num = size * 4;
			if (num > this.m_uiVertex.Length)
			{
				this.m_uiVertex = new UIVertex[Mathf.NextPowerOfTwo(num)];
			}
		}

		// Token: 0x06002808 RID: 10248 RVA: 0x0001CCFC File Offset: 0x0001AEFC
		public void UpdatePivot(Vector2 pivot)
		{
			if (this.m_inlineGraphicRectTransform == null)
			{
				this.m_inlineGraphicRectTransform = this.m_inlineGraphic.GetComponent<RectTransform>();
			}
			this.m_inlineGraphicRectTransform.pivot = pivot;
		}

		// Token: 0x06002809 RID: 10249 RVA: 0x0001CD2C File Offset: 0x0001AF2C
		public void ClearUIVertex()
		{
			if (this.uiVertex != null && this.uiVertex.Length > 0)
			{
				Array.Clear(this.uiVertex, 0, this.uiVertex.Length);
				this.m_inlineGraphicCanvasRenderer.Clear();
			}
		}

		// Token: 0x0600280A RID: 10250 RVA: 0x0001CD66 File Offset: 0x0001AF66
		public void DrawSprite(UIVertex[] uiVertices, int spriteCount)
		{
			if (this.m_inlineGraphicCanvasRenderer == null)
			{
				this.m_inlineGraphicCanvasRenderer = this.m_inlineGraphic.GetComponent<CanvasRenderer>();
			}
			this.m_inlineGraphicCanvasRenderer.SetVertices(uiVertices, spriteCount * 4);
			this.m_inlineGraphic.UpdateMaterial();
		}

		// Token: 0x0600280B RID: 10251 RVA: 0x000E8E7C File Offset: 0x000E707C
		public TMP_Sprite GetSprite(int index)
		{
			if (this.m_spriteAsset == null)
			{
				Debug.LogWarning("No Sprite Asset is assigned.", this);
				return null;
			}
			if (this.m_spriteAsset.spriteInfoList == null || index > this.m_spriteAsset.spriteInfoList.Count - 1)
			{
				Debug.LogWarning("Sprite index exceeds the number of sprites in this Sprite Asset.", this);
				return null;
			}
			return this.m_spriteAsset.spriteInfoList[index];
		}

		// Token: 0x0600280C RID: 10252 RVA: 0x000E8EF0 File Offset: 0x000E70F0
		public int GetSpriteIndexByHashCode(int hashCode)
		{
			if (this.m_spriteAsset == null || this.m_spriteAsset.spriteInfoList == null)
			{
				Debug.LogWarning("No Sprite Asset is assigned.", this);
				return -1;
			}
			return this.m_spriteAsset.spriteInfoList.FindIndex((TMP_Sprite item) => item.hashCode == hashCode);
		}

		// Token: 0x0600280D RID: 10253 RVA: 0x000E8F58 File Offset: 0x000E7158
		public int GetSpriteIndexByIndex(int index)
		{
			if (this.m_spriteAsset == null || this.m_spriteAsset.spriteInfoList == null)
			{
				Debug.LogWarning("No Sprite Asset is assigned.", this);
				return -1;
			}
			return this.m_spriteAsset.spriteInfoList.FindIndex((TMP_Sprite item) => item.id == index);
		}

		// Token: 0x0600280E RID: 10254 RVA: 0x0001CDA4 File Offset: 0x0001AFA4
		public void SetUIVertex(UIVertex[] uiVertex)
		{
			this.m_uiVertex = uiVertex;
		}

		// Token: 0x04002DF3 RID: 11763
		[SerializeField]
		private TMP_SpriteAsset m_spriteAsset;

		// Token: 0x04002DF4 RID: 11764
		[SerializeField]
		[HideInInspector]
		private InlineGraphic m_inlineGraphic;

		// Token: 0x04002DF5 RID: 11765
		[SerializeField]
		[HideInInspector]
		private CanvasRenderer m_inlineGraphicCanvasRenderer;

		// Token: 0x04002DF6 RID: 11766
		private UIVertex[] m_uiVertex;

		// Token: 0x04002DF7 RID: 11767
		private RectTransform m_inlineGraphicRectTransform;

		// Token: 0x04002DF8 RID: 11768
		private TMP_Text m_textComponent;

		// Token: 0x04002DF9 RID: 11769
		private bool m_isInitialized;
	}
}
