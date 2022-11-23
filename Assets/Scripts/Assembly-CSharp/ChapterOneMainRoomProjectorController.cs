using System;
using TMG.Core;
using UnityEngine;

// Token: 0x02000262 RID: 610
public class ChapterOneMainRoomProjectorController : TMGMonoBehaviour
{
	// Token: 0x06000CD3 RID: 3283 RVA: 0x00077D10 File Offset: 0x00076110
	public override void Init()
	{
		base.Init();
		this.m_ProjectorInteract.OnInteracted += this.HandleProjectorOnInteract;
	}

	// Token: 0x06000CD4 RID: 3284 RVA: 0x00077D30 File Offset: 0x00076130
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_Projector.FilmAudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Projector_Run_With_Film_01", this.m_Projector.AudioPosition.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
		this.m_Projector.MusicAudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/MUS/MUS_Hellfire_Follies", this.m_Projector.AudioPosition.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
		this.m_Projector.InitTurnOn();
		this.m_IsOn = true;
	}

	// Token: 0x06000CD5 RID: 3285 RVA: 0x00077DBC File Offset: 0x000761BC
	private void HandleProjectorOnInteract(object sender, EventArgs e)
	{
		if (this.m_IsOn)
		{
			this.TurnOff();
			this.m_IsOn = false;
		}
		else
		{
			this.m_Projector.FilmAudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Projector_Run_With_Film_01", this.m_Projector.AudioPosition.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
			this.m_Projector.MusicAudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/MUS/MUS_Hellfire_Follies", this.m_Projector.AudioPosition.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
			this.TurnOn();
			this.m_IsOn = true;
		}
	}

	// Token: 0x06000CD6 RID: 3286 RVA: 0x00077E59 File Offset: 0x00076259
	public void TurnOn()
	{
		this.m_Projector.TurnOn();
	}

	// Token: 0x06000CD7 RID: 3287 RVA: 0x00077E66 File Offset: 0x00076266
	public void TurnOff()
	{
		this.m_Projector.TurnOff();
	}

	// Token: 0x06000CD8 RID: 3288 RVA: 0x00077E73 File Offset: 0x00076273
	public void ShutDown()
	{
		this.TurnOff();
		this.m_ProjectorInteract.OnInteracted -= this.HandleProjectorOnInteract;
		this.m_ProjectorInteract.SetActive(false);
	}

	// Token: 0x06000CD9 RID: 3289 RVA: 0x00077E9E File Offset: 0x0007629E
	protected override void OnDisposed()
	{
		this.m_ProjectorInteract.OnInteracted -= this.HandleProjectorOnInteract;
		base.OnDisposed();
	}

	// Token: 0x04000EF3 RID: 3827
	[Header("Interactable")]
	[SerializeField]
	private Interactable m_ProjectorInteract;

	// Token: 0x04000EF4 RID: 3828
	[SerializeField]
	private ProjectorController m_Projector;

	// Token: 0x04000EF5 RID: 3829
	private bool m_IsOn;
}
