using System;
using ProCore.Decals;
using UnityEngine;

// Token: 0x0200017B RID: 379
[RequireComponent(typeof(MeshRenderer))]
[RequireComponent(typeof(MeshFilter))]
[ExecuteInEditMode]
public class qd_Decal : MonoBehaviour
{
	// Token: 0x17000144 RID: 324
	// (get) Token: 0x06000649 RID: 1609 RVA: 0x0003AB43 File Offset: 0x00038F43
	public Texture2D texture
	{
		get
		{
			return this._texture;
		}
	}

	// Token: 0x0600064A RID: 1610 RVA: 0x0003AB4B File Offset: 0x00038F4B
	private void Awake()
	{
		this.Verify();
	}

	// Token: 0x0600064B RID: 1611 RVA: 0x0003AB53 File Offset: 0x00038F53
	public void SetScale(float scale)
	{
		this._scale = scale;
	}

	// Token: 0x0600064C RID: 1612 RVA: 0x0003AB5C File Offset: 0x00038F5C
	public void SetTexture(Texture2D tex)
	{
		this._texture = tex;
	}

	// Token: 0x0600064D RID: 1613 RVA: 0x0003AB68 File Offset: 0x00038F68
	public void SetUVRect(Rect r)
	{
		this._rect = r;
		Vector2[] uv = new Vector2[]
		{
			new Vector2(this._rect.x + this._rect.width, this._rect.y),
			new Vector2(this._rect.x, this._rect.y),
			new Vector2(this._rect.x + this._rect.width, this._rect.y + this._rect.height),
			new Vector2(this._rect.x, this._rect.y + this._rect.height)
		};
		base.GetComponent<MeshFilter>().sharedMesh.uv = uv;
	}

	// Token: 0x0600064E RID: 1614 RVA: 0x0003AC60 File Offset: 0x00039060
	public void FreezeTransform()
	{
		Vector3 localScale = base.transform.localScale;
		Mesh sharedMesh = base.transform.GetComponent<MeshFilter>().sharedMesh;
		Vector3[] vertices = sharedMesh.vertices;
		for (int i = 0; i < vertices.Length; i++)
		{
			vertices[i] = Vector3.Scale(vertices[i], localScale);
		}
		sharedMesh.vertices = vertices;
		base.transform.localScale = Vector3.one;
	}

	// Token: 0x0600064F RID: 1615 RVA: 0x0003ACDC File Offset: 0x000390DC
	public void Verify()
	{
		Material material = base.GetComponent<MeshRenderer>().sharedMaterial;
		if (material == null)
		{
			GameObject[] array = qdUtil.FindDecalsWithTexture(this._texture);
			array = Array.FindAll<GameObject>(array, (GameObject x) => x.GetComponent<MeshRenderer>().sharedMaterial != null);
			if (array == null || array.Length < 1)
			{
				material = new Material(Shader.Find("Transparent/Diffuse"));
				material.mainTexture = this._texture;
			}
			else
			{
				material = array[0].GetComponent<MeshRenderer>().sharedMaterial;
			}
			base.GetComponent<MeshRenderer>().sharedMaterial = material;
		}
		if (base.GetComponent<MeshFilter>().sharedMesh == null)
		{
			base.GetComponent<MeshFilter>().sharedMesh = qd_Mesh.DecalMesh("DecalMesh" + base.GetInstanceID(), material, this._rect, this._scale);
		}
	}

	// Token: 0x04000529 RID: 1321
	[HideInInspector]
	[SerializeField]
	private Texture2D _texture;

	// Token: 0x0400052A RID: 1322
	[HideInInspector]
	[SerializeField]
	private Rect _rect;

	// Token: 0x0400052B RID: 1323
	[HideInInspector]
	[SerializeField]
	private float _scale;
}
