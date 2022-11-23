using System;
using System.Collections.Generic;
using TMG.Controls;
using TMG.Core;
using UnityEngine;

// Token: 0x0200029A RID: 666
[Serializable]
public class CharacterFootsteps : TMGAbstractDisposable
{
	// Token: 0x170002A0 RID: 672
	// (get) Token: 0x06000F3A RID: 3898 RVA: 0x00083F26 File Offset: 0x00082326
	public float StepInterval
	{
		get
		{
			return this.m_StepInterval;
		}
	}

	// Token: 0x170002A1 RID: 673
	// (get) Token: 0x06000F3B RID: 3899 RVA: 0x00083F2E File Offset: 0x0008232E
	public float RunstepLength
	{
		get
		{
			return this.m_RunstepLength;
		}
	}

	// Token: 0x06000F3C RID: 3900 RVA: 0x00083F36 File Offset: 0x00082336
	public void Init(List<FootstepsDataVO> dataVO, bool is3D = true)
	{
		if (!this.m_Active)
		{
			return;
		}
		this.m_FootstepDataVOs = dataVO;
		this.m_Is3D = is3D;
	}

	// Token: 0x06000F3D RID: 3901 RVA: 0x00083F54 File Offset: 0x00082354
	public void SetFootstepType(FootstepTypes footstepType)
	{
		if (!this.m_Active)
		{
			return;
		}
		if (this.m_CurrentFootstepType == footstepType)
		{
			return;
		}
		int count = this.m_FootstepDataVOs.Count;
		for (int i = 0; i < count; i++)
		{
			FootstepsDataVO footstepsDataVO = this.m_FootstepDataVOs[i];
			if (footstepsDataVO.Type == footstepType)
			{
				this.m_CurrentFootstepType = footstepType;
				this.m_CurrentFootstepClips = footstepsDataVO.Clips;
			}
		}
	}

	// Token: 0x06000F3E RID: 3902 RVA: 0x00083FC4 File Offset: 0x000823C4
	public void ProgressStepCycle(float magnitude, float speed)
	{
		if (!this.m_Active)
		{
			return;
		}
		if (magnitude > 0f && (PlayerInput.MoveX() != 0f || PlayerInput.MoveY() != 0f))
		{
			this.m_IsMoving = true;
			this.m_StepCycle += (magnitude + speed) * Time.fixedDeltaTime;
		}
		if (this.m_StepCycle <= this.m_NextStep)
		{
			return;
		}
		this.m_NextStep = this.m_StepCycle + this.m_StepInterval;
		this.PlayFootStepAudio();
	}

	// Token: 0x06000F3F RID: 3903 RVA: 0x00084054 File Offset: 0x00082454
	private void PlayFootStepAudio()
	{
		if (this.m_CurrentFootstepClips == null || this.m_CurrentFootstepClips.Length <= 0)
		{
			return;
		}
		int num = UnityEngine.Random.Range(0, this.m_CurrentFootstepClips.Length);
		AudioClip audioClip = this.m_CurrentFootstepClips[num];
		if (this.m_Is3D)
		{
			GameManager.Instance.AudioManager.PlayAtPosition(audioClip, this.m_FootstepAudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		}
		else
		{
			GameManager.Instance.AudioManager.Play(audioClip, AudioObjectType.SOUND_EFFECT, 0, false);
		}
		this.m_CurrentFootstepClips[num] = this.m_CurrentFootstepClips[0];
		this.m_CurrentFootstepClips[0] = audioClip;
	}

	// Token: 0x06000F40 RID: 3904 RVA: 0x000840F0 File Offset: 0x000824F0
	private void PlayFootStepScuffAudio()
	{
	}

	// Token: 0x06000F41 RID: 3905 RVA: 0x000840F4 File Offset: 0x000824F4
	protected override void OnDisposed()
	{
		if (this.m_FootstepDataVOs != null)
		{
			for (int i = 0; i < this.m_FootstepDataVOs.Count; i++)
			{
				this.m_FootstepDataVOs[i].Dispose();
			}
			this.m_FootstepDataVOs.Clear();
			this.m_FootstepDataVOs = null;
		}
		if (this.m_CurrentFootstepClips != null)
		{
			this.m_CurrentFootstepClips = null;
		}
		base.OnDisposed();
	}

	// Token: 0x04001108 RID: 4360
	[SerializeField]
	private Transform m_FootstepAudioPosition;

	// Token: 0x04001109 RID: 4361
	[SerializeField]
	private bool m_Active;

	// Token: 0x0400110A RID: 4362
	[SerializeField]
	private float m_StepInterval = 8f;

	// Token: 0x0400110B RID: 4363
	[SerializeField]
	private float m_RunstepLength = 0.7f;

	// Token: 0x0400110C RID: 4364
	[SerializeField]
	private List<CharacterFootsteps.LandClips> m_LandClips;

	// Token: 0x0400110D RID: 4365
	private List<FootstepsDataVO> m_FootstepDataVOs;

	// Token: 0x0400110E RID: 4366
	private FootstepTypes m_CurrentFootstepType;

	// Token: 0x0400110F RID: 4367
	private AudioClip[] m_CurrentFootstepClips;

	// Token: 0x04001110 RID: 4368
	private float m_StepCycle;

	// Token: 0x04001111 RID: 4369
	private float m_NextStep;

	// Token: 0x04001112 RID: 4370
	private bool m_IsMoving;

	// Token: 0x04001113 RID: 4371
	private bool m_Is3D;

	// Token: 0x0200029B RID: 667
	[Serializable]
	public class LandClips
	{
		// Token: 0x04001114 RID: 4372
		public FootstepTypes Type;

		// Token: 0x04001115 RID: 4373
		public List<AudioClip> Clips;
	}
}
