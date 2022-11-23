using System;

// Token: 0x02000282 RID: 642
public class Achievement
{
	// Token: 0x06000E4A RID: 3658 RVA: 0x0008099C File Offset: 0x0007ED9C
	public Achievement(int id, AchievementName name, string displayName)
	{
		this.ID = id;
		this.AchievementName = name;
		this.DisplayName = displayName;
	}

	// Token: 0x06000E4B RID: 3659 RVA: 0x000809B9 File Offset: 0x0007EDB9
	public Achievement()
	{
	}

	// Token: 0x17000289 RID: 649
	// (get) Token: 0x06000E4C RID: 3660 RVA: 0x000809C1 File Offset: 0x0007EDC1
	// (set) Token: 0x06000E4D RID: 3661 RVA: 0x000809C9 File Offset: 0x0007EDC9
	public AchievementName AchievementName { get; private set; }

	// Token: 0x1700028A RID: 650
	// (get) Token: 0x06000E4E RID: 3662 RVA: 0x000809D2 File Offset: 0x0007EDD2
	// (set) Token: 0x06000E4F RID: 3663 RVA: 0x000809DA File Offset: 0x0007EDDA
	public string DisplayName { get; private set; }

	// Token: 0x04001073 RID: 4211
	public int ID;
}
