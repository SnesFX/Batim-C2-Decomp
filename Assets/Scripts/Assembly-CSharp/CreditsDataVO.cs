using System;
using TMG.Core;

// Token: 0x020002B7 RID: 695
public class CreditsDataVO : TMGAbstractDisposable
{
	// Token: 0x06000FFB RID: 4091 RVA: 0x00086417 File Offset: 0x00084817
	public CreditsDataVO(bool isChapterTwo)
	{
		this.IsChapterTwo = isChapterTwo;
	}

	// Token: 0x06000FFC RID: 4092 RVA: 0x00086426 File Offset: 0x00084826
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400121F RID: 4639
	public bool IsChapterTwo;
}
