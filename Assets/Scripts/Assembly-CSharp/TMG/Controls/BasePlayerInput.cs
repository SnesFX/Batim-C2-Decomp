using System;
using InControl;
using TMG.GamepadControl;
using UnityEngine;

namespace TMG.Controls
{
	// Token: 0x020002A5 RID: 677
	public class BasePlayerInput
	{
		// Token: 0x06000FAD RID: 4013 RVA: 0x00085635 File Offset: 0x00083A35
		public static bool VirtualMouseLeftOnPressed()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetMouseButtonDown(0));
		}

		// Token: 0x06000FAE RID: 4014 RVA: 0x00085649 File Offset: 0x00083A49
		public static bool VirtualMouseLeftOnReleased()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetMouseButtonUp(0));
		}

		// Token: 0x06000FAF RID: 4015 RVA: 0x0008565D File Offset: 0x00083A5D
		public static bool VirtualMouseRightOnPressed()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetMouseButtonDown(1));
		}

		// Token: 0x06000FB0 RID: 4016 RVA: 0x00085671 File Offset: 0x00083A71
		public static bool VirtualMouseRightOnReleased()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetMouseButtonUp(1));
		}

		// Token: 0x06000FB1 RID: 4017 RVA: 0x00085685 File Offset: 0x00083A85
		public static bool VirtualMouseMiddleOnPressed()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetMouseButtonDown(2));
		}

		// Token: 0x06000FB2 RID: 4018 RVA: 0x00085699 File Offset: 0x00083A99
		public static bool VirtualMouseMiddleOnReleased()
		{
			return BasePlayerInput.GetInput<bool>(Input.GetMouseButtonUp(2));
		}

		// Token: 0x06000FB3 RID: 4019 RVA: 0x000856B0 File Offset: 0x00083AB0
		protected static T GetInput<T>(T inputKeyboard)
		{
			T result = default(T);

			if (!inputKeyboard.Equals(default(T)))
			{
				result = inputKeyboard;
			}
			return result;
		}
	}
}
