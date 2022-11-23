using System;
using UnityEngine;
using UnityEngine.Rendering;

namespace ProCore.Decals
{
	// Token: 0x0200017F RID: 383
	public class qd_Mesh
	{
		// Token: 0x06000653 RID: 1619 RVA: 0x0003AE58 File Offset: 0x00039258
		public static GameObject CreateDecal(Material mat, Rect uvCoords, float scale)
		{
			GameObject gameObject = new GameObject();
			gameObject.name = "Decal" + gameObject.GetInstanceID();
			gameObject.AddComponent<MeshFilter>().sharedMesh = qd_Mesh.DecalMesh("DecalMesh" + gameObject.GetInstanceID(), mat, uvCoords, scale);
			gameObject.AddComponent<MeshRenderer>().sharedMaterial = mat;
			gameObject.GetComponent<MeshRenderer>().shadowCastingMode = ShadowCastingMode.Off;
			qd_Decal qd_Decal = gameObject.AddComponent<qd_Decal>();
			qd_Decal.SetScale(scale);
			qd_Decal.SetTexture((Texture2D)mat.mainTexture);
			qd_Decal.SetUVRect(uvCoords);
			return gameObject;
		}

		// Token: 0x06000654 RID: 1620 RVA: 0x0003AEF0 File Offset: 0x000392F0
		public static Mesh DecalMesh(string name, Material mat, Rect uvCoords, float scale)
		{
			float num = uvCoords.width;
			float num2 = uvCoords.height;
			if (mat != null && mat.mainTexture != null)
			{
				if (mat.mainTexture.width > mat.mainTexture.height)
				{
					num2 *= (float)mat.mainTexture.height / (float)mat.mainTexture.width;
				}
				else
				{
					num *= (float)mat.mainTexture.width / (float)mat.mainTexture.height;
				}
			}
			Vector3 b = (num <= num2) ? new Vector3(num / num2, 1f, 1f) : new Vector3(1f, num2 / num, 1f);
			Mesh mesh = new Mesh();
			Vector3[] array = new Vector3[4];
			for (int i = 0; i < 4; i++)
			{
				array[i] = Vector3.Scale(qd_Mesh.BILLBOARD_VERTICES[i], b) * scale;
			}
			Vector2[] uv = new Vector2[]
			{
				new Vector2(uvCoords.x + uvCoords.width, uvCoords.y),
				new Vector2(uvCoords.x, uvCoords.y),
				new Vector2(uvCoords.x + uvCoords.width, uvCoords.y + uvCoords.height),
				new Vector2(uvCoords.x, uvCoords.y + uvCoords.height)
			};
			mesh.vertices = array;
			mesh.triangles = qd_Mesh.BILLBOARD_TRIANGLES;
			mesh.normals = qd_Mesh.BILLBOARD_NORMALS;
			mesh.tangents = qd_Mesh.BILLBOARD_TANGENTS;
			mesh.uv = uv;
			mesh.uv2 = qd_Mesh.BILLBOARD_UV2;
			mesh.name = name;
			return mesh;
		}

		// Token: 0x04000535 RID: 1333
		private static int[] BILLBOARD_TRIANGLES = new int[]
		{
			0,
			1,
			2,
			1,
			3,
			2
		};

		// Token: 0x04000536 RID: 1334
		private static Vector3[] BILLBOARD_VERTICES = new Vector3[]
		{
			new Vector3(-0.5f, -0.5f, 0f),
			new Vector3(0.5f, -0.5f, 0f),
			new Vector3(-0.5f, 0.5f, 0f),
			new Vector3(0.5f, 0.5f, 0f)
		};

		// Token: 0x04000537 RID: 1335
		private static Vector3[] BILLBOARD_NORMALS = new Vector3[]
		{
			Vector3.forward,
			Vector3.forward,
			Vector3.forward,
			Vector3.forward
		};

		// Token: 0x04000538 RID: 1336
		private static Vector4[] BILLBOARD_TANGENTS = new Vector4[]
		{
			Vector3.right,
			Vector3.right,
			Vector3.right,
			Vector3.right
		};

		// Token: 0x04000539 RID: 1337
		private static Vector2[] BILLBOARD_UV2 = new Vector2[]
		{
			Vector2.zero,
			Vector2.right,
			Vector2.up,
			Vector2.one
		};
	}
}
