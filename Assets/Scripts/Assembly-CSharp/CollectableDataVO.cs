using System;
using TMG.Core;

// Token: 0x020002B6 RID: 694
public class CollectableDataVO : TMGAbstractDisposable
{
	// Token: 0x06000FF8 RID: 4088 RVA: 0x000863E9 File Offset: 0x000847E9
	public CollectableDataVO(string audioClip, string lookup, string sprite)
	{
		this.AudioClip = audioClip;
		this.SpriteLookup = SpriteLookupDataVO.Create(lookup, sprite);
	}

	// Token: 0x06000FF9 RID: 4089 RVA: 0x00086405 File Offset: 0x00084805
	public static CollectableDataVO Create(string audioClip, string lookup, string sprite)
	{
		return new CollectableDataVO(audioClip, lookup, sprite);
	}

	// Token: 0x06000FFA RID: 4090 RVA: 0x0008640F File Offset: 0x0008480F
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400121D RID: 4637
	public string AudioClip;

	// Token: 0x0400121E RID: 4638
	public SpriteLookupDataVO SpriteLookup;
}
