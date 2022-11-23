using System;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x02000265 RID: 613
public class ChapterOnePlankJumpScareController : TMGMonoBehaviour
{
	// Token: 0x06000CEF RID: 3311 RVA: 0x000787E9 File Offset: 0x00076BE9
	public override void Init()
	{
		base.Init();
		this.m_EventTrigger.OnEnter += this.HandleEventTriggerOnEnter;
	}

	// Token: 0x06000CF0 RID: 3312 RVA: 0x00078808 File Offset: 0x00076C08
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_PlankFallClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_WoodPlankFall");
	}

	// Token: 0x06000CF1 RID: 3313 RVA: 0x00078828 File Offset: 0x00076C28
	private void HandleEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_EventTrigger.OnEnter -= this.HandleEventTriggerOnEnter;
		float num = 0f;
		Sequence s = DOTween.Sequence();
		s.Insert(num, this.m_Plank.DOMove(this.m_EndPosition.position, 1f, false).SetEase(Ease.OutBounce, 0.025f));
		num += 0.4f;
		s.InsertCallback(num, delegate
		{
			GameManager.Instance.AudioManager.Play(this.m_PlankFallClip, AudioObjectType.SOUND_EFFECT, 0, false);
		});
	}

	// Token: 0x06000CF2 RID: 3314 RVA: 0x000788A4 File Offset: 0x00076CA4
	protected override void OnDisposed()
	{
		this.m_PlankFallClip = null;
		if (this.m_EventTrigger != null)
		{
			this.m_EventTrigger.OnEnter -= this.HandleEventTriggerOnEnter;
		}
		base.OnDisposed();
	}

	// Token: 0x04000F09 RID: 3849
	[Header("Transforms")]
	[SerializeField]
	private Transform m_Plank;

	// Token: 0x04000F0A RID: 3850
	[SerializeField]
	private Transform m_EndPosition;

	// Token: 0x04000F0B RID: 3851
	[SerializeField]
	private Transform m_AudioPosition;

	// Token: 0x04000F0C RID: 3852
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_EventTrigger;

	// Token: 0x04000F0D RID: 3853
	private AudioClip m_PlankFallClip;
}
