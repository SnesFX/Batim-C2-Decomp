using System;
using UnityEngine;

namespace ProCore.Decals
{
	// Token: 0x02000177 RID: 375
	[Serializable]
	public class Decal
	{
		// Token: 0x06000634 RID: 1588 RVA: 0x0003A0A2 File Offset: 0x000384A2
		public Decal()
		{
		}

		// Token: 0x06000635 RID: 1589 RVA: 0x0003A0AC File Offset: 0x000384AC
		public Decal(Texture2D img)
		{
			this.name = img.name;
			this.texture = img;
			this.materialId = string.Empty;
			this.isPacked = false;
			this.rotation = new Vector3(-45f, 45f, 0f);
			this.scale = new Vector3(0.8f, 1.2f, 1f);
			this.atlasRect = new Rect(0f, 0f, 0f, 0f);
		}

		// Token: 0x06000636 RID: 1590 RVA: 0x0003A138 File Offset: 0x00038538
		public override string ToString()
		{
			return string.Concat(new object[]
			{
				this.name,
				"(Org: ",
				this.orgIndex,
				" Atlas: ",
				this.atlasIndex,
				" Packed: ",
				this.isPacked,
				")"
			});
		}

		// Token: 0x06000637 RID: 1591 RVA: 0x0003A1A4 File Offset: 0x000385A4
		public static bool Deserialize(string txt, out Decal decal)
		{
			decal = new Decal();
			string[] array = txt.Replace("{", string.Empty).Replace("}", string.Empty).Trim().Split(new char[]
			{
				'\n'
			});
			if (array.Length < 11)
			{
				return false;
			}
			decal.name = array[0];
			decal.id = array[1];
			decal.rotation = Decal.DefaultRotation;
			if (!Decal.Vec3WithString(array[2], ref decal.rotation))
			{
				Debug.LogWarning("Failed parsing default rotation values.  Using defaults.");
			}
			decal.scale = Decal.DefaultScale;
			if (!Decal.Vec3WithString(array[3], ref decal.scale))
			{
				Debug.LogWarning("Failed parsing default scale values.  Using defaults.");
			}
			Vector4 one = Vector4.one;
			if (!Decal.Vec4WithString(array[4], ref one))
			{
				Debug.LogWarning("Failed parsing atlas rect.  Using default.");
			}
			decal.atlasRect = Decal.Vec4ToRect(one);
			decal.orgGroup = 0;
			if (!int.TryParse(array[5], out decal.orgGroup))
			{
				Debug.LogWarning("Failed parsing organizational group.  Setting to group 0");
			}
			decal.atlasGroup = 0;
			if (!int.TryParse(array[6], out decal.atlasGroup))
			{
				Debug.LogWarning("Failed parsing atlas group.  Setting to group 0");
			}
			decal.orgIndex = 0;
			if (!int.TryParse(array[7], out decal.orgIndex))
			{
				Debug.LogWarning("Failed parsing organizational group.  Setting to group 0");
			}
			decal.atlasIndex = 0;
			if (!int.TryParse(array[8], out decal.atlasIndex))
			{
				Debug.LogWarning("Failed parsing atlas group.  Setting to group 0");
			}
			decal.rotationPlacement = Placement.Fixed;
			int num;
			if (!int.TryParse(array[9], out num))
			{
				Debug.LogWarning("Failed parsing rotationPlacement.  Setting to \"Fixed\"");
			}
			else
			{
				decal.rotationPlacement = (Placement)num;
			}
			decal.scalePlacement = Placement.Fixed;
			if (!int.TryParse(array[10], out num))
			{
				Debug.LogWarning("Failed parsing scalePlacement.  Setting to \"Fixed\"");
			}
			else
			{
				decal.scalePlacement = (Placement)num;
			}
			bool flag = false;
			if (array.Length < 12 || !bool.TryParse(array[11], out flag))
			{
				flag = false;
				Debug.LogWarning("Failed parsing packed.  Setting to \"false\"");
			}
			else
			{
				decal.isPacked = flag;
			}
			return true;
		}

		// Token: 0x06000638 RID: 1592 RVA: 0x0003A3BC File Offset: 0x000387BC
		public string Serialize()
		{
			return string.Concat(new object[]
			{
				"{\n",
				this.name.Replace(",", "\\,"),
				"\n",
				this.id,
				"\n",
				this.rotation.ToString(),
				"\n",
				this.scale.ToString(),
				"\n(",
				this.atlasRect.xMin,
				", ",
				this.atlasRect.yMin,
				", ",
				this.atlasRect.width,
				", ",
				this.atlasRect.height,
				")\n",
				this.orgGroup,
				"\n",
				this.atlasGroup,
				"\n",
				this.orgIndex,
				"\n",
				this.atlasIndex,
				"\n",
				(int)this.rotationPlacement,
				"\n",
				(int)this.scalePlacement,
				"\n",
				this.isPacked,
				"\n}"
			});
		}

		// Token: 0x06000639 RID: 1593 RVA: 0x0003A564 File Offset: 0x00038964
		private static bool Vec3WithString(string str, ref Vector3 vec3)
		{
			string[] array = str.Replace("(", string.Empty).Replace(")", string.Empty).Split(new char[]
			{
				','
			});
			float x;
			if (!float.TryParse(array[0], out x))
			{
				return false;
			}
			float y;
			if (!float.TryParse(array[1], out y))
			{
				return false;
			}
			float z;
			if (!float.TryParse(array[2], out z))
			{
				return false;
			}
			vec3 = new Vector3(x, y, z);
			return true;
		}

		// Token: 0x0600063A RID: 1594 RVA: 0x0003A5E0 File Offset: 0x000389E0
		private static bool Vec4WithString(string str, ref Vector4 vec4)
		{
			string[] array = str.Replace("(", string.Empty).Replace(")", string.Empty).Split(new char[]
			{
				','
			});
			float x;
			if (!float.TryParse(array[0], out x))
			{
				return false;
			}
			float y;
			if (!float.TryParse(array[1], out y))
			{
				return false;
			}
			float z;
			if (!float.TryParse(array[2], out z))
			{
				return false;
			}
			float w;
			if (!float.TryParse(array[3], out w))
			{
				return false;
			}
			vec4 = new Vector4(x, y, z, w);
			return true;
		}

		// Token: 0x0600063B RID: 1595 RVA: 0x0003A66D File Offset: 0x00038A6D
		private static Rect Vec4ToRect(Vector4 v)
		{
			return new Rect(v.x, v.y, v.z, v.w);
		}

		// Token: 0x0400050F RID: 1295
		private static Vector3 DefaultRotation = new Vector3(-45f, 45f, 0f);

		// Token: 0x04000510 RID: 1296
		private static Vector3 DefaultScale = new Vector3(0.8f, 1.2f, 1f);

		// Token: 0x04000511 RID: 1297
		public string name;

		// Token: 0x04000512 RID: 1298
		public string id;

		// Token: 0x04000513 RID: 1299
		public bool isPacked;

		// Token: 0x04000514 RID: 1300
		public string materialId;

		// Token: 0x04000515 RID: 1301
		public Vector3 rotation;

		// Token: 0x04000516 RID: 1302
		public Vector3 scale;

		// Token: 0x04000517 RID: 1303
		public Rect atlasRect;

		// Token: 0x04000518 RID: 1304
		public int orgGroup;

		// Token: 0x04000519 RID: 1305
		public int orgIndex;

		// Token: 0x0400051A RID: 1306
		public int atlasGroup;

		// Token: 0x0400051B RID: 1307
		public int atlasIndex;

		// Token: 0x0400051C RID: 1308
		public Placement rotationPlacement;

		// Token: 0x0400051D RID: 1309
		public Placement scalePlacement;

		// Token: 0x0400051E RID: 1310
		public Texture2D texture;
	}
}
