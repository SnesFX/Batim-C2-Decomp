using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x020002A0 RID: 672
public class InkWaterController : TMGMonoBehaviour
{
	// Token: 0x06000F94 RID: 3988 RVA: 0x00085008 File Offset: 0x00083408
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_InkAmbience = GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Ink_Flood_AMB_01", this.m_HallwayAudioPos.position, AudioObjectType.AMBIENCE, -1, false, null);
		for (int i = 0; i < this.m_EventTriggers.Count; i++)
		{
			this.m_EventTriggers[i].OnEnter += this.HandleEventTriggerOnEnter;
			this.m_EventTriggers[i].OnExit += this.HandleEventTriggerOnExit;
		}
	}

	// Token: 0x06000F95 RID: 3989 RVA: 0x0008509A File Offset: 0x0008349A
	private void HandleEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.Enter((EventTrigger)sender);
	}

	// Token: 0x06000F96 RID: 3990 RVA: 0x000850A8 File Offset: 0x000834A8
	private void HandleEventTriggerOnExit(object sender, EventArgs e)
	{
		this.Exit((EventTrigger)sender);
	}

	// Token: 0x06000F97 RID: 3991 RVA: 0x000850B8 File Offset: 0x000834B8
	private void Enter(EventTrigger trigger)
	{
		GameManager.Instance.Player.SlowSpeed();
		GameManager.Instance.Player.LockJump();
		if (trigger.Equals(this.m_FirstHallwayTrigger) || trigger.Equals(this.m_BendyTrigger))
		{
			Vector3 vector = GameManager.Instance.Player.transform.position;
			vector += Vector3.down * 3f;
			if (this.m_InkAmbience != null)
			{
				this.m_InkAmbience.transform.position = vector;
				this.m_InkAmbience.transform.SetParent(GameManager.Instance.Player.transform);
			}
		}
	}

	// Token: 0x06000F98 RID: 3992 RVA: 0x00085174 File Offset: 0x00083574
	private void Exit(EventTrigger trigger)
	{
		GameManager.Instance.Player.ResetSpeed();
		GameManager.Instance.Player.UnlockJump();
		if ((trigger.Equals(this.m_FirstHallwayTrigger) || trigger.Equals(this.m_BendyTrigger)) && this.m_InkAmbience != null)
		{
			this.m_InkAmbience.transform.SetParent(null);
		}
	}

	// Token: 0x06000F99 RID: 3993 RVA: 0x000851E3 File Offset: 0x000835E3
	public void MoveAudioToBendy()
	{
		if (this.m_InkAmbience != null)
		{
			this.m_InkAmbience.transform.position = this.m_BendyAudioPos.transform.position;
		}
	}

	// Token: 0x06000F9A RID: 3994 RVA: 0x00085218 File Offset: 0x00083618
	private void RemoveListeners()
	{
		for (int i = 0; i < this.m_EventTriggers.Count; i++)
		{
			this.m_EventTriggers[i].OnEnter -= this.HandleEventTriggerOnEnter;
			this.m_EventTriggers[i].OnExit -= this.HandleEventTriggerOnExit;
		}
	}

	// Token: 0x06000F9B RID: 3995 RVA: 0x0008527B File Offset: 0x0008367B
	protected override void OnDisposed()
	{
		this.RemoveListeners();
		if (this.m_InkAmbience != null)
		{
			this.m_InkAmbience.Clear();
			this.m_InkAmbience = null;
		}
		base.OnDisposed();
	}

	// Token: 0x04001148 RID: 4424
	[Header("Transforms")]
	[SerializeField]
	private Transform m_HallwayAudioPos;

	// Token: 0x04001149 RID: 4425
	[SerializeField]
	private Transform m_BendyAudioPos;

	// Token: 0x0400114A RID: 4426
	[Header("Event Triggers")]
	[SerializeField]
	private List<EventTrigger> m_EventTriggers;

	// Token: 0x0400114B RID: 4427
	[SerializeField]
	private EventTrigger m_FirstHallwayTrigger;

	// Token: 0x0400114C RID: 4428
	[SerializeField]
	private EventTrigger m_BendyTrigger;

	// Token: 0x0400114D RID: 4429
	private AudioObject m_InkAmbience;
}
