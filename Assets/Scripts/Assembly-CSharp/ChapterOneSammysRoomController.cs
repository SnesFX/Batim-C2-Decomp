using System;
using TMG.Core;
using UnityEngine;

// Token: 0x02000266 RID: 614
public class ChapterOneSammysRoomController : TMGMonoBehaviour
{
	// Token: 0x06000CF5 RID: 3317 RVA: 0x000788FE File Offset: 0x00076CFE
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_Door.Lock();
		this.m_RoomMusicAudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/MUS/MUS_Ode_To_Bendy_Loop_Through_Door_01", this.m_MusicPosition.position, AudioObjectType.AMBIENCE, -1, false, null);
	}

	// Token: 0x06000CF6 RID: 3318 RVA: 0x0007893A File Offset: 0x00076D3A
	public void Activate()
	{
		this.m_EnableTrigger.SetActive(true);
		this.m_EnableTrigger.OnEnter += this.HandleEnableTriggerOnEnter;
	}

	// Token: 0x06000CF7 RID: 3319 RVA: 0x0007895F File Offset: 0x00076D5F
	private void HandleEnableTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_EnableTrigger.OnEnter -= this.HandleEnableTriggerOnEnter;
		this.m_EventTrigger.SetActive(true);
		this.m_EventTrigger.OnEnter += this.HandleEventTriggerOnEnter;
	}

	// Token: 0x06000CF8 RID: 3320 RVA: 0x0007899B File Offset: 0x00076D9B
	private void HandleEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_EventTrigger.OnEnter -= this.HandleEventTriggerOnEnter;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Light_Switch_Sammys_Room_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.UnlockRoom();
	}

	// Token: 0x06000CF9 RID: 3321 RVA: 0x000789D4 File Offset: 0x00076DD4
	public void UnlockRoom()
	{
		if (this.m_RoomMusicAudioObject != null)
		{
			this.m_RoomMusicAudioObject.Clear();
			this.m_RoomMusicAudioObject = null;
		}
		this.m_LightBar.SetActive(false);
		this.m_InnerLights.SetActive(true);
		this.m_Door.Unlock();
	}

	// Token: 0x06000CFA RID: 3322 RVA: 0x00078A28 File Offset: 0x00076E28
	protected override void OnDisposed()
	{
		if (this.m_RoomMusicAudioObject != null)
		{
			this.m_RoomMusicAudioObject.Clear();
			this.m_RoomMusicAudioObject = null;
		}
		this.m_EnableTrigger.OnEnter -= this.HandleEnableTriggerOnEnter;
		this.m_EventTrigger.OnEnter -= this.HandleEventTriggerOnEnter;
		base.OnDisposed();
	}

	// Token: 0x04000F0E RID: 3854
	[Header("Transforms")]
	[SerializeField]
	private Transform m_MusicPosition;

	// Token: 0x04000F0F RID: 3855
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_LightBar;

	// Token: 0x04000F10 RID: 3856
	[SerializeField]
	private GameObject m_InnerLights;

	// Token: 0x04000F11 RID: 3857
	[Header("Door")]
	[SerializeField]
	private DoorController m_Door;

	// Token: 0x04000F12 RID: 3858
	[Header("< Event Triggers >")]
	[SerializeField]
	private EventTrigger m_EnableTrigger;

	// Token: 0x04000F13 RID: 3859
	[SerializeField]
	private EventTrigger m_EventTrigger;

	// Token: 0x04000F14 RID: 3860
	private AudioObject m_RoomMusicAudioObject;
}
