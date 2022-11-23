using System;
using ScionEngine;
using TMG.Core;
using TMG.Data;
using UnityEngine;

// Token: 0x02000297 RID: 663
public class GameCamera : TMGMonoBehaviour
{
	// Token: 0x1700029A RID: 666
	// (get) Token: 0x06000F0E RID: 3854 RVA: 0x00082C52 File Offset: 0x00081052
	public Camera WeaponCamera
	{
		get
		{
			return this.m_WeaponCamera;
		}
	}

	// Token: 0x1700029B RID: 667
	// (get) Token: 0x06000F0F RID: 3855 RVA: 0x00082C5A File Offset: 0x0008105A
	// (set) Token: 0x06000F10 RID: 3856 RVA: 0x00082C62 File Offset: 0x00081062
	public Camera Camera { get; private set; }

	// Token: 0x1700029C RID: 668
	// (get) Token: 0x06000F11 RID: 3857 RVA: 0x00082C6B File Offset: 0x0008106B
	// (set) Token: 0x06000F12 RID: 3858 RVA: 0x00082C73 File Offset: 0x00081073
	public ScionPostProcess PostProcess { get; private set; }

	// Token: 0x1700029D RID: 669
	// (get) Token: 0x06000F13 RID: 3859 RVA: 0x00082C7C File Offset: 0x0008107C
	// (set) Token: 0x06000F14 RID: 3860 RVA: 0x00082C84 File Offset: 0x00081084
	public AmplifyOcclusionEffect SSAO { get; private set; }

	// Token: 0x1700029E RID: 670
	// (get) Token: 0x06000F15 RID: 3861 RVA: 0x00082C8D File Offset: 0x0008108D
	// (set) Token: 0x06000F16 RID: 3862 RVA: 0x00082C95 File Offset: 0x00081095
	public VolumetricLightRenderer VolumetricLighting { get; private set; }

	// Token: 0x06000F17 RID: 3863 RVA: 0x00082CA0 File Offset: 0x000810A0
	public override void Init()
	{
		base.Init();
		this.Camera = base.GetComponent<Camera>();
		this.PostProcess = base.GetComponent<ScionPostProcess>();
		this.VolumetricLighting = base.GetComponent<VolumetricLightRenderer>();
		this.SSAO = base.GetComponent<AmplifyOcclusionEffect>();
		this.Camera.enabled = false;
		GameManager.Instance.GameCamera = this;
	}

	// Token: 0x06000F18 RID: 3864 RVA: 0x00082CFC File Offset: 0x000810FC
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		if (GameManager.Instance.PlayerSettings == null)
		{
			GameManager.Instance.PlayerSettings = new PlayerSettings();
		}
		GameManager.Instance.PlayerSettings.isPostProcessSupported = this.PostProcess.enabled;
		GameManager.Instance.PlayerSettings.isVolumetricLightSupported = this.VolumetricLighting.enabled;
		GameManager.Instance.PlayerSettings.isSSAOSupported = this.SSAO.enabled;
		this.Camera.enabled = true;
	}

	// Token: 0x06000F19 RID: 3865 RVA: 0x00082D87 File Offset: 0x00081187
	protected override void OnDisposed()
	{
		this.Camera = null;
		this.m_WeaponCamera = null;
		this.PostProcess = null;
		this.VolumetricLighting = null;
		this.SSAO = null;
		base.OnDisposed();
	}

	// Token: 0x040010D3 RID: 4307
	[SerializeField]
	private Camera m_WeaponCamera;
}
