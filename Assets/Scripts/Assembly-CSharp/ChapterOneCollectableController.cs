using System;
using UnityEngine;

// Token: 0x0200025D RID: 605
public class ChapterOneCollectableController : BaseController
{
	// Token: 0x06000C8D RID: 3213 RVA: 0x000765A3 File Offset: 0x000749A3
	public override void Init()
	{
		base.Init();
		this.m_MainLight.TurnOff();
		this.TurnOffAllLights();
	}

	// Token: 0x06000C8E RID: 3214 RVA: 0x000765BC File Offset: 0x000749BC
	public void Activate(ChapterManager chapterManager)
	{
		this.m_ChapterManager = chapterManager;
		this.m_CollectableGrear.Activate(this.m_ChapterManager);
		this.m_CollectableGrear.OnInteracted += this.HandleGearOnCollected;
		this.m_CollectableWrench.Activate(this.m_ChapterManager);
		this.m_CollectableWrench.OnInteracted += this.HandleWrenchOnCollected;
		this.m_CollectableBook.Activate(this.m_ChapterManager);
		this.m_CollectableBook.OnInteracted += this.HandleBookOnCollected;
		this.m_CollectableDoll.Activate(this.m_ChapterManager);
		this.m_CollectableDoll.OnInteracted += this.HandleDollOnCollected;
		this.m_CollectableRecord.Activate(this.m_ChapterManager);
		this.m_CollectableRecord.OnInteracted += this.HandleRecordOnCollected;
		this.m_CollectableInkwell.Activate(this.m_ChapterManager);
		this.m_CollectableInkwell.OnInteracted += this.HandleInkwellOnCollected;
	}

	// Token: 0x06000C8F RID: 3215 RVA: 0x000766C0 File Offset: 0x00074AC0
	private void HandleGearOnCollected(object sender, EventArgs e)
	{
		this.Collect("Audio/SFX/SFX_Gear_Pick_UP_Vanish_01", "UI/ChapterOneCollectables/ChapterOneCollectables", "collectable_gear", this.m_LightGear);
	}

	// Token: 0x06000C90 RID: 3216 RVA: 0x000766DD File Offset: 0x00074ADD
	private void HandleWrenchOnCollected(object sender, EventArgs e)
	{
		this.Collect("Audio/SFX/SFX_Wrench_Pick_UP_Vanish_01", "UI/ChapterOneCollectables/ChapterOneCollectables", "collectable_wrench", this.m_LightWrench);
	}

	// Token: 0x06000C91 RID: 3217 RVA: 0x000766FA File Offset: 0x00074AFA
	private void HandleBookOnCollected(object sender, EventArgs e)
	{
		this.Collect("Audio/SFX/SFX_Book_Pick_Up_Vanish_01", "UI/ChapterOneCollectables/ChapterOneCollectables", "collectable_book", this.m_LightBook);
	}

	// Token: 0x06000C92 RID: 3218 RVA: 0x00076717 File Offset: 0x00074B17
	private void HandleDollOnCollected(object sender, EventArgs e)
	{
		this.Collect("Audio/SFX/SFX_Toy_Pick_UP_Vanish_01", "UI/ChapterOneCollectables/ChapterOneCollectables", "collectable_doll", this.m_LightDoll);
	}

	// Token: 0x06000C93 RID: 3219 RVA: 0x00076734 File Offset: 0x00074B34
	private void HandleRecordOnCollected(object sender, EventArgs e)
	{
		this.Collect("Audio/SFX/SFX_Record_Pick_UP_Vanish_01", "UI/ChapterOneCollectables/ChapterOneCollectables", "collectable_record", this.m_LightRecord);
	}

	// Token: 0x06000C94 RID: 3220 RVA: 0x00076751 File Offset: 0x00074B51
	private void HandleInkwellOnCollected(object sender, EventArgs e)
	{
		this.Collect("Audio/SFX/SFX_Ink_Jar_Pick_UP_Vanish_01", "UI/ChapterOneCollectables/ChapterOneCollectables", "collectable_inkwell", this.m_LightInkwell);
	}

	// Token: 0x06000C95 RID: 3221 RVA: 0x0007676E File Offset: 0x00074B6E
	private void Collect(string audio, string lookup, string list, LightFixtureController light)
	{
		GameManager.Instance.ShowCollectable(CollectableDataVO.Create(audio, lookup, list));
		light.TurnOn();
	}

	// Token: 0x06000C96 RID: 3222 RVA: 0x0007678C File Offset: 0x00074B8C
	public void Complete()
	{
		this.m_MainLight.TurnOn();
		this.m_CollectableGrear.Dissolve();
		this.m_CollectableWrench.Dissolve();
		this.m_CollectableBook.Dissolve();
		this.m_CollectableDoll.Dissolve();
		this.m_CollectableRecord.Dissolve();
		this.m_CollectableInkwell.Dissolve();
		this.TurnOffAllLights();
		base.SendOnComplete();
	}

	// Token: 0x06000C97 RID: 3223 RVA: 0x000767F4 File Offset: 0x00074BF4
	private void TurnOffAllLights()
	{
		this.m_LightGear.TurnOff();
		this.m_LightWrench.TurnOff();
		this.m_LightBook.TurnOff();
		this.m_LightDoll.TurnOff();
		this.m_LightRecord.TurnOff();
		this.m_LightInkwell.TurnOff();
	}

	// Token: 0x06000C98 RID: 3224 RVA: 0x00076843 File Offset: 0x00074C43
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04000EA1 RID: 3745
	[Header("Collectables")]
	[SerializeField]
	private ChapterCollectable m_CollectableGrear;

	// Token: 0x04000EA2 RID: 3746
	[SerializeField]
	private ChapterCollectable m_CollectableWrench;

	// Token: 0x04000EA3 RID: 3747
	[SerializeField]
	private ChapterCollectable m_CollectableBook;

	// Token: 0x04000EA4 RID: 3748
	[SerializeField]
	private ChapterCollectable m_CollectableDoll;

	// Token: 0x04000EA5 RID: 3749
	[SerializeField]
	private ChapterCollectable m_CollectableRecord;

	// Token: 0x04000EA6 RID: 3750
	[SerializeField]
	private ChapterCollectable m_CollectableInkwell;

	// Token: 0x04000EA7 RID: 3751
	[Header("LightFixtures")]
	[SerializeField]
	private LightFixtureController m_MainLight;

	// Token: 0x04000EA8 RID: 3752
	[SerializeField]
	private LightFixtureController m_LightGear;

	// Token: 0x04000EA9 RID: 3753
	[SerializeField]
	private LightFixtureController m_LightWrench;

	// Token: 0x04000EAA RID: 3754
	[SerializeField]
	private LightFixtureController m_LightBook;

	// Token: 0x04000EAB RID: 3755
	[SerializeField]
	private LightFixtureController m_LightDoll;

	// Token: 0x04000EAC RID: 3756
	[SerializeField]
	private LightFixtureController m_LightRecord;

	// Token: 0x04000EAD RID: 3757
	[SerializeField]
	private LightFixtureController m_LightInkwell;

	// Token: 0x04000EAE RID: 3758
	private ChapterManager m_ChapterManager;
}
