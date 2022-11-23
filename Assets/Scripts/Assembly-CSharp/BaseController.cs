using System;
using TMG.Core;

// Token: 0x0200029E RID: 670
public abstract class BaseController : TMGMonoBehaviour
{
	// Token: 0x14000018 RID: 24
	// (add) Token: 0x06000F89 RID: 3977 RVA: 0x00076510 File Offset: 0x00074910
	// (remove) Token: 0x06000F8A RID: 3978 RVA: 0x00076548 File Offset: 0x00074948
	public event EventHandler OnComplete;

	// Token: 0x06000F8B RID: 3979 RVA: 0x0007657E File Offset: 0x0007497E
	protected void SendOnComplete()
	{
		this.OnComplete.Send(this);
	}

	// Token: 0x06000F8C RID: 3980 RVA: 0x0007658C File Offset: 0x0007498C
	protected override void OnDisposed()
	{
		this.OnComplete = null;
		base.OnDisposed();
	}
}
