using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000269 RID: 617
public class ChapterTwoAudioLogsController : BaseController
{
	// Token: 0x14000011 RID: 17
	// (add) Token: 0x06000D0F RID: 3343 RVA: 0x00079088 File Offset: 0x00077488
	// (remove) Token: 0x06000D10 RID: 3344 RVA: 0x000790C0 File Offset: 0x000774C0
	public event EventHandler OnLostKeyObjective;

	// Token: 0x14000012 RID: 18
	// (add) Token: 0x06000D11 RID: 3345 RVA: 0x000790F8 File Offset: 0x000774F8
	// (remove) Token: 0x06000D12 RID: 3346 RVA: 0x00079130 File Offset: 0x00077530
	public event EventHandler OnFavoriteSongObjective;

	// Token: 0x06000D13 RID: 3347 RVA: 0x00079166 File Offset: 0x00077566
	public override void Init()
	{
		base.Init();
		this.m_PuzzleController.GeneratePuzzle();
		this.GenerateDialogue();
	}

	// Token: 0x06000D14 RID: 3348 RVA: 0x00079180 File Offset: 0x00077580
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_LostKeysClip = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/AudioLogs/DIA_WAL_Diary_Lost_Keys_01_temp");
		this.m_ThePrayerClip = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/Sammy/DIA_SammyC2_Audio_Diarry_01");
		this.m_ThePrayerFinaleClip = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/Sammy/DIA_SammyC2_01");
		this.m_DistractionsClip = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/AudioLogs/DIA_SAM_Diary_Distractions_01_temp");
		this.m_ProjectionistClip = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/AudioLogs/DIA_NOR_Diary_Projectionist_01_temp");
		this.m_TheNewVoiceActressClip = GameManager.Instance.GetAudioClip("Audio/DIA/ChapterTwo/AudioLogs/DIA_SUS_Diary_New_Voice_Actress_01_temp");
		this.m_AudioLogThePrayerInteract.OnInteracted += this.HandleAudioLogThePrayerOnInteracted;
		this.m_AudioLogDistractionsInteract.OnInteracted += this.HandleAudioLogDistractionsOnInteracted;
		this.m_AudioLogTheProjectionistInteract.OnInteracted += this.HandleAudioLogTheProjectionistOnInteracted;
		this.m_AudioLogTheNewVoiceAcressInteract.OnInteracted += this.HandleAudioLogTheNewVoiceAcressOnInteracted;
	}

	// Token: 0x06000D15 RID: 3349 RVA: 0x0007926D File Offset: 0x0007766D
	public void Activate()
	{
		this.m_AudioLogLostKeysInteract.OnInteracted += this.HandleAudioLogLostKeyOnInteracted;
	}

	// Token: 0x06000D16 RID: 3350 RVA: 0x00079286 File Offset: 0x00077686
	public void ActivateFavoriteSong()
	{
		this.m_AudioLogFavoriteSongInteract.OnInteracted += this.HandleAudioLogFavoriteSongOnInteracted;
	}

	// Token: 0x06000D17 RID: 3351 RVA: 0x000792A0 File Offset: 0x000776A0
	private void GenerateDialogue()
	{
		string text = "Every artistic person needs a sanctuary. Joey Drew has his and I have mine. To enter, you need only know my favorite song:\n";
		List<AudioClip> list = new List<AudioClip>();
		list.Add(GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/DIA/ChapterTwo/Puzzle/DIA_Sammy_Puzzle_Diary_Intro_01"));
		int num = 0;
		int num2 = 0;
		int num3 = 0;
		int num4 = 0;
		int num5 = 0;
		for (int i = 0; i < this.m_PuzzleController.InstrumentOrder.Count; i++)
		{
			int num6 = this.m_PuzzleController.InstrumentOrder[i];
			if (num6 == 0)
			{
				this.UpdatePuzzleAudioLog(AudioLogConstants.SAMMY_BANJO, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/DIA/ChapterTwo/Puzzle/Banjo"), ref text, ref num, ref list);
			}
			else if (num6 == 1)
			{
				this.UpdatePuzzleAudioLog(AudioLogConstants.SAMMY_DRUM, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/DIA/ChapterTwo/Puzzle/Drum"), ref text, ref num2, ref list);
			}
			else if (num6 == 2)
			{
				this.UpdatePuzzleAudioLog(AudioLogConstants.SAMMY_BASS, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/DIA/ChapterTwo/Puzzle/BassFiddle"), ref text, ref num3, ref list);
			}
			else if (num6 == 3)
			{
				this.UpdatePuzzleAudioLog(AudioLogConstants.SAMMY_VIOLIN, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/DIA/ChapterTwo/Puzzle/Violin"), ref text, ref num4, ref list);
			}
			else if (num6 == 4)
			{
				this.UpdatePuzzleAudioLog(AudioLogConstants.SAMMY_PIANO, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/DIA/ChapterTwo/Puzzle/Piano"), ref text, ref num5, ref list);
			}
		}
		list.Add(GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/DIA/ChapterTwo/Puzzle/DIA_Sammy_Puzzle_Diary_Outro_01"));
		text += "\n\nSing my song and my sanctuary will open to you.";
		this.m_PuzzleLog = text;
		this.m_PuzzleClip = GameManager.Instance.AudioManager.Combine(list);
	}

	// Token: 0x06000D18 RID: 3352 RVA: 0x00079450 File Offset: 0x00077850
	private void UpdatePuzzleAudioLog(string[] instrumentLog, AudioClip[] dialogueClips, ref string audioLog, ref int index, ref List<AudioClip> audioClips)
	{
		audioLog += instrumentLog[index];
		audioClips.Add(dialogueClips[index]);
		index++;
	}

	// Token: 0x06000D19 RID: 3353 RVA: 0x00079478 File Offset: 0x00077878
	private void HandleAudioLogLostKeyOnInteracted(object sender, EventArgs e)
	{
		this.m_AudioLogLostKeysInteract.SetActive(false);
		this.m_AudioLogLostKeysInteract.OnInteracted -= this.HandleAudioLogLostKeyOnInteracted;
		if (!this.m_HasKeyObjective)
		{
			this.m_HasKeyObjective = true;
			this.OnLostKeyObjective.Send(this);
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "UNLOCK WALLY'S CLOSET", "TIP: RETRACE WALLY'S STEPS", 4f, false));
		}
		this.PlayAudioLog(new AudioLogDataVO
		{
			Name = "Wally Franks",
			Log = "So I go to get my dust pan from the hall closet the other day and guess what? I can't find my stupid keys. It's like they disappeared into thin air or something.\n\nAll I can think of is that they must have fallen into one of the garbage cans as I was making my rounds last week.\n\nI just hope nobody tells Sammy. Because if he finds out I lost my keys again, I'm out of here.",
			LogWorldPosition = this.m_AudioLogLostKeys.transform.position
		}, this.m_AudioLogLostKeys, this.m_LostKeysClip, new Action(this.HandleAudioLostKeyOnComplete));
	}

	// Token: 0x06000D1A RID: 3354 RVA: 0x0007953C File Offset: 0x0007793C
	private void HandleAudioLostKeyOnComplete()
	{
		if (this.m_ActiveAudioClip == this.m_LostKeysClip)
		{
			this.m_AudioLogController.PlayOut();
		}
		this.m_AudioLogLostKeysInteract.SetActive(true);
		this.m_AudioLogLostKeysInteract.OnInteracted += this.HandleAudioLogLostKeyOnInteracted;
	}

	// Token: 0x06000D1B RID: 3355 RVA: 0x00079590 File Offset: 0x00077990
	private void HandleAudioLogThePrayerOnInteracted(object sender, EventArgs e)
	{
		this.m_AudioLogThePrayerInteract.SetActive(false);
		this.m_AudioLogThePrayerInteract.OnInteracted -= this.HandleAudioLogThePrayerOnInteracted;
		this.PlayAudioLog(new AudioLogDataVO
		{
			Name = "Sammy Lawrence",
			Log = "He appears from the shadows to rain his sweet blessings upon me. The figure of ink that shines in the darkness. I see you, my savior.\nI pray you hear me.\n\nThose old song, yes, I still sing them. For I know you are coming to save me. And I will be swept into your final loving embrace.\n\nBut, love requires sacrifice.\nCan I get an amen?",
			LogWorldPosition = this.m_AudioLogThePrayer.transform.position
		}, this.m_AudioLogThePrayer, this.m_ThePrayerClip, new Action(this.HandleAudioThePrayerOnComplete));
	}

	// Token: 0x06000D1C RID: 3356 RVA: 0x00079614 File Offset: 0x00077A14
	private void HandleAudioThePrayerOnComplete()
	{
		if (!this.m_IsSammyScareComplete && Vector3.Distance(GameManager.Instance.Player.transform.position, this.m_AudioLogThePrayer.transform.position) < 15f)
		{
			this.m_IsSammyScareComplete = true;
			Vector3 vector = GameManager.Instance.Player.transform.position;
			vector -= GameManager.Instance.Player.transform.forward * 4f;
			this.m_AudioObjectThePrayerFinale = GameManager.Instance.AudioManager.PlayAtPosition(this.m_ThePrayerFinaleClip, vector, AudioObjectType.DIALOGUE, 0, false, GameManager.Instance.Player.transform);
		}
		if (this.m_ActiveAudioClip == this.m_ThePrayerClip)
		{
			this.m_AudioLogController.PlayOut();
		}
		this.m_AudioLogThePrayerInteract.SetActive(true);
		this.m_AudioLogThePrayerInteract.OnInteracted += this.HandleAudioLogThePrayerOnInteracted;
	}

	// Token: 0x06000D1D RID: 3357 RVA: 0x00079714 File Offset: 0x00077B14
	private void HandleAudioLogDistractionsOnInteracted(object sender, EventArgs e)
	{
		this.m_AudioLogDistractionsInteract.SetActive(false);
		this.m_AudioLogDistractionsInteract.OnInteracted -= this.HandleAudioLogDistractionsOnInteracted;
		this.PlayAudioLog(new AudioLogDataVO
		{
			Name = "Sammy Lawrence",
			Log = "So first, Joey installs this Ink Machine over our heads. Then it begins to leak. Three times last month, we couldn't even get out of our department because the ink had flooded the stairwell.\n\nJoey's solution? An ink pump to drain it periodically.\nNow I have this ugly pump switch right in my office.\nPeople in and out all day.\n\nThanks, Joey. Just what I needed.\nMore distractions.\nThese stupid cartoon songs don't write themselves, you know.",
			LogWorldPosition = this.m_AudioLogDistractions.transform.position
		}, this.m_AudioLogDistractions, this.m_DistractionsClip, new Action(this.HandleAudioDistractionsOnComplete));
	}

	// Token: 0x06000D1E RID: 3358 RVA: 0x00079798 File Offset: 0x00077B98
	private void HandleAudioDistractionsOnComplete()
	{
		if (this.m_ActiveAudioClip == this.m_DistractionsClip)
		{
			this.m_AudioLogController.PlayOut();
		}
		this.m_AudioLogDistractionsInteract.SetActive(true);
		this.m_AudioLogDistractionsInteract.OnInteracted += this.HandleAudioLogDistractionsOnInteracted;
	}

	// Token: 0x06000D1F RID: 3359 RVA: 0x000797EC File Offset: 0x00077BEC
	private void HandleAudioLogTheProjectionistOnInteracted(object sender, EventArgs e)
	{
		this.m_AudioLogTheProjectionistInteract.SetActive(false);
		this.m_AudioLogTheProjectionistInteract.OnInteracted -= this.HandleAudioLogTheProjectionistOnInteracted;
		this.PlayAudioLog(new AudioLogDataVO
		{
			Name = "Norman Polk",
			Log = "Every day the same strange thing happens,I'll be up here in my booth, the band will be swinging, and suddenly Sammy Lawrence just comes marching in and shuts the whole thing down. Tells us all to wait in the hall.\n\nThen I hear him. He starts up my projector, and he dashes from the projector booth and down to the recording studio like the little devil himself was chasing behind.\n\nFew seconds later, the projector turns off. But Sammy, he doesn't come out for a long time. This man is weird. Crazy weird.\n\nI have half a mind to talk to Mr. Drew about all this. But then again, I have to admit. Mr. Drew has his own peculiarities.",
			LogWorldPosition = this.m_AudioLogTheProjectionist.transform.position
		}, this.m_AudioLogTheProjectionist, this.m_ProjectionistClip, new Action(this.HandleAudioTheProjectionistOnComplete));
	}

	// Token: 0x06000D20 RID: 3360 RVA: 0x00079870 File Offset: 0x00077C70
	private void HandleAudioTheProjectionistOnComplete()
	{
		if (this.m_ActiveAudioClip == this.m_ProjectionistClip)
		{
			this.m_AudioLogController.PlayOut();
		}
		this.m_AudioLogTheProjectionistInteract.SetActive(true);
		this.m_AudioLogTheProjectionistInteract.OnInteracted += this.HandleAudioLogTheProjectionistOnInteracted;
	}

	// Token: 0x06000D21 RID: 3361 RVA: 0x000798C4 File Offset: 0x00077CC4
	private void HandleAudioLogTheNewVoiceAcressOnInteracted(object sender, EventArgs e)
	{
		this.m_AudioLogTheNewVoiceAcressInteract.SetActive(false);
		this.m_AudioLogTheNewVoiceAcressInteract.OnInteracted -= this.HandleAudioLogTheNewVoiceAcressOnInteracted;
		this.PlayAudioLog(new AudioLogDataVO
		{
			Name = "Susie Campbell",
			Log = "It may only be my second month working for Joey Drew, but I can already tell I'm going to love it here!\n\nPeople really seem to enjoy my Alice Angel voice. Sammy says she may be as popular as Bendy some day.\n\nThese past few weeks I have voiced everything from talking chairs to dancing chickens.\nBut this is the first character I have really felt a connection with. Like she's as a part of me.\n\nAlice and I, we are going places.",
			LogWorldPosition = this.m_AudioLogTheNewVoiceAcress.transform.position
		}, this.m_AudioLogTheNewVoiceAcress, this.m_TheNewVoiceActressClip, new Action(this.HandleAudioTheNewVoiceAcressOnComplete));
	}

	// Token: 0x06000D22 RID: 3362 RVA: 0x00079948 File Offset: 0x00077D48
	private void HandleAudioTheNewVoiceAcressOnComplete()
	{
		if (this.m_ActiveAudioClip == this.m_TheNewVoiceActressClip)
		{
			this.m_AudioLogController.PlayOut();
		}
		this.m_AudioLogTheNewVoiceAcressInteract.SetActive(true);
		this.m_AudioLogTheNewVoiceAcressInteract.OnInteracted += this.HandleAudioLogTheNewVoiceAcressOnInteracted;
	}

	// Token: 0x06000D23 RID: 3363 RVA: 0x0007999C File Offset: 0x00077D9C
	private void HandleAudioLogFavoriteSongOnInteracted(object sender, EventArgs e)
	{
		this.m_AudioLogFavoriteSongInteract.SetActive(false);
		this.m_AudioLogFavoriteSongInteract.OnInteracted -= this.HandleAudioLogFavoriteSongOnInteracted;
		if (!this.m_HasFavoriteSongObjective)
		{
			this.m_HasFavoriteSongObjective = true;
			this.OnFavoriteSongObjective.Send(this);
			for (int i = 0; i < this.m_FavSongSearchers.Count; i++)
			{
				this.m_FavSongSearchers[i].gameObject.SetActive(true);
				this.m_FavSongSearchers[i].Activate();
			}
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "FIND SAMMY'S SANCTUARY", "TIP: LEARN SAMMY'S FAVORITE SONG", 4f, false));
			this.m_PuzzleController.EnableTip();
		}
		this.PlayAudioLog(new AudioLogDataVO
		{
			Name = "Sammy Lawrence",
			Log = this.m_PuzzleLog,
			LogWorldPosition = this.m_AudioLogFavoriteSong.transform.position
		}, this.m_AudioLogFavoriteSong, this.m_PuzzleClip, new Action(this.HandleAudioFavoriteSongOnComplete));
	}

	// Token: 0x06000D24 RID: 3364 RVA: 0x00079AB0 File Offset: 0x00077EB0
	private void HandleAudioFavoriteSongOnComplete()
	{
		if (this.m_ActiveAudioClip == this.m_PuzzleClip)
		{
			this.m_AudioLogController.PlayOut();
		}
		this.m_AudioLogFavoriteSongInteract.SetActive(true);
		this.m_AudioLogFavoriteSongInteract.OnInteracted += this.HandleAudioLogFavoriteSongOnInteracted;
	}

	// Token: 0x06000D25 RID: 3365 RVA: 0x00079B01 File Offset: 0x00077F01
	private void PlayAudioLog(AudioLogDataVO vo, AudioLog audioLog, AudioClip audioClip, Action onComplete)
	{
		this.AudioControllerReset();
		this.m_ActiveAudioClip = audioClip;
		this.m_AudioLogController = GameManager.Instance.UIManager.Show<AudioLogModalController>("UI/Modals/AudioLogModalController", "MODAL", vo);
		audioLog.Play(audioClip, onComplete);
	}

	// Token: 0x06000D26 RID: 3366 RVA: 0x00079B39 File Offset: 0x00077F39
	private void AudioControllerReset()
	{
		if (this.m_AudioLogController != null)
		{
			this.m_AudioLogController.Dispose();
			this.m_AudioLogController = null;
		}
	}

	// Token: 0x06000D27 RID: 3367 RVA: 0x00079B60 File Offset: 0x00077F60
	protected override void OnDisposed()
	{
		this.AudioControllerReset();
		this.m_AudioLogThePrayerInteract.OnInteracted -= this.HandleAudioLogThePrayerOnInteracted;
		this.m_AudioLogDistractionsInteract.OnInteracted -= this.HandleAudioLogDistractionsOnInteracted;
		this.m_AudioLogTheProjectionistInteract.OnInteracted -= this.HandleAudioLogTheProjectionistOnInteracted;
		this.m_AudioLogTheNewVoiceAcressInteract.OnInteracted -= this.HandleAudioLogTheNewVoiceAcressOnInteracted;
		this.m_AudioLogFavoriteSongInteract.OnInteracted -= this.HandleAudioLogFavoriteSongOnInteracted;
		this.m_AudioLogLostKeysInteract.OnInteracted -= this.HandleAudioLogLostKeyOnInteracted;
		if (this.m_AudioObjectThePrayerFinale != null)
		{
			this.m_AudioObjectThePrayerFinale.Clear();
			this.m_AudioObjectThePrayerFinale = null;
		}
		this.m_LostKeysClip = null;
		this.m_ThePrayerClip = null;
		this.m_ThePrayerFinaleClip = null;
		this.m_DistractionsClip = null;
		this.m_ProjectionistClip = null;
		this.m_TheNewVoiceActressClip = null;
		this.m_PuzzleClip = null;
		base.OnDisposed();
	}

	// Token: 0x04000F2B RID: 3883
	[Header("Puzzle Controller")]
	[SerializeField]
	private ChapterTwoRecordingStudioController m_PuzzleController;

	// Token: 0x04000F2C RID: 3884
	[Header("Lost Keys")]
	[SerializeField]
	private Interactable m_AudioLogLostKeysInteract;

	// Token: 0x04000F2D RID: 3885
	[SerializeField]
	private AudioLog m_AudioLogLostKeys;

	// Token: 0x04000F2E RID: 3886
	[Header("The Prayer")]
	[SerializeField]
	private Interactable m_AudioLogThePrayerInteract;

	// Token: 0x04000F2F RID: 3887
	[SerializeField]
	private AudioLog m_AudioLogThePrayer;

	// Token: 0x04000F30 RID: 3888
	[Header("Distractions")]
	[SerializeField]
	private Interactable m_AudioLogDistractionsInteract;

	// Token: 0x04000F31 RID: 3889
	[SerializeField]
	private AudioLog m_AudioLogDistractions;

	// Token: 0x04000F32 RID: 3890
	[Header("The Projectionist")]
	[SerializeField]
	private Interactable m_AudioLogTheProjectionistInteract;

	// Token: 0x04000F33 RID: 3891
	[SerializeField]
	private AudioLog m_AudioLogTheProjectionist;

	// Token: 0x04000F34 RID: 3892
	[Header("The New Voice Acress")]
	[SerializeField]
	private Interactable m_AudioLogTheNewVoiceAcressInteract;

	// Token: 0x04000F35 RID: 3893
	[SerializeField]
	private AudioLog m_AudioLogTheNewVoiceAcress;

	// Token: 0x04000F36 RID: 3894
	[Header("My Favorite Song")]
	[SerializeField]
	private Interactable m_AudioLogFavoriteSongInteract;

	// Token: 0x04000F37 RID: 3895
	[SerializeField]
	private AudioLog m_AudioLogFavoriteSong;

	// Token: 0x04000F38 RID: 3896
	[Header("Searchers")]
	[SerializeField]
	private List<SearcherSpawnController> m_FavSongSearchers;

	// Token: 0x04000F39 RID: 3897
	private AudioObject m_AudioObjectThePrayerFinale;

	// Token: 0x04000F3A RID: 3898
	private AudioClip m_ActiveAudioClip;

	// Token: 0x04000F3B RID: 3899
	private AudioClip m_LostKeysClip;

	// Token: 0x04000F3C RID: 3900
	private AudioClip m_ThePrayerClip;

	// Token: 0x04000F3D RID: 3901
	private AudioClip m_ThePrayerFinaleClip;

	// Token: 0x04000F3E RID: 3902
	private AudioClip m_DistractionsClip;

	// Token: 0x04000F3F RID: 3903
	private AudioClip m_ProjectionistClip;

	// Token: 0x04000F40 RID: 3904
	private AudioClip m_TheNewVoiceActressClip;

	// Token: 0x04000F41 RID: 3905
	private AudioClip m_PuzzleClip;

	// Token: 0x04000F42 RID: 3906
	private AudioLogModalController m_AudioLogController;

	// Token: 0x04000F43 RID: 3907
	private bool m_IsSammyScareComplete;

	// Token: 0x04000F44 RID: 3908
	private string m_PuzzleLog;

	// Token: 0x04000F45 RID: 3909
	private bool m_HasKeyObjective;

	// Token: 0x04000F46 RID: 3910
	private bool m_HasFavoriteSongObjective;
}
