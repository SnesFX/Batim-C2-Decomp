using System;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200025A RID: 602
public class ChapterCollectable : Interactable
{
	// Token: 0x06000C74 RID: 3188 RVA: 0x00075BB6 File Offset: 0x00073FB6
	public void Activate(ChapterManager chapterManager)
	{
		this.m_ChapterManager = chapterManager;
		base.SetActive(true);
	}

	// Token: 0x06000C75 RID: 3189 RVA: 0x00075BC8 File Offset: 0x00073FC8
	public override void OnInteract()
	{
		this.m_Active = false;
		if (this.m_ChapterManager != null)
		{
			this.m_ChapterManager.Collect();
		}
		if (this.m_CollectedLocation != null)
		{
			base.transform.SetParent(this.m_CollectedLocation);
			base.transform.localPosition = Vector3.zero;
			base.transform.localEulerAngles = Vector3.zero;
			this.m_CollectedAnimator.DOKill(false);
			this.m_CollectedAnimator.DOLocalRotate(this.m_Rotation, 5f, RotateMode.LocalAxisAdd).SetEase(Ease.Linear).SetLoops(-1, LoopType.Restart);
		}
		else
		{
			base.Dispose();
		}
	}

	// Token: 0x06000C76 RID: 3190 RVA: 0x00075C74 File Offset: 0x00074074
	public void Dissolve()
	{
		if (Shader.Find("Shader Forge/DissolveShader").isSupported)
		{
			for (int i = 0; i < this.m_MaterialDatas.Count; i++)
			{
				Interactable.MaterialData materialData = this.m_MaterialDatas[i];
				materialData.MeshRenderer.material = new Material(this.m_DissolveMaterial);
				materialData.MeshRenderer.material.SetFloat("_DissolveAmount", 0f);
				materialData.MeshRenderer.material.DOFloat(1f, "_DissolveAmount", 10f).OnComplete(new TweenCallback(base.Dispose));
			}
		}
		else
		{
			base.Dispose();
		}
	}

	// Token: 0x06000C77 RID: 3191 RVA: 0x00075D2A File Offset: 0x0007412A
	protected override void OnDisposed()
	{
		this.m_ChapterManager = null;
		if (this.m_CollectedAnimator != null)
		{
			this.m_CollectedAnimator.DOKill(false);
		}
		base.OnDisposed();
	}

	// Token: 0x04000E7B RID: 3707
	[Header("Transforms")]
	[SerializeField]
	private Transform m_CollectedAnimator;

	// Token: 0x04000E7C RID: 3708
	[SerializeField]
	private Transform m_CollectedLocation;

	// Token: 0x04000E7D RID: 3709
	[Header("Materials")]
	[SerializeField]
	private Material m_DissolveMaterial;

	// Token: 0x04000E7E RID: 3710
	[Header("Rotation")]
	[SerializeField]
	private Vector3 m_Rotation = new Vector3(0f, 0f, 360f);

	// Token: 0x04000E7F RID: 3711
	private ChapterManager m_ChapterManager;
}
