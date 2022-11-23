using System;

namespace Steamworks
{
	[Serializable]
	public struct HAuthTicket
	{
		public HAuthTicket(uint value) : this()
		{
		}

		public uint m_HAuthTicket;
	}
}
