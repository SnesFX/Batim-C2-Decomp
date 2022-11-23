using System;

namespace Steamworks
{
	[Serializable]
	public struct ClientUnifiedMessageHandle
	{
		public ClientUnifiedMessageHandle(ulong value) : this()
		{
		}

		public ulong m_ClientUnifiedMessageHandle;
	}
}
