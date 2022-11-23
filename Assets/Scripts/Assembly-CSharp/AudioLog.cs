using System;
using System.Collections;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x02000291 RID: 657
public class AudioLog : TMGMonoBehaviour
{
	// Token: 0x06000EDE RID: 3806 RVA: 0x00081C0C File Offset: 0x0008000C
	public void Play(string audioKey, Action onComplete = null)
	{
		this.m_OnComplete = onComplete;
		this.m_CassettePlayer.localScale = Vector3.one;
		this.m_CassettePlayer.DOKill(false);
		this.m_CassettePlayer.DOScale(1.01f, 0.25f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Cassette_Player_Turn_On_01", this.m_CassettePlayer.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_RunningAudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Cassette_Player_Run_01", this.m_CassettePlayer.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
		this.m_AudioObject = GameManager.Instance.AudioManager.PlayAtPosition(audioKey, this.m_CassettePlayer.position, AudioObjectType.DIALOGUE, 0, false, null);
		this.m_AudioObject.OnComplete += this.HandleAudioObjectOnComplete;
	}

	// Token: 0x06000EDF RID: 3807 RVA: 0x00081CEC File Offset: 0x000800EC
	public void Play(AudioClip audioClip, Action onComplete = null)
	{
		this.m_OnComplete = onComplete;
		this.m_CassettePlayer.localScale = Vector3.one;
		this.m_CassettePlayer.DOKill(false);
		this.m_CassettePlayer.DOScale(1.01f, 0.25f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Cassette_Player_Turn_On_01", this.m_CassettePlayer.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_RunningAudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Cassette_Player_Run_01", this.m_CassettePlayer.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
		this.m_AudioObject = GameManager.Instance.AudioManager.PlayAtPosition(audioClip, this.m_CassettePlayer.position, AudioObjectType.DIALOGUE, 0, false, null);
		this.m_AudioObject.OnComplete += this.HandleAudioObjectOnComplete;
	}

	// Token: 0x06000EE0 RID: 3808 RVA: 0x00081DCC File Offset: 0x000801CC
	private void HandleAudioObjectOnComplete(object sender, EventArgs e)
	{
		this.m_AudioObject.OnComplete -= this.HandleAudioObjectOnComplete;
		this.m_AudioObject = null;
		this.m_RunningAudioObject.Clear();
		this.m_RunningAudioObject = null;
		this.m_CassettePlayer.DOKill(false);
		this.m_CassettePlayer.DOScale(1f, 0.25f).SetEase(Ease.InOutQuad);
		GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Cassette_Player_Turn_Off_01", this.m_CassettePlayer.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		base.StartCoroutine(this.DelayOnComplete());
	}

	// Token: 0x06000EE1 RID: 3809 RVA: 0x00081E64 File Offset: 0x00080264
	private IEnumerator DelayOnComplete()
	{
		yield return new WaitForSeconds(0.5f);
		if (this.m_OnComplete != null)
		{
			this.m_OnComplete();
		}
		yield break;
	}

	// Token: 0x06000EE2 RID: 3810 RVA: 0x00081E80 File Offset: 0x00080280
	protected override void OnDisposed()
	{
		this.m_CassettePlayer.DOKill(false);
		if (this.m_AudioObject != null)
		{
			this.m_AudioObject.OnComplete -= this.HandleAudioObjectOnComplete;
			this.m_AudioObject.Clear();
			this.m_AudioObject = null;
		}
		if (this.m_RunningAudioObject != null)
		{
			this.m_RunningAudioObject.Clear();
			this.m_RunningAudioObject = null;
		}
		this.m_OnComplete = null;
		base.OnDisposed();
	}

	// Token: 0x040010A4 RID: 4260
	[Header("Transforms")]
	[SerializeField]
	private Transform m_CassettePlayer;

	// Token: 0x040010A5 RID: 4261
	private AudioObject m_RunningAudioObject;

	// Token: 0x040010A6 RID: 4262
	private AudioObject m_AudioObject;

	// Token: 0x040010A7 RID: 4263
	private Action m_OnComplete;
}
