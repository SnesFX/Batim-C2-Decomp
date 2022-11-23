using System;

namespace TMG.Core
{
	// Token: 0x020002A9 RID: 681
	public abstract class TMGAbstractDisposable : IDisposable
	{
		// Token: 0x170002AE RID: 686
		// (get) Token: 0x06000FD4 RID: 4052 RVA: 0x00082428 File Offset: 0x00080828
		// (set) Token: 0x06000FD5 RID: 4053 RVA: 0x00082430 File Offset: 0x00080830
		public bool IsDisposed { get; private set; }

		// Token: 0x06000FD6 RID: 4054 RVA: 0x00082439 File Offset: 0x00080839
		public void Dispose()
		{
			if (this.IsDisposed)
			{
				return;
			}
			this.OnDisposed();
			this.IsDisposed = true;
			GC.SuppressFinalize(this);
		}

		// Token: 0x06000FD7 RID: 4055 RVA: 0x0008245A File Offset: 0x0008085A
		protected virtual void OnDisposed()
		{
		}
	}
}
