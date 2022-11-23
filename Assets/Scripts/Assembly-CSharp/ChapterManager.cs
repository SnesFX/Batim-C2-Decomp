using System;
using TMG.Core;

// Token: 0x020002D9 RID: 729
public class ChapterManager : TMGAbstractDisposable
{
	// Token: 0x060010D0 RID: 4304 RVA: 0x00088F5E File Offset: 0x0008735E
	public ChapterManager(Chapters chapter)
	{
		this.Chapter = chapter;
	}

	// Token: 0x1400001E RID: 30
	// (add) Token: 0x060010D1 RID: 4305 RVA: 0x00088F70 File Offset: 0x00087370
	// (remove) Token: 0x060010D2 RID: 4306 RVA: 0x00088FA8 File Offset: 0x000873A8
	public event EventHandler OnComplete;

	// Token: 0x1400001F RID: 31
	// (add) Token: 0x060010D3 RID: 4307 RVA: 0x00088FE0 File Offset: 0x000873E0
	// (remove) Token: 0x060010D4 RID: 4308 RVA: 0x00089018 File Offset: 0x00087418
	public event EventHandler OnCollectablesComplete;

	// Token: 0x170002C9 RID: 713
	// (get) Token: 0x060010D5 RID: 4309 RVA: 0x0008904E File Offset: 0x0008744E
	// (set) Token: 0x060010D6 RID: 4310 RVA: 0x00089056 File Offset: 0x00087456
	public Chapters Chapter { get; private set; }

	// Token: 0x170002CA RID: 714
	// (get) Token: 0x060010D7 RID: 4311 RVA: 0x0008905F File Offset: 0x0008745F
	// (set) Token: 0x060010D8 RID: 4312 RVA: 0x00089067 File Offset: 0x00087467
	public int Collected { get; private set; }

	// Token: 0x170002CB RID: 715
	// (get) Token: 0x060010D9 RID: 4313 RVA: 0x00089070 File Offset: 0x00087470
	// (set) Token: 0x060010DA RID: 4314 RVA: 0x00089078 File Offset: 0x00087478
	public int MaxCollectables { get; private set; }

	// Token: 0x170002CC RID: 716
	// (get) Token: 0x060010DB RID: 4315 RVA: 0x00089081 File Offset: 0x00087481
	// (set) Token: 0x060010DC RID: 4316 RVA: 0x00089089 File Offset: 0x00087489
	public bool isComplete { get; private set; }

	// Token: 0x060010DD RID: 4317 RVA: 0x00089094 File Offset: 0x00087494
	public void Collect()
	{
		if (this.Collected >= this.MaxCollectables)
		{
			return;
		}
		if (this.Collected < this.MaxCollectables)
		{
			this.Collected++;
			if (this.Collected >= this.MaxCollectables && this.OnCollectablesComplete != null)
			{
				this.OnCollectablesComplete(this, EventArgs.Empty);
			}
		}
	}

	// Token: 0x060010DE RID: 4318 RVA: 0x000890FF File Offset: 0x000874FF
	public void AddCollectables(int maxCollecables)
	{
		this.MaxCollectables = maxCollecables;
	}

	// Token: 0x060010DF RID: 4319 RVA: 0x00089108 File Offset: 0x00087508
	public void Reset()
	{
		this.Collected = 0;
	}

	// Token: 0x060010E0 RID: 4320 RVA: 0x00089111 File Offset: 0x00087511
	protected override void OnDisposed()
	{
		this.OnComplete = null;
		this.OnCollectablesComplete = null;
		this.Reset();
		base.OnDisposed();
	}
}
