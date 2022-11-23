using System;
using System.Collections.Generic;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x020002DE RID: 734
public class InkMachineController : TMGMonoBehaviour
{
	// Token: 0x06001115 RID: 4373 RVA: 0x00089CC4 File Offset: 0x000880C4
	public override void Init()
	{
		base.Init();
		this.m_ActiveGOCount = this.m_ActiveGameObjects.Count;
		this.m_GearsCount = this.m_Gears.Count;
	}

	// Token: 0x06001116 RID: 4374 RVA: 0x00089CEE File Offset: 0x000880EE
	public override void InitOnComplete()
	{
		this.m_InkMachineAudioClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Ink_Machine_Run_Loop_01");
		this.m_InkPipeClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Pipes_Ink_Flow_02");
		base.InitOnComplete();
	}

	// Token: 0x06001117 RID: 4375 RVA: 0x00089D2C File Offset: 0x0008812C
	public void TurnOn()
	{
		this.m_InkPipesAudio = GameManager.Instance.AudioManager.PlayAtPosition(this.m_InkPipeClip, this.m_AudioBehindLeverPosition.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
		for (int i = 0; i < this.m_AudioPositions.Count; i++)
		{
			this.m_InkMachineAudios.Add(GameManager.Instance.AudioManager.PlayAtPosition(this.m_InkMachineAudioClip, this.m_AudioPositions[i].position, AudioObjectType.SOUND_EFFECT, -1, false, null));
		}
		for (int j = 0; j < this.m_ActiveGOCount; j++)
		{
			this.m_ActiveGameObjects[j].SetActive(true);
		}
		this.m_Machine.DOKill(false);
		this.m_Machine.DOScaleY(1.01f, 0.15f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		for (int k = 0; k < this.m_GearsCount; k++)
		{
			Transform target = this.m_Gears[k];
			target.DOKill(false);
			target.DOLocalRotate(new Vector3(0f, 0f, 360f), 3.6f, RotateMode.LocalAxisAdd).SetEase(Ease.Linear).SetLoops(-1, LoopType.Restart);
		}
	}

	// Token: 0x06001118 RID: 4376 RVA: 0x00089E68 File Offset: 0x00088268
	public void TurnOff(bool isDisposing = false)
	{
		if (this.m_InkPipesAudio != null)
		{
			this.m_InkPipesAudio.Clear();
			this.m_InkPipesAudio = null;
		}
		for (int i = 0; i < this.m_InkMachineAudios.Count; i++)
		{
			AudioObject audioObject = this.m_InkMachineAudios[i];
			if (audioObject != null)
			{
				audioObject.Clear();
			}
		}
		this.m_Machine.DOKill(false);
		this.m_Machine.DOScaleY(1f, 0.15f).SetEase(Ease.OutQuad);
		for (int j = 0; j < this.m_GearsCount; j++)
		{
			Transform target = this.m_Gears[j];
			target.DOKill(false);
			if (!isDisposing)
			{
				target.DOLocalRotate(new Vector3(0f, 0f, 360f), 4f, RotateMode.LocalAxisAdd).SetEase(Ease.OutQuad);
			}
		}
	}

	// Token: 0x06001119 RID: 4377 RVA: 0x00089F55 File Offset: 0x00088355
	protected override void OnDisposed()
	{
		this.TurnOff(true);
		if (this.m_InkMachineAudios != null)
		{
			this.m_InkMachineAudios.Clear();
			this.m_InkMachineAudios = null;
		}
		base.OnDisposed();
	}

	// Token: 0x040012EB RID: 4843
	[Header("GameObjects")]
	[SerializeField]
	private List<GameObject> m_ActiveGameObjects;

	// Token: 0x040012EC RID: 4844
	[Header("Transforms")]
	[SerializeField]
	private Transform m_Machine;

	// Token: 0x040012ED RID: 4845
	[SerializeField]
	private Transform m_AudioBehindLeverPosition;

	// Token: 0x040012EE RID: 4846
	[SerializeField]
	private List<Transform> m_AudioPositions;

	// Token: 0x040012EF RID: 4847
	[SerializeField]
	private List<Transform> m_Gears;

	// Token: 0x040012F0 RID: 4848
	private List<AudioObject> m_InkMachineAudios = new List<AudioObject>();

	// Token: 0x040012F1 RID: 4849
	private AudioObject m_InkPipesAudio;

	// Token: 0x040012F2 RID: 4850
	private AudioClip m_InkMachineAudioClip;

	// Token: 0x040012F3 RID: 4851
	private AudioClip m_InkPipeClip;

	// Token: 0x040012F4 RID: 4852
	private int m_ActiveGOCount;

	// Token: 0x040012F5 RID: 4853
	private int m_GearsCount;
}
