using System;

// Token: 0x0200028D RID: 653
public class StatAchievement
{
	// Token: 0x06000EB1 RID: 3761 RVA: 0x00081A1B File Offset: 0x0007FE1B
	public StatAchievement(StatName statName)
	{
		this._StatName = statName;
		AchievementsController.GetStat(this._StatName, out this._CurrentValue);
	}

	// Token: 0x1700028F RID: 655
	// (get) Token: 0x06000EB2 RID: 3762 RVA: 0x00081A3B File Offset: 0x0007FE3B
	// (set) Token: 0x06000EB3 RID: 3763 RVA: 0x00081A43 File Offset: 0x0007FE43
	public int? CurrentValue
	{
		get
		{
			return this._CurrentValue;
		}
		set
		{
			this._CurrentValue = value;
		}
	}

	// Token: 0x17000290 RID: 656
	// (get) Token: 0x06000EB4 RID: 3764 RVA: 0x00081A4C File Offset: 0x0007FE4C
	public StatName StatKey
	{
		get
		{
			return this._StatName;
		}
	}

	// Token: 0x06000EB5 RID: 3765 RVA: 0x00081A54 File Offset: 0x0007FE54
	public void IncrementStat()
	{
		int? currentValue = this._CurrentValue;
		this._CurrentValue = ((currentValue == null) ? null : new int?(currentValue.GetValueOrDefault() + 1));
		this.SaveStat();
	}

	// Token: 0x06000EB6 RID: 3766 RVA: 0x00081A9C File Offset: 0x0007FE9C
	public void IncrementStatByValue(int incrementAmount)
	{
		int? currentValue = this._CurrentValue;
		this._CurrentValue = ((currentValue == null) ? null : new int?(currentValue.GetValueOrDefault() + incrementAmount));
		this.SaveStat();
	}

	// Token: 0x06000EB7 RID: 3767 RVA: 0x00081AE4 File Offset: 0x0007FEE4
	public void SaveStat()
	{
		int? currentValue = this._CurrentValue;
		if (currentValue == null)
		{
			this._CurrentValue = new int?(0);
		}
		AchievementsController.SetStat(this._StatName, this._CurrentValue.Value);
	}

	// Token: 0x0400109F RID: 4255
	private StatName _StatName;

	// Token: 0x040010A0 RID: 4256
	private int? _CurrentValue;
}
