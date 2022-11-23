using System;
using TMG.Core;
using UnityEngine;

// Token: 0x0200025B RID: 603
public class ChapterOneAudioLogsController : TMGMonoBehaviour
{
	// Token: 0x06000C79 RID: 3193 RVA: 0x00075D5F File Offset: 0x0007415F
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_OfferingClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/DIA/ChapterOne/AudioLogs/DIA_Cassette_Tape_01");
		this.m_AudioLogOfferingInteract.OnInteracted += this.HandleAudioLogOfferingOnInteracted;
	}

	// Token: 0x06000C7A RID: 3194 RVA: 0x00075D98 File Offset: 0x00074198
	private void HandleAudioLogOfferingOnInteracted(object sender, EventArgs e)
	{
		this.m_AudioLogOfferingInteract.SetActive(false);
		this.m_AudioLogOfferingInteract.OnInteracted -= this.HandleAudioLogOfferingOnInteracted;
		this.PlayAudioLog(new AudioLogDataVO
		{
			Name = "Wally Franks",
			Log = "At this point, I don't get what Joey's plan is for this company. The animations sure aren't being finished on time anymore. And I certainly don't see why we need this machine. It's noisy, it's messy. And who needs that much ink anyway?\n\nAlso, get this, Joey had each one of us donate something from our work station. We put them on these little pedestals in the break room. To help appease the gods, Joey says. Keep things going.\n\nI think he's lost his mind, but, hey, he writes the checks.\n\nBut I tell you what, if one more of these pipes burst, I'm out of here.",
			LogWorldPosition = this.m_AudioLogOffering.transform.position
		}, this.m_AudioLogOffering, this.m_OfferingClip, new Action(this.HandleAudioOfferingOnComplete));
	}

	// Token: 0x06000C7B RID: 3195 RVA: 0x00075E19 File Offset: 0x00074219
	private void HandleAudioOfferingOnComplete()
	{
		this.m_AudioLogController.PlayOut();
		this.m_AudioLogOfferingInteract.SetActive(true);
		this.m_AudioLogOfferingInteract.OnInteracted += this.HandleAudioLogOfferingOnInteracted;
	}

	// Token: 0x06000C7C RID: 3196 RVA: 0x00075E49 File Offset: 0x00074249
	private void PlayAudioLog(AudioLogDataVO vo, AudioLog audioLog, AudioClip audioClip, Action onComplete)
	{
		this.AudioControllerReset();
		this.m_AudioLogController = GameManager.Instance.UIManager.Show<AudioLogModalController>("UI/Modals/AudioLogModalController", "MODAL", vo);
		audioLog.Play(audioClip, onComplete);
	}

	// Token: 0x06000C7D RID: 3197 RVA: 0x00075E7A File Offset: 0x0007427A
	private void AudioControllerReset()
	{
		if (this.m_AudioLogController != null)
		{
			this.m_AudioLogController.Dispose();
			this.m_AudioLogController = null;
		}
	}

	// Token: 0x06000C7E RID: 3198 RVA: 0x00075E9F File Offset: 0x0007429F
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04000E80 RID: 3712
	[Header("Interactables")]
	[SerializeField]
	private Interactable m_AudioLogOfferingInteract;

	// Token: 0x04000E81 RID: 3713
	[SerializeField]
	private AudioLog m_AudioLogOffering;

	// Token: 0x04000E82 RID: 3714
	private AudioLogModalController m_AudioLogController;

	// Token: 0x04000E83 RID: 3715
	private AudioClip m_OfferingClip;
}
