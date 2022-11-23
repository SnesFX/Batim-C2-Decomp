using System;

namespace InControl
{
	public struct VersionInfo
	{
		public VersionInfo(int major, int minor, int patch, int build) : this()
		{
		}

		public int Major;
		public int Minor;
		public int Patch;
		public int Build;
	}
}
