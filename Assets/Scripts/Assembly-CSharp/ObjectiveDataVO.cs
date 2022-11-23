using System;
using TMG.Core;

// Token: 0x020002BC RID: 700
public class ObjectiveDataVO : TMGAbstractDisposable
{
	// Token: 0x06001010 RID: 4112 RVA: 0x0008657C File Offset: 0x0008497C
	public static ObjectiveDataVO Create(string header, string objective, string tip, float delay = 0f, bool isCurrentObjective = false)
	{
		return new ObjectiveDataVO
		{
			Header = header,
			Objective = objective,
			Tip = tip,
			Delay = delay,
			IsCurrentObjective = isCurrentObjective
		};
	}

	// Token: 0x04001229 RID: 4649
	public string Header;

	// Token: 0x0400122A RID: 4650
	public string Objective;

	// Token: 0x0400122B RID: 4651
	public string Tip;

	// Token: 0x0400122C RID: 4652
	public float Delay;

	// Token: 0x0400122D RID: 4653
	public bool IsCurrentObjective;
}
