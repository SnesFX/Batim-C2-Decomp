using System;

// Token: 0x02000283 RID: 643
[Serializable]
public class AchievementIDMapping
{
	// Token: 0x06000E50 RID: 3664 RVA: 0x000809E3 File Offset: 0x0007EDE3
	public AchievementIDMapping(int id, AchievementName name)
	{
		this.AchievementID = id;
		this.AchievementName = name;
	}

	// Token: 0x04001076 RID: 4214
	public AchievementName AchievementName;

	// Token: 0x04001077 RID: 4215
	public int AchievementID;
}
