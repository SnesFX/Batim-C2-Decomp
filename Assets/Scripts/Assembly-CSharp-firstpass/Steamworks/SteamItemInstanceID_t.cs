using System;

namespace Steamworks
{
	[Serializable]
	public struct SteamItemInstanceID_t
	{
		public SteamItemInstanceID_t(ulong value) : this()
		{
		}

		public ulong m_SteamItemInstanceID;
	}
}
