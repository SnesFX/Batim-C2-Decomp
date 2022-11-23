using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002B4 RID: 692
public class AudioLogDataVO : TMGAbstractDisposable
{
	// Token: 0x06000FF4 RID: 4084 RVA: 0x000863A8 File Offset: 0x000847A8
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04001217 RID: 4631
	public string Name;

	// Token: 0x04001218 RID: 4632
	public string Log;

	// Token: 0x04001219 RID: 4633
	public Vector3 LogWorldPosition;
}
