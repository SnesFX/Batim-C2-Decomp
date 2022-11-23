using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002E3 RID: 739
[RequireComponent(typeof(BoxCollider))]
public class EventTrigger : TMGMonoBehaviour
{
	// Token: 0x14000020 RID: 32
	// (add) Token: 0x06001135 RID: 4405 RVA: 0x0008A78C File Offset: 0x00088B8C
	// (remove) Token: 0x06001136 RID: 4406 RVA: 0x0008A7C4 File Offset: 0x00088BC4
	public event EventHandler OnEnter;

	// Token: 0x14000021 RID: 33
	// (add) Token: 0x06001137 RID: 4407 RVA: 0x0008A7FC File Offset: 0x00088BFC
	// (remove) Token: 0x06001138 RID: 4408 RVA: 0x0008A834 File Offset: 0x00088C34
	public event EventHandler OnExit;

	// Token: 0x170002D1 RID: 721
	// (get) Token: 0x06001139 RID: 4409 RVA: 0x0008A86A File Offset: 0x00088C6A
	// (set) Token: 0x0600113A RID: 4410 RVA: 0x0008A872 File Offset: 0x00088C72
	public bool IsTriggered { get; private set; }

	// Token: 0x0600113B RID: 4411 RVA: 0x0008A87B File Offset: 0x00088C7B
	public override void Init()
	{
		base.Init();
		base.gameObject.layer = LayerMask.NameToLayer("EventTrigger");
		this.ActualGetCollider();
	}

	// Token: 0x0600113C RID: 4412 RVA: 0x0008A89E File Offset: 0x00088C9E
	private void GetCollider()
	{
		this.ActualGetCollider();
		if (this.m_Collider != null)
		{
			this.m_Collider.isTrigger = true;
		}
	}

	// Token: 0x0600113D RID: 4413 RVA: 0x0008A8C3 File Offset: 0x00088CC3
	private void ActualGetCollider()
	{
		this.m_Collider = base.GetComponent<Collider>();
		if (this.m_Collider != null)
		{
			this.m_Collider.enabled = this.m_IsActive;
		}
	}

	// Token: 0x0600113E RID: 4414 RVA: 0x0008A8F4 File Offset: 0x00088CF4
	public void SetActive(bool active)
	{
		if (this.m_Collider != null)
		{
			Collider collider = this.m_Collider;
			this.m_IsActive = active;
			collider.enabled = active;
		}
	}

	// Token: 0x0600113F RID: 4415 RVA: 0x0008A927 File Offset: 0x00088D27
	private void OnTriggerEnter(Collider col)
	{
		if (!this.m_OnEnter || !this.m_IsActive || this.IsTriggered)
		{
			return;
		}
		this.ActualTriggerEnter(col);
	}

	// Token: 0x06001140 RID: 4416 RVA: 0x0008A952 File Offset: 0x00088D52
	private void OnTriggerStay(Collider col)
	{
		if (!this.m_OnStay || !this.m_IsActive || this.IsTriggered)
		{
			return;
		}
		this.ActualTriggerEnter(col);
	}

	// Token: 0x06001141 RID: 4417 RVA: 0x0008A97D File Offset: 0x00088D7D
	private void ActualTriggerEnter(Collider col)
	{
		if (col.CompareTag("Player"))
		{
			this.IsTriggered = true;
			this.OnEnter.Send(this);
			if (this.m_IsSingleTrigger)
			{
				base.Dispose();
			}
		}
	}

	// Token: 0x06001142 RID: 4418 RVA: 0x0008A9B4 File Offset: 0x00088DB4
	private void OnTriggerExit(Collider col)
	{
		if (!this.m_OnExit || !this.m_IsActive || !this.IsTriggered)
		{
			return;
		}
		if (col.CompareTag("Player"))
		{
			this.IsTriggered = false;
			this.OnExit.Send(this);
		}
	}

	// Token: 0x06001143 RID: 4419 RVA: 0x0008AA06 File Offset: 0x00088E06
	public override void OnDisable()
	{
		base.OnDisable();
	}

	// Token: 0x04001309 RID: 4873
	[Header("Trigger Type")]
	[SerializeField]
	private bool m_OnStay = true;

	// Token: 0x0400130A RID: 4874
	[SerializeField]
	private bool m_OnEnter;

	// Token: 0x0400130B RID: 4875
	[Header("Trigger Options")]
	[SerializeField]
	private bool m_IsActive = true;

	// Token: 0x0400130C RID: 4876
	[SerializeField]
	private bool m_IsSingleTrigger = true;

	// Token: 0x0400130D RID: 4877
	[SerializeField]
	private bool m_OnExit;

	// Token: 0x0400130F RID: 4879
	private Collider m_Collider;
}
