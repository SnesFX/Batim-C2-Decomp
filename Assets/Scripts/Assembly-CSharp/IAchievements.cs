using System;

// Token: 0x02000289 RID: 649
public interface IAchievements
{
	// Token: 0x06000E8A RID: 3722
	void Initialize(AchievementIDMapping[] mapping = null);

	// Token: 0x06000E8B RID: 3723
	void SetAchievementUser(int userID);

	// Token: 0x06000E8C RID: 3724
	bool GetAchievement(AchievementName name);

	// Token: 0x06000E8D RID: 3725
	void SetAchievement(AchievementName name);

	// Token: 0x06000E8E RID: 3726
	void ClearAchievement(AchievementName name);

	// Token: 0x06000E8F RID: 3727
	void SetStat(StatName name, int data);

	// Token: 0x06000E90 RID: 3728
	void SetStat(StatName name, float data);

	// Token: 0x06000E91 RID: 3729
	void GetStat(StatName name, out int? data);

	// Token: 0x06000E92 RID: 3730
	void GetStat(StatName name, out float? data);

	// Token: 0x06000E93 RID: 3731
	void IndicateProgress(AchievementName name, uint currentProgress, uint maxProgress);

	// Token: 0x06000E94 RID: 3732
	void StoreStats();

	// Token: 0x06000E95 RID: 3733
	void ResetStats();

	// Token: 0x06000E96 RID: 3734
	void ResetStatsAndAchievements();

	// Token: 0x06000E97 RID: 3735
	bool IsConnected();
}
