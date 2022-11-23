using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

namespace TMG.Data
{
	// Token: 0x020002B3 RID: 691
	public class PlayerSettings : TMGAbstractDisposable
	{
		// Token: 0x170002B4 RID: 692
		// (get) Token: 0x06000FED RID: 4077 RVA: 0x000860CC File Offset: 0x000844CC
		// (set) Token: 0x06000FEE RID: 4078 RVA: 0x000860D4 File Offset: 0x000844D4
		public bool isFullscreen
		{
			get
			{
				return this.m_IsFullscreen;
			}
			set
			{
				this.m_IsFullscreen = value;
				int value2 = (!this.m_IsFullscreen) ? 0 : 1;
				PlayerPrefs.SetInt("FULLSCREEN", value2);
			}
		}

		// Token: 0x170002B5 RID: 693
		// (get) Token: 0x06000FEF RID: 4079 RVA: 0x00086108 File Offset: 0x00084508
		public List<Resolution> Resolutions
		{
			get
			{
				if (this.m_Resolutions == null || this.m_Resolutions.Count <= 0)
				{
					this.m_Resolutions = new List<Resolution>();
					Resolution[] resolutions = Screen.resolutions;
					foreach (Resolution item in resolutions)
					{
						this.m_Resolutions.Add(item);
					}
				}
				return this.m_Resolutions;
			}
		}

		// Token: 0x170002B6 RID: 694
		// (get) Token: 0x06000FF0 RID: 4080 RVA: 0x00086178 File Offset: 0x00084578
		public Dictionary<int, string> Quality
		{
			get
			{
				if (this.m_Quality == null || this.m_Quality.Count <= 0)
				{
					this.m_Quality = new Dictionary<int, string>();
					string[] array = new string[]
					{
						"Low",
						"Medium",
						"High"
					};
					for (int i = 0; i < 3; i++)
					{
						this.m_Quality.Add(i, array[i]);
					}
				}
				return this.m_Quality;
			}
		}

		// Token: 0x06000FF1 RID: 4081 RVA: 0x000861F4 File Offset: 0x000845F4
		public void InitializeResolution()
		{
			if (!PlayerPrefs.HasKey("FULLSCREEN"))
			{
				Debug.Log("Initializing Fullscreen");
				PlayerPrefs.SetInt("FULLSCREEN", 1);
			}
			if (!PlayerPrefs.HasKey("RESOLUTION_WIDTH"))
			{
				Debug.Log("Initializing Resolution Width");
				PlayerPrefsManager.Save("RESOLUTION_WIDTH", Screen.currentResolution.width);
			}
			if (!PlayerPrefs.HasKey("RESOLUTION_HEIGHT"))
			{
				Debug.Log("Initializing Resolution Height");
				PlayerPrefsManager.Save("RESOLUTION_HEIGHT", Screen.currentResolution.height);
			}
			this.m_IsFullscreen = PlayerPrefsManager.GetBool("FULLSCREEN");
			int @int = PlayerPrefsManager.GetInt("RESOLUTION_WIDTH");
			int int2 = PlayerPrefsManager.GetInt("RESOLUTION_HEIGHT");
			Screen.SetResolution(@int, int2, this.m_IsFullscreen);
			for (int i = 0; i < this.Resolutions.Count; i++)
			{
				if (this.Resolutions[i].width == @int && this.Resolutions[i].height == int2)
				{
					this.currentResolution = i;
					break;
				}
			}
			Debug.Log(string.Concat(new object[]
			{
				"Fullscreen: ",
				this.m_IsFullscreen,
				"\nResolution :",
				@int,
				" x ",
				int2,
				"\nResolution Index: ",
				this.currentResolution
			}));
		}

		// Token: 0x06000FF2 RID: 4082 RVA: 0x0008637B File Offset: 0x0008477B
		protected override void OnDisposed()
		{
			if (this.m_Resolutions != null)
			{
				this.m_Resolutions.Clear();
				this.m_Resolutions = null;
			}
			base.OnDisposed();
		}

		// Token: 0x04001207 RID: 4615
		public bool isVolumetricLightSupported;

		// Token: 0x04001208 RID: 4616
		public bool isPostProcessSupported;

		// Token: 0x04001209 RID: 4617
		public bool isSSAOSupported;

		// Token: 0x0400120A RID: 4618
		public bool HDR;

		// Token: 0x0400120B RID: 4619
		public bool DoF = true;

		// Token: 0x0400120C RID: 4620
		public bool Bloom = true;

		// Token: 0x0400120D RID: 4621
		public bool SSAO = true;

		// Token: 0x0400120E RID: 4622
		public bool Crosshair = true;

		// Token: 0x0400120F RID: 4623
		public bool Subtitles = true;

		// Token: 0x04001210 RID: 4624
		public float Volume = 1f;

		// Token: 0x04001211 RID: 4625
		public float Sensitivity = 0.3f;

		// Token: 0x04001212 RID: 4626
		public int currentQuality;

		// Token: 0x04001213 RID: 4627
		private bool m_IsFullscreen;

		// Token: 0x04001214 RID: 4628
		public int currentResolution;

		// Token: 0x04001215 RID: 4629
		private List<Resolution> m_Resolutions;

		// Token: 0x04001216 RID: 4630
		private Dictionary<int, string> m_Quality;
	}
}
