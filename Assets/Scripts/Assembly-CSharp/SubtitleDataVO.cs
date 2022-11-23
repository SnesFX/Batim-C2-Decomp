using System;
using TMG.Core;

// Token: 0x020002BE RID: 702
public class SubtitleDataVO : TMGAbstractDisposable
{
	// Token: 0x06001015 RID: 4117 RVA: 0x000865E4 File Offset: 0x000849E4
	public static SubtitleDataVO Create(string subtitles, float duration, bool isTrimmed = false)
	{
		return new SubtitleDataVO
		{
			Subtitles = subtitles,
			Duration = duration,
			IsTrimmed = isTrimmed
		};
	}

	// Token: 0x04001230 RID: 4656
	public string Subtitles;

	// Token: 0x04001231 RID: 4657
	public float Duration;

	// Token: 0x04001232 RID: 4658
	public bool IsTrimmed;
}
