using System;

// Token: 0x0200028A RID: 650
public class InGameAchievementTracker
{
	// Token: 0x06000E98 RID: 3736 RVA: 0x00081944 File Offset: 0x0007FD44
	public InGameAchievementTracker(AchievementName achievement, int unlockValue)
	{
		this._CurrentValue = 0;
		this._UnlockValue = unlockValue;
		this._Achievement = achievement;
	}

	// Token: 0x06000E99 RID: 3737 RVA: 0x00081961 File Offset: 0x0007FD61
	public void IncrementValue()
	{
		this._CurrentValue++;
		if (this._CurrentValue >= this._UnlockValue)
		{
			AchievementsController.SetAchievement(this._Achievement);
		}
	}

	// Token: 0x06000E9A RID: 3738 RVA: 0x0008198D File Offset: 0x0007FD8D
	public void Reset()
	{
		this._CurrentValue = 0;
	}

	// Token: 0x04001098 RID: 4248
	private int _CurrentValue;

	// Token: 0x04001099 RID: 4249
	private int _UnlockValue;

	// Token: 0x0400109A RID: 4250
	private AchievementName _Achievement;
}
