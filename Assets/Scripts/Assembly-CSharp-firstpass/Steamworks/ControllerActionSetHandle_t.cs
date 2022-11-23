using System;

namespace Steamworks
{
	[Serializable]
	public struct ControllerActionSetHandle_t
	{
		public ControllerActionSetHandle_t(ulong value) : this()
		{
		}

		public ulong m_ControllerActionSetHandle;
	}
}
