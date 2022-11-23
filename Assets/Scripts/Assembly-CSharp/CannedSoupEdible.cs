using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002CB RID: 715
public class CannedSoupEdible : Interactable
{
	// Token: 0x06001033 RID: 4147 RVA: 0x00086F2F File Offset: 0x0008532F
	public override void OnInteract()
	{
		this.PlayEatSound();
		base.Dispose();
	}

	// Token: 0x06001034 RID: 4148 RVA: 0x00086F40 File Offset: 0x00085340
	public void PlayEatSound()
	{
		if (this.m_AudioClips == null || this.m_AudioClips.Count <= 0)
		{
			return;
		}
		int index = UnityEngine.Random.Range(0, this.m_AudioClips.Count);
		GameManager.Instance.AudioManager.Play(this.m_AudioClips[index], AudioObjectType.SOUND_EFFECT, 0, false);
	}

	// Token: 0x04001273 RID: 4723
	[Header("Sounds")]
	[SerializeField]
	private List<AudioClip> m_AudioClips;
}
