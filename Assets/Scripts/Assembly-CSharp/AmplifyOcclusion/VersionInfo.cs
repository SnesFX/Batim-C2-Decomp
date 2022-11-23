using System;
using UnityEngine;

namespace AmplifyOcclusion
{
	[Serializable]
	public class VersionInfo
	{
		private VersionInfo()
		{
		}

		[SerializeField]
		private int m_major;
		[SerializeField]
		private int m_minor;
		[SerializeField]
		private int m_release;
	}
}
