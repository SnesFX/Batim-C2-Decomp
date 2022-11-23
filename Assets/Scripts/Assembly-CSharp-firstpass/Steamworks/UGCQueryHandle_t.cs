using System;

namespace Steamworks
{
	[Serializable]
	public struct UGCQueryHandle_t
	{
		public UGCQueryHandle_t(ulong value) : this()
		{
		}

		public ulong m_UGCQueryHandle;
	}
}
