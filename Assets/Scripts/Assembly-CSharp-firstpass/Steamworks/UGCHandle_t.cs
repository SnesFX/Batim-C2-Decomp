using System;

namespace Steamworks
{
	[Serializable]
	public struct UGCHandle_t
	{
		public UGCHandle_t(ulong value) : this()
		{
		}

		public ulong m_UGCHandle;
	}
}
