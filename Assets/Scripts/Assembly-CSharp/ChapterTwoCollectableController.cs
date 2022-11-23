using System;
using UnityEngine;

// Token: 0x0200026E RID: 622
public class ChapterTwoCollectableController : BaseController
{
	// Token: 0x06000D5A RID: 3418 RVA: 0x0007AE2C File Offset: 0x0007922C
	public override void Init()
	{
		base.Init();
		this.m_ChapterManager = GameManager.Instance.ChapterTwo;
		this.m_Keys.SetActive(false);
	}

	// Token: 0x06000D5B RID: 3419 RVA: 0x0007AE50 File Offset: 0x00079250
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_ClosetDoor.Lock();
	}

	// Token: 0x06000D5C RID: 3420 RVA: 0x0007AE63 File Offset: 0x00079263
	public void Activate()
	{
		this.m_Keys.Activate(this.m_ChapterManager);
		this.m_Keys.SetActive(true);
		this.m_Keys.OnInteracted += this.HandleKeysOnCollected;
	}

	// Token: 0x06000D5D RID: 3421 RVA: 0x0007AE9C File Offset: 0x0007929C
	private void HandleKeysOnCollected(object sender, EventArgs e)
	{
		this.m_Keys.OnInteracted -= this.HandleKeysOnCollected;
		GameManager.Instance.ShowCollectable(CollectableDataVO.Create("Audio/SFX/SFX_Keys_Pickup_01", "UI/ChapterOneCollectables/ChapterOneCollectables", "collectable_keys"));
		this.m_ClosetDoor.Unlock();
		base.SendOnComplete();
	}

	// Token: 0x06000D5E RID: 3422 RVA: 0x0007AEEF File Offset: 0x000792EF
	protected override void OnDisposed()
	{
		if (this.m_Keys != null)
		{
			this.m_Keys.OnInteracted -= this.HandleKeysOnCollected;
		}
		base.OnDisposed();
	}

	// Token: 0x04000F7D RID: 3965
	[Header("Collectables")]
	[SerializeField]
	private ChapterCollectable m_Keys;

	// Token: 0x04000F7E RID: 3966
	[Header("Door")]
	[SerializeField]
	private DoorController m_ClosetDoor;

	// Token: 0x04000F7F RID: 3967
	private ChapterManager m_ChapterManager;

	// Token: 0x04000F80 RID: 3968
	private bool m_HasKeyObjective;
}
