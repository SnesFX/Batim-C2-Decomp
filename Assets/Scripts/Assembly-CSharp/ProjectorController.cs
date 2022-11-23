using System;
using System.Collections.Generic;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x020002E2 RID: 738
public class ProjectorController : TMGMonoBehaviour
{
	// Token: 0x170002D0 RID: 720
	// (get) Token: 0x0600112B RID: 4395 RVA: 0x0008A40C File Offset: 0x0008880C
	public Transform AudioPosition
	{
		get
		{
			return this.m_AudioPosition;
		}
	}

	// Token: 0x0600112C RID: 4396 RVA: 0x0008A414 File Offset: 0x00088814
	public override void Init()
	{
		base.Init();
		this.SetEnableGameObjectsActive(false);
	}

	// Token: 0x0600112D RID: 4397 RVA: 0x0008A424 File Offset: 0x00088824
	public void InitTurnOn()
	{
		int count = this.m_ProjectorWheels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_ProjectorWheels[i].DOLocalRotate(new Vector3(0f, 0f, 360f), 1.8f, RotateMode.LocalAxisAdd).SetEase(Ease.Linear).SetLoops(-1, LoopType.Restart);
		}
		this.SetEnableGameObjectsActive(true);
	}

	// Token: 0x0600112E RID: 4398 RVA: 0x0008A490 File Offset: 0x00088890
	public void InitTurnOff()
	{
		int count = this.m_ProjectorWheels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_ProjectorWheels[i].DOKill(false);
		}
		this.SetEnableGameObjectsActive(false);
	}

	// Token: 0x0600112F RID: 4399 RVA: 0x0008A4D8 File Offset: 0x000888D8
	public void TurnOn()
	{
		int count = this.m_ProjectorWheels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_ProjectorWheels[i].DOLocalRotate(new Vector3(0f, 0f, 360f), 1.8f, RotateMode.LocalAxisAdd).SetEase(Ease.Linear).SetLoops(-1, LoopType.Restart);
		}
		GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Projector_Switch_Turn_On_01", this.m_AudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.SetEnableGameObjectsActive(true);
	}

	// Token: 0x06001130 RID: 4400 RVA: 0x0008A568 File Offset: 0x00088968
	public void TurnOffSilent()
	{
		int count = this.m_ProjectorWheels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_ProjectorWheels[i].DOKill(false);
		}
		if (this.MusicAudioObject != null)
		{
			this.MusicAudioObject.Clear();
			this.MusicAudioObject = null;
		}
		if (this.FilmAudioObject != null)
		{
			this.FilmAudioObject.Clear();
			this.FilmAudioObject = null;
		}
		this.SetEnableGameObjectsActive(false);
	}

	// Token: 0x06001131 RID: 4401 RVA: 0x0008A5F4 File Offset: 0x000889F4
	public void TurnOff()
	{
		int count = this.m_ProjectorWheels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_ProjectorWheels[i].DOKill(false);
		}
		GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Projector_Switch_Turn_On_01", this.m_AudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		if (this.MusicAudioObject != null)
		{
			this.MusicAudioObject.Clear();
			this.MusicAudioObject = null;
		}
		if (this.FilmAudioObject != null)
		{
			this.FilmAudioObject.Clear();
			this.FilmAudioObject = null;
		}
		this.SetEnableGameObjectsActive(false);
	}

	// Token: 0x06001132 RID: 4402 RVA: 0x0008A6A4 File Offset: 0x00088AA4
	private void SetEnableGameObjectsActive(bool active)
	{
		int count = this.m_EnableGameObjects.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_EnableGameObjects[i].SetActive(active);
		}
	}

	// Token: 0x06001133 RID: 4403 RVA: 0x0008A6E4 File Offset: 0x00088AE4
	protected override void OnDisposed()
	{
		int count = this.m_ProjectorWheels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_ProjectorWheels[i].DOKill(false);
		}
		if (this.MusicAudioObject != null)
		{
			this.MusicAudioObject.Clear();
			this.MusicAudioObject = null;
		}
		if (this.FilmAudioObject != null)
		{
			this.FilmAudioObject.Clear();
			this.FilmAudioObject = null;
		}
		base.OnDisposed();
	}

	// Token: 0x04001302 RID: 4866
	[Header("Transforms")]
	[SerializeField]
	private Transform m_AudioPosition;

	// Token: 0x04001303 RID: 4867
	[Header("Projector Wheels")]
	[SerializeField]
	private List<Transform> m_ProjectorWheels;

	// Token: 0x04001304 RID: 4868
	[Header("Enable GameObjects")]
	[SerializeField]
	private List<GameObject> m_EnableGameObjects;

	// Token: 0x04001305 RID: 4869
	[HideInInspector]
	public AudioObject MusicAudioObject;

	// Token: 0x04001306 RID: 4870
	[HideInInspector]
	public AudioObject FilmAudioObject;
}
