using System;
using TMG.Core;
using UnityEngine;

// Token: 0x0200029F RID: 671
public class CharacterHeadController : TMGMonoBehaviour
{
	// Token: 0x06000F8E RID: 3982 RVA: 0x00084F56 File Offset: 0x00083356
	public override void Init()
	{
		base.Init();
		this.m_CanLook = this.m_OnAwake;
	}

	// Token: 0x06000F8F RID: 3983 RVA: 0x00084F6A File Offset: 0x0008336A
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_Target = GameManager.Instance.Player.transform;
	}

	// Token: 0x06000F90 RID: 3984 RVA: 0x00084F87 File Offset: 0x00083387
	public void Activate()
	{
		this.m_CanLook = true;
	}

	// Token: 0x06000F91 RID: 3985 RVA: 0x00084F90 File Offset: 0x00083390
	private void LateUpdate()
	{
		if (this.m_Target == null || !this.m_CanLook)
		{
			return;
		}
		this.m_Head.LookAt(this.m_Target);
		Vector3 localEulerAngles = this.m_Head.localEulerAngles;
		localEulerAngles.z = 0f;
		this.m_Head.localEulerAngles = localEulerAngles;
	}

	// Token: 0x06000F92 RID: 3986 RVA: 0x00084FEF File Offset: 0x000833EF
	protected override void OnDisposed()
	{
		this.m_Target = null;
		base.OnDisposed();
	}

	// Token: 0x04001144 RID: 4420
	[Header("Transforms")]
	[SerializeField]
	private Transform m_Head;

	// Token: 0x04001145 RID: 4421
	[Header("Options")]
	[SerializeField]
	private bool m_OnAwake = true;

	// Token: 0x04001146 RID: 4422
	private bool m_CanLook;

	// Token: 0x04001147 RID: 4423
	private Transform m_Target;
}
