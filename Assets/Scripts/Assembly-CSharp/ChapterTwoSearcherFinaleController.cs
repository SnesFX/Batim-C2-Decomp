using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200027D RID: 637
public class ChapterTwoSearcherFinaleController : BaseController
{
	// Token: 0x06000E24 RID: 3620 RVA: 0x0007FB68 File Offset: 0x0007DF68
	public override void Init()
	{
		base.Init();
		this.m_SammyBalcony.SetActive(false);
		this.m_FinaleTrigger.SetActive(false);
		this.m_ExitTrigger.SetActive(false);
	}

	// Token: 0x06000E25 RID: 3621 RVA: 0x0007FB94 File Offset: 0x0007DF94
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_SearcherMusicClip = GameManager.Instance.GetAudioClip("Audio/MUS/MUS_The_Searchers");
	}

	// Token: 0x06000E26 RID: 3622 RVA: 0x0007FBB4 File Offset: 0x0007DFB4
	public void Activate()
	{
		this.m_FinaleTrigger.SetActive(true);
		this.m_FinaleTrigger.OnEnter += this.HandleFinaleTriggerOnEnter;
		this.m_SammyBalcony.SetActive(true);
		for (int i = 0; i < this.m_Searchers.Count; i++)
		{
			this.m_Searchers[i].gameObject.SetActive(true);
		}
		this.m_Door.Close(0f, Ease.Linear, delegate()
		{
			this.m_Door.Lock();
		});
	}

	// Token: 0x06000E27 RID: 3623 RVA: 0x0007FC40 File Offset: 0x0007E040
	private void HandleFinaleTriggerOnEnter(object sender, EventArgs e)
	{
		GameManager.Instance.AudioManager.Play("Audio/MUS/MUS_SearcherStartCue01", AudioObjectType.SOUND_EFFECT, 0, false).OnComplete += delegate(object _sender, EventArgs _e)
		{
			this.m_SearcherMusic = GameManager.Instance.AudioManager.Play(this.m_SearcherMusicClip, AudioObjectType.MUSIC, -1, false);
		};
		for (int i = 0; i < this.m_Searchers.Count; i++)
		{
			this.m_Searchers[i].Activate();
			this.m_Searchers[i].OnDeplete += this.HandleSearcherOnDeplete;
		}
		for (int j = 0; j < this.m_ExtraSearchers.Count; j++)
		{
			this.m_ExtraSearchers[j].gameObject.SetActive(true);
			this.m_ExtraSearchers[j].Activate();
		}
	}

	// Token: 0x06000E28 RID: 3624 RVA: 0x0007FD04 File Offset: 0x0007E104
	private void HandleSearcherOnDeplete(object sender, EventArgs e)
	{
		SearcherSpawnController item = sender as SearcherSpawnController;
		this.m_Searchers.Remove(item);
		if (this.m_Searchers.Count <= 0)
		{
			this.OnComplete();
		}
	}

	// Token: 0x06000E29 RID: 3625 RVA: 0x0007FD3C File Offset: 0x0007E13C
	private new void OnComplete()
	{
		base.SendOnComplete();
		this.m_SearcherMusic.AudioSource.DOFade(0f, 5f).OnComplete(delegate
		{
			this.m_SearcherMusic.Clear();
			this.m_SearcherMusic = null;
		});
		this.m_Door.Unlock();
		this.m_Door.Open(1f, Ease.InOutQuad, delegate()
		{
			this.m_Door.Lock();
			this.m_ExitTrigger.SetActive(true);
			this.m_ExitTrigger.OnEnter += this.HandleExitTriggerOnEnter;
		}, 145f);
	}

	// Token: 0x06000E2A RID: 3626 RVA: 0x0007FDA8 File Offset: 0x0007E1A8
	private void HandleExitTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_ExitTrigger.OnEnter -= this.HandleExitTriggerOnEnter;
		this.m_SammyBalcony.SetActive(false);
	}

	// Token: 0x06000E2B RID: 3627 RVA: 0x0007FDCD File Offset: 0x0007E1CD
	protected override void OnDisposed()
	{
		if (this.m_SearcherMusic != null)
		{
			this.m_SearcherMusic.Clear();
			this.m_SearcherMusic = null;
		}
		this.m_SearcherMusicClip = null;
		base.OnDisposed();
	}

	// Token: 0x0400104A RID: 4170
	[Header("GameObject")]
	[SerializeField]
	private GameObject m_SammyBalcony;

	// Token: 0x0400104B RID: 4171
	[Header("EventTriggers")]
	[SerializeField]
	private EventTrigger m_FinaleTrigger;

	// Token: 0x0400104C RID: 4172
	[SerializeField]
	private EventTrigger m_ExitTrigger;

	// Token: 0x0400104D RID: 4173
	[Header("Door")]
	[SerializeField]
	private DoorController m_Door;

	// Token: 0x0400104E RID: 4174
	[Header("Searchers")]
	[SerializeField]
	private List<SearcherSpawnController> m_Searchers;

	// Token: 0x0400104F RID: 4175
	[SerializeField]
	private List<SearcherSpawnController> m_ExtraSearchers;

	// Token: 0x04001050 RID: 4176
	private AudioObject m_SearcherMusic;

	// Token: 0x04001051 RID: 4177
	private AudioClip m_SearcherMusicClip;
}
