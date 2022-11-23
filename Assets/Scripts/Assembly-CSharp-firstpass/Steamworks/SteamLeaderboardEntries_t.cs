using System;

namespace Steamworks
{
	[Serializable]
	public struct SteamLeaderboardEntries_t
	{
		public SteamLeaderboardEntries_t(ulong value) : this()
		{
		}

		public ulong m_SteamLeaderboardEntries;
	}
}
