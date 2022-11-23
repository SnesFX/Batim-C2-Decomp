using System;

// Token: 0x0200028E RID: 654
public class StatRequirement
{
	// Token: 0x06000EB8 RID: 3768 RVA: 0x00081B29 File Offset: 0x0007FF29
	public StatRequirement(StatAchievement stat, int minimumRequirement)
	{
		this.stat = stat;
		this.minimumRequirement = minimumRequirement;
	}

	// Token: 0x06000EB9 RID: 3769 RVA: 0x00081B3F File Offset: 0x0007FF3F
	public StatRequirement()
	{
	}

	// Token: 0x17000291 RID: 657
	// (get) Token: 0x06000EBA RID: 3770 RVA: 0x00081B47 File Offset: 0x0007FF47
	// (set) Token: 0x06000EBB RID: 3771 RVA: 0x00081B4F File Offset: 0x0007FF4F
	public StatAchievement Stat
	{
		get
		{
			return this.stat;
		}
		set
		{
			this.stat = value;
		}
	}

	// Token: 0x17000292 RID: 658
	// (get) Token: 0x06000EBC RID: 3772 RVA: 0x00081B58 File Offset: 0x0007FF58
	// (set) Token: 0x06000EBD RID: 3773 RVA: 0x00081B60 File Offset: 0x0007FF60
	public int MinimumRequirement
	{
		get
		{
			return this.minimumRequirement;
		}
		set
		{
			this.minimumRequirement = value;
		}
	}

	// Token: 0x040010A1 RID: 4257
	private StatAchievement stat;

	// Token: 0x040010A2 RID: 4258
	private int minimumRequirement;
}
