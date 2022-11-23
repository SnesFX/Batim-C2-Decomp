using System;
using TMG.Core;
using UnityEngine;

// Token: 0x02000295 RID: 661
[Serializable]
public class CameraMovements : TMGAbstractDisposable
{
	// Token: 0x06000EFF RID: 3839 RVA: 0x00082498 File Offset: 0x00080898
	public void Init(Transform parent, Transform cameraContainer)
	{
		if (!this.m_Active)
		{
			return;
		}
		this.m_ActualCamera = cameraContainer;
		this.m_OriginalRotation = this.m_ActualCamera.localRotation;
		this.m_Target = new GameObject("Forward Camera Target").transform;
		this.m_Target.SetParent(parent);
		this.m_Target.localPosition = Vector3.forward;
		this.m_Target.localEulerAngles = Vector3.zero;
	}

	// Token: 0x06000F00 RID: 3840 RVA: 0x0008250C File Offset: 0x0008090C
	public void Sway(Transform cameraContainer)
	{
		if (!this.m_Active)
		{
			return;
		}
		this.m_ActualCamera.localRotation = this.m_OriginalRotation;
		Vector3 vector = cameraContainer.InverseTransformPoint(this.m_Target.position);
		float num = Mathf.Atan2(vector.x, vector.z) * 57.29578f;
		num = Mathf.Clamp(num, -10.5f, 10.5f);
		this.m_ActualCamera.localRotation = this.m_OriginalRotation * Quaternion.Euler(0f, num, 0f);
		vector = cameraContainer.InverseTransformPoint(this.m_Target.position);
		float num2 = Mathf.Atan2(vector.y, vector.z) * 57.29578f;
		num2 = Mathf.Clamp(num2, -10.5f, 10.5f);
		Vector3 target = new Vector3(this.m_FollowAngles.x + Mathf.DeltaAngle(this.m_FollowAngles.x, num2), this.m_FollowAngles.y + Mathf.DeltaAngle(this.m_FollowAngles.y, num));
		this.m_FollowAngles = Vector3.SmoothDamp(this.m_FollowAngles, target, ref this.m_FollowVelocity, this.m_FollowSpeed);
		this.m_ActualCamera.localRotation = this.m_OriginalRotation * Quaternion.Euler(-this.m_FollowAngles.x, this.m_FollowAngles.y, 0f);
		float num3 = Mathf.PerlinNoise(0f, Time.time * this.m_SwaySpeed) - 0.5f;
		float num4 = Mathf.PerlinNoise(0f, Time.time * this.m_SwaySpeed + 100f) - 0.5f;
		num3 *= this.m_BaseSwayAmount;
		num4 *= this.m_BaseSwayAmount;
		float num5 = Mathf.PerlinNoise(0f, Time.time * this.m_SwaySpeed) - 0.5f + this.m_TrackingBias;
		float num6 = Mathf.PerlinNoise(0f, Time.time * this.m_SwaySpeed + 100f) - 0.5f + this.m_TrackingBias;
		num5 *= -this.m_TrackingSwayAmount * this.m_FollowVelocity.x;
		num6 *= this.m_TrackingSwayAmount * this.m_FollowVelocity.y;
		float xAngle = num3 + num5;
		float num7 = num4 + num6;
		this.m_ActualCamera.Rotate(xAngle, num7, -num7 * 0.5f);
	}

	// Token: 0x06000F01 RID: 3841 RVA: 0x00082769 File Offset: 0x00080B69
	protected override void OnDisposed()
	{
		this.m_ActualCamera = null;
		this.m_Target = null;
		base.OnDisposed();
	}

	// Token: 0x040010B7 RID: 4279
	[SerializeField]
	private bool m_Active = true;

	// Token: 0x040010B8 RID: 4280
	[SerializeField]
	private float m_SwaySpeed = 0.6f;

	// Token: 0x040010B9 RID: 4281
	[SerializeField]
	private float m_BaseSwayAmount = 1.5f;

	// Token: 0x040010BA RID: 4282
	[SerializeField]
	private float m_TrackingSwayAmount = 1.5f;

	// Token: 0x040010BB RID: 4283
	[SerializeField]
	private float m_TrackingBias;

	// Token: 0x040010BC RID: 4284
	[SerializeField]
	private float m_FollowSpeed = 1f;

	// Token: 0x040010BD RID: 4285
	private Transform m_ActualCamera;

	// Token: 0x040010BE RID: 4286
	private Transform m_Target;

	// Token: 0x040010BF RID: 4287
	private Quaternion m_OriginalRotation;

	// Token: 0x040010C0 RID: 4288
	private Vector3 m_FollowVelocity;

	// Token: 0x040010C1 RID: 4289
	private Vector3 m_FollowAngles;

	// Token: 0x040010C2 RID: 4290
	private Vector2 m_RotationRange;
}
