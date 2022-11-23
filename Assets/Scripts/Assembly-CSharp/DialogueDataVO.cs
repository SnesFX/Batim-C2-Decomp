using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002B8 RID: 696
public class DialogueDataVO : TMGAbstractDisposable
{
	// Token: 0x06000FFE RID: 4094 RVA: 0x00086438 File Offset: 0x00084838
	public static DialogueDataVO Create(string dialogue, string subtitles, bool isTrimmed = false)
	{
		SubtitleDataVO subtitles2 = SubtitleDataVO.Create(subtitles, 0f, isTrimmed);
		return new DialogueDataVO
		{
			Dialogue = dialogue,
			Subtitles = subtitles2
		};
	}

	// Token: 0x06000FFF RID: 4095 RVA: 0x00086468 File Offset: 0x00084868
	public static DialogueDataVO Create(AudioClip dialogue, string subtitles, bool isTrimmed = false)
	{
		SubtitleDataVO subtitles2 = SubtitleDataVO.Create(subtitles, 0f, isTrimmed);
		return new DialogueDataVO
		{
			DialogueClip = dialogue,
			Subtitles = subtitles2
		};
	}

	// Token: 0x06001000 RID: 4096 RVA: 0x00086497 File Offset: 0x00084897
	protected override void OnDisposed()
	{
		this.Subtitles.Dispose();
		this.Subtitles = null;
		base.OnDisposed();
	}

	// Token: 0x04001220 RID: 4640
	public string Dialogue;

	// Token: 0x04001221 RID: 4641
	public AudioClip DialogueClip;

	// Token: 0x04001222 RID: 4642
	public SubtitleDataVO Subtitles;
}
