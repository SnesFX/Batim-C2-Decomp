using System;
using TMG.Core;

// Token: 0x020002BB RID: 699
public class MenuItemButtonDataVO : TMGAbstractDisposable
{
	// Token: 0x170002B7 RID: 695
	// (get) Token: 0x06001007 RID: 4103 RVA: 0x0008650C File Offset: 0x0008490C
	// (set) Token: 0x06001008 RID: 4104 RVA: 0x00086514 File Offset: 0x00084914
	public string Label { get; private set; }

	// Token: 0x170002B8 RID: 696
	// (get) Token: 0x06001009 RID: 4105 RVA: 0x0008651D File Offset: 0x0008491D
	// (set) Token: 0x0600100A RID: 4106 RVA: 0x00086525 File Offset: 0x00084925
	public Action Callback { get; private set; }

	// Token: 0x0600100B RID: 4107 RVA: 0x00086530 File Offset: 0x00084930
	public static MenuItemButtonDataVO Create(string label, Action callback)
	{
		return new MenuItemButtonDataVO
		{
			Label = label,
			Callback = callback
		};
	}

	// Token: 0x0600100C RID: 4108 RVA: 0x00086552 File Offset: 0x00084952
	public void UpdateLabel(string label)
	{
		this.Label = label;
	}

	// Token: 0x0600100D RID: 4109 RVA: 0x0008655B File Offset: 0x0008495B
	public void UpdateCallback(Action callback)
	{
		this.Callback = callback;
	}

	// Token: 0x0600100E RID: 4110 RVA: 0x00086564 File Offset: 0x00084964
	protected override void OnDisposed()
	{
		this.Callback = null;
		base.OnDisposed();
	}
}
