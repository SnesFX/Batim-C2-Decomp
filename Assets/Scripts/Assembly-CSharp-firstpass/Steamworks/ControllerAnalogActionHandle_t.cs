using System;

namespace Steamworks
{
	[Serializable]
	public struct ControllerAnalogActionHandle_t
	{
		public ControllerAnalogActionHandle_t(ulong value) : this()
		{
		}

		public ulong m_ControllerAnalogActionHandle;
	}
}
