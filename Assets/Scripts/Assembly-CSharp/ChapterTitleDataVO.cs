using System;
using TMG.Core;

// Token: 0x020002B5 RID: 693
public class ChapterTitleDataVO : TMGAbstractDisposable
{
	// Token: 0x06000FF6 RID: 4086 RVA: 0x000863B8 File Offset: 0x000847B8
	public static ChapterTitleDataVO Create(string chapter, string title, bool showBlocker = true)
	{
		return new ChapterTitleDataVO
		{
			Chapter = chapter,
			Title = title,
			ShowBlocker = showBlocker
		};
	}

	// Token: 0x06000FF7 RID: 4087 RVA: 0x000863E1 File Offset: 0x000847E1
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400121A RID: 4634
	public string Chapter;

	// Token: 0x0400121B RID: 4635
	public string Title;

	// Token: 0x0400121C RID: 4636
	public bool ShowBlocker;
}
