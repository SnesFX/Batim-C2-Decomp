using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace TMPro
{
	// Token: 0x020005E4 RID: 1508
	public class TMP_UpdateRegistry
	{
		// Token: 0x06002BDD RID: 11229 RVA: 0x0010D44C File Offset: 0x0010B64C
		protected TMP_UpdateRegistry()
		{
			Canvas.willRenderCanvases += this.PerformUpdateForCanvasRendererObjects;
		}

		// Token: 0x170004E7 RID: 1255
		// (get) Token: 0x06002BDE RID: 11230 RVA: 0x0001F988 File Offset: 0x0001DB88
		public static TMP_UpdateRegistry instance
		{
			get
			{
				if (TMP_UpdateRegistry.s_Instance == null)
				{
					TMP_UpdateRegistry.s_Instance = new TMP_UpdateRegistry();
				}
				return TMP_UpdateRegistry.s_Instance;
			}
		}

		// Token: 0x06002BDF RID: 11231 RVA: 0x0001F9A3 File Offset: 0x0001DBA3
		public static void RegisterCanvasElementForLayoutRebuild(ICanvasElement element)
		{
			TMP_UpdateRegistry.instance.InternalRegisterCanvasElementForLayoutRebuild(element);
		}

		// Token: 0x06002BE0 RID: 11232 RVA: 0x0010D49C File Offset: 0x0010B69C
		private bool InternalRegisterCanvasElementForLayoutRebuild(ICanvasElement element)
		{
			int instanceID = (element as UnityEngine.Object).GetInstanceID();
			if (this.m_LayoutQueueLookup.ContainsKey(instanceID))
			{
				return false;
			}
			this.m_LayoutQueueLookup[instanceID] = instanceID;
			this.m_LayoutRebuildQueue.Add(element);
			return true;
		}

		// Token: 0x06002BE1 RID: 11233 RVA: 0x0001F9B1 File Offset: 0x0001DBB1
		public static void RegisterCanvasElementForGraphicRebuild(ICanvasElement element)
		{
			TMP_UpdateRegistry.instance.InternalRegisterCanvasElementForGraphicRebuild(element);
		}

		// Token: 0x06002BE2 RID: 11234 RVA: 0x0010D4E4 File Offset: 0x0010B6E4
		private bool InternalRegisterCanvasElementForGraphicRebuild(ICanvasElement element)
		{
			int instanceID = (element as UnityEngine.Object).GetInstanceID();
			if (this.m_GraphicQueueLookup.ContainsKey(instanceID))
			{
				return false;
			}
			this.m_GraphicQueueLookup[instanceID] = instanceID;
			this.m_GraphicRebuildQueue.Add(element);
			return true;
		}

		// Token: 0x06002BE3 RID: 11235 RVA: 0x0010D52C File Offset: 0x0010B72C
		private void PerformUpdateForCanvasRendererObjects()
		{
			for (int i = 0; i < this.m_LayoutRebuildQueue.Count; i++)
			{
				ICanvasElement canvasElement = TMP_UpdateRegistry.instance.m_LayoutRebuildQueue[i];
				canvasElement.Rebuild(CanvasUpdate.Prelayout);
			}
			if (this.m_LayoutRebuildQueue.Count > 0)
			{
				this.m_LayoutRebuildQueue.Clear();
				this.m_LayoutQueueLookup.Clear();
			}
			for (int j = 0; j < this.m_GraphicRebuildQueue.Count; j++)
			{
				ICanvasElement canvasElement2 = TMP_UpdateRegistry.instance.m_GraphicRebuildQueue[j];
				canvasElement2.Rebuild(CanvasUpdate.PreRender);
			}
			if (this.m_GraphicRebuildQueue.Count > 0)
			{
				this.m_GraphicRebuildQueue.Clear();
				this.m_GraphicQueueLookup.Clear();
			}
		}

		// Token: 0x06002BE4 RID: 11236 RVA: 0x0001F9BF File Offset: 0x0001DBBF
		private void PerformUpdateForMeshRendererObjects()
		{
			Debug.Log("Perform update of MeshRenderer objects.");
		}

		// Token: 0x06002BE5 RID: 11237 RVA: 0x0001F9CB File Offset: 0x0001DBCB
		public static void UnRegisterCanvasElementForRebuild(ICanvasElement element)
		{
			TMP_UpdateRegistry.instance.InternalUnRegisterCanvasElementForLayoutRebuild(element);
			TMP_UpdateRegistry.instance.InternalUnRegisterCanvasElementForGraphicRebuild(element);
		}

		// Token: 0x06002BE6 RID: 11238 RVA: 0x0010D5F0 File Offset: 0x0010B7F0
		private void InternalUnRegisterCanvasElementForLayoutRebuild(ICanvasElement element)
		{
			int instanceID = (element as UnityEngine.Object).GetInstanceID();
			TMP_UpdateRegistry.instance.m_LayoutRebuildQueue.Remove(element);
			this.m_GraphicQueueLookup.Remove(instanceID);
		}

		// Token: 0x06002BE7 RID: 11239 RVA: 0x0010D628 File Offset: 0x0010B828
		private void InternalUnRegisterCanvasElementForGraphicRebuild(ICanvasElement element)
		{
			int instanceID = (element as UnityEngine.Object).GetInstanceID();
			TMP_UpdateRegistry.instance.m_GraphicRebuildQueue.Remove(element);
			this.m_LayoutQueueLookup.Remove(instanceID);
		}

		// Token: 0x040030CE RID: 12494
		private static TMP_UpdateRegistry s_Instance;

		// Token: 0x040030CF RID: 12495
		private readonly List<ICanvasElement> m_LayoutRebuildQueue = new List<ICanvasElement>();

		// Token: 0x040030D0 RID: 12496
		private Dictionary<int, int> m_LayoutQueueLookup = new Dictionary<int, int>();

		// Token: 0x040030D1 RID: 12497
		private readonly List<ICanvasElement> m_GraphicRebuildQueue = new List<ICanvasElement>();

		// Token: 0x040030D2 RID: 12498
		private Dictionary<int, int> m_GraphicQueueLookup = new Dictionary<int, int>();
	}
}
