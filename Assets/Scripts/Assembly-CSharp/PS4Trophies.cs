using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200028B RID: 651
public class PS4Trophies : IAchievements
{
	// Token: 0x06000E9C RID: 3740 RVA: 0x0008199E File Offset: 0x0007FD9E
	public void SetAchievementUser(int userID)
	{
	}

	// Token: 0x06000E9D RID: 3741 RVA: 0x000819A0 File Offset: 0x0007FDA0
	public bool GetAchievement(AchievementName achievementName)
	{
		return false;
	}

	// Token: 0x06000E9E RID: 3742 RVA: 0x000819A3 File Offset: 0x0007FDA3
	private int GetTrophyIDFromAchievement(AchievementName achievementName)
	{
		return 0;
	}

	// Token: 0x06000E9F RID: 3743 RVA: 0x000819A6 File Offset: 0x0007FDA6
	public void SetAchievement(AchievementName achievementName)
	{
	}

	// Token: 0x06000EA0 RID: 3744 RVA: 0x000819A8 File Offset: 0x0007FDA8
	public void ClearAchievement(AchievementName name)
	{
	}

	// Token: 0x06000EA1 RID: 3745 RVA: 0x000819AA File Offset: 0x0007FDAA
	public void SetStat(StatName name, int data)
	{
	}

	// Token: 0x06000EA2 RID: 3746 RVA: 0x000819AC File Offset: 0x0007FDAC
	public void SetStat(StatName name, float data)
	{
	}

	// Token: 0x06000EA3 RID: 3747 RVA: 0x000819AE File Offset: 0x0007FDAE
	public void GetStat(StatName name, out int? data)
	{
		data = new int?(0);
	}

	// Token: 0x06000EA4 RID: 3748 RVA: 0x000819BC File Offset: 0x0007FDBC
	public void GetStat(StatName name, out float? data)
	{
		data = new float?(0f);
	}

	// Token: 0x06000EA5 RID: 3749 RVA: 0x000819CE File Offset: 0x0007FDCE
	public void Initialize(AchievementIDMapping[] mapping = null)
	{
	}

	// Token: 0x06000EA6 RID: 3750 RVA: 0x000819D0 File Offset: 0x0007FDD0
	public void IndicateProgress(AchievementName name, uint currentProgress, uint maxProgress)
	{
	}

	// Token: 0x06000EA7 RID: 3751 RVA: 0x000819D2 File Offset: 0x0007FDD2
	public void StoreStats()
	{
	}

	// Token: 0x06000EA8 RID: 3752 RVA: 0x000819D4 File Offset: 0x0007FDD4
	public void ResetStats()
	{
	}

	// Token: 0x06000EA9 RID: 3753 RVA: 0x000819D6 File Offset: 0x0007FDD6
	public void ResetStatsAndAchievements()
	{
	}

	// Token: 0x06000EAA RID: 3754 RVA: 0x000819D8 File Offset: 0x0007FDD8
	public bool IsConnected()
	{
		return false;
	}

	// Token: 0x06000EAB RID: 3755 RVA: 0x000819DB File Offset: 0x0007FDDB
	private void DumpGameInfo()
	{
	}

	// Token: 0x06000EAC RID: 3756 RVA: 0x000819DD File Offset: 0x0007FDDD
	private void TrophiesDebugLog(string message)
	{
		Debug.Log("*PS4 TROPHIES* " + message);
	}

	// Token: 0x0400109B RID: 4251
	private List<AchievementIDMapping> IDMapping;

	// Token: 0x0400109C RID: 4252
	private Texture2D trophyIcon;

	// Token: 0x0400109D RID: 4253
	private Texture2D trophyGroupIcon;
}
