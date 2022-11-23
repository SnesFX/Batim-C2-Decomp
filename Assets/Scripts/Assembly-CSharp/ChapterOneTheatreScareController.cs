using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x02000268 RID: 616
public class ChapterOneTheatreScareController : BaseController
{
	// Token: 0x06000D02 RID: 3330 RVA: 0x00078BDE File Offset: 0x00076FDE
	public override void Init()
	{
		base.Init();
		this.SetEnableGameObjectsActive(false);
	}

	// Token: 0x06000D03 RID: 3331 RVA: 0x00078BF0 File Offset: 0x00076FF0
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_TheatreMusicStartupClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_You_Left_Me_In_A_Heartbeat_Start_Up_01LOUD");
		this.m_TheatreMusicClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_You_Left_Me_In_A_Heartbeat_Loop_01LOUD");
		this.m_TheatreProjectorClip = GameManager.Instance.GetAudioClip("Audio/SFX/SFX_Projector_Run_With_Film_01");
		this.m_DuctCrawlingClip = GameManager.Instance.GetAudioClip("Audio/SFX/FOL_Duct_Crawling_01");
	}

	// Token: 0x06000D04 RID: 3332 RVA: 0x00078C58 File Offset: 0x00077058
	public void Activate()
	{
		this.m_TheatreMainEvent.OnEnter += this.HandleTheatreMainOnEnter;
		this.m_TheatreEnterEvent.OnEnter += this.HandleTheatreEnterOnEnter;
		this.m_TheatreExitEvent.OnEnter += this.HandleTheatreExitOnEnter;
		this.m_TheatreEnterEvent.SetActive(true);
	}

	// Token: 0x06000D05 RID: 3333 RVA: 0x00078CB8 File Offset: 0x000770B8
	private void SetEnableGameObjectsActive(bool active)
	{
		int count = this.m_EnableGameObjects.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_EnableGameObjects[i].SetActive(active);
		}
	}

	// Token: 0x06000D06 RID: 3334 RVA: 0x00078CF8 File Offset: 0x000770F8
	private Sequence DOCutoutSequence()
	{
		this.KillCutoutSequence();
		this.m_CutoutSequence = DOTween.Sequence();
		float duration = 0.25f;
		float num = 0f;
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DOLocalMove(this.m_CutoutScarePosition.localPosition, duration, false).SetEase(Ease.OutBack));
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DORotateQuaternion(this.m_CutoutScarePosition.localRotation, duration).SetEase(Ease.OutBack));
		num += 0.85f;
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DOMove(this.m_CutoutStartPosition.localPosition, duration, false).SetEase(Ease.InBack));
		this.m_CutoutSequence.Insert(num, this.m_Cutout.DORotateQuaternion(this.m_CutoutStartPosition.localRotation, duration).SetEase(Ease.InBack));
		return this.m_CutoutSequence;
	}

	// Token: 0x06000D07 RID: 3335 RVA: 0x00078DE0 File Offset: 0x000771E0
	private void HandleTheatreMainOnEnter(object sender, EventArgs e)
	{
		this.m_TheatreMainEvent.OnEnter -= this.HandleTheatreMainOnEnter;
		this.m_TheatreExitEvent.SetActive(true);
		this.m_ProjectorController.TurnOn();
		this.m_ProjectorController.MusicAudioObject = GameManager.Instance.AudioManager.PlayAtPosition(this.m_TheatreMusicStartupClip, this.m_ProjectorController.AudioPosition.position, AudioObjectType.MUSIC, 0, false, null);
		this.m_ProjectorController.MusicAudioObject.OnComplete += this.HandleMusicStartUpOnComplete;
		this.m_ProjectorController.FilmAudioObject = GameManager.Instance.AudioManager.PlayAtPosition(this.m_TheatreProjectorClip, this.m_ProjectorController.AudioPosition.position, AudioObjectType.MUSIC, -1, false, null);
	}

	// Token: 0x06000D08 RID: 3336 RVA: 0x00078EA0 File Offset: 0x000772A0
	private void HandleMusicStartUpOnComplete(object sender, EventArgs e)
	{
		this.m_ProjectorController.MusicAudioObject.OnComplete -= this.HandleMusicStartUpOnComplete;
		this.m_ProjectorController.MusicAudioObject = GameManager.Instance.AudioManager.PlayAtPosition(this.m_TheatreMusicClip, this.m_ProjectorController.AudioPosition.position, AudioObjectType.MUSIC, -1, false, null);
	}

	// Token: 0x06000D09 RID: 3337 RVA: 0x00078F00 File Offset: 0x00077300
	private void HandleTheatreEnterOnEnter(object sender, EventArgs e)
	{
		this.m_TheatreEnterEvent.OnEnter -= this.HandleTheatreEnterOnEnter;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Jumpscare_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.SetEnableGameObjectsActive(true);
		Camera.main.transform.DOShakePosition(0.3f, 0.1f, 15, 90f, false, true);
		this.m_Cutout.localPosition = this.m_CutoutStartPosition.localPosition;
		this.m_Cutout.localRotation = this.m_CutoutStartPosition.localRotation;
		this.DOCutoutSequence().OnComplete(new TweenCallback(this.HandleCutoutSequenceOnComplete));
	}

	// Token: 0x06000D0A RID: 3338 RVA: 0x00078FAA File Offset: 0x000773AA
	private void HandleCutoutSequenceOnComplete()
	{
		this.m_Cutout.localPosition = this.m_CutoutEndPosition.localPosition;
		this.m_Cutout.localRotation = this.m_CutoutEndPosition.localRotation;
		this.m_TheatreMainEvent.SetActive(true);
	}

	// Token: 0x06000D0B RID: 3339 RVA: 0x00078FE4 File Offset: 0x000773E4
	private void HandleTheatreExitOnEnter(object sender, EventArgs e)
	{
		this.m_TheatreExitEvent.OnEnter -= this.HandleTheatreExitOnEnter;
		GameManager.Instance.AudioManager.PlayAtPosition(this.m_DuctCrawlingClip, this.m_TheatreExitAudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		base.SendOnComplete();
	}

	// Token: 0x06000D0C RID: 3340 RVA: 0x00079033 File Offset: 0x00077433
	private void KillCutoutSequence()
	{
		if (this.m_CutoutSequence != null)
		{
			this.m_CutoutSequence.Kill(false);
			this.m_CutoutSequence = null;
		}
	}

	// Token: 0x06000D0D RID: 3341 RVA: 0x00079053 File Offset: 0x00077453
	protected override void OnDisposed()
	{
		this.KillCutoutSequence();
		this.m_DuctCrawlingClip = null;
		this.m_TheatreMusicClip = null;
		this.m_TheatreMusicStartupClip = null;
		this.m_TheatreProjectorClip = null;
		base.OnDisposed();
	}

	// Token: 0x04000F1A RID: 3866
	[Header("Transforms")]
	[SerializeField]
	private Transform m_Cutout;

	// Token: 0x04000F1B RID: 3867
	[SerializeField]
	private Transform m_CutoutStartPosition;

	// Token: 0x04000F1C RID: 3868
	[SerializeField]
	private Transform m_CutoutScarePosition;

	// Token: 0x04000F1D RID: 3869
	[SerializeField]
	private Transform m_CutoutEndPosition;

	// Token: 0x04000F1E RID: 3870
	[SerializeField]
	private Transform m_TheatreExitAudioPosition;

	// Token: 0x04000F1F RID: 3871
	[Header("Enable Game Objects")]
	[SerializeField]
	private List<GameObject> m_EnableGameObjects;

	// Token: 0x04000F20 RID: 3872
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_TheatreMainEvent;

	// Token: 0x04000F21 RID: 3873
	[SerializeField]
	private EventTrigger m_TheatreEnterEvent;

	// Token: 0x04000F22 RID: 3874
	[SerializeField]
	private EventTrigger m_TheatreExitEvent;

	// Token: 0x04000F23 RID: 3875
	[Header("Projector")]
	[SerializeField]
	private ProjectorController m_ProjectorController;

	// Token: 0x04000F24 RID: 3876
	private Sequence m_CutoutSequence;

	// Token: 0x04000F25 RID: 3877
	private AudioClip m_TheatreMusicStartupClip;

	// Token: 0x04000F26 RID: 3878
	private AudioClip m_TheatreMusicClip;

	// Token: 0x04000F27 RID: 3879
	private AudioClip m_TheatreProjectorClip;

	// Token: 0x04000F28 RID: 3880
	private AudioClip m_DuctCrawlingClip;
}
