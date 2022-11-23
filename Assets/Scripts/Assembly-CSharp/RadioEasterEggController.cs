using System;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x020002A4 RID: 676
public class RadioEasterEggController : TMGMonoBehaviour
{
	// Token: 0x06000FA7 RID: 4007 RVA: 0x00085474 File Offset: 0x00083874
	public override void Init()
	{
		base.Init();
		if (this.m_Chapter == Chapters.ONE)
		{
			this.m_SongAssetKey = "Audio/EasterEggs/EasterEggKyleBendySong";
			this.m_AchievementAssetKey = AchievementName.CROONER_TUNER;
		}
		else if (this.m_Chapter == Chapters.TWO)
		{
			this.m_SongAssetKey = "Audio/EasterEggs/EasterEggDAGamesBuildOurMachine";
			this.m_AchievementAssetKey = AchievementName.COAST_TO_COAST;
		}
	}

	// Token: 0x06000FA8 RID: 4008 RVA: 0x000854C8 File Offset: 0x000838C8
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_RadioAudioClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>(this.m_SongAssetKey);
		this.m_Radio.OnInteracted += this.HandleRadioOnInteracted;
	}

	// Token: 0x06000FA9 RID: 4009 RVA: 0x00085504 File Offset: 0x00083904
	private void HandleRadioOnInteracted(object sender, EventArgs e)
	{
		this.m_Radio.OnInteracted -= this.HandleRadioOnInteracted;
		this.m_RadioAudioObject = GameManager.Instance.AudioManager.PlayAtPosition(this.m_RadioAudioClip, this.m_Radio.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_RadioAudioObject.OnComplete += this.HandleRadioAudioOnComplete;
		this.m_Radio.transform.DOScaleY(1.01f, 0.25f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
		GameManager.Instance.AchievementManager.SetAchievement(this.m_AchievementAssetKey);
	}

	// Token: 0x06000FAA RID: 4010 RVA: 0x000855AC File Offset: 0x000839AC
	private void HandleRadioAudioOnComplete(object sender, EventArgs e)
	{
		this.m_RadioAudioObject.OnComplete -= this.HandleRadioAudioOnComplete;
		this.m_Radio.transform.DOKill(false);
		this.m_Radio.transform.localScale = Vector3.one;
		this.m_RadioAudioClip = null;
		this.m_RadioAudioObject = null;
	}

	// Token: 0x06000FAB RID: 4011 RVA: 0x00085605 File Offset: 0x00083A05
	protected override void OnDisposed()
	{
		this.m_Radio.transform.DOKill(false);
		this.m_RadioAudioClip = null;
		this.m_RadioAudioObject = null;
		base.OnDisposed();
	}

	// Token: 0x04001156 RID: 4438
	[Header("Chapter")]
	[SerializeField]
	private Chapters m_Chapter;

	// Token: 0x04001157 RID: 4439
	[Header("Interactable")]
	[SerializeField]
	private Interactable m_Radio;

	// Token: 0x04001158 RID: 4440
	private AudioObject m_RadioAudioObject;

	// Token: 0x04001159 RID: 4441
	private AudioClip m_RadioAudioClip;

	// Token: 0x0400115A RID: 4442
	private string m_SongAssetKey;

	// Token: 0x0400115B RID: 4443
	private AchievementName m_AchievementAssetKey;
}
