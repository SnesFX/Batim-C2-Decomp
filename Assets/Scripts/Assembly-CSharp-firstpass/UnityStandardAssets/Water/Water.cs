using UnityEngine;

namespace UnityStandardAssets.Water
{
	public class Water : MonoBehaviour
	{
		public enum WaterMode
		{
			Simple = 0,
			Reflective = 1,
			Refractive = 2,
		}

		public WaterMode waterMode;
		public bool disablePixelLights;
		public int textureSize;
		public float clipPlaneOffset;
		public LayerMask reflectLayers;
		public LayerMask refractLayers;
	}
}
