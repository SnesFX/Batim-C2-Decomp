using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x020002CD RID: 717
public class DoorController : Interactable
{
	// Token: 0x1400001A RID: 26
	// (add) Token: 0x0600103A RID: 4154 RVA: 0x00087038 File Offset: 0x00085438
	// (remove) Token: 0x0600103B RID: 4155 RVA: 0x00087070 File Offset: 0x00085470
	public event EventHandler OnOpened;

	// Token: 0x1400001B RID: 27
	// (add) Token: 0x0600103C RID: 4156 RVA: 0x000870A8 File Offset: 0x000854A8
	// (remove) Token: 0x0600103D RID: 4157 RVA: 0x000870E0 File Offset: 0x000854E0
	public event EventHandler OnClosed;

	// Token: 0x170002B9 RID: 697
	// (get) Token: 0x0600103E RID: 4158 RVA: 0x00087116 File Offset: 0x00085516
	// (set) Token: 0x0600103F RID: 4159 RVA: 0x0008711E File Offset: 0x0008551E
	public bool IsSilent { get; private set; }

	// Token: 0x170002BA RID: 698
	// (get) Token: 0x06001040 RID: 4160 RVA: 0x00087127 File Offset: 0x00085527
	// (set) Token: 0x06001041 RID: 4161 RVA: 0x0008712F File Offset: 0x0008552F
	public bool IsLocked { get; private set; }

	// Token: 0x170002BB RID: 699
	// (get) Token: 0x06001042 RID: 4162 RVA: 0x00087138 File Offset: 0x00085538
	// (set) Token: 0x06001043 RID: 4163 RVA: 0x00087140 File Offset: 0x00085540
	public bool IsOpen { get; private set; }

	// Token: 0x06001044 RID: 4164 RVA: 0x00087149 File Offset: 0x00085549
	public override void Init()
	{
		base.Init();
		this.IsLocked = this.m_IsLocked;
	}

	// Token: 0x06001045 RID: 4165 RVA: 0x0008715D File Offset: 0x0008555D
	public override void OnInteract()
	{
		if (!this.IsOpen)
		{
			this.Open();
		}
	}

	// Token: 0x06001046 RID: 4166 RVA: 0x00087170 File Offset: 0x00085570
	public void Lock()
	{
		this.IsLocked = true;
	}

	// Token: 0x06001047 RID: 4167 RVA: 0x00087179 File Offset: 0x00085579
	public void Unlock()
	{
		this.IsLocked = false;
	}

	// Token: 0x06001048 RID: 4168 RVA: 0x00087182 File Offset: 0x00085582
	public void Open()
	{
		this.Open(1f, Ease.OutQuad, null, 145f);
	}

	// Token: 0x06001049 RID: 4169 RVA: 0x00087196 File Offset: 0x00085596
	public void Open(float speed)
	{
		this.Open(speed, Ease.OutQuad, null, 145f);
	}

	// Token: 0x0600104A RID: 4170 RVA: 0x000871A6 File Offset: 0x000855A6
	public void Open(float speed, float rotation)
	{
		this.Open(speed, Ease.OutQuad, null, rotation);
	}

	// Token: 0x0600104B RID: 4171 RVA: 0x000871B4 File Offset: 0x000855B4
	public void Open(float speed, Ease ease, Action onComplete, float rotation = 145f)
	{
		if (this.IsLocked)
		{
			if (this.m_LockAudioObject == null)
			{
				this.m_LockAudioObject = this.PlayLockedAudio();
				this.m_LockAudioObject.OnComplete += this.HandleLockAudioOnComplete;
			}
		}
		else
		{
			if (!this.IsSilent)
			{
				GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/Door/SFX_Door_Generic_Open_01", base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
			}
			this.IsOpen = true;
			this.AnimateDoor(new Vector3(0f, rotation, 0f), speed, ease, onComplete);
			this.OnOpened.Send(this);
		}
	}

	// Token: 0x0600104C RID: 4172 RVA: 0x00087261 File Offset: 0x00085661
	private void HandleLockAudioOnComplete(object sender, EventArgs e)
	{
		this.m_LockAudioObject.OnComplete -= this.HandleLockAudioOnComplete;
		this.m_LockAudioObject.Clear();
		this.m_LockAudioObject = null;
	}

	// Token: 0x0600104D RID: 4173 RVA: 0x0008728C File Offset: 0x0008568C
	public void Close()
	{
		this.Close(1f, Ease.InQuad, null);
	}

	// Token: 0x0600104E RID: 4174 RVA: 0x0008729B File Offset: 0x0008569B
	public void Close(float speed)
	{
		this.Close(speed, Ease.InQuad, null);
	}

	// Token: 0x0600104F RID: 4175 RVA: 0x000872A8 File Offset: 0x000856A8
	public void Close(float speed, Ease ease, Action onComplete)
	{
		if (!this.IsSilent)
		{
			GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/Door/SFX_Door_Generic_Close_01", base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		}
		this.IsOpen = false;
		this.AnimateDoor(Vector3.zero, speed, ease, onComplete);
		this.OnClosed.Send(this);
	}

	// Token: 0x06001050 RID: 4176 RVA: 0x00087305 File Offset: 0x00085705
	public void SetSilent(bool isSilent)
	{
		this.IsSilent = isSilent;
	}

	// Token: 0x06001051 RID: 4177 RVA: 0x00087310 File Offset: 0x00085710
	private void AnimateDoor(Vector3 rotation, float speed, Ease ease, Action onComplete)
	{
		this.m_DoorCollider.enabled = false;
		this.m_DoorHinge.DOKill(false);
		this.m_DoorHinge.DOLocalRotate(rotation, speed, RotateMode.Fast).SetEase(ease).OnComplete(delegate
		{
			this.m_DoorCollider.enabled = true;
			if (onComplete != null)
			{
				onComplete();
			}
		});
	}

	// Token: 0x06001052 RID: 4178 RVA: 0x00087374 File Offset: 0x00085774
	private AudioObject PlayLockedAudio()
	{
		if (this.m_LockAudioClips.Count <= 0)
		{
			return null;
		}
		int index = UnityEngine.Random.Range(0, this.m_LockAudioClips.Count);
		AudioClip audioClip = this.m_LockAudioClips[index];
		AudioObject result = GameManager.Instance.AudioManager.PlayAtPosition(audioClip, base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_LockAudioClips[index] = this.m_LockAudioClips[0];
		this.m_LockAudioClips[0] = audioClip;
		return result;
	}

	// Token: 0x06001053 RID: 4179 RVA: 0x000873F9 File Offset: 0x000857F9
	protected override void OnDisposed()
	{
		this.m_DoorHinge.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x04001277 RID: 4727
	[Header("Transforms")]
	[SerializeField]
	private Transform m_DoorHinge;

	// Token: 0x04001278 RID: 4728
	[Header("Collider")]
	[SerializeField]
	private Collider m_DoorCollider;

	// Token: 0x04001279 RID: 4729
	[Header("Options")]
	[SerializeField]
	private bool m_IsLocked;

	// Token: 0x0400127A RID: 4730
	[SerializeField]
	private List<AudioClip> m_LockAudioClips;

	// Token: 0x0400127B RID: 4731
	private AudioObject m_LockAudioObject;
}
