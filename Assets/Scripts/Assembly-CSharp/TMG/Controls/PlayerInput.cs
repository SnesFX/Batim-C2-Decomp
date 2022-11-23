using System;
using InControl;
using TMG.GamepadControl;
using UnityEngine;

namespace TMG.Controls
{
	// Token: 0x020002A7 RID: 679
	public class PlayerInput : BasePlayerInput
	{
		// Token: 0x06000FBB RID: 4027 RVA: 0x000857FA File Offset: 0x00083BFA
		public static bool Any()
		{
			return BasePlayerInput.GetInput<bool>(Input.anyKeyDown);
		}

		// Token: 0x06000FBC RID: 4028 RVA: 0x00085834 File Offset: 0x00083C34
		public static bool Attack()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetMouseButtonDown(0));
		}

		// Token: 0x06000FBD RID: 4029 RVA: 0x00085848 File Offset: 0x00083C48
		public static bool Run()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetKey(KeyCode.LeftShift));
		}

		// Token: 0x06000FBE RID: 4030 RVA: 0x0008586E File Offset: 0x00083C6E
		public static bool Jump()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetKeyDown(KeyCode.Space));
		}

		// Token: 0x06000FBF RID: 4031 RVA: 0x00085883 File Offset: 0x00083C83
		public static bool Pause()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetKeyDown(KeyCode.Escape));
		}

		// Token: 0x06000FC0 RID: 4032 RVA: 0x00085898 File Offset: 0x00083C98
		public static float MoveX()
		{
			return BasePlayerInput.GetInput<float>(Input.GetAxis("Horizontal"));
		}

		// Token: 0x06000FC1 RID: 4033 RVA: 0x000858B3 File Offset: 0x00083CB3
		public static float MoveY()
		{
			return BasePlayerInput.GetInput<float>( Input.GetAxis("Vertical"));
		}

		// Token: 0x06000FC2 RID: 4034 RVA: 0x000858D0 File Offset: 0x00083CD0
		public static float LookX()
		{
			return BasePlayerInput.GetInput<float>(Input.GetAxis("Mouse X"));
		}

		// Token: 0x06000FC3 RID: 4035 RVA: 0x00085904 File Offset: 0x00083D04
		public static float LookY()
		{
			return BasePlayerInput.GetInput<float>(Input.GetAxis("Mouse Y"));
		}

		// Token: 0x06000FC4 RID: 4036 RVA: 0x00085938 File Offset: 0x00083D38
		public static bool BackOnPressed()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetKeyDown(KeyCode.Q));
		}

		// Token: 0x06000FC5 RID: 4037 RVA: 0x0008594D File Offset: 0x00083D4D
		public static bool InteractOnPressed()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetKeyDown(KeyCode.E));
		}

		// Token: 0x06000FC6 RID: 4038 RVA: 0x00085962 File Offset: 0x00083D62
		public static bool InteractOnReleased()
		{
			return BasePlayerInput.GetInput<bool>( Input.GetKeyUp(KeyCode.E));
		}
	}
}
