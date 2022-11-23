using System;
using TMG.Controls;
using TMG.Core;
using UnityEngine;

// Token: 0x020002D0 RID: 720
[Serializable]
public class InteractableInputController : TMGAbstractDisposable
{
	// Token: 0x170002C0 RID: 704
	// (get) Token: 0x0600106E RID: 4206 RVA: 0x0008746B File Offset: 0x0008586B
	// (set) Token: 0x0600106F RID: 4207 RVA: 0x00087473 File Offset: 0x00085873
	public Interactable Interactable { get; private set; }

	// Token: 0x06001070 RID: 4208 RVA: 0x0008747C File Offset: 0x0008587C
	public void Init()
	{
		this.m_OriginalLookDistance = this.m_LookDistance;
	}

	// Token: 0x06001071 RID: 4209 RVA: 0x0008748A File Offset: 0x0008588A
	public void UpdateInteraction(Vector3 origin, Vector3 direction)
	{
		if (!this.m_Active)
		{
			return;
		}
		this.UpdateInteraction(origin, direction, this.m_LookDistance);
	}

	// Token: 0x06001072 RID: 4210 RVA: 0x000874A8 File Offset: 0x000858A8
	public void UpdateInteraction(Vector3 origin, Vector3 direction, float distance)
	{
		if (!this.m_Active)
		{
			return;
		}
		RaycastHit raycastHit;
		if (Physics.SphereCast(origin, this.m_SphereCastThickness, direction, out raycastHit, distance, ~this.m_IgnoreLayers))
		{
			Interactable component = raycastHit.transform.GetComponent<Interactable>();
			if (component != null)
			{
				this.DrawDebugLine(origin, raycastHit.point, Color.yellow);
				if (this.Interactable != component)
				{
					this.ExitInteraction();
				}
				this.Interactable = component;
				bool flag = (!this.HasWeapon) ? (PlayerInput.InteractOnPressed() || PlayerInput.Attack()) : PlayerInput.InteractOnPressed();
				if (flag)
				{
					this.Interact();
					return;
				}
				this.EnterInteraction();
			}
			else
			{
				this.ExitInteraction();
			}
		}
		else
		{
			this.ExitInteraction();
		}
	}

	// Token: 0x06001073 RID: 4211 RVA: 0x0008757D File Offset: 0x0008597D
	private void Interact()
	{
		if (this.Interactable != null)
		{
			this.Interactable.Interact();
		}
	}

	// Token: 0x06001074 RID: 4212 RVA: 0x0008759B File Offset: 0x0008599B
	private void EnterInteraction()
	{
		if (this.Interactable != null)
		{
			this.Interactable.InteractEnter();
		}
	}

	// Token: 0x06001075 RID: 4213 RVA: 0x000875B9 File Offset: 0x000859B9
	private void ExitInteraction()
	{
		if (this.Interactable != null)
		{
			this.Interactable.InteractExit();
			this.Interactable = null;
		}
	}

	// Token: 0x06001076 RID: 4214 RVA: 0x000875DE File Offset: 0x000859DE
	private void DrawDebugLine(Vector3 start, Vector3 end, Color color)
	{
		if (!this.DebugLines)
		{
			return;
		}
		Debug.DrawLine(start, end, color);
	}

	// Token: 0x06001077 RID: 4215 RVA: 0x000875F4 File Offset: 0x000859F4
	public void SetActive(bool active)
	{
		this.m_Active = active;
	}

	// Token: 0x06001078 RID: 4216 RVA: 0x000875FD File Offset: 0x000859FD
	private void SetDistance(float distance)
	{
		this.m_LookDistance = distance;
	}

	// Token: 0x06001079 RID: 4217 RVA: 0x00087606 File Offset: 0x00085A06
	protected override void OnDisposed()
	{
		this.Interactable = null;
		base.OnDisposed();
	}

	// Token: 0x0400128F RID: 4751
	[SerializeField]
	private bool m_Active = true;

	// Token: 0x04001290 RID: 4752
	[SerializeField]
	private LayerMask m_IgnoreLayers;

	// Token: 0x04001291 RID: 4753
	[SerializeField]
	private float m_LookDistance = 8f;

	// Token: 0x04001292 RID: 4754
	[SerializeField]
	private float m_SphereCastThickness = 0.1f;

	// Token: 0x04001293 RID: 4755
	[SerializeField]
	private bool DebugLines = true;

	// Token: 0x04001294 RID: 4756
	public bool HasWeapon;

	// Token: 0x04001296 RID: 4758
	private float m_OriginalLookDistance;
}
