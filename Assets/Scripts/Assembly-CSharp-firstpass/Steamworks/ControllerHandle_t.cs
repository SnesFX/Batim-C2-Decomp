using System;

namespace Steamworks
{
	[Serializable]
	public struct ControllerHandle_t
	{
		public ControllerHandle_t(ulong value) : this()
		{
		}

		public ulong m_ControllerHandle;
	}
}
