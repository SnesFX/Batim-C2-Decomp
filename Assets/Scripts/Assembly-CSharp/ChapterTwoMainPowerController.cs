using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x02000273 RID: 627
public class ChapterTwoMainPowerController : BaseController
{
	// Token: 0x06000D8C RID: 3468 RVA: 0x0007BD64 File Offset: 0x0007A164
	public override void Init()
	{
		base.Init();
		for (int i = 0; i < this.m_LightControllers.Count; i++)
		{
			this.m_LightControllers[i].TurnOff();
		}
		for (int j = 0; j < this.m_SilentLightControllers.Count; j++)
		{
			this.m_SilentLightControllers[j].TurnOff();
		}
		for (int k = 0; k < this.m_RecordingLbls.Count; k++)
		{
			this.m_RecordingLbls[k].SetActive(false);
		}
		this.m_PowerLeverInteract.SetActive(false);
		this.m_InkStairwellEventTrigger.SetActive(false);
	}

	// Token: 0x06000D8D RID: 3469 RVA: 0x0007BE18 File Offset: 0x0007A218
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_MusicClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_Lobby_Jazz_01");
		this.m_SearchersMusicClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_The_Searchers");
		this.m_SearcherScareClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_SearcherStartCue01");
		this.m_Target = GameManager.Instance.Player.transform;
		this.m_LobbyEventTrigger.SetActive(true);
		this.m_LobbyEventTrigger.OnEnter += this.HandleLobbyEventTriggerOnEnter;
	}

	// Token: 0x06000D8E RID: 3470 RVA: 0x0007BEA4 File Offset: 0x0007A2A4
	public void Activate()
	{
		this.m_InkStairwellEventTrigger.SetActive(true);
		this.m_InkStairwellEventTrigger.OnEnter += this.HandleInkStairwellEventTriggerOnEnter;
		this.m_PowerLeverInteract.SetActive(true);
		this.m_PowerLeverInteract.OnInteracted += this.HandlePowerLeverOnInteracted;
	}

	// Token: 0x06000D8F RID: 3471 RVA: 0x0007BEF8 File Offset: 0x0007A2F8
	private void Update()
	{
		if (!this.m_HasPower)
		{
			return;
		}
		if (this.m_Target == null || this.m_MusicAudioObject == null)
		{
			return;
		}
		if (this.m_Target.position.x < this.m_MusicPositionRight.position.x && this.m_Target.position.x > this.m_MusicPositionLeft.position.x)
		{
			Vector3 worldPosition = this.m_MusicAudioObject.WorldPosition;
			worldPosition.x = this.m_Target.position.x;
			this.m_MusicAudioObject.WorldPosition = worldPosition;
		}
		if (this.m_Target.position.z < this.m_MusicPositionForward.position.z && this.m_Target.position.z > this.m_MusicPositionBack.position.z)
		{
			Vector3 worldPosition2 = this.m_MusicAudioObject.WorldPosition;
			worldPosition2.z = this.m_Target.position.z;
			this.m_MusicAudioObject.WorldPosition = worldPosition2;
		}
	}

	// Token: 0x06000D90 RID: 3472 RVA: 0x0007C04E File Offset: 0x0007A44E
	private void HandleLobbyEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_LobbyEventTrigger.OnEnter -= this.HandleLobbyEventTriggerOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_02", "How did this place get so big?", false));
	}

	// Token: 0x06000D91 RID: 3473 RVA: 0x0007C084 File Offset: 0x0007A484
	private void HandleInkStairwellEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_InkStairwellEventTrigger.OnEnter -= this.HandleInkStairwellEventTriggerOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_06", "Looks like the stairwell is flooded.\nIf I'm going to get out of here, I'll need to find a way to drain it.", false)).OnComplete += this.HandleStairwellDialogueOnComplete;
	}

	// Token: 0x06000D92 RID: 3474 RVA: 0x0007C0D3 File Offset: 0x0007A4D3
	private void HandleStairwellDialogueOnComplete(object sender, EventArgs e)
	{
		(sender as AudioObject).OnComplete -= this.HandleStairwellDialogueOnComplete;
		GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "DRAIN THE STAIRWELL", "TIP: FIND THE PUMP CONTROL", 4f, false));
	}

	// Token: 0x06000D93 RID: 3475 RVA: 0x0007C110 File Offset: 0x0007A510
	private void HandlePowerLeverOnInteracted(object sender, EventArgs e)
	{
		this.m_PowerLeverInteract.OnInteracted -= this.HandlePowerLeverOnInteracted;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Mainr_Power_Lever_Turn_On_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_PowerLever.DORotateQuaternion(this.m_LeverFinalRotation.rotation, 0.75f).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.HandleLeverRotationOnComplete));
	}

	// Token: 0x06000D94 RID: 3476 RVA: 0x0007C180 File Offset: 0x0007A580
	private void HandleLeverRotationOnComplete()
	{
		this.m_HasPower = true;
		this.DOPowerSequence().OnComplete(delegate
		{
			this.m_InitialSearcherSpawner.Activate();
			this.m_InitialSearcherSpawner.OnSpawned += this.HandleSpawnerOnSpawned;
			this.m_InitialSearcherSpawner.OnDeplete += this.HandleInitialSpawnerOnDeplete;
		});
	}

	// Token: 0x06000D95 RID: 3477 RVA: 0x0007C1A4 File Offset: 0x0007A5A4
	private void HandleInitialSpawnerOnDeplete(object sender, EventArgs e)
	{
		for (int i = 0; i < this.m_ExtraSearcherSapwners.Count; i++)
		{
			this.m_ExtraSearcherSapwners[i].gameObject.SetActive(true);
			this.m_ExtraSearcherSapwners[i].Activate();
		}
		for (int j = 0; j < this.m_SearcherSpawners.Count; j++)
		{
			this.m_SearcherSpawners[j].Activate();
			this.m_SearcherSpawners[j].OnDeplete += this.HandleSearcherSpawnersOnDepleted;
		}
	}

	// Token: 0x06000D96 RID: 3478 RVA: 0x0007C240 File Offset: 0x0007A640
	private void HandleSearcherSpawnersOnDepleted(object sender, EventArgs e)
	{
		SearcherSpawnController searcherSpawnController = sender as SearcherSpawnController;
		if (searcherSpawnController == null)
		{
			return;
		}
		searcherSpawnController.OnDeplete -= this.HandleSearcherSpawnersOnDepleted;
		this.m_SearcherSpawners.Remove(searcherSpawnController);
		if (this.m_SearcherSpawners.Count <= 0)
		{
			this.OpenGateDoor();
			this.PlaySpeakers();
			this.m_SearchersMusicObject.AudioSource.DOFade(0f, 2f).OnComplete(new TweenCallback(this.ClearSearcherMusic));
		}
	}

	// Token: 0x06000D97 RID: 3479 RVA: 0x0007C2C9 File Offset: 0x0007A6C9
	private void HandleSpawnerOnSpawned(object sender, EventArgs e)
	{
		GameManager.Instance.AudioManager.Play(this.m_SearcherScareClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_SearchersMusicObject = GameManager.Instance.AudioManager.Play(this.m_SearchersMusicClip, AudioObjectType.MUSIC, -1, false);
	}

	// Token: 0x06000D98 RID: 3480 RVA: 0x0007C304 File Offset: 0x0007A704
	private Sequence DOPowerSequence()
	{
		Sequence sequence = DOTween.Sequence();
		float num = 0f;
		for (int i = 0; i < this.m_LightControllers.Count; i++)
		{
			LightFixtureController lightController = this.m_LightControllers[i];
			sequence.InsertCallback(num, delegate
			{
				this.TurnOnLight(lightController);
			});
			num += 0.75f;
		}
		for (int j = 0; j < this.m_SilentLightControllers.Count; j++)
		{
			LightFixtureController lightController = this.m_SilentLightControllers[j];
			sequence.InsertCallback(num, delegate
			{
				this.TurnOnLightSilent(lightController);
			});
		}
		num += 0.5f;
		sequence.InsertCallback(num, new TweenCallback(this.TurnOnRecordingLabels));
		return sequence;
	}

	// Token: 0x06000D99 RID: 3481 RVA: 0x0007C3EC File Offset: 0x0007A7EC
	private void TurnOnRecordingLabels()
	{
		for (int i = 0; i < this.m_RecordingLbls.Count; i++)
		{
			this.m_RecordingLbls[i].SetActive(true);
		}
	}

	// Token: 0x06000D9A RID: 3482 RVA: 0x0007C427 File Offset: 0x0007A827
	private void TurnOnLight(LightFixtureController light)
	{
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Light_Switch_Sammys_Room_01", AudioObjectType.SOUND_EFFECT, 0, false);
		light.TurnOn();
	}

	// Token: 0x06000D9B RID: 3483 RVA: 0x0007C447 File Offset: 0x0007A847
	private void TurnOnLightSilent(LightFixtureController light)
	{
		light.TurnOn();
	}

	// Token: 0x06000D9C RID: 3484 RVA: 0x0007C450 File Offset: 0x0007A850
	private void OpenGateDoor()
	{
		base.SendOnComplete();
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Gate_Open_Slow_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_GateDoor.DOLocalMoveY(9.75f, 8f, false).SetEase(Ease.Linear).SetDelay(2f);
	}

	// Token: 0x06000D9D RID: 3485 RVA: 0x0007C4A4 File Offset: 0x0007A8A4
	private void PlaySpeakers()
	{
		this.m_MusicAudioObject = GameManager.Instance.AudioManager.PlayAtPosition(this.m_MusicClip, this.m_MusicPositionForward.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_MusicAudioObject.OnComplete += this.HandleMusicOnComplete;
		for (int i = 0; i < this.m_Speakers.Count; i++)
		{
			this.m_Speakers[i].DOKill(false);
			this.m_Speakers[i].DOScale(1.025f, 0.225f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo).SetDelay(2f);
		}
	}

	// Token: 0x06000D9E RID: 3486 RVA: 0x0007C554 File Offset: 0x0007A954
	private void HandleMusicOnComplete(object sender, EventArgs e)
	{
		this.m_MusicAudioObject.OnComplete -= this.HandleMusicOnComplete;
		this.ClearLobbyMusic();
		for (int i = 0; i < this.m_Speakers.Count; i++)
		{
			this.m_Speakers[i].DOKill(false);
			this.m_Speakers[i].localScale = Vector3.one;
		}
	}

	// Token: 0x06000D9F RID: 3487 RVA: 0x0007C5C3 File Offset: 0x0007A9C3
	private void ClearSearcherMusic()
	{
		if (this.m_SearchersMusicObject != null)
		{
			this.m_SearchersMusicObject.Clear();
			this.m_SearchersMusicObject = null;
		}
	}

	// Token: 0x06000DA0 RID: 3488 RVA: 0x0007C5E8 File Offset: 0x0007A9E8
	private void ClearLobbyMusic()
	{
		if (this.m_MusicAudioObject != null)
		{
			this.m_MusicAudioObject.Clear();
			this.m_MusicAudioObject = null;
		}
	}

	// Token: 0x06000DA1 RID: 3489 RVA: 0x0007C610 File Offset: 0x0007AA10
	protected override void OnDisposed()
	{
		this.m_PowerLever.DOKill(false);
		if (this.m_PowerLeverInteract != null)
		{
			this.m_PowerLeverInteract.OnInteracted -= this.HandlePowerLeverOnInteracted;
		}
		if (this.m_InkStairwellEventTrigger != null)
		{
			this.m_InkStairwellEventTrigger.OnEnter -= this.HandleInkStairwellEventTriggerOnEnter;
		}
		if (this.m_LobbyEventTrigger != null)
		{
			this.m_LobbyEventTrigger.OnEnter -= this.HandleLobbyEventTriggerOnEnter;
		}
		for (int i = 0; i < this.m_Speakers.Count; i++)
		{
			this.m_Speakers[i].DOKill(false);
		}
		this.ClearLobbyMusic();
		this.ClearSearcherMusic();
		this.m_MusicClip = null;
		this.m_Target = null;
		base.OnDisposed();
	}

	// Token: 0x04000FAD RID: 4013
	[Header("GameObjects")]
	[SerializeField]
	private List<GameObject> m_RecordingLbls;

	// Token: 0x04000FAE RID: 4014
	[Header("Transforms")]
	[SerializeField]
	private Transform m_PowerLever;

	// Token: 0x04000FAF RID: 4015
	[SerializeField]
	private Transform m_LeverFinalRotation;

	// Token: 0x04000FB0 RID: 4016
	[SerializeField]
	private Transform m_GateDoor;

	// Token: 0x04000FB1 RID: 4017
	[Header("Music")]
	[SerializeField]
	private Transform m_MusicPositionLeft;

	// Token: 0x04000FB2 RID: 4018
	[SerializeField]
	private Transform m_MusicPositionRight;

	// Token: 0x04000FB3 RID: 4019
	[SerializeField]
	private Transform m_MusicPositionForward;

	// Token: 0x04000FB4 RID: 4020
	[SerializeField]
	private Transform m_MusicPositionBack;

	// Token: 0x04000FB5 RID: 4021
	[SerializeField]
	private List<Transform> m_Speakers;

	// Token: 0x04000FB6 RID: 4022
	[Header("Interactables")]
	[SerializeField]
	private Interactable m_PowerLeverInteract;

	// Token: 0x04000FB7 RID: 4023
	[Header("Searcher Spawners")]
	[SerializeField]
	private SearcherSpawnController m_InitialSearcherSpawner;

	// Token: 0x04000FB8 RID: 4024
	[SerializeField]
	private List<SearcherSpawnController> m_ExtraSearcherSapwners;

	// Token: 0x04000FB9 RID: 4025
	[SerializeField]
	private List<SearcherSpawnController> m_SearcherSpawners;

	// Token: 0x04000FBA RID: 4026
	[Header("LightFixtures")]
	[SerializeField]
	private List<LightFixtureController> m_LightControllers;

	// Token: 0x04000FBB RID: 4027
	[SerializeField]
	private List<LightFixtureController> m_SilentLightControllers;

	// Token: 0x04000FBC RID: 4028
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_InkStairwellEventTrigger;

	// Token: 0x04000FBD RID: 4029
	[SerializeField]
	private EventTrigger m_LobbyEventTrigger;

	// Token: 0x04000FBE RID: 4030
	private Transform m_Target;

	// Token: 0x04000FBF RID: 4031
	private AudioObject m_MusicAudioObject;

	// Token: 0x04000FC0 RID: 4032
	private AudioClip m_MusicClip;

	// Token: 0x04000FC1 RID: 4033
	private AudioObject m_SearchersMusicObject;

	// Token: 0x04000FC2 RID: 4034
	private AudioClip m_SearchersMusicClip;

	// Token: 0x04000FC3 RID: 4035
	private AudioClip m_SearcherScareClip;

	// Token: 0x04000FC4 RID: 4036
	private bool m_HasPower;
}
