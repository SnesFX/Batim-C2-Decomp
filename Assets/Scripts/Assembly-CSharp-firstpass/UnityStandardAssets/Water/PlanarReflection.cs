using UnityEngine;

namespace UnityStandardAssets.Water
{
	public class PlanarReflection : MonoBehaviour
	{
		public LayerMask reflectionMask;
		public bool reflectSkybox;
		public Color clearColor;
		public string reflectionSampler;
		public float clipPlaneOffset;
	}
}
