using System;

// Token: 0x0200028F RID: 655
public class SteamAchievements : IAchievements
{
	// Token: 0x06000EBF RID: 3775 RVA: 0x00081B71 File Offset: 0x0007FF71
	public void SetAchievementUser(int userID)
	{
	}

	// Token: 0x06000EC0 RID: 3776 RVA: 0x00081B73 File Offset: 0x0007FF73
	public void Initialize(AchievementIDMapping[] mapping = null)
	{
	}

	// Token: 0x06000EC1 RID: 3777 RVA: 0x00081B75 File Offset: 0x0007FF75
	public void SetStat(StatName name, int data)
	{
	}

	// Token: 0x06000EC2 RID: 3778 RVA: 0x00081B77 File Offset: 0x0007FF77
	public void SetStat(StatName name, float data)
	{
	}

	// Token: 0x06000EC3 RID: 3779 RVA: 0x00081B79 File Offset: 0x0007FF79
	public bool GetAchievement(AchievementName name)
	{
		return false;
	}

	// Token: 0x06000EC4 RID: 3780 RVA: 0x00081B7C File Offset: 0x0007FF7C
	public void SetAchievement(AchievementName name)
	{
	}

	// Token: 0x06000EC5 RID: 3781 RVA: 0x00081B7E File Offset: 0x0007FF7E
	public void ClearAchievement(AchievementName name)
	{
	}

	// Token: 0x06000EC6 RID: 3782 RVA: 0x00081B80 File Offset: 0x0007FF80
	public void GetStat(StatName name, out int? data)
	{
		data = new int?(0);
	}

	// Token: 0x06000EC7 RID: 3783 RVA: 0x00081B8E File Offset: 0x0007FF8E
	public void GetStat(StatName name, out float? data)
	{
		data = new float?(0f);
	}

	// Token: 0x06000EC8 RID: 3784 RVA: 0x00081BA0 File Offset: 0x0007FFA0
	public void IndicateProgress(AchievementName name, uint currentProgress, uint maxProgress)
	{
	}

	// Token: 0x06000EC9 RID: 3785 RVA: 0x00081BA2 File Offset: 0x0007FFA2
	public void ResetStats()
	{
	}

	// Token: 0x06000ECA RID: 3786 RVA: 0x00081BA4 File Offset: 0x0007FFA4
	public void ResetStatsAndAchievements()
	{
	}

	// Token: 0x06000ECB RID: 3787 RVA: 0x00081BA6 File Offset: 0x0007FFA6
	public void StoreStats()
	{
	}

	// Token: 0x06000ECC RID: 3788 RVA: 0x00081BA8 File Offset: 0x0007FFA8
	public bool IsConnected()
	{
		return false;
	}

	// Token: 0x040010A3 RID: 4259
	private bool _IsInitialized;
}
