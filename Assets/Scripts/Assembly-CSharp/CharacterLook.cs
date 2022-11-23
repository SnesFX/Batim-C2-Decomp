using System;
using TMG.Controls;
using TMG.Core;
using UnityEngine;

// Token: 0x0200029C RID: 668
[Serializable]
public class CharacterLook : TMGAbstractDisposable
{
	// Token: 0x170002A2 RID: 674
	// (get) Token: 0x06000F44 RID: 3908 RVA: 0x00084190 File Offset: 0x00082590
	// (set) Token: 0x06000F45 RID: 3909 RVA: 0x00084198 File Offset: 0x00082598
	public bool hasHorizontalLock { get; private set; }

	// Token: 0x06000F46 RID: 3910 RVA: 0x000841A1 File Offset: 0x000825A1
	public void Init(Transform character)
	{
		this.ResetRotation(character);
		this.m_InitialVerticalClamp = this.m_VerticalClamp;
	}

	// Token: 0x06000F47 RID: 3911 RVA: 0x000841B6 File Offset: 0x000825B6
	public void Init(Transform character, Transform camera)
	{
		this.ResetRotation(character, camera);
		this.m_InitialVerticalClamp = this.m_VerticalClamp;
	}

	// Token: 0x06000F48 RID: 3912 RVA: 0x000841CC File Offset: 0x000825CC
	public void ForceRotation(Quaternion rotation)
	{
		this.m_CharacterTargetRotation = rotation;
	}

	// Token: 0x06000F49 RID: 3913 RVA: 0x000841D5 File Offset: 0x000825D5
	public void ForceCameraRotation(Quaternion rotation)
	{
		this.m_CameraTargetRotation = rotation;
	}

	// Token: 0x06000F4A RID: 3914 RVA: 0x000841DE File Offset: 0x000825DE
	public void Rotation(Transform character)
	{
		this.Rotation(character, null, true);
	}

	// Token: 0x06000F4B RID: 3915 RVA: 0x000841E9 File Offset: 0x000825E9
	public void Rotation(Transform character, bool hasGravity)
	{
		this.Rotation(character, null, hasGravity);
	}

	// Token: 0x06000F4C RID: 3916 RVA: 0x000841F4 File Offset: 0x000825F4
	public void Rotation(Transform character, params Transform[] cameras)
	{
		for (int i = 0; i < cameras.Length; i++)
		{
			if (!(cameras[i] == null))
			{
				this.Rotation(character, cameras[i], true);
			}
		}
	}

	// Token: 0x06000F4D RID: 3917 RVA: 0x00084233 File Offset: 0x00082633
	public void Rotation(Transform character, Transform camera)
	{
		this.Rotation(character, camera, true);
	}

	// Token: 0x06000F4E RID: 3918 RVA: 0x00084240 File Offset: 0x00082640
	public void Rotation(Transform character, Transform camera, bool hasGravity)
	{
		float num = PlayerInput.LookX() * this.m_Sensitivity;
		float num2 = -PlayerInput.LookY() * this.m_Sensitivity;
		if (!this.IsNullRotation(num, num2))
		{
			if (hasGravity)
			{
				this.m_CharacterTargetRotation *= Quaternion.Euler(0f, num, 0f);
				if (this.hasHorizontalLock)
				{
					this.m_CharacterTargetRotation = this.ClampRotationYAxis(this.m_CharacterTargetRotation, -this.m_HorizontalClamp, this.m_HorizontalClamp);
				}
				character.localRotation = this.m_CharacterTargetRotation;
				if (camera != null)
				{
					this.m_CameraTargetRotation *= Quaternion.Euler(num2, 0f, 0f);
					if (this.m_ClampVerticalRotation)
					{
						this.m_CameraTargetRotation = this.ClampRotationXAxis(this.m_CameraTargetRotation, -this.m_VerticalClamp, this.m_VerticalClamp);
					}
					camera.localRotation = this.m_CameraTargetRotation;
				}
			}
			else
			{
				this.m_CharacterTargetRotation *= Quaternion.Euler(num2, num, 0f);
				character.localRotation = this.m_CharacterTargetRotation;
			}
		}
		else
		{
			character.localRotation = this.m_CharacterTargetRotation;
			if (camera != null)
			{
				camera.localRotation = this.m_CameraTargetRotation;
			}
		}
		this.UpdateCursorLock();
	}

	// Token: 0x06000F4F RID: 3919 RVA: 0x00084392 File Offset: 0x00082792
	public void ResetRotation(Transform character)
	{
		this.ResetRotation(character, null);
	}

	// Token: 0x06000F50 RID: 3920 RVA: 0x0008439C File Offset: 0x0008279C
	public void ResetRotation(Transform character, Transform camera)
	{
		this.m_CharacterTargetRotation = character.localRotation;
		if (camera != null)
		{
			this.m_CameraTargetRotation = camera.localRotation;
		}
	}

	// Token: 0x06000F51 RID: 3921 RVA: 0x000843C2 File Offset: 0x000827C2
	public void ResetVerticalClamp()
	{
		this.m_VerticalClamp = this.m_InitialVerticalClamp;
	}

	// Token: 0x06000F52 RID: 3922 RVA: 0x000843D0 File Offset: 0x000827D0
	public void SetVerticalClamp(float clamp)
	{
		this.m_VerticalClamp = clamp;
	}

	// Token: 0x06000F53 RID: 3923 RVA: 0x000843D9 File Offset: 0x000827D9
	public void SetHorizontalClamp(float clamp)
	{
		this.m_HorizontalClamp = clamp;
	}

	// Token: 0x06000F54 RID: 3924 RVA: 0x000843E2 File Offset: 0x000827E2
	public void HorizontalClampSetActive(bool active)
	{
		this.hasHorizontalLock = active;
	}

	// Token: 0x06000F55 RID: 3925 RVA: 0x000843EB File Offset: 0x000827EB
	public void UpdateCursorLock()
	{
		this.InternalLockUpdate();
	}

	// Token: 0x06000F56 RID: 3926 RVA: 0x000843F3 File Offset: 0x000827F3
	private void InternalLockUpdate()
	{
		Cursor.lockState = CursorLockMode.Locked;
	}

	// Token: 0x06000F57 RID: 3927 RVA: 0x000843FB File Offset: 0x000827FB
	private bool IsNullRotation(float horizontal, float vertical)
	{
		if (horizontal == 0f && vertical == 0f)
		{
			return true;
		}
		if (!this.m_IsRotationInitialized)
		{
			this.m_IsRotationInitialized = true;
			return true;
		}
		return false;
	}

	// Token: 0x06000F58 RID: 3928 RVA: 0x0008442C File Offset: 0x0008282C
	private Quaternion ClampRotationXAxis(Quaternion _quaternion, float minimum, float maximum)
	{
		_quaternion.x /= _quaternion.w;
		_quaternion.y /= _quaternion.w;
		_quaternion.z /= _quaternion.w;
		_quaternion.w = 1f;
		float num = 114.59156f * Mathf.Atan(_quaternion.x);
		num = Mathf.Clamp(num, minimum, maximum);
		_quaternion.x = Mathf.Tan(0.008726646f * num);
		return _quaternion;
	}

	// Token: 0x06000F59 RID: 3929 RVA: 0x000844B4 File Offset: 0x000828B4
	private Quaternion ClampRotationYAxis(Quaternion _quaternion, float minimum, float maximum)
	{
		_quaternion.x /= _quaternion.w;
		_quaternion.y /= _quaternion.w;
		_quaternion.z /= _quaternion.w;
		_quaternion.w = 1f;
		float num = 114.59156f * Mathf.Atan(_quaternion.y);
		num = Mathf.Clamp(num, minimum, maximum);
		_quaternion.y = Mathf.Tan(0.008726646f * num);
		return _quaternion;
	}

	// Token: 0x06000F5A RID: 3930 RVA: 0x0008453C File Offset: 0x0008293C
	public void SetSensitivity(float sensitivity)
	{
		this.m_Sensitivity = sensitivity;
	}

	// Token: 0x06000F5B RID: 3931 RVA: 0x00084545 File Offset: 0x00082945
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04001116 RID: 4374
	[SerializeField]
	private float m_Sensitivity = 3f;

	// Token: 0x04001117 RID: 4375
	[SerializeField]
	private bool m_ClampVerticalRotation = true;

	// Token: 0x04001118 RID: 4376
	[SerializeField]
	private float m_VerticalClamp = 85f;

	// Token: 0x04001119 RID: 4377
	private Quaternion m_CharacterTargetRotation;

	// Token: 0x0400111A RID: 4378
	private Quaternion m_CameraTargetRotation;

	// Token: 0x0400111B RID: 4379
	private bool m_IsRotationInitialized;

	// Token: 0x0400111D RID: 4381
	private float m_HorizontalClamp;

	// Token: 0x0400111E RID: 4382
	private float m_InitialVerticalClamp;
}
