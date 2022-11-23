using System;
using System.Collections;
using DG.Tweening;
using UnityEngine;

// Token: 0x020002C7 RID: 711
public class AudioPlayer : Interactable
{
	// Token: 0x06001021 RID: 4129 RVA: 0x0008691F File Offset: 0x00084D1F
	public override void Init()
	{
		base.Init();
	}

	// Token: 0x06001022 RID: 4130 RVA: 0x00086928 File Offset: 0x00084D28
	public override void OnInteract()
	{
		GameManager.Instance.AudioManager.PlayAtPosition(this.m_AudioClip, base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		if (this.m_EnableAnimation && this.m_AudioPlayer != null)
		{
			this.m_AudioPlayer.DOScale(1.01f, 0.2f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
			base.StartCoroutine(this.HandleAudioClipOnComplete(this.m_AudioClip.length));
		}
	}

	// Token: 0x06001023 RID: 4131 RVA: 0x000869B4 File Offset: 0x00084DB4
	private IEnumerator HandleAudioClipOnComplete(float delay)
	{
		yield return new WaitForSeconds(delay);
		this.KillAudioTween();
		this.m_AudioPlayer.localScale = Vector3.one;
		yield break;
	}

	// Token: 0x06001024 RID: 4132 RVA: 0x000869D6 File Offset: 0x00084DD6
	private void KillAudioTween()
	{
		this.m_AudioPlayer.DOKill(false);
	}

	// Token: 0x06001025 RID: 4133 RVA: 0x000869E5 File Offset: 0x00084DE5
	protected override void OnDisposed()
	{
		this.KillAudioTween();
		base.OnDisposed();
	}

	// Token: 0x04001260 RID: 4704
	[Header("Audio Player Options")]
	[SerializeField]
	private Transform m_AudioPlayer;

	// Token: 0x04001261 RID: 4705
	[SerializeField]
	private AudioClip m_AudioClip;

	// Token: 0x04001262 RID: 4706
	[SerializeField]
	private bool m_EnableAnimation = true;
}
