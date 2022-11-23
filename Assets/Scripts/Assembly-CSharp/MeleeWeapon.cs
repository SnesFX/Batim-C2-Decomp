using System;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200030D RID: 781
public class MeleeWeapon : BaseWeapon
{
	// Token: 0x06001270 RID: 4720 RVA: 0x0008FBE4 File Offset: 0x0008DFE4
	protected override void OnEquip()
	{
		this.m_HitCollider.enabled = true;
		GameManager.Instance.ShowCrosshair();
	}

	// Token: 0x06001271 RID: 4721 RVA: 0x0008FBFC File Offset: 0x0008DFFC
	public override void OnAttack()
	{
		base.ResetAttackSequence();
		float num = 0f;
		float num2 = 0.125f;
		Vector3 endValue = (UnityEngine.Random.value >= 0.5f) ? this.m_WeaponPullBackRotation2 : this.m_WeaponPullBackRotation;
		this.m_AttackSequence.Insert(num, base.transform.DOLocalRotate(endValue, num2, RotateMode.Fast).SetEase(Ease.InQuad));
		num += num2;
		num2 = 0.2f;
		this.m_AttackSequence.InsertCallback(num, new TweenCallback(this.HandleSwingBegin));
		this.m_AttackSequence.Insert(num, base.transform.DOLocalMoveX(-1f, num2, false).SetEase(Ease.OutQuad));
		Vector3 endValue2 = (UnityEngine.Random.value >= 0.5f) ? this.m_WeaponSwingRotation2 : this.m_WeaponSwingRotation;
		this.m_AttackSequence.Insert(num, base.transform.DOLocalRotate(endValue2, num2, RotateMode.Fast).SetEase(Ease.OutQuad));
		num += num2;
		this.m_AttackSequence.InsertCallback(num, new TweenCallback(this.HandleSwingEnd));
		this.m_AttackSequence.Insert(num, base.transform.DOLocalMoveX(0f, num2, false).SetEase(Ease.OutQuad));
		this.m_AttackSequence.Insert(num, base.transform.DOLocalRotate(Vector3.zero, 0.5f, RotateMode.Fast).SetEase(Ease.OutQuad));
		this.m_AttackSequence.OnComplete(delegate
		{
			this.m_CanAttack = true;
		});
	}

	// Token: 0x06001272 RID: 4722 RVA: 0x0008FD70 File Offset: 0x0008E170
	private void HandleSwingBegin()
	{
		int index = UnityEngine.Random.Range(0, this.m_AttackClips.Count);
		AudioClip audioClip = this.m_AttackClips[index];
		GameManager.Instance.AudioManager.Play(audioClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_AttackClips[index] = this.m_AttackClips[0];
		this.m_AttackClips[0] = audioClip;
		this.m_CanHit = true;
	}

	// Token: 0x06001273 RID: 4723 RVA: 0x0008FDDC File Offset: 0x0008E1DC
	private void HandleSwingEnd()
	{
		this.m_CanHit = false;
	}

	// Token: 0x06001274 RID: 4724 RVA: 0x0008FDE5 File Offset: 0x0008E1E5
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04001410 RID: 5136
	[Header("Collider")]
	[SerializeField]
	private Collider m_HitCollider;

	// Token: 0x04001411 RID: 5137
	[Header("Swing Rotation 01")]
	[SerializeField]
	private Vector3 m_WeaponPullBackRotation;

	// Token: 0x04001412 RID: 5138
	[SerializeField]
	private Vector3 m_WeaponSwingRotation;

	// Token: 0x04001413 RID: 5139
	[Header("Swing Rotation 02")]
	[SerializeField]
	private Vector3 m_WeaponPullBackRotation2;

	// Token: 0x04001414 RID: 5140
	[SerializeField]
	private Vector3 m_WeaponSwingRotation2;
}
