using System;
using TMG.Core;
using UnityEngine;

namespace TMG.UI
{
	// Token: 0x02000305 RID: 773
	public class UILayer : TMGMonoBehaviour
	{
		// Token: 0x170002D9 RID: 729
		// (get) Token: 0x0600124A RID: 4682 RVA: 0x0008F296 File Offset: 0x0008D696
		// (set) Token: 0x0600124B RID: 4683 RVA: 0x0008F29E File Offset: 0x0008D69E
		public string Name { get; private set; }

		// Token: 0x170002DA RID: 730
		// (get) Token: 0x0600124C RID: 4684 RVA: 0x0008F2A7 File Offset: 0x0008D6A7
		// (set) Token: 0x0600124D RID: 4685 RVA: 0x0008F2AF File Offset: 0x0008D6AF
		public float Order { get; private set; }

		// Token: 0x0600124E RID: 4686 RVA: 0x0008F2B8 File Offset: 0x0008D6B8
		public static UILayer Create(string layerName, float layerOrder, Transform layerParent)
		{
			UILayer uilayer = new GameObject
			{
				name = "[UI Layer] - " + layerName
			}.AddComponent<UILayer>();
			uilayer.Name = layerName;
			uilayer.Order = layerOrder;
			uilayer.Init(layerParent);
			return uilayer;
		}

		// Token: 0x0600124F RID: 4687 RVA: 0x0008F2FC File Offset: 0x0008D6FC
		public void Init(Transform parent)
		{
			this.m_RectTransform = base.gameObject.AddComponent<RectTransform>();
			this.m_RectTransform.SetParent(parent);
			this.m_RectTransform.localPosition = new Vector3(0f, 0f, this.Order);
			this.m_RectTransform.localEulerAngles = Vector3.zero;
			this.m_RectTransform.localScale = Vector3.one;
			this.m_RectTransform.pivot = new Vector2(0.5f, 0.5f);
			this.m_RectTransform.anchorMax = new Vector2(1f, 1f);
			this.m_RectTransform.anchorMin = new Vector2(0f, 0f);
			this.m_RectTransform.offsetMax = new Vector2(0f, 0f);
			this.m_RectTransform.offsetMin = new Vector2(0f, 0f);
		}

		// Token: 0x040013F9 RID: 5113
		public bool isActive;

		// Token: 0x040013FC RID: 5116
		private RectTransform m_RectTransform;
	}
}
