using System;
using System.Collections;
using TMG.Core;
using UnityEngine;

// Token: 0x02000296 RID: 662
[Serializable]
public class FirstPersonHeadBob : TMGAbstractDisposable
{
	// Token: 0x17000298 RID: 664
	// (get) Token: 0x06000F03 RID: 3843 RVA: 0x000827D8 File Offset: 0x00080BD8
	public bool isActive
	{
		get
		{
			return this.m_Active;
		}
	}

	// Token: 0x17000299 RID: 665
	// (get) Token: 0x06000F04 RID: 3844 RVA: 0x000827E0 File Offset: 0x00080BE0
	// (set) Token: 0x06000F05 RID: 3845 RVA: 0x000827E8 File Offset: 0x00080BE8
	public float JumpOffset { get; private set; }

	// Token: 0x06000F06 RID: 3846 RVA: 0x000827F4 File Offset: 0x00080BF4
	public void Init(Transform cameraContainer, float stepInterval)
	{
		if (!this.m_Active)
		{
			return;
		}
		this.m_CameraContainer = cameraContainer;
		this.m_StepInterval = stepInterval;
		this.m_OriginalCameraPosition = this.m_CameraContainer.localPosition;
		this.m_Time = this.m_Bobcurve[this.m_Bobcurve.length - 1].time;
	}

	// Token: 0x06000F07 RID: 3847 RVA: 0x00082854 File Offset: 0x00080C54
	public void UpdateCameraPosition(float magnitude, float speed)
	{
		if (!this.m_Active)
		{
			return;
		}
		Vector3 localPosition;
		if (magnitude > 0.1f)
		{
			this.m_CameraContainer.localPosition = this.DoHeadBob(magnitude + speed);
			localPosition = this.m_CameraContainer.localPosition;
			localPosition.y = this.m_CameraContainer.localPosition.y - this.JumpOffset;
			this.m_CurrentCameraPosition = localPosition;
		}
		else
		{
			localPosition = this.m_CameraContainer.localPosition;
			localPosition.y = this.m_OriginalCameraPosition.y - this.JumpOffset;
		}
		this.m_CameraContainer.localPosition = localPosition;
	}

	// Token: 0x06000F08 RID: 3848 RVA: 0x000828F8 File Offset: 0x00080CF8
	private Vector3 DoHeadBob(float speed)
	{
		if (!this.m_Active)
		{
			return Vector3.zero;
		}
		float x = this.m_OriginalCameraPosition.x + this.m_Bobcurve.Evaluate(this.m_CyclePositionX) * this.m_HorizontalBobRange;
		float y = this.m_OriginalCameraPosition.y + this.m_Bobcurve.Evaluate(this.m_CyclePositionY) * this.m_VerticalBobRange;
		this.m_CyclePositionX += speed * Time.deltaTime / this.m_StepInterval;
		this.m_CyclePositionY += speed * Time.deltaTime / this.m_StepInterval * this.m_VerticaltoHorizontalRatio;
		if (this.m_CyclePositionX > this.m_Time)
		{
			this.m_CyclePositionX -= this.m_Time;
		}
		if (this.m_CyclePositionY > this.m_Time)
		{
			this.m_CyclePositionY -= this.m_Time;
		}
		return new Vector3(x, y, 0f);
	}

	// Token: 0x06000F09 RID: 3849 RVA: 0x000829F4 File Offset: 0x00080DF4
	private Vector3 DoHeadReset()
	{
		if (!this.m_Active)
		{
			return Vector3.zero;
		}
		float num = Time.deltaTime * 1f;
		Vector3 originalCameraPosition = this.m_OriginalCameraPosition;
		originalCameraPosition.x -= this.JumpOffset;
		originalCameraPosition.y -= this.JumpOffset;
		float t = num / Vector3.Distance(this.m_CurrentCameraPosition, originalCameraPosition);
		return Vector3.Lerp(this.m_CurrentCameraPosition, originalCameraPosition, t);
	}

	// Token: 0x06000F0A RID: 3850 RVA: 0x00082A6C File Offset: 0x00080E6C
	public IEnumerator DoJumpBob()
	{
		if (!this.m_EnableJumpBob)
		{
			yield break;
		}
		float time = 0f;
		while (time < this.m_JumpBobDuration)
		{
			this.JumpOffset = Mathf.Lerp(0f, this.m_JumpBobAmount, time / this.m_JumpBobDuration);
			time += Time.deltaTime;
			yield return new WaitForFixedUpdate();
		}
		time = 0f;
		while (time < this.m_JumpBobDuration)
		{
			this.JumpOffset = Mathf.Lerp(this.m_JumpBobAmount, 0f, time / this.m_JumpBobDuration);
			time += Time.deltaTime;
			yield return new WaitForFixedUpdate();
		}
		this.JumpOffset = 0f;
		yield break;
	}

	// Token: 0x06000F0B RID: 3851 RVA: 0x00082A87 File Offset: 0x00080E87
	public void SetActive(bool active)
	{
		this.m_Active = active;
		this.m_EnableJumpBob = active;
	}

	// Token: 0x06000F0C RID: 3852 RVA: 0x00082A97 File Offset: 0x00080E97
	protected override void OnDisposed()
	{
		this.m_CameraContainer = null;
		base.OnDisposed();
	}

	// Token: 0x040010C3 RID: 4291
	[SerializeField]
	private bool m_Active = true;

	// Token: 0x040010C4 RID: 4292
	[SerializeField]
	private float m_HorizontalBobRange = 0.15f;

	// Token: 0x040010C5 RID: 4293
	[SerializeField]
	private float m_VerticalBobRange = 0.15f;

	// Token: 0x040010C6 RID: 4294
	[SerializeField]
	private AnimationCurve m_Bobcurve;

	// Token: 0x040010C7 RID: 4295
	[SerializeField]
	private float m_VerticaltoHorizontalRatio = 2f;

	// Token: 0x040010C8 RID: 4296
	[Header("Jump Bob")]
	[SerializeField]
	private bool m_EnableJumpBob = true;

	// Token: 0x040010C9 RID: 4297
	[SerializeField]
	private float m_JumpBobDuration = 0.2f;

	// Token: 0x040010CA RID: 4298
	[SerializeField]
	private float m_JumpBobAmount = 0.1f;

	// Token: 0x040010CC RID: 4300
	private Transform m_CameraContainer;

	// Token: 0x040010CD RID: 4301
	private Vector3 m_OriginalCameraPosition;

	// Token: 0x040010CE RID: 4302
	private Vector3 m_CurrentCameraPosition;

	// Token: 0x040010CF RID: 4303
	private float m_CyclePositionX;

	// Token: 0x040010D0 RID: 4304
	private float m_CyclePositionY;

	// Token: 0x040010D1 RID: 4305
	private float m_StepInterval;

	// Token: 0x040010D2 RID: 4306
	private float m_Time;
}
