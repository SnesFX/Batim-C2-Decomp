using System;

namespace Steamworks
{
	[Serializable]
	public struct SteamAPICall_t
	{
		public SteamAPICall_t(ulong value) : this()
		{
		}

		public ulong m_SteamAPICall;
	}
}
