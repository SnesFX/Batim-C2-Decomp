using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002A1 RID: 673
public class InkedFloor : TMGMonoBehaviour
{
	// Token: 0x06000F9D RID: 3997 RVA: 0x000852B4 File Offset: 0x000836B4
	public override void Init()
	{
		base.Init();
		this.m_InkFloor.SetActive(false);
	}

	// Token: 0x06000F9E RID: 3998 RVA: 0x000852C8 File Offset: 0x000836C8
	public void ShowInk()
	{
		this.m_InkFloor.SetActive(true);
	}

	// Token: 0x06000F9F RID: 3999 RVA: 0x000852D6 File Offset: 0x000836D6
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400114E RID: 4430
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_InkFloor;
}
