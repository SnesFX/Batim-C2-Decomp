using System;

namespace Steamworks
{
	[Serializable]
	public struct HTTPRequestHandle
	{
		public HTTPRequestHandle(uint value) : this()
		{
		}

		public uint m_HTTPRequestHandle;
	}
}
