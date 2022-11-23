using System;
using System.Collections.Generic;
using TMG.Controls;
using TMG.Core;
using UnityEngine;

namespace TMG.UI
{
	// Token: 0x02000304 RID: 772
	public class UIManager : TMGMonoBehaviour
	{
		// Token: 0x170002D7 RID: 727
		// (get) Token: 0x0600123F RID: 4671 RVA: 0x0008EEB3 File Offset: 0x0008D2B3
		// (set) Token: 0x06001240 RID: 4672 RVA: 0x0008EEBB File Offset: 0x0008D2BB
		public Camera Camera { get; private set; }

		// Token: 0x170002D8 RID: 728
		// (get) Token: 0x06001241 RID: 4673 RVA: 0x0008EEC4 File Offset: 0x0008D2C4
		// (set) Token: 0x06001242 RID: 4674 RVA: 0x0008EECC File Offset: 0x0008D2CC
		public Dictionary<string, UILayer> UILayers { get; private set; }

		// Token: 0x06001243 RID: 4675 RVA: 0x0008EED8 File Offset: 0x0008D2D8
		public static UIManager Create(object _data = null)
		{
			return new GameObject("[UI MANAGER]").AddComponent<UIManager>();
		}

		// Token: 0x06001244 RID: 4676 RVA: 0x0008EEF8 File Offset: 0x0008D2F8
		public override void Init()
		{
			base.Init();
			UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
			GameObject.FindGameObjectWithTag("UIVisualControls").transform.SetParent(base.transform);
			this.Camera = GameObject.FindGameObjectWithTag("UICamera").GetComponent<Camera>();
			this.UILayers = new Dictionary<string, UILayer>();
			this.UILayers.Add("VIEW", UILayer.Create("VIEW", 0f, base.transform));
			this.UILayers.Add("BORDERS", UILayer.Create("BORDERS", -20f, base.transform));
			this.UILayers.Add("CROSSHAIR", UILayer.Create("CROSSHAIR", -40f, base.transform));
			this.UILayers.Add("MODAL", UILayer.Create("MODAL", -80f, base.transform));
			this.UILayers.Add("PAUSE", UILayer.Create("PAUSE", -100f, base.transform));
			this.UILayers.Add("OBJECTIVE", UILayer.Create("OBJECTIVE", -120f, base.transform));
			this.UILayers.Add("NOTIFICATIONS", UILayer.Create("NOTIFICATIONS", -140f, base.transform));
			this.UILayers.Add("PROMPT", UILayer.Create("PROMPT", -160f, base.transform));
			this.UILayers.Add("LOADER", UILayer.Create("LOADER", -180f, base.transform));
			this.UILayers.Add("BLOCKER", UILayer.Create("BLOCKER", -200f, base.transform));
			this.UILayers.Add("CHAPTERTITLE", UILayer.Create("CHAPTERTITLE", -220f, base.transform));
			this.UILayers.Add("SUBTITLES", UILayer.Create("SUBTITLES", -240f, base.transform));
			this.UILayers.Add("ERROR", UILayer.Create("ERROR", -800f, base.transform));
		}

		// Token: 0x06001245 RID: 4677 RVA: 0x0008F134 File Offset: 0x0008D534
		public void Update()
		{
			if (GameManager.Instance.isPauseReady && PlayerInput.Pause())
			{
				if (!GameManager.Instance.isPaused)
				{
					GameManager.Instance.Pause();
				}
				else
				{
					GameManager.Instance.Unpause();
				}
			}
		}

		// Token: 0x06001246 RID: 4678 RVA: 0x0008F184 File Offset: 0x0008D584
		public T Show<T>(string assetKey, string layer, object data = null)
		{
			GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(GameManager.Instance.AssetManager.GetAsset<GameObject>(assetKey));
			UILayer uilayer = this.UILayers[layer];
			gameObject.transform.position = uilayer.transform.position;
			gameObject.transform.eulerAngles = uilayer.transform.eulerAngles;
			gameObject.transform.localScale = Vector3.one;
			gameObject.transform.SetParent(uilayer.transform);
			T component = gameObject.GetComponent<T>();
			(component as BaseUIController).InitController(data);
			(component as BaseUIController).PlayIn();
			return component;
		}

		// Token: 0x06001247 RID: 4679 RVA: 0x0008F22C File Offset: 0x0008D62C
		public void ClearLayer(string layer)
		{
			Transform child = this.UILayers[layer].transform.GetChild(0);
			if (child != null)
			{
				BaseUIController component = child.GetComponent<BaseUIController>();
				if (component != null)
				{
					component.Kill();
				}
				else
				{
					UnityEngine.Object.Destroy(child.gameObject);
				}
			}
		}

		// Token: 0x06001248 RID: 4680 RVA: 0x0008F286 File Offset: 0x0008D686
		protected override void OnDisposed()
		{
			base.OnDisposed();
		}
	}
}
