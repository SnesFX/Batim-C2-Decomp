using System;
using System.Collections.Generic;
using TMG.UI.Controls;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

// Token: 0x020002F0 RID: 752
public class GameMenuController : AbstractGameMenuController
{
	// Token: 0x06001184 RID: 4484 RVA: 0x0008BD0C File Offset: 0x0008A10C
	public override void InitController(object _data)
	{
		base.InitController(_data);
		Cursor.visible = true;
		Cursor.lockState = CursorLockMode.None;
		this.m_Sensitivity.value = GameManager.Instance.PlayerSettings.Sensitivity;
		this.m_Crosshair.isOn = GameManager.Instance.PlayerSettings.Crosshair;
		this.m_MasterVolume.value = GameManager.Instance.PlayerSettings.Volume;
		this.m_Subtitles.isOn = GameManager.Instance.PlayerSettings.Subtitles;
		this.InitQualityDropdown();
		this.InitResolutionDropdown();
		this.m_Fullscreen.isOn = Screen.fullScreen;
		if (SystemInfo.SupportsRenderTextureFormat(RenderTextureFormat.DefaultHDR))
		{
			this.m_HDR.onValueChanged.AddListener(new UnityAction<bool>(this.HandleHDRValueChange));
			this.m_HDR.isOn = GameManager.Instance.PlayerSettings.HDR;
		}
		else
		{
			this.m_HDR.isOn = false;
			this.m_HDR.interactable = false;
			GameManager.Instance.PlayerSettings.HDR = false;
		}
		if (GameManager.Instance.PlayerSettings.isPostProcessSupported)
		{
			this.m_DepthOfField.onValueChanged.AddListener(new UnityAction<bool>(this.HandleDOFValueChange));
			this.m_DepthOfField.isOn = GameManager.Instance.PlayerSettings.DoF;
			this.m_Bloom.onValueChanged.AddListener(new UnityAction<bool>(this.HandleBloomValueChange));
			this.m_Bloom.isOn = GameManager.Instance.PlayerSettings.Bloom;
		}
		else
		{
			this.m_DepthOfField.isOn = false;
			this.m_DepthOfField.interactable = false;
			GameManager.Instance.PlayerSettings.DoF = false;
			this.m_Bloom.isOn = false;
			this.m_Bloom.interactable = false;
			GameManager.Instance.PlayerSettings.Bloom = false;
		}
		if (!GameManager.Instance.PlayerSettings.isVolumetricLightSupported)
		{
		}
		if (GameManager.Instance.PlayerSettings.isSSAOSupported)
		{
			this.m_SSAO.onValueChanged.AddListener(new UnityAction<bool>(this.HandleSSAOValueChange));
			this.m_SSAO.isOn = GameManager.Instance.PlayerSettings.SSAO;
		}
		else
		{
			this.m_SSAO.isOn = false;
			this.m_SSAO.interactable = false;
			GameManager.Instance.PlayerSettings.SSAO = false;
		}
	}

	// Token: 0x06001185 RID: 4485 RVA: 0x0008BF7F File Offset: 0x0008A37F
	public override void PlayInComplete()
	{
		this.AddListeners();
	}

	// Token: 0x06001186 RID: 4486 RVA: 0x0008BF88 File Offset: 0x0008A388
	private void Update()
	{
	}

	// Token: 0x06001187 RID: 4487 RVA: 0x0008BF98 File Offset: 0x0008A398
	private void InitQualityDropdown()
	{
		List<string> list = new List<string>();
		for (int i = 0; i < GameManager.Instance.PlayerSettings.Quality.Count; i++)
		{
			list.Add(GameManager.Instance.PlayerSettings.Quality[i]);
			GameManager.Instance.PlayerSettings.currentQuality = QualitySettings.GetQualityLevel();
		}
		this.m_Quality.Dropdown.AddOptions(list);
		this.m_Quality.Dropdown.value = GameManager.Instance.PlayerSettings.currentQuality;
	}

	// Token: 0x06001188 RID: 4488 RVA: 0x0008C030 File Offset: 0x0008A430
	private void InitResolutionDropdown()
	{
		List<string> list = new List<string>();
		int value = 0;
		for (int i = 0; i < GameManager.Instance.PlayerSettings.Resolutions.Count; i++)
		{
			Resolution resolution = GameManager.Instance.PlayerSettings.Resolutions[i];
			list.Add(resolution.width.ToString() + "x" + resolution.height.ToString());
			if (resolution.height == Screen.currentResolution.height && resolution.width == Screen.currentResolution.width)
			{
				value = i;
				this.m_Resolution.CaptionText.text = resolution.width.ToString() + "x" + resolution.height.ToString();
			}
		}
		this.m_Resolution.Dropdown.AddOptions(list);
		this.m_Resolution.Dropdown.value = value;
	}

	// Token: 0x06001189 RID: 4489 RVA: 0x0008C15A File Offset: 0x0008A55A
	private void HandleCrosshairValueChange(bool active)
	{
		GameManager.Instance.PlayerSettings.Crosshair = active;
	}

	// Token: 0x0600118A RID: 4490 RVA: 0x0008C16C File Offset: 0x0008A56C
	private void HandleSubtitleValueChange(bool active)
	{
		GameManager.Instance.PlayerSettings.Subtitles = active;
	}

	// Token: 0x0600118B RID: 4491 RVA: 0x0008C180 File Offset: 0x0008A580
	private void HandleQualityValeChange(int index)
	{
		GameManager.Instance.PlayerSettings.currentQuality = index;
		this.m_Quality.Dropdown.value = index;
		this.m_Quality.CaptionText.text = GameManager.Instance.PlayerSettings.Quality[index];
		QualitySettings.SetQualityLevel(index, true);
	}

	// Token: 0x0600118C RID: 4492 RVA: 0x0008C1DC File Offset: 0x0008A5DC
	private void HandleResolutionValeChange(int index)
	{
		Resolution resolution = GameManager.Instance.PlayerSettings.Resolutions[index];
		this.m_Resolution.Dropdown.value = index;
		this.m_Resolution.CaptionText.text = resolution.width.ToString() + "x" + resolution.height.ToString();
		Screen.SetResolution(resolution.width, resolution.height, GameManager.Instance.PlayerSettings.isFullscreen);
	}

	// Token: 0x0600118D RID: 4493 RVA: 0x0008C276 File Offset: 0x0008A676
	private void HandleFullscreenValueChange(bool active)
	{
		GameManager.Instance.PlayerSettings.isFullscreen = active;
		Screen.fullScreen = active;
	}

	// Token: 0x0600118E RID: 4494 RVA: 0x0008C28E File Offset: 0x0008A68E
	private void HandleSensitivityValueChange(float value)
	{
		GameManager.Instance.PlayerSettings.Sensitivity = value;
		if (GameManager.Instance.Player != null)
		{
			GameManager.Instance.Player.SetSensitivity(value * 10f);
		}
	}

	// Token: 0x0600118F RID: 4495 RVA: 0x0008C2CB File Offset: 0x0008A6CB
	private void HandleVolumeValueChange(float value)
	{
		GameManager.Instance.PlayerSettings.Volume = value;
		AudioListener.volume = value;
	}

	// Token: 0x06001190 RID: 4496 RVA: 0x0008C2E3 File Offset: 0x0008A6E3
	private void HandleHDRValueChange(bool active)
	{
		GameManager.Instance.PlayerSettings.HDR = active;
		GameManager.Instance.GameCamera.Camera.allowHDR = active;
		GameManager.Instance.GameCamera.WeaponCamera.allowHDR = active;
	}

	// Token: 0x06001191 RID: 4497 RVA: 0x0008C31F File Offset: 0x0008A71F
	private void HandleDOFValueChange(bool active)
	{
		GameManager.Instance.PlayerSettings.DoF = active;
		GameManager.Instance.GameCamera.PostProcess.depthOfField = active;
	}

	// Token: 0x06001192 RID: 4498 RVA: 0x0008C346 File Offset: 0x0008A746
	private void HandleBloomValueChange(bool active)
	{
		GameManager.Instance.PlayerSettings.Bloom = active;
		GameManager.Instance.GameCamera.PostProcess.bloom = active;
	}

	// Token: 0x06001193 RID: 4499 RVA: 0x0008C36D File Offset: 0x0008A76D
	private void HandleSSAOValueChange(bool active)
	{
		GameManager.Instance.PlayerSettings.SSAO = active;
		GameManager.Instance.GameCamera.SSAO.enabled = active;
	}

	// Token: 0x06001194 RID: 4500 RVA: 0x0008C394 File Offset: 0x0008A794
	private void HandleQuitBtnOnClick(object sender, EventArgs e)
	{
		GameManager.Instance.UIManager.Show<QuitPromptController>("UI/Prompts/QuitPromptController", "PROMPT", null);
	}

	// Token: 0x06001195 RID: 4501 RVA: 0x0008C3B1 File Offset: 0x0008A7B1
	public void CloseMenu()
	{
		base.Kill();
	}

	// Token: 0x06001196 RID: 4502 RVA: 0x0008C3B9 File Offset: 0x0008A7B9
	public override void PlayOutComplete()
	{
		GameManager.Instance.Unpause();
		Cursor.visible = false;
		Cursor.lockState = CursorLockMode.Locked;
		base.PlayOutComplete();
	}

	// Token: 0x06001197 RID: 4503 RVA: 0x0008C3D8 File Offset: 0x0008A7D8
	private void AddListeners()
	{
		this.QuitBtn.OnClick += this.HandleQuitBtnOnClick;
		this.m_Sensitivity.onValueChanged.AddListener(new UnityAction<float>(this.HandleSensitivityValueChange));
		this.m_Crosshair.onValueChanged.AddListener(new UnityAction<bool>(this.HandleCrosshairValueChange));
		this.m_MasterVolume.onValueChanged.AddListener(new UnityAction<float>(this.HandleVolumeValueChange));
		this.m_Subtitles.onValueChanged.AddListener(new UnityAction<bool>(this.HandleSubtitleValueChange));
		this.m_Quality.Dropdown.onValueChanged.AddListener(new UnityAction<int>(this.HandleQualityValeChange));
		this.m_Resolution.Dropdown.onValueChanged.AddListener(new UnityAction<int>(this.HandleResolutionValeChange));
		this.m_Fullscreen.onValueChanged.AddListener(new UnityAction<bool>(this.HandleFullscreenValueChange));
	}

	// Token: 0x06001198 RID: 4504 RVA: 0x0008C4CC File Offset: 0x0008A8CC
	private void RemoveListeners()
	{
		this.QuitBtn.OnClick -= this.HandleQuitBtnOnClick;
		this.m_Sensitivity.onValueChanged.RemoveListener(new UnityAction<float>(this.HandleSensitivityValueChange));
		this.m_Crosshair.onValueChanged.RemoveListener(new UnityAction<bool>(this.HandleCrosshairValueChange));
		this.m_MasterVolume.onValueChanged.RemoveListener(new UnityAction<float>(this.HandleVolumeValueChange));
		this.m_Subtitles.onValueChanged.RemoveListener(new UnityAction<bool>(this.HandleSubtitleValueChange));
		this.m_Quality.Dropdown.onValueChanged.RemoveListener(new UnityAction<int>(this.HandleQualityValeChange));
		this.m_Resolution.Dropdown.onValueChanged.RemoveListener(new UnityAction<int>(this.HandleResolutionValeChange));
		this.m_Fullscreen.onValueChanged.RemoveListener(new UnityAction<bool>(this.HandleFullscreenValueChange));
		this.m_HDR.onValueChanged.RemoveListener(new UnityAction<bool>(this.HandleHDRValueChange));
		this.m_Bloom.onValueChanged.RemoveListener(new UnityAction<bool>(this.HandleBloomValueChange));
		this.m_DepthOfField.onValueChanged.RemoveListener(new UnityAction<bool>(this.HandleDOFValueChange));
		this.m_SSAO.onValueChanged.RemoveListener(new UnityAction<bool>(this.HandleSSAOValueChange));
	}

	// Token: 0x06001199 RID: 4505 RVA: 0x0008C62E File Offset: 0x0008AA2E
	protected override void OnDisposed()
	{
		this.RemoveListeners();
		base.OnDisposed();
	}

	// Token: 0x04001369 RID: 4969
	[Header("General")]
	[SerializeField]
	private Slider m_Sensitivity;

	// Token: 0x0400136A RID: 4970
	[SerializeField]
	private Toggle m_Crosshair;

	// Token: 0x0400136B RID: 4971
	[Header("Audio")]
	[SerializeField]
	private Slider m_MasterVolume;

	// Token: 0x0400136C RID: 4972
	[SerializeField]
	private Toggle m_Subtitles;

	// Token: 0x0400136D RID: 4973
	[Header("Graphics")]
	[SerializeField]
	private BaseUGUIDropdown m_Quality;

	// Token: 0x0400136E RID: 4974
	[SerializeField]
	private BaseUGUIDropdown m_Resolution;

	// Token: 0x0400136F RID: 4975
	[SerializeField]
	private Toggle m_Fullscreen;

	// Token: 0x04001370 RID: 4976
	[SerializeField]
	private Toggle m_HDR;

	// Token: 0x04001371 RID: 4977
	[SerializeField]
	private Toggle m_DepthOfField;

	// Token: 0x04001372 RID: 4978
	[SerializeField]
	private Toggle m_Bloom;

	// Token: 0x04001373 RID: 4979
	[SerializeField]
	private Toggle m_SSAO;

	// Token: 0x04001374 RID: 4980
	[Header("Buttons")]
	[SerializeField]
	private BaseUIButton QuitBtn;

	// Token: 0x04001375 RID: 4981
	private int currentChapterSelected;

	// Token: 0x04001376 RID: 4982
	private int selectedIndex;

	// Token: 0x04001377 RID: 4983
	private int indexMax = 1;

	// Token: 0x04001378 RID: 4984
	private float selectTimeNext;

	// Token: 0x04001379 RID: 4985
	private float selectTimeRate = 0.5f;

	// Token: 0x0400137A RID: 4986
	private bool isLoading;

	// Token: 0x0400137B RID: 4987
	private int _resume;

	// Token: 0x0400137C RID: 4988
	private int _quit = 1;
}
