using System;

namespace Steamworks
{
	[Serializable]
	public struct UGCUpdateHandle_t
	{
		public UGCUpdateHandle_t(ulong value) : this()
		{
		}

		public ulong m_UGCUpdateHandle;
	}
}
