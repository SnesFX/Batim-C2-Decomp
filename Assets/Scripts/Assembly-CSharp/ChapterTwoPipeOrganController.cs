using System;
using UnityEngine;

// Token: 0x02000276 RID: 630
public class ChapterTwoPipeOrganController : BaseController
{
	// Token: 0x06000DC4 RID: 3524 RVA: 0x0007D3C4 File Offset: 0x0007B7C4
	public override void Init()
	{
		base.Init();
		this.m_PipeOrganInteract.OnInteracted += this.HandlePipeOrganOnInteracted;
	}

	// Token: 0x06000DC5 RID: 3525 RVA: 0x0007D3E3 File Offset: 0x0007B7E3
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_PipeOrganAudioClips = GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Instruments/PipeOrgan");
	}

	// Token: 0x06000DC6 RID: 3526 RVA: 0x0007D408 File Offset: 0x0007B808
	private void HandlePipeOrganOnInteracted(object sender, EventArgs e)
	{
		this.m_PipeOrganInteract.SetActive(false);
		this.m_PipeOrganInteract.OnInteracted -= this.HandlePipeOrganOnInteracted;
		this.PlayPipeOrganAudio();
		if (!this.m_HasAchievement)
		{
			this.m_InteractCount++;
			if (this.m_InteractCount >= this.m_InteractMax)
			{
				this.m_HasAchievement = true;
				GameManager.Instance.AchievementManager.SetAchievement(AchievementName.JOHNNYS_BROKEN_HEART);
			}
		}
	}

	// Token: 0x06000DC7 RID: 3527 RVA: 0x0007D480 File Offset: 0x0007B880
	private void HandlePipeOrganAudioOnComplete(object sender, EventArgs e)
	{
		this.m_PipeOrganAudioObject.OnComplete -= this.HandlePipeOrganAudioOnComplete;
		this.m_PipeOrganInteract.SetActive(true);
		this.m_PipeOrganInteract.OnInteracted += this.HandlePipeOrganOnInteracted;
	}

	// Token: 0x06000DC8 RID: 3528 RVA: 0x0007D4BC File Offset: 0x0007B8BC
	private void PlayPipeOrganAudio()
	{
		if (this.m_PipeOrganAudioClips == null || this.m_PipeOrganAudioClips.Length <= 0)
		{
			return;
		}
		int num = UnityEngine.Random.Range(0, this.m_PipeOrganAudioClips.Length);
		AudioClip audioClip = this.m_PipeOrganAudioClips[num];
		this.m_PipeOrganAudioObject = null;
		this.m_PipeOrganAudioObject = GameManager.Instance.AudioManager.PlayAtPosition(audioClip, this.m_AudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_PipeOrganAudioObject.OnComplete += this.HandlePipeOrganAudioOnComplete;
		this.m_PipeOrganAudioClips[num] = this.m_PipeOrganAudioClips[0];
		this.m_PipeOrganAudioClips[0] = audioClip;
	}

	// Token: 0x06000DC9 RID: 3529 RVA: 0x0007D558 File Offset: 0x0007B958
	protected override void OnDisposed()
	{
		if (this.m_PipeOrganInteract != null)
		{
			this.m_PipeOrganInteract.OnInteracted -= this.HandlePipeOrganOnInteracted;
		}
		if (this.m_PipeOrganAudioObject != null)
		{
			this.m_PipeOrganAudioObject.OnComplete -= this.HandlePipeOrganAudioOnComplete;
			this.m_PipeOrganAudioObject.Clear();
			this.m_PipeOrganAudioObject = null;
		}
		base.OnDisposed();
	}

	// Token: 0x04000FE5 RID: 4069
	[Header("Transforms")]
	[SerializeField]
	private Transform m_AudioPosition;

	// Token: 0x04000FE6 RID: 4070
	[Header("Interactable")]
	[SerializeField]
	private Interactable m_PipeOrganInteract;

	// Token: 0x04000FE7 RID: 4071
	private AudioObject m_PipeOrganAudioObject;

	// Token: 0x04000FE8 RID: 4072
	private AudioClip[] m_PipeOrganAudioClips;

	// Token: 0x04000FE9 RID: 4073
	private int m_InteractCount;

	// Token: 0x04000FEA RID: 4074
	private int m_InteractMax = 5;

	// Token: 0x04000FEB RID: 4075
	private bool m_HasAchievement;
}
