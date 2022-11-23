using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200026D RID: 621
public class ChapterTwoCannedSoupController : BaseController
{
	// Token: 0x06000D56 RID: 3414 RVA: 0x0007AD5C File Offset: 0x0007915C
	public override void Init()
	{
		base.Init();
		this.m_CannedSoupCount = this.m_CannedSoups.Count;
		for (int i = 0; i < this.m_CannedSoupCount; i++)
		{
			this.m_CannedSoups[i].OnInteracted += this.HandleCannedSoupOnInteracted;
		}
	}

	// Token: 0x06000D57 RID: 3415 RVA: 0x0007ADB4 File Offset: 0x000791B4
	private void HandleCannedSoupOnInteracted(object sender, EventArgs e)
	{
		Interactable interactable = (Interactable)sender;
		if (interactable == null)
		{
			return;
		}
		interactable.OnInteracted -= this.HandleCannedSoupOnInteracted;
		this.m_CollectedCannedSoups++;
		if (this.m_CollectedCannedSoups >= this.m_CannedSoupCount)
		{
			GameManager.Instance.AchievementManager.SetAchievement(AchievementName.CANADIAN_BACON);
			base.Dispose();
		}
	}

	// Token: 0x06000D58 RID: 3416 RVA: 0x0007AE1C File Offset: 0x0007921C
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04000F7A RID: 3962
	[Header("Bacon Soups")]
	[SerializeField]
	private List<Interactable> m_CannedSoups;

	// Token: 0x04000F7B RID: 3963
	private int m_CannedSoupCount;

	// Token: 0x04000F7C RID: 3964
	private int m_CollectedCannedSoups;
}
