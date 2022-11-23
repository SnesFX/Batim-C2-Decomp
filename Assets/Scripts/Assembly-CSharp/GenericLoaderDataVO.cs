using System;
using TMG.Core;

// Token: 0x020002BA RID: 698
public class GenericLoaderDataVO : TMGAbstractDisposable
{
	// Token: 0x06001004 RID: 4100 RVA: 0x000864E6 File Offset: 0x000848E6
	public GenericLoaderDataVO(string sceneName, bool hasControlTutorial)
	{
		this.SceneName = sceneName;
		this.HasControlTutorial = hasControlTutorial;
	}

	// Token: 0x06001005 RID: 4101 RVA: 0x000864FC File Offset: 0x000848FC
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04001225 RID: 4645
	public string SceneName;

	// Token: 0x04001226 RID: 4646
	public bool HasControlTutorial;
}
