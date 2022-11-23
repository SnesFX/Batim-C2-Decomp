using System;

namespace TMPro
{
	// Token: 0x0200059B RID: 1435
	internal interface ITweenValue
	{
		// Token: 0x060028E3 RID: 10467
		void TweenValue(float floatPercentage);

		// Token: 0x1700041A RID: 1050
		// (get) Token: 0x060028E4 RID: 10468
		bool ignoreTimeScale { get; }

		// Token: 0x1700041B RID: 1051
		// (get) Token: 0x060028E5 RID: 10469
		float duration { get; }

		// Token: 0x060028E6 RID: 10470
		bool ValidTarget();
	}
}
