using System;

namespace Steamworks
{
	[Serializable]
	public struct CGameID
	{
		public CGameID(ulong GameID) : this()
		{
		}

		public ulong m_GameID;
	}
}
