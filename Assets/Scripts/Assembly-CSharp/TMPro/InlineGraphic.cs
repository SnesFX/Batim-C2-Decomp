using System;
using UnityEngine;
using UnityEngine.UI;

namespace TMPro
{
	// Token: 0x0200058D RID: 1421
	public class InlineGraphic : MaskableGraphic
	{
		// Token: 0x170003F4 RID: 1012
		// (get) Token: 0x060027F2 RID: 10226 RVA: 0x0001CC73 File Offset: 0x0001AE73
		public override Texture mainTexture
		{
			get
			{
				if (this.texture == null)
				{
					return Graphic.s_WhiteTexture;
				}
				return this.texture;
			}
		}

		// Token: 0x060027F3 RID: 10227 RVA: 0x0001CC92 File Offset: 0x0001AE92
		protected override void Awake()
		{
			this.m_manager = base.GetComponentInParent<InlineGraphicManager>();
		}

		// Token: 0x060027F4 RID: 10228 RVA: 0x000E8B58 File Offset: 0x000E6D58
		protected override void OnEnable()
		{
			if (this.m_RectTransform == null)
			{
				this.m_RectTransform = base.gameObject.GetComponent<RectTransform>();
			}
			if (this.m_manager != null && this.m_manager.spriteAsset != null)
			{
				this.texture = this.m_manager.spriteAsset.spriteSheet;
			}
		}

		// Token: 0x060027F5 RID: 10229 RVA: 0x0001CCA0 File Offset: 0x0001AEA0
		protected override void OnDisable()
		{
			base.OnDisable();
		}

		// Token: 0x060027F6 RID: 10230 RVA: 0x00002482 File Offset: 0x00000682
		protected override void OnTransformParentChanged()
		{
		}

		// Token: 0x060027F7 RID: 10231 RVA: 0x000E8BC4 File Offset: 0x000E6DC4
		protected override void OnRectTransformDimensionsChange()
		{
			if (this.m_RectTransform == null)
			{
				this.m_RectTransform = base.gameObject.GetComponent<RectTransform>();
			}
			if (this.m_ParentRectTransform == null)
			{
				this.m_ParentRectTransform = this.m_RectTransform.parent.GetComponent<RectTransform>();
			}
			if (this.m_RectTransform.pivot != this.m_ParentRectTransform.pivot)
			{
				this.m_RectTransform.pivot = this.m_ParentRectTransform.pivot;
			}
		}

		// Token: 0x060027F8 RID: 10232 RVA: 0x0001CCA8 File Offset: 0x0001AEA8
		public new void UpdateMaterial()
		{
			base.UpdateMaterial();
		}

		// Token: 0x060027F9 RID: 10233 RVA: 0x00002482 File Offset: 0x00000682
		protected override void UpdateGeometry()
		{
		}

		// Token: 0x04002DEF RID: 11759
		public Texture texture;

		// Token: 0x04002DF0 RID: 11760
		private InlineGraphicManager m_manager;

		// Token: 0x04002DF1 RID: 11761
		private RectTransform m_RectTransform;

		// Token: 0x04002DF2 RID: 11762
		private RectTransform m_ParentRectTransform;
	}
}
