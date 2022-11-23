using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x02000263 RID: 611
public class ChapterOnePentagramDoorController : BaseController
{
	// Token: 0x06000CDB RID: 3291 RVA: 0x00077EFC File Offset: 0x000762FC
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_Door.Lock();
	}

	// Token: 0x06000CDC RID: 3292 RVA: 0x00077F0F File Offset: 0x0007630F
	public void Activate()
	{
		this.AddListeners();
	}

	// Token: 0x06000CDD RID: 3293 RVA: 0x00077F18 File Offset: 0x00076318
	private void HandleDoorOnOpened(object sender, EventArgs e)
	{
		this.m_Door.OnOpened -= this.HandleDoorOnOpened;
		base.SendOnComplete();
		if (this.m_CollapsedVisuals != null && this.m_CollapseAudioPosition != null)
		{
			this.m_CollapsedVisuals.SetActive(true);
			GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Floor_Boards_Break_01.L", this.m_CollapseAudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
			this.ScreenRumble();
		}
	}

	// Token: 0x06000CDE RID: 3294 RVA: 0x00077F9C File Offset: 0x0007639C
	private void HandleOnBroken(object sender, EventArgs e)
	{
		bool flag = false;
		int count = this.m_Breakables.Count;
		for (int i = 0; i < count; i++)
		{
			flag = this.m_Breakables[i].isDestroyed;
			if (!flag)
			{
				break;
			}
		}
		if (flag)
		{
			this.RemoveListeners();
			this.m_Door.Unlock();
			this.m_Door.OnOpened += this.HandleDoorOnOpened;
		}
	}

	// Token: 0x06000CDF RID: 3295 RVA: 0x00078014 File Offset: 0x00076414
	private void ScreenRumble()
	{
		GameManager.Instance.GameCamera.transform.DOShakePosition(0.5f, this.m_Intensity, this.m_Vibration, 90f, false, false).OnComplete(delegate
		{
			if (this.m_Vibration < this.m_MaxVibration)
			{
				this.m_Vibration += this.m_VibrationIncrease;
			}
			if (this.m_Intensity < this.m_MaxIntensity)
			{
				this.m_Intensity += this.m_IntensityIncrease;
			}
			this.ScreenRumble();
		});
	}

	// Token: 0x06000CE0 RID: 3296 RVA: 0x00078054 File Offset: 0x00076454
	private void AddListeners()
	{
		int count = this.m_Breakables.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_Breakables[i].OnBroken += this.HandleOnBroken;
		}
	}

	// Token: 0x06000CE1 RID: 3297 RVA: 0x0007809C File Offset: 0x0007649C
	private void RemoveListeners()
	{
		int count = this.m_Breakables.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_Breakables[i].OnBroken -= this.HandleOnBroken;
		}
	}

	// Token: 0x06000CE2 RID: 3298 RVA: 0x000780E4 File Offset: 0x000764E4
	protected override void OnDisposed()
	{
		this.RemoveListeners();
		this.m_Door.OnOpened -= this.HandleDoorOnOpened;
		base.OnDisposed();
	}

	// Token: 0x04000EF6 RID: 3830
	[Header("Transforms")]
	[SerializeField]
	private Transform m_CollapseAudioPosition;

	// Token: 0x04000EF7 RID: 3831
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_CollapsedVisuals;

	// Token: 0x04000EF8 RID: 3832
	[Header("Door")]
	[SerializeField]
	private DoorController m_Door;

	// Token: 0x04000EF9 RID: 3833
	[Header("Blockage")]
	[SerializeField]
	private List<Breakable> m_Breakables;

	// Token: 0x04000EFA RID: 3834
	private float m_Intensity = 0.05f;

	// Token: 0x04000EFB RID: 3835
	private float m_IntensityIncrease = 0.05f;

	// Token: 0x04000EFC RID: 3836
	private float m_MaxIntensity = 0.2f;

	// Token: 0x04000EFD RID: 3837
	private int m_Vibration = 8;

	// Token: 0x04000EFE RID: 3838
	private int m_VibrationIncrease = 1;

	// Token: 0x04000EFF RID: 3839
	private int m_MaxVibration = 15;
}
