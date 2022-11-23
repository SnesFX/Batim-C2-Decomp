using System;

namespace Steamworks
{
	[Serializable]
	public struct PublishedFileUpdateHandle_t
	{
		public PublishedFileUpdateHandle_t(ulong value) : this()
		{
		}

		public ulong m_PublishedFileUpdateHandle;
	}
}
