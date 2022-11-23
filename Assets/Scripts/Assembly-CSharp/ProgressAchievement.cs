using System;

// Token: 0x0200028C RID: 652
public class ProgressAchievement : Achievement
{
	// Token: 0x06000EAD RID: 3757 RVA: 0x000819EF File Offset: 0x0007FDEF
	public ProgressAchievement(int id, AchievementName name, string displayName, StatRequirement statRequirement) : base(id, name, displayName)
	{
		this.StatRequirement = statRequirement;
	}

	// Token: 0x06000EAE RID: 3758 RVA: 0x00081A02 File Offset: 0x0007FE02
	public ProgressAchievement()
	{
	}

	// Token: 0x1700028E RID: 654
	// (get) Token: 0x06000EAF RID: 3759 RVA: 0x00081A0A File Offset: 0x0007FE0A
	// (set) Token: 0x06000EB0 RID: 3760 RVA: 0x00081A12 File Offset: 0x0007FE12
	public StatRequirement StatRequirement { get; private set; }
}
