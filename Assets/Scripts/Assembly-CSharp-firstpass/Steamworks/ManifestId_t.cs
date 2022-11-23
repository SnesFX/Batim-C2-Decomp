using System;

namespace Steamworks
{
	[Serializable]
	public struct ManifestId_t
	{
		public ManifestId_t(ulong value) : this()
		{
		}

		public ulong m_ManifestId;
	}
}
