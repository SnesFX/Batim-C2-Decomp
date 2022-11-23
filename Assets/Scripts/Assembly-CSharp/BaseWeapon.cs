using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMG.Controls;
using TMG.Core;
using UnityEngine;

// Token: 0x0200030B RID: 779
public class BaseWeapon : TMGMonoBehaviour
{
	// Token: 0x0600125F RID: 4703 RVA: 0x0008F6E9 File Offset: 0x0008DAE9
	public override void Init()
	{
		base.Init();
		this.Interaction.OnInteracted += this.HandleOnInteracted;
	}

	// Token: 0x06001260 RID: 4704 RVA: 0x0008F708 File Offset: 0x0008DB08
	public void Update()
	{
		if (!this.m_IsEquipped)
		{
			return;
		}
		if (this.m_Player.isLocked)
		{
			return;
		}
		RaycastHit raycastHit;
		if (Physics.SphereCast(this.m_GameCamera.position, 0.5f, this.m_GameCamera.forward, out raycastHit, 7f, ~this.m_IgnoreLayers))
		{
			this.m_Target = raycastHit.transform.GetComponent<Breakable>();
		}
		else
		{
			this.m_Target = null;
		}
		this.Attack();
	}

	// Token: 0x06001261 RID: 4705 RVA: 0x0008F78E File Offset: 0x0008DB8E
	private void Attack()
	{
		if (!this.m_CanAttack)
		{
			return;
		}
		if (PlayerInput.Attack())
		{
			this.m_CanAttack = false;
			this.OnAttack();
		}
	}

	// Token: 0x06001262 RID: 4706 RVA: 0x0008F7B3 File Offset: 0x0008DBB3
	public virtual void OnAttack()
	{
	}

	// Token: 0x06001263 RID: 4707 RVA: 0x0008F7B5 File Offset: 0x0008DBB5
	public void Equip()
	{
		this.m_Player.EquipWeapon();
		this.m_IsEquipped = true;
		this.m_CanAttack = true;
		this.OnEquip();
	}

	// Token: 0x06001264 RID: 4708 RVA: 0x0008F7D6 File Offset: 0x0008DBD6
	protected virtual void OnEquip()
	{
	}

	// Token: 0x06001265 RID: 4709 RVA: 0x0008F7D8 File Offset: 0x0008DBD8
	private IEnumerator DelayEquip()
	{
		yield return new WaitForEndOfFrame();
		this.Equip();
		yield break;
	}

	// Token: 0x06001266 RID: 4710 RVA: 0x0008F7F4 File Offset: 0x0008DBF4
	private void HandleOnInteracted(object sender, EventArgs e)
	{
		this.Interaction.OnInteracted -= this.HandleOnInteracted;
		Interactable interactable = sender as Interactable;
		if (interactable == null)
		{
			return;
		}
		this.OnInteracted();
		UnityEngine.Object.Destroy(interactable.gameObject);
		this.Interaction = null;
		Rigidbody rigidbody = base.gameObject.AddComponent<Rigidbody>();
		rigidbody.useGravity = false;
		rigidbody.isKinematic = true;
		GameManager.Instance.AudioManager.Play(this.m_EquipSound, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_Player = GameManager.Instance.Player;
		this.m_GameCamera = GameManager.Instance.GameCamera.transform;
		this.m_Player.WeaponGameObject = base.gameObject;
		base.transform.SetParent(this.m_Player.WeaponParent);
		base.transform.localEulerAngles = Vector3.zero;
		base.transform.localPosition = Vector3.zero;
		if (this.m_WeaponModel != null)
		{
			this.m_WeaponModel.layer = LayerMask.NameToLayer("Weapon");
			Transform[] componentsInChildren = this.m_WeaponModel.GetComponentsInChildren<Transform>(true);
			if (componentsInChildren != null && componentsInChildren.Length > 0)
			{
				for (int i = 0; i < componentsInChildren.Length; i++)
				{
					componentsInChildren[i].gameObject.layer = LayerMask.NameToLayer("Weapon");
				}
			}
		}
		foreach (Transform transform in this.m_WeaponModel.GetComponentsInChildren<Transform>(true))
		{
			transform.gameObject.layer = LayerMask.NameToLayer("Weapon");
		}
		base.StartCoroutine(this.DelayEquip());
	}

	// Token: 0x06001267 RID: 4711 RVA: 0x0008F9A1 File Offset: 0x0008DDA1
	protected virtual void OnInteracted()
	{
	}

	// Token: 0x06001268 RID: 4712 RVA: 0x0008F9A4 File Offset: 0x0008DDA4
	private void OnTriggerStay(Collider collider)
	{
		if (!this.m_CanHit)
		{
			return;
		}
		Breakable component = collider.GetComponent<Breakable>();
		if (component != null)
		{
			if (component != this.m_Target)
			{
				return;
			}
			if (!component.isDestroyed)
			{
				this.m_Target = null;
				this.m_CanHit = false;
				component.Destroy(base.transform.position);
			}
			return;
		}
		else
		{
			SearcherAiController component2 = collider.GetComponent<SearcherAiController>();
			if (component2 != null)
			{
				this.m_CanHit = false;
				GameManager.Instance.AudioManager.Play("Audio/SFX/Axe/SFX_Axe_Hit_01", AudioObjectType.SOUND_EFFECT, 0, false);
				component2.Kill();
				return;
			}
			BreakableCutout component3 = collider.GetComponent<BreakableCutout>();
			if (component3 != null)
			{
				this.m_CanHit = false;
				component3.Break(base.transform.position);
				return;
			}
			return;
		}
	}

	// Token: 0x06001269 RID: 4713 RVA: 0x0008FA72 File Offset: 0x0008DE72
	protected void ResetAttackSequence()
	{
		this.KillAttackSequence();
		this.m_AttackSequence = DOTween.Sequence();
	}

	// Token: 0x0600126A RID: 4714 RVA: 0x0008FA85 File Offset: 0x0008DE85
	protected void KillAttackSequence()
	{
		if (this.m_AttackSequence != null)
		{
			this.m_AttackSequence.Kill(false);
			this.m_AttackSequence = null;
		}
	}

	// Token: 0x0600126B RID: 4715 RVA: 0x0008FAA5 File Offset: 0x0008DEA5
	protected override void OnDisposed()
	{
		this.KillAttackSequence();
		base.OnDisposed();
	}

	// Token: 0x04001403 RID: 5123
	[Header("Layer Masks")]
	[SerializeField]
	private LayerMask m_IgnoreLayers;

	// Token: 0x04001404 RID: 5124
	[Header("Interaction")]
	[SerializeField]
	private Interactable Interaction;

	// Token: 0x04001405 RID: 5125
	[Header("Weapon Model")]
	[SerializeField]
	private GameObject m_WeaponModel;

	// Token: 0x04001406 RID: 5126
	[Header("Audio Clips")]
	[SerializeField]
	protected AudioClip m_EquipSound;

	// Token: 0x04001407 RID: 5127
	[SerializeField]
	protected List<AudioClip> m_AttackClips;

	// Token: 0x04001408 RID: 5128
	protected Sequence m_AttackSequence;

	// Token: 0x04001409 RID: 5129
	private PlayerController m_Player;

	// Token: 0x0400140A RID: 5130
	private Transform m_GameCamera;

	// Token: 0x0400140B RID: 5131
	private Breakable m_Target;

	// Token: 0x0400140C RID: 5132
	protected bool m_CanAttack;

	// Token: 0x0400140D RID: 5133
	protected bool m_IsEquipped;

	// Token: 0x0400140E RID: 5134
	protected bool m_CanHit;
}
