using System;
using System.Collections.Generic;
using System.Linq;
using TMG.Core;
using UnityEngine;

// Token: 0x020002D6 RID: 726
public class AchievementManager : TMGAbstractDisposable
{
	// Token: 0x0600108F RID: 4239 RVA: 0x00087AB0 File Offset: 0x00085EB0
	public void Init()
	{
		this.m_AchievementIDs = new AchievementIDMapping[0];
		this.m_AchievementController = new GameJoltAchievements();
		this.m_AchievementIDs = this.GetGameJoltTrophyIDs().ToArray();
		if (this.m_AchievementController != null)
		{
			this.m_AchievementController.Initialize(this.m_AchievementIDs);
			this.InitializeStatAchievements();
			this.InitializeAchievementNames();
		}
	}

	// Token: 0x06001090 RID: 4240 RVA: 0x00087B10 File Offset: 0x00085F10
	private void InitializeStatAchievements()
	{
		Debug.Log("Initializing stat achievements.");
		this.m_StatAchievements = new List<StatAchievement>
		{
			new StatAchievement(StatName.STRIKE_UP_THE_BAND),
			new StatAchievement(StatName.CANADIAN_BACON)
		};
		foreach (StatAchievement statAchievement in this.m_StatAchievements)
		{
		}
	}

	// Token: 0x06001091 RID: 4241 RVA: 0x00087B94 File Offset: 0x00085F94
	private void InitializeAchievementNames()
	{
		this.m_AchievementNames = new Dictionary<AchievementName, string>
		{
			{
				AchievementName.PICKING_UP_THE_PIECES,
				"Picking Up The Pieces"
			},
			{
				AchievementName.HELLO_BENDY,
				"Hello Bendy"
			},
			{
				AchievementName.CROONER_TUNER,
				"Crooner Tuner"
			},
			{
				AchievementName.THE_CREATOR,
				"The Creator"
			},
			{
				AchievementName.MY_FAVORITE_SONG,
				"My Favorite Song"
			},
			{
				AchievementName.STRIKE_UP_THE_BAND,
				"Strike Up The Band"
			},
			{
				AchievementName.COAST_TO_COAST,
				"Coast To Coast"
			},
			{
				AchievementName.CANADIAN_BACON,
				"Canadian Bacon"
			},
			{
				AchievementName.THE_BELIEVER,
				"The Believer"
			},
			{
				AchievementName.MAN_BEHIND_THE_CURTAIN,
				"Man Behind The Curtain"
			},
			{
				AchievementName.JOHNNYS_BROKEN_HEART,
				"Johnny's Broken Heart"
			}
		};
		this.m_Achievements = new List<Achievement>
		{
			new Achievement(this.m_AchievementIDs[0].AchievementID, AchievementName.PICKING_UP_THE_PIECES, "Picking Up The Pieces"),
			new Achievement(this.m_AchievementIDs[1].AchievementID, AchievementName.HELLO_BENDY, "Hello Bendy"),
			new Achievement(this.m_AchievementIDs[2].AchievementID, AchievementName.CROONER_TUNER, "Crooner Tuner"),
			new Achievement(this.m_AchievementIDs[3].AchievementID, AchievementName.THE_CREATOR, "The Creator"),
			new Achievement(this.m_AchievementIDs[4].AchievementID, AchievementName.MY_FAVORITE_SONG, "My Favorite Song"),
			new ProgressAchievement(this.m_AchievementIDs[5].AchievementID, AchievementName.STRIKE_UP_THE_BAND, "Strike Up The Band", new StatRequirement(this.GetStatAchievementByStatName(StatName.STRIKE_UP_THE_BAND), 10)),
			new Achievement(this.m_AchievementIDs[6].AchievementID, AchievementName.COAST_TO_COAST, "Coast To Coast"),
			new ProgressAchievement(this.m_AchievementIDs[7].AchievementID, AchievementName.CANADIAN_BACON, "Canadian Bacon", new StatRequirement(this.GetStatAchievementByStatName(StatName.CANADIAN_BACON), 25)),
			new Achievement(this.m_AchievementIDs[8].AchievementID, AchievementName.THE_BELIEVER, "The Believer"),
			new Achievement(this.m_AchievementIDs[9].AchievementID, AchievementName.MAN_BEHIND_THE_CURTAIN, "Man Behind The Curtain"),
			new Achievement(this.m_AchievementIDs[10].AchievementID, AchievementName.JOHNNYS_BROKEN_HEART, "Johnny's Broken Heart")
		};
	}

	// Token: 0x06001092 RID: 4242 RVA: 0x00087DAC File Offset: 0x000861AC
	public void CheckAchievementsAgainstStatRequirements(StatName statUpdated)
	{
		StatAchievement statAchievementByStatName = this.GetStatAchievementByStatName(statUpdated);
		foreach (ProgressAchievement progressAchievement in this.m_Achievements.OfType<ProgressAchievement>())
		{
			if (progressAchievement.StatRequirement.Stat == statAchievementByStatName && statAchievementByStatName.CurrentValue >= progressAchievement.StatRequirement.MinimumRequirement)
			{
				this.m_AchievementController.SetAchievement(progressAchievement.AchievementName);
			}
		}
		this.DebugOutAllStatProgress();
	}

	// Token: 0x06001093 RID: 4243 RVA: 0x00087E68 File Offset: 0x00086268
	private void DebugOutAllStatProgress()
	{
		foreach (ProgressAchievement progressAchievement in this.m_Achievements.OfType<ProgressAchievement>())
		{
			StatAchievement statAchievementByStatName = this.GetStatAchievementByStatName(progressAchievement.StatRequirement.Stat.StatKey);
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

	// Token: 0x06001094 RID: 4244 RVA: 0x00087F5C File Offset: 0x0008635C
	private StatAchievement GetStatAchievementByStatName(StatName statName)
	{
		return this.m_StatAchievements.Find((StatAchievement statAchievement) => statAchievement.StatKey == statName);
	}

	// Token: 0x06001095 RID: 4245 RVA: 0x00087F8D File Offset: 0x0008638D
	public bool GetAchievement(AchievementName key)
	{
		return this.CanUseAchievements() && this.m_AchievementController.GetAchievement(key);
	}

	// Token: 0x06001096 RID: 4246 RVA: 0x00087FA8 File Offset: 0x000863A8
	public void SetAchievement(AchievementName key)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		this.m_AchievementController.SetAchievement(key);
		this.m_AchievementController.StoreStats();
	}

	// Token: 0x06001097 RID: 4247 RVA: 0x00087FCD File Offset: 0x000863CD
	public void ClearAchievement(AchievementName key)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		this.m_AchievementController.ClearAchievement(key);
	}

	// Token: 0x06001098 RID: 4248 RVA: 0x00087FE8 File Offset: 0x000863E8
	public void GetStat(StatName name, out int? data)
	{
		if (!this.CanUseAchievements())
		{
			data = null;
			return;
		}
		this.m_AchievementController.GetStat(name, out data);
	}

	// Token: 0x06001099 RID: 4249 RVA: 0x00088020 File Offset: 0x00086420
	public void GetStat(StatName name, out float? data)
	{
		if (!this.CanUseAchievements())
		{
			data = null;
			return;
		}
		this.m_AchievementController.GetStat(name, out data);
	}

	// Token: 0x0600109A RID: 4250 RVA: 0x00088058 File Offset: 0x00086458
	public void SetStat(StatName name, int data)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		StatAchievement statAchievementByStatName = this.GetStatAchievementByStatName(name);
		if (statAchievementByStatName != null)
		{
			statAchievementByStatName.CurrentValue = new int?(data);
		}
		this.m_AchievementController.SetStat(name, data);
	}

	// Token: 0x0600109B RID: 4251 RVA: 0x00088098 File Offset: 0x00086498
	public void SetStat(StatName name, float data)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		this.m_AchievementController.SetStat(name, data);
	}

	// Token: 0x0600109C RID: 4252 RVA: 0x000880B4 File Offset: 0x000864B4
	public void IncrementStatAchievement(StatName name)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		StatAchievement statAchievement = this.m_StatAchievements.Find((StatAchievement achievement) => achievement.StatKey == name);
		statAchievement.IncrementStat();
	}

	// Token: 0x0600109D RID: 4253 RVA: 0x000880F8 File Offset: 0x000864F8
	public void IncrementStatByValue(StatName name, int incrementAmount)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		StatAchievement statAchievement = this.m_StatAchievements.Find((StatAchievement achievement) => achievement.StatKey == name);
		statAchievement.IncrementStatByValue(incrementAmount);
	}

	// Token: 0x0600109E RID: 4254 RVA: 0x00088140 File Offset: 0x00086540
	public void SaveStatAchievement(StatName name)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		StatAchievement statAchievement = this.m_StatAchievements.Find((StatAchievement achievement) => achievement.StatKey == name);
		statAchievement.SaveStat();
	}

	// Token: 0x0600109F RID: 4255 RVA: 0x00088184 File Offset: 0x00086584
	public void IndicateProgress(AchievementName name, uint currentProgress, uint maxProgress)
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		this.m_AchievementController.IndicateProgress(name, currentProgress, maxProgress);
	}

	// Token: 0x060010A0 RID: 4256 RVA: 0x000881A0 File Offset: 0x000865A0
	public void StoreStats()
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		this.m_AchievementController.StoreStats();
	}

	// Token: 0x060010A1 RID: 4257 RVA: 0x000881B9 File Offset: 0x000865B9
	public void ResetStats()
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		this.m_AchievementController.ResetStats();
		this.m_AchievementController.StoreStats();
	}

	// Token: 0x060010A2 RID: 4258 RVA: 0x000881DD File Offset: 0x000865DD
	public void ResetStatsAndAchievements()
	{
		if (!this.CanUseAchievements())
		{
			return;
		}
		this.m_AchievementController.ResetStatsAndAchievements();
		this.m_AchievementController.StoreStats();
	}

	// Token: 0x060010A3 RID: 4259 RVA: 0x00088201 File Offset: 0x00086601
	public void SetAchievementUser(int id)
	{
		this.m_AchievementController.SetAchievementUser(id);
	}

	// Token: 0x060010A4 RID: 4260 RVA: 0x0008820F File Offset: 0x0008660F
	private bool CanUseAchievements()
	{
		return this.m_AchievementController != null && this.m_AchievementController.IsConnected();
	}

	// Token: 0x060010A5 RID: 4261 RVA: 0x0008822C File Offset: 0x0008662C
	private List<AchievementIDMapping> GetGameJoltTrophyIDs()
	{
		return new List<AchievementIDMapping>
		{
			new AchievementIDMapping(76029, AchievementName.PICKING_UP_THE_PIECES),
			new AchievementIDMapping(76030, AchievementName.HELLO_BENDY),
			new AchievementIDMapping(76031, AchievementName.CROONER_TUNER),
			new AchievementIDMapping(76032, AchievementName.THE_CREATOR),
			new AchievementIDMapping(76034, AchievementName.MY_FAVORITE_SONG),
			new AchievementIDMapping(76035, AchievementName.STRIKE_UP_THE_BAND),
			new AchievementIDMapping(76036, AchievementName.COAST_TO_COAST),
			new AchievementIDMapping(76039, AchievementName.CANADIAN_BACON),
			new AchievementIDMapping(76038, AchievementName.THE_BELIEVER),
			new AchievementIDMapping(76033, AchievementName.MAN_BEHIND_THE_CURTAIN),
			new AchievementIDMapping(76037, AchievementName.JOHNNYS_BROKEN_HEART)
		};
	}

	// Token: 0x060010A6 RID: 4262 RVA: 0x00088300 File Offset: 0x00086700
	private List<AchievementIDMapping> GetPS4TrophyIDs()
	{
		return new List<AchievementIDMapping>
		{
			new AchievementIDMapping(-1, AchievementName.PICKING_UP_THE_PIECES),
			new AchievementIDMapping(-1, AchievementName.HELLO_BENDY),
			new AchievementIDMapping(-1, AchievementName.CROONER_TUNER),
			new AchievementIDMapping(-1, AchievementName.THE_CREATOR),
			new AchievementIDMapping(-1, AchievementName.MY_FAVORITE_SONG),
			new AchievementIDMapping(-1, AchievementName.STRIKE_UP_THE_BAND),
			new AchievementIDMapping(-1, AchievementName.COAST_TO_COAST),
			new AchievementIDMapping(-1, AchievementName.CANADIAN_BACON),
			new AchievementIDMapping(-1, AchievementName.THE_BELIEVER),
			new AchievementIDMapping(-1, AchievementName.MAN_BEHIND_THE_CURTAIN),
			new AchievementIDMapping(-1, AchievementName.JOHNNYS_BROKEN_HEART)
		};
	}

	// Token: 0x040012B0 RID: 4784
	private IAchievements m_AchievementController;

	// Token: 0x040012B1 RID: 4785
	private List<Achievement> m_Achievements;

	// Token: 0x040012B2 RID: 4786
	private Dictionary<AchievementName, string> m_AchievementNames;

	// Token: 0x040012B3 RID: 4787
	private List<StatAchievement> m_StatAchievements;

	// Token: 0x040012B4 RID: 4788
	private AchievementIDMapping[] m_AchievementIDs;
}
