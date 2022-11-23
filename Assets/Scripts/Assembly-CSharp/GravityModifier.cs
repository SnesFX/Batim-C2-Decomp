using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002C6 RID: 710
public class GravityModifier : TMGMonoBehaviour
{
	// Token: 0x0600101C RID: 4124 RVA: 0x00086826 File Offset: 0x00084C26
	public override void Init()
	{
		base.Init();
		this.m_Timer = 0f;
	}

	// Token: 0x0600101D RID: 4125 RVA: 0x0008683C File Offset: 0x00084C3C
	private void Update()
	{
		if (this.m_UseKinematic && !this.m_IsKinematic)
		{
			this.m_Timer += Time.deltaTime;
			if (this.m_Timer > this.m_TimerMax && base.rigidBody.velocity.magnitude <= 0.1f)
			{
				this.m_IsKinematic = true;
				base.rigidBody.isKinematic = this.m_IsKinematic;
			}
		}
	}

	// Token: 0x0600101E RID: 4126 RVA: 0x000868B8 File Offset: 0x00084CB8
	private void FixedUpdate()
	{
		if (!this.m_IsKinematic && base.rigidBody.velocity.magnitude > 0.1f)
		{
			base.rigidBody.AddForce(Physics.gravity * this.modifier);
		}
	}

	// Token: 0x0600101F RID: 4127 RVA: 0x00086908 File Offset: 0x00084D08
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x0400125B RID: 4699
	[SerializeField]
	private float modifier = 4f;

	// Token: 0x0400125C RID: 4700
	[SerializeField]
	private bool m_UseKinematic;

	// Token: 0x0400125D RID: 4701
	private float m_Timer;

	// Token: 0x0400125E RID: 4702
	private float m_TimerMax = 3f;

	// Token: 0x0400125F RID: 4703
	private bool m_IsKinematic;
}
