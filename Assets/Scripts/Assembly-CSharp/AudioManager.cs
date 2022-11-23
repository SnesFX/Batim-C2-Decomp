using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x020002D8 RID: 728
public class AudioManager : TMGMonoBehaviour
{
	// Token: 0x170002C2 RID: 706
	// (get) Token: 0x060010AE RID: 4270 RVA: 0x0008860A File Offset: 0x00086A0A
	// (set) Token: 0x060010AF RID: 4271 RVA: 0x00088612 File Offset: 0x00086A12
	public Transform AudioManagerParent { get; private set; }

	// Token: 0x170002C3 RID: 707
	// (get) Token: 0x060010B0 RID: 4272 RVA: 0x0008861B File Offset: 0x00086A1B
	// (set) Token: 0x060010B1 RID: 4273 RVA: 0x00088623 File Offset: 0x00086A23
	public Transform PooledAudioObjectsParent { get; private set; }

	// Token: 0x170002C4 RID: 708
	// (get) Token: 0x060010B2 RID: 4274 RVA: 0x0008862C File Offset: 0x00086A2C
	// (set) Token: 0x060010B3 RID: 4275 RVA: 0x00088634 File Offset: 0x00086A34
	public Transform Ambience { get; private set; }

	// Token: 0x170002C5 RID: 709
	// (get) Token: 0x060010B4 RID: 4276 RVA: 0x0008863D File Offset: 0x00086A3D
	// (set) Token: 0x060010B5 RID: 4277 RVA: 0x00088645 File Offset: 0x00086A45
	public Transform SoundEffects { get; private set; }

	// Token: 0x170002C6 RID: 710
	// (get) Token: 0x060010B6 RID: 4278 RVA: 0x0008864E File Offset: 0x00086A4E
	// (set) Token: 0x060010B7 RID: 4279 RVA: 0x00088656 File Offset: 0x00086A56
	public Transform Music { get; private set; }

	// Token: 0x170002C7 RID: 711
	// (get) Token: 0x060010B8 RID: 4280 RVA: 0x0008865F File Offset: 0x00086A5F
	// (set) Token: 0x060010B9 RID: 4281 RVA: 0x00088667 File Offset: 0x00086A67
	public Transform Dialogue { get; private set; }

	// Token: 0x170002C8 RID: 712
	// (get) Token: 0x060010BA RID: 4282 RVA: 0x00088670 File Offset: 0x00086A70
	// (set) Token: 0x060010BB RID: 4283 RVA: 0x00088678 File Offset: 0x00086A78
	public AudioListener AudioListener { get; private set; }

	// Token: 0x060010BC RID: 4284 RVA: 0x00088684 File Offset: 0x00086A84
	public static AudioManager Create()
	{
		AudioManager audioManager = new GameObject("[Audio Manager]").AddComponent<AudioManager>();
		audioManager.AudioManagerParent = audioManager.transform;
		UnityEngine.Object.DontDestroyOnLoad(audioManager.gameObject);
		audioManager.AudioListener = audioManager.gameObject.AddComponent<AudioListener>();
		audioManager.PooledAudioObjectsParent = new GameObject("[Pooled Audio Objects]").transform;
		audioManager.PooledAudioObjectsParent.SetParent(audioManager.AudioManagerParent);
		audioManager.Ambience = new GameObject("[Ambience]").transform;
		audioManager.Ambience.SetParent(audioManager.AudioManagerParent);
		audioManager.SoundEffects = new GameObject("[Sound Effects]").transform;
		audioManager.SoundEffects.SetParent(audioManager.AudioManagerParent);
		audioManager.Music = new GameObject("[Music]").transform;
		audioManager.Music.SetParent(audioManager.AudioManagerParent);
		audioManager.Dialogue = new GameObject("[Dialogue]").transform;
		audioManager.Dialogue.SetParent(audioManager.AudioManagerParent);
		return audioManager;
	}

	// Token: 0x060010BD RID: 4285 RVA: 0x00088788 File Offset: 0x00086B88
	private void Update()
	{
		this.CheckForPooling();
		this.CheckDialogueQueue();
		this.CheckSoundEffectQueue();
	}

	// Token: 0x060010BE RID: 4286 RVA: 0x0008879C File Offset: 0x00086B9C
	public void ListenerSetActive(bool active)
	{
		this.AudioListener.enabled = active;
	}

	// Token: 0x060010BF RID: 4287 RVA: 0x000887AC File Offset: 0x00086BAC
	private void CheckForPooling()
	{
		if (this.m_UsedAudioObjects.Count <= 0)
		{
			return;
		}
		for (int i = 0; i < this.m_UsedAudioObjects.Count; i++)
		{
			this.SendToPool(this.m_UsedAudioObjects[i]);
		}
		this.m_UsedAudioObjects.Clear();
	}

	// Token: 0x060010C0 RID: 4288 RVA: 0x00088804 File Offset: 0x00086C04
	private void CheckDialogueQueue()
	{
		if (this.m_DialogueQueue.Count <= 0 || this.m_ActiveDialogue != null)
		{
			return;
		}
		this.m_DialogueTimer += Time.deltaTime;
		if (this.m_DialogueTimer >= this.m_DialogueLength)
		{
			this.m_DialogueLength = 0f;
			this.m_DialogueTimer = 0f;
			this.m_ActiveDialogue = this.m_DialogueQueue[0];
			this.m_DialogueLength = this.m_ActiveDialogue.AudioClip.length;
			this.m_DialogueQueue.RemoveAt(0);
			this.m_ActiveDialogue.IsQueued = false;
			this.m_ActiveDialogue.Play();
			this.m_ActiveDialogue.OnComplete += this.HandleActiveDialogueOnComplete;
		}
	}

	// Token: 0x060010C1 RID: 4289 RVA: 0x000888D0 File Offset: 0x00086CD0
	private void HandleActiveDialogueOnComplete(object sender, EventArgs e)
	{
		AudioObject audioObject = (AudioObject)sender;
		if (audioObject == null)
		{
			return;
		}
		audioObject.OnComplete -= this.HandleActiveDialogueOnComplete;
		this.m_ActiveDialogue = null;
		this.m_DialogueLength = 0f;
	}

	// Token: 0x060010C2 RID: 4290 RVA: 0x00088918 File Offset: 0x00086D18
	private void CheckSoundEffectQueue()
	{
		if (this.m_SoundEffectsQueue.Count <= 0)
		{
			return;
		}
		this.m_SoundEffectTimer += Time.deltaTime;
		if (this.m_SoundEffectTimer >= this.m_SoundEffectLength)
		{
			this.m_SoundEffectLength = 0f;
			this.m_SoundEffectTimer = 0f;
			AudioObject audioObject = this.m_SoundEffectsQueue[0];
			this.m_SoundEffectLength = ((this.m_SoundEffectsQueue.Count > 0) ? audioObject.AudioClip.length : 0f);
			this.m_SoundEffectsQueue.RemoveAt(0);
			audioObject.IsQueued = false;
			audioObject.Play();
		}
	}

	// Token: 0x060010C3 RID: 4291 RVA: 0x000889C4 File Offset: 0x00086DC4
	public AudioObject PlayAtPosition(string _clipKey, Vector3 position, AudioObjectType audioType = AudioObjectType.SOUND_EFFECT, int _loops = 0, bool isQueued = false, Transform parent = null)
	{
		AudioClip asset = GameManager.Instance.AssetManager.GetAsset<AudioClip>(_clipKey);
		return this.PlayAtPosition(asset, position, audioType, _loops, isQueued, parent);
	}

	// Token: 0x060010C4 RID: 4292 RVA: 0x000889F4 File Offset: 0x00086DF4
	public AudioObject PlayAtPosition(AudioClip _clip, Vector3 position, AudioObjectType audioType = AudioObjectType.SOUND_EFFECT, int _loops = 0, bool isQueued = false, Transform parent = null)
	{
		AudioObject fromPool = this.GetFromPool();
		fromPool.AudioClip = _clip;
		fromPool.Loops = _loops;
		fromPool.AudioSource.spatialBlend = 1f;
		fromPool.WorldPosition = position;
		fromPool.IsQueued = isQueued;
		fromPool.Parent = parent;
		fromPool.OnComplete += this.HandleAudioOnComplete;
		if (parent == null)
		{
			this.SetEditorParent(fromPool, audioType);
		}
		if (isQueued)
		{
			if (audioType == AudioObjectType.SOUND_EFFECT)
			{
				this.m_SoundEffectsQueue.Add(fromPool);
			}
			else if (audioType == AudioObjectType.DIALOGUE)
			{
				this.m_DialogueQueue.Add(fromPool);
			}
		}
		else
		{
			fromPool.Play();
		}
		return fromPool;
	}

	// Token: 0x060010C5 RID: 4293 RVA: 0x00088AA4 File Offset: 0x00086EA4
	public AudioObject Play(string _clipKey, AudioObjectType audioType = AudioObjectType.SOUND_EFFECT, int _loops = 0, bool isQueued = false)
	{
		AudioClip asset = GameManager.Instance.AssetManager.GetAsset<AudioClip>(_clipKey);
		return this.Play(asset, audioType, _loops, isQueued);
	}

	// Token: 0x060010C6 RID: 4294 RVA: 0x00088AD0 File Offset: 0x00086ED0
	public AudioObject Play(AudioClip _clip, AudioObjectType audioType = AudioObjectType.SOUND_EFFECT, int _loops = 0, bool isQueued = false)
	{
		AudioObject fromPool = this.GetFromPool();

		if(fromPool.AudioSource == null)
		return fromPool;
		
		fromPool.AudioClip = _clip;
		fromPool.Loops = _loops;
		fromPool.AudioSource.spatialBlend = 0f;
		fromPool.IsQueued = isQueued;
		fromPool.OnComplete += this.HandleAudioOnComplete;
		this.SetEditorParent(fromPool, audioType);
		if (isQueued)
		{
			if (audioType == AudioObjectType.SOUND_EFFECT)
			{
				this.m_SoundEffectsQueue.Add(fromPool);
			}
			else if (audioType == AudioObjectType.DIALOGUE)
			{
				this.m_DialogueQueue.Add(fromPool);
			}
		}
		else
		{
			fromPool.Play();
		}
		return fromPool;
	}

	// Token: 0x060010C7 RID: 4295 RVA: 0x00088B61 File Offset: 0x00086F61
	private void SetEditorParent(AudioObject audioObject, AudioObjectType audioType)
	{
	}

	// Token: 0x060010C8 RID: 4296 RVA: 0x00088B64 File Offset: 0x00086F64
	private AudioObject GetFromPool()
	{
		if (this.m_AudioObjectPool.Count <= 0)
		{
			this.m_AudioObjectPool.Add(this.CreateAudioObject());
		}
		AudioObject audioObject = this.m_AudioObjectPool[0];
		this.m_AudioObjectPool.Remove(audioObject);
		return audioObject;
	}

	// Token: 0x060010C9 RID: 4297 RVA: 0x00088BAE File Offset: 0x00086FAE
	private void SendToPool(AudioObject audioObject)
	{
		if (audioObject != null)
		{
			audioObject.Clear();
			this.m_AudioObjectPool.Add(audioObject);
		}
	}

	// Token: 0x060010CA RID: 4298 RVA: 0x00088BD0 File Offset: 0x00086FD0
	private void HandleAudioOnComplete(object sender, EventArgs e)
	{
		AudioObject audioObject = (AudioObject)sender;
		audioObject.OnComplete -= this.HandleAudioOnComplete;
		if (this.m_UsedAudioObjects == null || base.IsDisposed)
		{
			return;
		}
		this.m_UsedAudioObjects.Add(audioObject);
	}

	// Token: 0x060010CB RID: 4299 RVA: 0x00088C19 File Offset: 0x00087019
	private AudioObject CreateAudioObject()
	{
		return AudioObject.Create();
	}

	// Token: 0x060010CC RID: 4300 RVA: 0x00088C20 File Offset: 0x00087020
	public AudioClip Combine(List<AudioClip> clips)
	{
		int frequency = 48000;
		if (clips == null || clips.Count == 0)
		{
			return null;
		}
		int num = 0;
		for (int i = 0; i < clips.Count; i++)
		{
			if (!(clips[i] == null))
			{
				num += clips[i].samples;
				frequency = clips[i].frequency;
			}
		}
		float[] array = new float[num];
		num = 0;
		for (int j = 0; j < clips.Count; j++)
		{
			if (!(clips[j] == null))
			{
				float[] array2 = new float[clips[j].samples];
				clips[j].GetData(array2, 0);
				array2.CopyTo(array, num);
				num += array2.Length;
			}
		}
		if (num == 0)
		{
			return null;
		}
		AudioClip audioClip = AudioClip.Create("Combine", num, 1, frequency, false);
		audioClip.SetData(array, 0);
		return audioClip;
	}

	// Token: 0x060010CD RID: 4301 RVA: 0x00088D28 File Offset: 0x00087128
	public void ClearAll()
	{
		for (int i = 0; i < this.m_UsedAudioObjects.Count; i++)
		{
			this.SendToPool(this.m_UsedAudioObjects[i]);
		}
		this.m_UsedAudioObjects.Clear();
		for (int j = 0; j < this.m_SoundEffectsQueue.Count; j++)
		{
			this.SendToPool(this.m_SoundEffectsQueue[j]);
		}
		this.m_SoundEffectsQueue.Clear();
		for (int k = 0; k < this.m_DialogueQueue.Count; k++)
		{
			this.SendToPool(this.m_DialogueQueue[k]);
		}
		this.m_DialogueQueue.Clear();
	}

	// Token: 0x060010CE RID: 4302 RVA: 0x00088DE0 File Offset: 0x000871E0
	private void DisposeAll()
	{
		if (this.m_AudioObjectPool != null)
		{
			for (int i = this.m_AudioObjectPool.Count - 1; i >= 0; i--)
			{
				this.m_AudioObjectPool[i].Dispose();
			}
			this.m_AudioObjectPool.Clear();
		}
		if (this.m_UsedAudioObjects != null)
		{
			for (int j = this.m_UsedAudioObjects.Count - 1; j >= 0; j--)
			{
				this.m_UsedAudioObjects[j].Dispose();
			}
			this.m_UsedAudioObjects.Clear();
		}
		if (this.m_SoundEffectsQueue != null)
		{
			for (int k = this.m_SoundEffectsQueue.Count - 1; k >= 0; k--)
			{
				this.m_SoundEffectsQueue[k].Dispose();
			}
			this.m_SoundEffectsQueue.Clear();
		}
		if (this.m_DialogueQueue != null)
		{
			for (int l = this.m_DialogueQueue.Count - 1; l >= 0; l--)
			{
				this.m_DialogueQueue[l].Dispose();
			}
			this.m_DialogueQueue.Clear();
		}
		AudioObject[] array = UnityEngine.Object.FindObjectsOfType<AudioObject>();
		for (int m = array.Length - 1; m >= 0; m--)
		{
			array[m].Dispose();
		}
	}

	// Token: 0x060010CF RID: 4303 RVA: 0x00088F2D File Offset: 0x0008732D
	protected override void OnDisposed()
	{
		this.DisposeAll();
		this.m_AudioObjectPool = null;
		this.m_UsedAudioObjects = null;
		this.m_SoundEffectsQueue = null;
		this.m_DialogueQueue = null;
		this.m_ActiveDialogue = null;
		base.OnDisposed();
	}

	// Token: 0x040012BF RID: 4799
	private List<AudioObject> m_AudioObjectPool = new List<AudioObject>();

	// Token: 0x040012C0 RID: 4800
	private List<AudioObject> m_UsedAudioObjects = new List<AudioObject>();

	// Token: 0x040012C1 RID: 4801
	private List<AudioObject> m_SoundEffectsQueue = new List<AudioObject>();

	// Token: 0x040012C2 RID: 4802
	private List<AudioObject> m_DialogueQueue = new List<AudioObject>();

	// Token: 0x040012C3 RID: 4803
	private AudioObject m_ActiveDialogue;

	// Token: 0x040012C4 RID: 4804
	private float m_DialogueTimer;

	// Token: 0x040012C5 RID: 4805
	private float m_DialogueLength;

	// Token: 0x040012C6 RID: 4806
	private float m_SoundEffectTimer;

	// Token: 0x040012C7 RID: 4807
	private float m_SoundEffectLength;
}
