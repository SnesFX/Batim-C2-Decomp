using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x020002A2 RID: 674
public class PlankBreakController : TMGMonoBehaviour
{
	// Token: 0x06000FA1 RID: 4001 RVA: 0x000852E8 File Offset: 0x000836E8
	public override void Init()
	{
		base.Init();
		this.m_PlankCount = this.m_Planks.Count;
		for (int i = 0; i < this.m_PlankCount; i++)
		{
			this.m_Planks[i].BreakTrigger.OnEnter += this.HandleBreakTriggerOnEnter;
		}
	}

	// Token: 0x06000FA2 RID: 4002 RVA: 0x00085348 File Offset: 0x00083748
	private void HandleBreakTriggerOnEnter(object sender, EventArgs e)
	{
		int hashCode = sender.GetHashCode();
		for (int i = 0; i < this.m_PlankCount; i++)
		{
			PlankBreakController.Plank plank = this.m_Planks[i];
			if (plank.HashID == hashCode)
			{
				plank.BreakTrigger.OnEnter -= this.HandleBreakTriggerOnEnter;
				GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_06", plank.AudioPosition.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
				plank.BreakablePlank.Destroy(plank.BreakPosition.position);
				this.m_BrokenPlankCount++;
				break;
			}
		}
		/*
		if (this.m_BrokenPlankCount >= this.m_BrokenPlankCount)
		{
			base.Dispose();
		}
		*/
	}

	// Token: 0x06000FA3 RID: 4003 RVA: 0x00085408 File Offset: 0x00083808
	protected override void OnDisposed()
	{
		for (int i = 0; i < this.m_PlankCount; i++)
		{
			this.m_Planks[i].BreakTrigger.OnEnter -= this.HandleBreakTriggerOnEnter;
		}
		base.OnDisposed();
	}

	// Token: 0x0400114F RID: 4431
	[Header("Breakable Planks")]
	[SerializeField]
	private List<PlankBreakController.Plank> m_Planks;

	// Token: 0x04001150 RID: 4432
	private int m_PlankCount;

	// Token: 0x04001151 RID: 4433
	private int m_BrokenPlankCount;

	// Token: 0x020002A3 RID: 675
	[Serializable]
	public class Plank
	{
		// Token: 0x170002AD RID: 685
		// (get) Token: 0x06000FA5 RID: 4005 RVA: 0x0008545C File Offset: 0x0008385C
		public int HashID
		{
			get
			{
				return this.BreakTrigger.GetHashCode();
			}
		}

		// Token: 0x04001152 RID: 4434
		public EventTrigger BreakTrigger;

		// Token: 0x04001153 RID: 4435
		public Transform AudioPosition;

		// Token: 0x04001154 RID: 4436
		public Transform BreakPosition;

		// Token: 0x04001155 RID: 4437
		public Breakable BreakablePlank;
	}
}
