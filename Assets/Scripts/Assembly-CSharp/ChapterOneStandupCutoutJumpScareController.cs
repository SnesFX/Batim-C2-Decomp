using System;
using TMG.Core;
using UnityEngine;

// Token: 0x02000267 RID: 615
public class ChapterOneStandupCutoutJumpScareController : TMGMonoBehaviour
{
	// Token: 0x06000CFC RID: 3324 RVA: 0x00078A94 File Offset: 0x00076E94
	public void Activate()
	{
		this.m_PlankController.Dispose();
		this.m_Cutout.SetActive(true);
		this.m_JumpScareTrigger.SetActive(true);
		this.m_JumpScareTrigger.OnEnter += this.HandleJumpScareTriggerOnEnter;
		this.m_DialogueTrigger.OnEnter += this.HandleDialogueTriggerOnEnter;
	}

	// Token: 0x06000CFD RID: 3325 RVA: 0x00078AF2 File Offset: 0x00076EF2
	private void HandleDialogueTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_DialogueTrigger.OnEnter -= this.HandleDialogueTriggerOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterOne/Henry/DIA_Player_11", "Who put this here?!", false));
	}

	// Token: 0x06000CFE RID: 3326 RVA: 0x00078B28 File Offset: 0x00076F28
	private void HandleJumpScareTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_JumpScareTrigger.OnEnter -= this.HandleJumpScareTriggerOnEnter;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Jumpscare_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_DestroyTrigger.SetActive(true);
		this.m_DestroyTrigger.OnEnter += this.HandleDestroyTriggerOnEnter;
	}

	// Token: 0x06000CFF RID: 3327 RVA: 0x00078B87 File Offset: 0x00076F87
	private void HandleDestroyTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_DestroyTrigger.OnEnter -= this.HandleDestroyTriggerOnEnter;
		base.Dispose();
	}

	// Token: 0x06000D00 RID: 3328 RVA: 0x00078BA6 File Offset: 0x00076FA6
	protected override void OnDisposed()
	{
		if (this.m_DialogueTrigger != null)
		{
			this.m_DialogueTrigger.OnEnter -= this.HandleDialogueTriggerOnEnter;
		}
		base.OnDisposed();
	}

	// Token: 0x04000F15 RID: 3861
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_Cutout;

	// Token: 0x04000F16 RID: 3862
	[Header("Controllers")]
	[SerializeField]
	private ChapterOnePlankJumpScareController m_PlankController;

	// Token: 0x04000F17 RID: 3863
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_JumpScareTrigger;

	// Token: 0x04000F18 RID: 3864
	[SerializeField]
	private EventTrigger m_DestroyTrigger;

	// Token: 0x04000F19 RID: 3865
	[SerializeField]
	private EventTrigger m_DialogueTrigger;
}
