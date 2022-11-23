using System;
using System.Collections;
using TMG.Core;
using UnityEngine;

// Token: 0x02000293 RID: 659
public class LoopAudio : TMGMonoBehaviour
{
	// Token: 0x06000EF8 RID: 3832 RVA: 0x00082298 File Offset: 0x00080698
	public override void OnEnable()
	{
		this.m_IsActive = true;
		base.StartCoroutine(this.DelayAudio());
	}

	// Token: 0x06000EF9 RID: 3833 RVA: 0x000822AE File Offset: 0x000806AE
	public override void OnDisable()
	{
		base.StopCoroutine(this.DelayAudio());
		this.m_IsActive = false;
	}

	// Token: 0x06000EFA RID: 3834 RVA: 0x000822C4 File Offset: 0x000806C4
	private IEnumerator DelayAudio()
	{
		while (this.m_IsActive)
		{
			yield return new WaitForSeconds(this.delay);
			GameManager.Instance.AudioManager.PlayAtPosition("Audio/Sounds/Effects/ink_squirt", base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		}
		yield break;
	}

	// Token: 0x06000EFB RID: 3835 RVA: 0x000822DF File Offset: 0x000806DF
	protected override void OnDisposed()
	{
		base.StopCoroutine(this.DelayAudio());
		base.OnDisposed();
	}

	// Token: 0x040010B2 RID: 4274
	public float delay;

	// Token: 0x040010B3 RID: 4275
	private bool m_IsActive;
}
