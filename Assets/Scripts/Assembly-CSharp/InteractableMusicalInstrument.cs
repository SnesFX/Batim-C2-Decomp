using System;
using DG.Tweening;
using UnityEngine;

// Token: 0x020002D1 RID: 721
public class InteractableMusicalInstrument : Interactable
{
	// Token: 0x1400001D RID: 29
	// (add) Token: 0x0600107B RID: 4219 RVA: 0x00087620 File Offset: 0x00085A20
	// (remove) Token: 0x0600107C RID: 4220 RVA: 0x00087658 File Offset: 0x00085A58
	public event EventHandler OnNotePlayed;

	// Token: 0x170002C1 RID: 705
	// (get) Token: 0x0600107D RID: 4221 RVA: 0x0008768E File Offset: 0x00085A8E
	public InstrumentType InstrumentType
	{
		get
		{
			return this.m_InstrumentType;
		}
	}

	// Token: 0x0600107E RID: 4222 RVA: 0x00087698 File Offset: 0x00085A98
	public override void Init()
	{
		base.Init();
		if (this.m_InstrumentType == InstrumentType.BANJO)
		{
			this.m_InstrumentNotes = this.GetAudioClips("Audio/SFX/Instruments/Banjo");
		}
		else if (this.m_InstrumentType == InstrumentType.PIANO)
		{
			this.m_InstrumentNotes = this.GetAudioClips("Audio/SFX/Instruments/Piano");
		}
		else if (this.m_InstrumentType == InstrumentType.BASS_FIDDLE)
		{
			this.m_InstrumentNotes = this.GetAudioClips("Audio/SFX/Instruments/BassFiddle");
		}
		else if (this.m_InstrumentType == InstrumentType.VIOLIN)
		{
			this.m_InstrumentNotes = this.GetAudioClips("Audio/SFX/Instruments/Violin");
		}
		else if (this.m_InstrumentType == InstrumentType.DRUM)
		{
			this.m_InstrumentNotes = this.GetAudioClips("Audio/SFX/Instruments/Drum");
		}
	}

	// Token: 0x0600107F RID: 4223 RVA: 0x0008774F File Offset: 0x00085B4F
	public override void OnInteract()
	{
		this.PlayMusicalNote();
		this.OnNotePlayed.Send(this);
	}

	// Token: 0x06001080 RID: 4224 RVA: 0x00087764 File Offset: 0x00085B64
	private void PlayMusicalNote()
	{
		this.m_Active = false;
		this.m_Instrument.DOKill(false);
		this.m_Instrument.localScale = Vector3.one;
		this.m_Instrument.DOScale(1.025f, 0.05f).SetLoops(2, LoopType.Yoyo).SetEase(Ease.InOutQuad).OnComplete(new TweenCallback(this.HandleInstrumentAudioObjectOnComplete));
		if (this.m_InstrumentNotes == null || this.m_InstrumentNotes.Length <= 0)
		{
			return;
		}
		int num = UnityEngine.Random.Range(0, this.m_InstrumentNotes.Length);
		AudioClip audioClip = this.m_InstrumentNotes[num];
		this.m_InstrumentNotes[num] = this.m_InstrumentNotes[0];
		this.m_InstrumentNotes[0] = audioClip;
		GameManager.Instance.AudioManager.PlayAtPosition(audioClip, base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
	}

	// Token: 0x06001081 RID: 4225 RVA: 0x00087834 File Offset: 0x00085C34
	private void HandleInstrumentAudioObjectOnComplete()
	{
		this.m_Active = true;
	}

	// Token: 0x06001082 RID: 4226 RVA: 0x0008783D File Offset: 0x00085C3D
	private AudioClip[] GetAudioClips(string assetKey)
	{
		return GameManager.Instance.AssetManager.GetAssets<AudioClip>(assetKey);
	}

	// Token: 0x06001083 RID: 4227 RVA: 0x0008784F File Offset: 0x00085C4F
	protected override void OnDisposed()
	{
		this.m_Instrument.DOKill(false);
		this.m_InstrumentNotes = null;
		base.OnDisposed();
	}

	// Token: 0x04001298 RID: 4760
	[Header("Instrument")]
	[SerializeField]
	private Transform m_Instrument;

	// Token: 0x04001299 RID: 4761
	[SerializeField]
	private InstrumentType m_InstrumentType;

	// Token: 0x0400129A RID: 4762
	private AudioClip[] m_InstrumentNotes;
}
