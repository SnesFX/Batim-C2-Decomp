using System;
using TMG.Core;

// Token: 0x020002BD RID: 701
public class SpriteLookupDataVO : TMGAbstractDisposable
{
	// Token: 0x06001011 RID: 4113 RVA: 0x000865B4 File Offset: 0x000849B4
	public SpriteLookupDataVO(string lookup, string sprite)
	{
		this.Lookup = lookup;
		this.Sprite = sprite;
	}

	// Token: 0x06001012 RID: 4114 RVA: 0x000865CA File Offset: 0x000849CA
	public static SpriteLookupDataVO Create(string lookup, string sprite)
	{
		return new SpriteLookupDataVO(lookup, sprite);
	}

	// Token: 0x06001013 RID: 4115 RVA: 0x000865D3 File Offset: 0x000849D3
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400122E RID: 4654
	public string Lookup;

	// Token: 0x0400122F RID: 4655
	public string Sprite;
}
