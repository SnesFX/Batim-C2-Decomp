using System;

namespace Steamworks
{
	[Serializable]
	public struct PublishedFileId_t
	{
		public PublishedFileId_t(ulong value) : this()
		{
		}

		public ulong m_PublishedFileId;
	}
}
