using System;
using UnityEngine;

// Token: 0x0200000C RID: 12
public class MouseLook : MonoBehaviour
{
	// Token: 0x06000034 RID: 52 RVA: 0x000042C4 File Offset: 0x000026C4
	private void Update()
	{
		if (GUIUtility.hotControl != 0)
		{
			return;
		}
		if (Input.GetMouseButtonDown(0))
		{
			this.look = true;
		}
		if (Input.GetMouseButtonUp(0))
		{
			this.look = false;
		}
		if (this.look)
		{
			if (this.axes == MouseLook.RotationAxes.MouseXAndY)
			{
				this.rotationX += Input.GetAxis("Mouse X") * this.sensitivityX;
				this.rotationY += Input.GetAxis("Mouse Y") * this.sensitivityY;
				this.rotationX = MouseLook.ClampAngle(this.rotationX, this.minimumX, this.maximumX);
				this.rotationY = MouseLook.ClampAngle(this.rotationY, this.minimumY, this.maximumY);
				Quaternion rhs = Quaternion.AngleAxis(this.rotationX, Vector3.up);
				Quaternion rhs2 = Quaternion.AngleAxis(this.rotationY, Vector3.left);
				base.transform.localRotation = this.originalRotation * rhs * rhs2;
			}
			else if (this.axes == MouseLook.RotationAxes.MouseX)
			{
				this.rotationX += Input.GetAxis("Mouse X") * this.sensitivityX;
				this.rotationX = MouseLook.ClampAngle(this.rotationX, this.minimumX, this.maximumX);
				Quaternion rhs3 = Quaternion.AngleAxis(this.rotationX, Vector3.up);
				base.transform.localRotation = this.originalRotation * rhs3;
			}
			else
			{
				this.rotationY += Input.GetAxis("Mouse Y") * this.sensitivityY;
				this.rotationY = MouseLook.ClampAngle(this.rotationY, this.minimumY, this.maximumY);
				Quaternion rhs4 = Quaternion.AngleAxis(this.rotationY, Vector3.left);
				base.transform.localRotation = this.originalRotation * rhs4;
			}
		}
		Vector3 vector = new Vector3(Input.GetAxis("Horizontal"), 0f, Input.GetAxis("Vertical"));
		vector = base.transform.TransformDirection(vector);
		vector *= 10f;
		float num = (!Input.GetKey(KeyCode.LeftShift)) ? 50f : 150f;
		float num2 = Input.GetAxis("Vertical") * this.forwardSpeedScale * num;
		float num3 = Input.GetAxis("Horizontal") * this.strafeSpeedScale * num;
		if (num2 != 0f)
		{
			base.transform.position += base.transform.forward * num2;
		}
		if (num3 != 0f)
		{
			base.transform.position += base.transform.right * num3;
		}
	}

	// Token: 0x06000035 RID: 53 RVA: 0x00004598 File Offset: 0x00002998
	private void Start()
	{
		if (base.GetComponent<Rigidbody>())
		{
			base.GetComponent<Rigidbody>().freezeRotation = true;
		}
		this.originalRotation = base.transform.localRotation;
		this.look = false;
	}

	// Token: 0x06000036 RID: 54 RVA: 0x000045CE File Offset: 0x000029CE
	public static float ClampAngle(float angle, float min, float max)
	{
		if (angle < -360f)
		{
			angle += 360f;
		}
		if (angle > 360f)
		{
			angle -= 360f;
		}
		return Mathf.Clamp(angle, min, max);
	}

	// Token: 0x0400009A RID: 154
	public MouseLook.RotationAxes axes;

	// Token: 0x0400009B RID: 155
	public float sensitivityX = 3f;

	// Token: 0x0400009C RID: 156
	public float sensitivityY = 3f;

	// Token: 0x0400009D RID: 157
	public float minimumX = -360f;

	// Token: 0x0400009E RID: 158
	public float maximumX = 360f;

	// Token: 0x0400009F RID: 159
	public float minimumY = -80f;

	// Token: 0x040000A0 RID: 160
	public float maximumY = 80f;

	// Token: 0x040000A1 RID: 161
	public float forwardSpeedScale = 0.03f;

	// Token: 0x040000A2 RID: 162
	public float strafeSpeedScale = 0.03f;

	// Token: 0x040000A3 RID: 163
	private float rotationX;

	// Token: 0x040000A4 RID: 164
	private float rotationY;

	// Token: 0x040000A5 RID: 165
	private bool look;

	// Token: 0x040000A6 RID: 166
	private Quaternion originalRotation;

	// Token: 0x0200000D RID: 13
	public enum RotationAxes
	{
		// Token: 0x040000A8 RID: 168
		MouseXAndY,
		// Token: 0x040000A9 RID: 169
		MouseX,
		// Token: 0x040000AA RID: 170
		MouseY
	}
}
