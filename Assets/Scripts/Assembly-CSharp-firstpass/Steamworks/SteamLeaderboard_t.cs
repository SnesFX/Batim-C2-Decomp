using System;

namespace Steamworks
{
	[Serializable]
	public struct SteamLeaderboard_t
	{
		public SteamLeaderboard_t(ulong value) : this()
		{
		}

		public ulong m_SteamLeaderboard;
	}
}
