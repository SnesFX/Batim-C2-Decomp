using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using UnityEngine;

// Token: 0x02000286 RID: 646
public class AchievementsController : MonoBehaviour
{
	// Token: 0x1700028C RID: 652
	// (get) Token: 0x06000E54 RID: 3668 RVA: 0x00080A16 File Offset: 0x0007EE16
	public static Dictionary<AchievementName, string> AchievementNames
	{
		get
		{
			return AchievementsController._AchievementNames;
		}
	}

	// Token: 0x1700028D RID: 653
	// (get) Token: 0x06000E55 RID: 3669 RVA: 0x00080A1D File Offset: 0x0007EE1D
	public static ReadOnlyCollection<StatAchievement> Stats
	{
		get
		{
			return AchievementsController._StatAchievements.AsReadOnly();
		}
	}

	// Token: 0x06000E56 RID: 3670 RVA: 0x00080A2C File Offset: 0x0007EE2C
	public static void Initialize()
	{
		AchievementIDMapping[] mapping = new AchievementIDMapping[0];
		AchievementsController._CurrentAchievementsController = new SteamAchievements();
		if (AchievementsController._CurrentAchievementsController != null)
		{
			AchievementsController._CurrentAchievementsController.Initialize(mapping);
		}
		AchievementsController.InitializeStatAchievements();
		AchievementsController.InitializeAchievementNames();
	}

	// Token: 0x06000E57 RID: 3671 RVA: 0x00080A69 File Offset: 0x0007EE69
	private void Awake()
	{
		AchievementsController.achievementMappers = base.gameObject.GetComponentsInChildren<AchievementMapper>();
	}

	// Token: 0x06000E58 RID: 3672 RVA: 0x00080A7B File Offset: 0x0007EE7B
	private void Start()
	{
	}

	// Token: 0x06000E59 RID: 3673 RVA: 0x00080A7D File Offset: 0x0007EE7D
	private static void InitializeAchievementNames()
	{
		AchievementsController._AchievementNames = new Dictionary<AchievementName, string>();
		AchievementsController.Achievements = new List<Achievement>();
	}

	// Token: 0x06000E5A RID: 3674 RVA: 0x00080A94 File Offset: 0x0007EE94
	public static void CheckAchievementsAgainstStatRequirements(StatName statUpdated)
	{
		StatAchievement statAchievementByStatName = AchievementsController.GetStatAchievementByStatName(statUpdated);
		foreach (ProgressAchievement progressAchievement in AchievementsController.Achievements.OfType<ProgressAchievement>())
		{
			if (progressAchievement.StatRequirement.Stat == statAchievementByStatName && statAchievementByStatName.CurrentValue >= progressAchievement.StatRequirement.MinimumRequirement)
			{
				Debug.Log("*AchievementController* Awarding achievement " + progressAchievement.DisplayName);
				AchievementsController._CurrentAchievementsController.SetAchievement(progressAchievement.AchievementName);
			}
		}
		AchievementsController.DebugOutAllStatProgress();
	}

	// Token: 0x06000E5B RID: 3675 RVA: 0x00080B60 File Offset: 0x0007EF60
	private static void DebugOutAllStatProgress()
	{
		foreach (ProgressAchievement progressAchievement in AchievementsController.Achievements.OfType<ProgressAchievement>())
		{
			StatAchievement statAchievementByStatName = AchievementsController.GetStatAchievementByStatName(progressAchievement.StatRequirement.Stat.StatKey);
			Debug.Log(string.Concat(new object[]
			{
				"*AchievementController* Checking achievement ",
				progressAchievement.DisplayName,
				" with stat requirement ",
				progressAchievement.StatRequirement.Stat.StatKey.ToString(),
				" and minimum req ",
				progressAchievement.StatRequirement.MinimumRequirement.ToString(),
				" current amount is ",
				statAchievementByStatName.CurrentValue
			}));
		}
	}

	// Token: 0x06000E5C RID: 3676 RVA: 0x00080C54 File Offset: 0x0007F054
	private static StatAchievement GetStatAchievementByStatName(StatName statName)
	{
		return AchievementsController._StatAchievements.Find((StatAchievement statAchievement) => statAchievement.StatKey == statName);
	}

	// Token: 0x06000E5D RID: 3677 RVA: 0x00080C84 File Offset: 0x0007F084
	private static void InitializeStatAchievements()
	{
		Debug.Log("Initializing stat achievements.");
		AchievementsController._StatAchievements = new List<StatAchievement>();
		foreach (StatAchievement statAchievement in AchievementsController._StatAchievements)
		{
		}
	}

	// Token: 0x06000E5E RID: 3678 RVA: 0x00080CEC File Offset: 0x0007F0EC
	public static bool GetAchievement(AchievementName key)
	{
		return AchievementsController.CanUseAchievements() && AchievementsController._CurrentAchievementsController.GetAchievement(key);
	}

	// Token: 0x06000E5F RID: 3679 RVA: 0x00080D05 File Offset: 0x0007F105
	public static void SetAchievement(AchievementName key)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		AchievementsController._CurrentAchievementsController.SetAchievement(key);
		AchievementsController._CurrentAchievementsController.StoreStats();
	}

	// Token: 0x06000E60 RID: 3680 RVA: 0x00080D27 File Offset: 0x0007F127
	public static void ClearAchievement(AchievementName key)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		AchievementsController._CurrentAchievementsController.ClearAchievement(key);
	}

	// Token: 0x06000E61 RID: 3681 RVA: 0x00080D40 File Offset: 0x0007F140
	public static void GetStat(StatName name, out int? data)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			data = null;
			return;
		}
		AchievementsController._CurrentAchievementsController.GetStat(name, out data);
	}

	// Token: 0x06000E62 RID: 3682 RVA: 0x00080D74 File Offset: 0x0007F174
	public static void GetStat(StatName name, out float? data)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			data = null;
			return;
		}
		AchievementsController._CurrentAchievementsController.GetStat(name, out data);
	}

	// Token: 0x06000E63 RID: 3683 RVA: 0x00080DA8 File Offset: 0x0007F1A8
	public static void SetStat(StatName name, int data)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			Debug.Log("AchievementController - cannot set achievement");
			return;
		}
		StatAchievement statAchievementByStatName = AchievementsController.GetStatAchievementByStatName(name);
		if (statAchievementByStatName != null)
		{
			Debug.Log(string.Concat(new object[]
			{
				"Got stat ",
				name,
				", now setting it to ",
				data
			}));
			statAchievementByStatName.CurrentValue = new int?(data);
		}
		AchievementsController._CurrentAchievementsController.SetStat(name, data);
	}

	// Token: 0x06000E64 RID: 3684 RVA: 0x00080E21 File Offset: 0x0007F221
	public static void SetStat(StatName name, float data)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		AchievementsController._CurrentAchievementsController.SetStat(name, data);
	}

	// Token: 0x06000E65 RID: 3685 RVA: 0x00080E3C File Offset: 0x0007F23C
	public static void IncrementStatAchievement(StatName name)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		Debug.Log("*Can save stat " + name + ". Now trying to find it in collection and increment.*");
		StatAchievement statAchievement = AchievementsController._StatAchievements.Find((StatAchievement achievement) => achievement.StatKey == name);
		statAchievement.IncrementStat();
	}

	// Token: 0x06000E66 RID: 3686 RVA: 0x00080EA0 File Offset: 0x0007F2A0
	public static void IncrementStatByValue(StatName name, int incrementAmount)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		StatAchievement statAchievement = AchievementsController._StatAchievements.Find((StatAchievement achievement) => achievement.StatKey == name);
		statAchievement.IncrementStatByValue(incrementAmount);
	}

	// Token: 0x06000E67 RID: 3687 RVA: 0x00080EE4 File Offset: 0x0007F2E4
	public static void SaveStatAchievement(StatName name)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		StatAchievement statAchievement = AchievementsController._StatAchievements.Find((StatAchievement achievement) => achievement.StatKey == name);
		statAchievement.SaveStat();
	}

	// Token: 0x06000E68 RID: 3688 RVA: 0x00080F26 File Offset: 0x0007F326
	public static void IndicateProgress(AchievementName name, uint currentProgress, uint maxProgress)
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		AchievementsController._CurrentAchievementsController.IndicateProgress(name, currentProgress, maxProgress);
	}

	// Token: 0x06000E69 RID: 3689 RVA: 0x00080F40 File Offset: 0x0007F340
	public static void StoreStats()
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		AchievementsController._CurrentAchievementsController.StoreStats();
	}

	// Token: 0x06000E6A RID: 3690 RVA: 0x00080F57 File Offset: 0x0007F357
	public static void ResetStats()
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		AchievementsController._CurrentAchievementsController.ResetStats();
		AchievementsController._CurrentAchievementsController.StoreStats();
	}

	// Token: 0x06000E6B RID: 3691 RVA: 0x00080F78 File Offset: 0x0007F378
	public static void ResetStatsAndAchievements()
	{
		if (!AchievementsController.CanUseAchievements())
		{
			return;
		}
		AchievementsController._CurrentAchievementsController.ResetStatsAndAchievements();
		AchievementsController._CurrentAchievementsController.StoreStats();
	}

	// Token: 0x06000E6C RID: 3692 RVA: 0x00080F99 File Offset: 0x0007F399
	public static void SetAchievementUser(int id)
	{
		AchievementsController._CurrentAchievementsController.SetAchievementUser(id);
	}

	// Token: 0x06000E6D RID: 3693 RVA: 0x00080FA6 File Offset: 0x0007F3A6
	private static bool CanUseAchievements()
	{
		return false;
	}

	// Token: 0x04001085 RID: 4229
	private static IAchievements _CurrentAchievementsController;

	// Token: 0x04001086 RID: 4230
	private static List<Achievement> Achievements;

	// Token: 0x04001087 RID: 4231
	private static Dictionary<AchievementName, string> _AchievementNames;

	// Token: 0x04001088 RID: 4232
	private static List<StatAchievement> _StatAchievements;

	// Token: 0x04001089 RID: 4233
	private static AchievementMapper[] achievementMappers;
}
