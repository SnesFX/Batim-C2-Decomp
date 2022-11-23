using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005DE RID: 1502
	[Serializable]
	public class TMP_TextInfo
	{
		// Token: 0x06002BB0 RID: 11184 RVA: 0x0010B500 File Offset: 0x00109700
		public TMP_TextInfo()
		{
			this.characterInfo = new TMP_CharacterInfo[8];
			this.wordInfo = new TMP_WordInfo[16];
			this.linkInfo = new TMP_LinkInfo[0];
			this.lineInfo = new TMP_LineInfo[2];
			this.pageInfo = new TMP_PageInfo[16];
			this.meshInfo = new TMP_MeshInfo[1];
		}

		// Token: 0x06002BB1 RID: 11185 RVA: 0x0010B560 File Offset: 0x00109760
		public TMP_TextInfo(TMP_Text textComponent)
		{
			this.textComponent = textComponent;
			this.characterInfo = new TMP_CharacterInfo[8];
			this.wordInfo = new TMP_WordInfo[4];
			this.linkInfo = new TMP_LinkInfo[0];
			this.lineInfo = new TMP_LineInfo[2];
			this.pageInfo = new TMP_PageInfo[16];
			this.meshInfo = new TMP_MeshInfo[1];
			this.meshInfo[0].mesh = textComponent.mesh;
			this.materialCount = 1;
		}

		// Token: 0x06002BB2 RID: 11186 RVA: 0x0010B5E4 File Offset: 0x001097E4
		public void Clear()
		{
			this.characterCount = 0;
			this.spaceCount = 0;
			this.wordCount = 0;
			this.linkCount = 0;
			this.lineCount = 0;
			this.pageCount = 0;
			this.spriteCount = 0;
			for (int i = 0; i < this.meshInfo.Length; i++)
			{
				this.meshInfo[i].vertexCount = 0;
			}
		}

		// Token: 0x06002BB3 RID: 11187 RVA: 0x0010B650 File Offset: 0x00109850
		public void ClearMeshInfo(bool updateMesh)
		{
			for (int i = 0; i < this.meshInfo.Length; i++)
			{
				this.meshInfo[i].Clear(updateMesh);
			}
		}

		// Token: 0x06002BB4 RID: 11188 RVA: 0x0010B688 File Offset: 0x00109888
		public void ClearAllMeshInfo()
		{
			for (int i = 0; i < this.meshInfo.Length; i++)
			{
				this.meshInfo[i].Clear(true);
			}
		}

		// Token: 0x06002BB5 RID: 11189 RVA: 0x0010B6C0 File Offset: 0x001098C0
		public void ResetVertexLayout(bool isVolumetric)
		{
			for (int i = 0; i < this.meshInfo.Length; i++)
			{
				this.meshInfo[i].ResizeMeshInfo(0, isVolumetric);
			}
		}

		// Token: 0x06002BB6 RID: 11190 RVA: 0x0010B6FC File Offset: 0x001098FC
		public void ClearUnusedVertices(MaterialReference[] materials)
		{
			for (int i = 0; i < this.meshInfo.Length; i++)
			{
				int startIndex = 0;
				this.meshInfo[i].ClearUnusedVertices(startIndex);
			}
		}

		// Token: 0x06002BB7 RID: 11191 RVA: 0x0010B738 File Offset: 0x00109938
		public void ClearLineInfo()
		{
			if (this.lineInfo == null)
			{
				this.lineInfo = new TMP_LineInfo[2];
			}
			for (int i = 0; i < this.lineInfo.Length; i++)
			{
				this.lineInfo[i].characterCount = 0;
				this.lineInfo[i].spaceCount = 0;
				this.lineInfo[i].width = 0f;
				this.lineInfo[i].ascender = TMP_TextInfo.k_InfinityVectorNegative.x;
				this.lineInfo[i].descender = TMP_TextInfo.k_InfinityVectorPositive.x;
				this.lineInfo[i].lineExtents.min = TMP_TextInfo.k_InfinityVectorPositive;
				this.lineInfo[i].lineExtents.max = TMP_TextInfo.k_InfinityVectorNegative;
				this.lineInfo[i].maxAdvance = 0f;
			}
		}

		// Token: 0x06002BB8 RID: 11192 RVA: 0x0010B834 File Offset: 0x00109A34
		public TMP_MeshInfo[] CopyMeshInfoVertexData()
		{
			if (this.m_CachedMeshInfo == null || this.m_CachedMeshInfo.Length != this.meshInfo.Length)
			{
				this.m_CachedMeshInfo = new TMP_MeshInfo[this.meshInfo.Length];
				for (int i = 0; i < this.m_CachedMeshInfo.Length; i++)
				{
					int num = this.meshInfo[i].vertices.Length;
					this.m_CachedMeshInfo[i].vertices = new Vector3[num];
					this.m_CachedMeshInfo[i].uvs0 = new Vector2[num];
					this.m_CachedMeshInfo[i].uvs2 = new Vector2[num];
					this.m_CachedMeshInfo[i].colors32 = new Color32[num];
				}
			}
			for (int j = 0; j < this.m_CachedMeshInfo.Length; j++)
			{
				int num2 = this.meshInfo[j].vertices.Length;
				if (this.m_CachedMeshInfo[j].vertices.Length != num2)
				{
					this.m_CachedMeshInfo[j].vertices = new Vector3[num2];
					this.m_CachedMeshInfo[j].uvs0 = new Vector2[num2];
					this.m_CachedMeshInfo[j].uvs2 = new Vector2[num2];
					this.m_CachedMeshInfo[j].colors32 = new Color32[num2];
				}
				Array.Copy(this.meshInfo[j].vertices, this.m_CachedMeshInfo[j].vertices, num2);
				Array.Copy(this.meshInfo[j].uvs0, this.m_CachedMeshInfo[j].uvs0, num2);
				Array.Copy(this.meshInfo[j].uvs2, this.m_CachedMeshInfo[j].uvs2, num2);
				Array.Copy(this.meshInfo[j].colors32, this.m_CachedMeshInfo[j].colors32, num2);
			}
			return this.m_CachedMeshInfo;
		}

		// Token: 0x06002BB9 RID: 11193 RVA: 0x0010BA48 File Offset: 0x00109C48
		public static void Resize<T>(ref T[] array, int size)
		{
			int newSize = (size <= 1024) ? Mathf.NextPowerOfTwo(size) : (size + 256);
			Array.Resize<T>(ref array, newSize);
		}

		// Token: 0x06002BBA RID: 11194 RVA: 0x0001F88F File Offset: 0x0001DA8F
		public static void Resize<T>(ref T[] array, int size, bool isBlockAllocated)
		{
			if (isBlockAllocated)
			{
				size = ((size <= 1024) ? Mathf.NextPowerOfTwo(size) : (size + 256));
			}
			if (size == array.Length)
			{
				return;
			}
			Array.Resize<T>(ref array, size);
		}

		// Token: 0x040030AC RID: 12460
		private static Vector2 k_InfinityVectorPositive = new Vector2(1000000f, 1000000f);

		// Token: 0x040030AD RID: 12461
		private static Vector2 k_InfinityVectorNegative = new Vector2(-1000000f, -1000000f);

		// Token: 0x040030AE RID: 12462
		public TMP_Text textComponent;

		// Token: 0x040030AF RID: 12463
		public int characterCount;

		// Token: 0x040030B0 RID: 12464
		public int spriteCount;

		// Token: 0x040030B1 RID: 12465
		public int spaceCount;

		// Token: 0x040030B2 RID: 12466
		public int wordCount;

		// Token: 0x040030B3 RID: 12467
		public int linkCount;

		// Token: 0x040030B4 RID: 12468
		public int lineCount;

		// Token: 0x040030B5 RID: 12469
		public int pageCount;

		// Token: 0x040030B6 RID: 12470
		public int materialCount;

		// Token: 0x040030B7 RID: 12471
		public TMP_CharacterInfo[] characterInfo;

		// Token: 0x040030B8 RID: 12472
		public TMP_WordInfo[] wordInfo;

		// Token: 0x040030B9 RID: 12473
		public TMP_LinkInfo[] linkInfo;

		// Token: 0x040030BA RID: 12474
		public TMP_LineInfo[] lineInfo;

		// Token: 0x040030BB RID: 12475
		public TMP_PageInfo[] pageInfo;

		// Token: 0x040030BC RID: 12476
		public TMP_MeshInfo[] meshInfo;

		// Token: 0x040030BD RID: 12477
		private TMP_MeshInfo[] m_CachedMeshInfo;
	}
}
