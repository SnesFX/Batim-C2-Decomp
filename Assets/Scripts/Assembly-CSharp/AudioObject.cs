using System;
using TMG.Core;
using UnityEngine;

// Token: 0x02000292 RID: 658
public class AudioObject : TMGMonoBehaviour
{
	// Token: 0x14000013 RID: 19
	// (add) Token: 0x06000EE4 RID: 3812 RVA: 0x00081FB8 File Offset: 0x000803B8
	// (remove) Token: 0x06000EE5 RID: 3813 RVA: 0x00081FF0 File Offset: 0x000803F0
	public event EventHandler OnComplete;

	// Token: 0x17000293 RID: 659
	// (get) Token: 0x06000EE6 RID: 3814 RVA: 0x00082026 File Offset: 0x00080426
	// (set) Token: 0x06000EE7 RID: 3815 RVA: 0x0008202E File Offset: 0x0008042E
	public AudioSource AudioSource { get; private set; }

	// Token: 0x17000294 RID: 660
	// (get) Token: 0x06000EE8 RID: 3816 RVA: 0x00082037 File Offset: 0x00080437
	// (set) Token: 0x06000EE9 RID: 3817 RVA: 0x00082044 File Offset: 0x00080444
	public Vector3 WorldPosition
	{
		get
		{
			return base.transform.position;
		}
		set
		{
			base.transform.position = value;
		}
	}

	// Token: 0x17000295 RID: 661
	// (get) Token: 0x06000EEA RID: 3818 RVA: 0x00082052 File Offset: 0x00080452
	// (set) Token: 0x06000EEB RID: 3819 RVA: 0x0008205F File Offset: 0x0008045F
	public Vector3 LocalPosition
	{
		get
		{
			return base.transform.localPosition;
		}
		set
		{
			base.transform.localPosition = value;
		}
	}

	// Token: 0x17000296 RID: 662
	// (get) Token: 0x06000EEC RID: 3820 RVA: 0x0008206D File Offset: 0x0008046D
	// (set) Token: 0x06000EED RID: 3821 RVA: 0x0008207A File Offset: 0x0008047A
	public Transform Parent
	{
		get
		{
			return base.transform.parent;
		}
		set
		{
			base.transform.SetParent(value);
		}
	}

	// Token: 0x17000297 RID: 663
	// (get) Token: 0x06000EEE RID: 3822 RVA: 0x00082088 File Offset: 0x00080488
	private AudioManager m_AudioManager
	{
		get
		{
			return GameManager.Instance.AudioManager;
		}
	}

	// Token: 0x06000EEF RID: 3823 RVA: 0x00082094 File Offset: 0x00080494
	public static AudioObject Create()
	{
		AudioObject audioObject = GameManager.Instance.AssetManager.CreateAsset<AudioObject>("GamePlay/Audio/AudioObject");
		UnityEngine.Object.DontDestroyOnLoad(audioObject.gameObject);
		audioObject.AudioSource = audioObject.GetComponent<AudioSource>();
		audioObject.AudioSource.playOnAwake = false;
		audioObject.AudioSource.mute = false;
		return audioObject;
	}

	// Token: 0x06000EF0 RID: 3824 RVA: 0x000820E8 File Offset: 0x000804E8
	private void Update()
	{
		if (this.AudioSource.isPlaying || this.IsQueued)
		{
			return;
		}
		this.m_TimesPlayed++;
		if (this.Loops == -1 || (this.Loops > 0 && this.m_TimesPlayed < this.Loops))
		{
			this.AudioSource.time = 0f;
			this.AudioSource.Play();
		}
		else
		{
			this.Stop();
		}
	}

	// Token: 0x06000EF1 RID: 3825 RVA: 0x0008216E File Offset: 0x0008056E
	public void Play()
	{
		this.AudioSource.clip = this.AudioClip;
		this.m_TimesPlayed = 0;
		this.AudioSource.time = 0f;
		this.AudioSource.Play();
	}

	// Token: 0x06000EF2 RID: 3826 RVA: 0x000821A3 File Offset: 0x000805A3
	public void Pause()
	{
		this.m_PauseTime = this.AudioSource.time;
		this.AudioSource.Pause();
	}

	// Token: 0x06000EF3 RID: 3827 RVA: 0x000821C1 File Offset: 0x000805C1
	public void Resume()
	{
		this.AudioSource.time = this.m_PauseTime;
		this.AudioSource.Play();
	}

	// Token: 0x06000EF4 RID: 3828 RVA: 0x000821DF File Offset: 0x000805DF
	public void Stop()
	{
		if (this.AudioSource != null)
		{
			this.AudioSource.Stop();
			this.OnComplete.Send(this);
		}
	}

	// Token: 0x06000EF5 RID: 3829 RVA: 0x00082209 File Offset: 0x00080609
	public void Clear()
	{
		this.OnComplete = null;

		if(this.AudioSource != null)
		this.AudioSource.clip = null;

		this.AudioClip = null;
		this.Parent = null;
		this.m_IsMuted = false;
		this.m_Volume = 1f;
	}

	// Token: 0x06000EF6 RID: 3830 RVA: 0x00082240 File Offset: 0x00080640
	protected override void OnDisposed()
	{
		this.OnComplete = null;
		this.AudioClip = null;
		if (this.AudioSource != null)
		{
			this.AudioSource.Stop();
			this.AudioSource.clip = null;
			this.AudioSource = null;
		}
		base.OnDisposed();
	}

	// Token: 0x040010A9 RID: 4265
	public const string DEFAULT_NAME = "[POOLED AUDIO OBJECT]";

	// Token: 0x040010AB RID: 4267
	public AudioClip AudioClip;

	// Token: 0x040010AC RID: 4268
	public int Loops;

	// Token: 0x040010AD RID: 4269
	public bool IsQueued;

	// Token: 0x040010AE RID: 4270
	private bool m_IsMuted;

	// Token: 0x040010AF RID: 4271
	private float m_Volume;

	// Token: 0x040010B0 RID: 4272
	private int m_TimesPlayed;

	// Token: 0x040010B1 RID: 4273
	private float m_PauseTime;
}
