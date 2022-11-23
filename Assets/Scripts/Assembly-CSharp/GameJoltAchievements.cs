using System;
using System.Collections.Generic;
using System.Linq;
using GameJolt.API;
using GameJolt.API.Core;
using GameJolt.API.Objects;

// Token: 0x02000288 RID: 648
public class GameJoltAchievements : IAchievements
{
	// Token: 0x06000E7A RID: 3706 RVA: 0x000817E4 File Offset: 0x0007FBE4
	public void Initialize(AchievementIDMapping[] mapping = null)
	{
		this.m_IDMapping = mapping.ToList<AchievementIDMapping>();
	}

	// Token: 0x06000E7B RID: 3707 RVA: 0x000817F2 File Offset: 0x0007FBF2
	public void SetAchievementUser(int userID)
	{
	}

	// Token: 0x06000E7C RID: 3708 RVA: 0x000817F4 File Offset: 0x0007FBF4
	public bool GetAchievement(AchievementName name)
	{
		int trophyIDFromAchievement = this.GetTrophyIDFromAchievement(name);
		bool isUnlocked = false;
		if (trophyIDFromAchievement != -1)
		{
            
			Trophies.Get(trophyIDFromAchievement, delegate(Trophy trophy)
			{
				isUnlocked = trophy.Unlocked;
			});
		}
		return isUnlocked;
	}

	// Token: 0x06000E7D RID: 3709 RVA: 0x00081838 File Offset: 0x0007FC38
	private int GetTrophyIDFromAchievement(AchievementName achievementName)
	{
		AchievementIDMapping achievementIDMapping = this.m_IDMapping.Find((AchievementIDMapping mapping) => mapping.AchievementName == achievementName);
		if (achievementIDMapping != null)
		{
			return achievementIDMapping.AchievementID;
		}
		return -1;
	}

	// Token: 0x06000E7E RID: 3710 RVA: 0x0008187C File Offset: 0x0007FC7C
	public void SetAchievement(AchievementName name)
	{
		int trophyIDFromAchievement = this.GetTrophyIDFromAchievement(name);
		if (trophyIDFromAchievement != -1)
		{
			Trophies.Get(trophyIDFromAchievement, new Action<Trophy>(this.HandleAchievementUnlocked));
		}
	}

	// Token: 0x06000E7F RID: 3711 RVA: 0x000818AA File Offset: 0x0007FCAA
	private void HandleAchievementUnlocked(Trophy trophy)
	{
		if (!trophy.Unlocked)
		{
			GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Achievment_Gamejolt_01", AudioObjectType.SOUND_EFFECT, 0, false);
			trophy.Unlock(null);
		}
	}

	// Token: 0x06000E80 RID: 3712 RVA: 0x000818D6 File Offset: 0x0007FCD6
	public void ClearAchievement(AchievementName name)
	{
	}

	// Token: 0x06000E81 RID: 3713 RVA: 0x000818D8 File Offset: 0x0007FCD8
	public void SetStat(StatName name, int data)
	{
	}

	// Token: 0x06000E82 RID: 3714 RVA: 0x000818DA File Offset: 0x0007FCDA
	public void SetStat(StatName name, float data)
	{
	}

	// Token: 0x06000E83 RID: 3715 RVA: 0x000818DC File Offset: 0x0007FCDC
	public void GetStat(StatName name, out int? data)
	{
		data = new int?(0);
	}

	// Token: 0x06000E84 RID: 3716 RVA: 0x000818EA File Offset: 0x0007FCEA
	public void GetStat(StatName name, out float? data)
	{
		data = new float?(0f);
	}

	// Token: 0x06000E85 RID: 3717 RVA: 0x000818FC File Offset: 0x0007FCFC
	public void IndicateProgress(AchievementName name, uint currentProgress, uint maxProgress)
	{
	}

	// Token: 0x06000E86 RID: 3718 RVA: 0x000818FE File Offset: 0x0007FCFE
	public void StoreStats()
	{
	}

	// Token: 0x06000E87 RID: 3719 RVA: 0x00081900 File Offset: 0x0007FD00
	public void ResetStats()
	{
	}

	// Token: 0x06000E88 RID: 3720 RVA: 0x00081902 File Offset: 0x0007FD02
	public void ResetStatsAndAchievements()
	{
	}

	// Token: 0x06000E89 RID: 3721 RVA: 0x00081904 File Offset: 0x0007FD04
	public bool IsConnected()
	{
		return GameJoltAPI.Instance.CurrentUser != null;
	}

	// Token: 0x04001095 RID: 4245
	private User m_User;

	// Token: 0x04001096 RID: 4246
	private List<AchievementIDMapping> m_IDMapping;

	// Token: 0x04001097 RID: 4247
	private bool m_IsInitialized;
}
