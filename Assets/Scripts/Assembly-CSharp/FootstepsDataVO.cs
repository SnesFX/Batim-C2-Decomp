using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002B9 RID: 697
public class FootstepsDataVO : TMGAbstractDisposable
{
	// Token: 0x06001002 RID: 4098 RVA: 0x000864BC File Offset: 0x000848BC
	public static FootstepsDataVO Create(FootstepTypes type, AudioClip[] clips)
	{
		return new FootstepsDataVO
		{
			Type = type,
			Clips = clips
		};
	}

	// Token: 0x06001003 RID: 4099 RVA: 0x000864DE File Offset: 0x000848DE
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04001223 RID: 4643
	public FootstepTypes Type;

	// Token: 0x04001224 RID: 4644
	public AudioClip[] Clips;
}
