using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x020002CE RID: 718
public class Interactable : TMGMonoBehaviour
{
	// Token: 0x1400001C RID: 28
	// (add) Token: 0x06001055 RID: 4181 RVA: 0x00075440 File Offset: 0x00073840
	// (remove) Token: 0x06001056 RID: 4182 RVA: 0x00075478 File Offset: 0x00073878
	public event EventHandler OnInteracted;

	// Token: 0x170002BC RID: 700
	// (get) Token: 0x06001057 RID: 4183 RVA: 0x000754AE File Offset: 0x000738AE
	public bool isSingleInteraction
	{
		get
		{
			return this.m_EnableSingleInteraction;
		}
	}

	// Token: 0x170002BD RID: 701
	// (get) Token: 0x06001058 RID: 4184 RVA: 0x000754B6 File Offset: 0x000738B6
	// (set) Token: 0x06001059 RID: 4185 RVA: 0x000754BE File Offset: 0x000738BE
	public bool isInteracted { get; private set; }

	// Token: 0x170002BE RID: 702
	// (get) Token: 0x0600105A RID: 4186 RVA: 0x000754C7 File Offset: 0x000738C7
	public bool isHighlightEnabled
	{
		get
		{
			return this.m_EnableHighlight;
		}
	}

	// Token: 0x170002BF RID: 703
	// (get) Token: 0x0600105B RID: 4187 RVA: 0x000754CF File Offset: 0x000738CF
	// (set) Token: 0x0600105C RID: 4188 RVA: 0x000754D7 File Offset: 0x000738D7
	public bool isHighlighted { get; private set; }

	// Token: 0x0600105D RID: 4189 RVA: 0x000754E0 File Offset: 0x000738E0
	public override void Init()
	{
		if (this.m_EnableHighlight)
		{
			this.m_MaterialDatas = new List<Interactable.MaterialData>();
			if (this.m_HighlightMeshRenderers.Count <= 0)
			{
				MeshRenderer component = base.GetComponent<MeshRenderer>();
				if (component != null)
				{
					this.m_HighlightMeshRenderers.Add(component);
				}
			}
			for (int i = 0; i < this.m_HighlightMeshRenderers.Count; i++)
			{
				Interactable.MaterialData materialData = new Interactable.MaterialData();
				materialData.MeshRenderer = this.m_HighlightMeshRenderers[i];
				materialData.Materials = this.m_HighlightMeshRenderers[i].materials.ToList<Material>();
				for (int j = 0; j < materialData.Materials.Count; j++)
				{
					materialData.Materials[j].SetFloat("_HighlightStrength", 0f);
				}
				this.m_MaterialDatas.Add(materialData);
			}
		}
	}

	// Token: 0x0600105E RID: 4190 RVA: 0x000755C6 File Offset: 0x000739C6
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		if (this.m_EnableHighlight && this.m_HasShimmer)
		{
			base.StartCoroutine(this.FindTarget());
		}
	}

	// Token: 0x0600105F RID: 4191 RVA: 0x000755F4 File Offset: 0x000739F4
	private IEnumerator FindTarget()
	{
		while (this.m_Target == null)
		{
			if (GameManager.Instance.Player != null)
			{
				this.m_Target = GameManager.Instance.Player.transform;
			}
			yield return null;
		}
		yield break;
	}

	// Token: 0x06001060 RID: 4192 RVA: 0x00075610 File Offset: 0x00073A10
	private void Update()
	{
		if (!this.m_Active || !this.m_HasShimmer || !this.m_EnableHighlight || this.m_Target == null || this.m_HasInteractedOnce)
		{
			return;
		}
		if (this.m_ShimmerTimer < this.m_ShimmerTimerLimit)
		{
			this.m_ShimmerTimer += Time.deltaTime;
		}
		else
		{
			this.DOShimmer();
		}
	}

	// Token: 0x06001061 RID: 4193 RVA: 0x0007568C File Offset: 0x00073A8C
	private void DOShimmer()
	{
		this.ResetShimmer();
		if (Vector3.Distance(this.m_Target.position, base.transform.position) < 15f && !this.isHighlighted)
		{
			for (int i = 0; i < this.m_MaterialDatas.Count; i++)
			{
				Interactable.MaterialData materialData = this.m_MaterialDatas[i];
				for (int j = 0; j < materialData.Materials.Count; j++)
				{
					Material target = materialData.Materials[j];
					float num = 0f;
					float duration = 0.2f;
					Sequence s = DOTween.Sequence();
					s.Insert(num, target.DOFloat(0.1f, "_HighlightStrength", duration));
					num += 0.2f;
					s.Insert(num, target.DOFloat(0f, "_HighlightStrength", duration));
					num += 0.3f;
					s.Insert(num, target.DOFloat(0.1f, "_HighlightStrength", duration));
					num += 0.2f;
					s.Insert(num, target.DOFloat(0f, "_HighlightStrength", duration));
				}
			}
		}
	}

	// Token: 0x06001062 RID: 4194 RVA: 0x000757C4 File Offset: 0x00073BC4
	private void ResetShimmer()
	{
		if (!this.m_HasShimmer)
		{
			return;
		}
		this.m_ShimmerTimer = 0f;
	}

	// Token: 0x06001063 RID: 4195 RVA: 0x000757E0 File Offset: 0x00073BE0
	public void InteractEnter()
	{
		if (!this.m_Active)
		{
			return;
		}
		if (this.m_EnableSingleInteraction && this.isInteracted)
		{
			return;
		}
		if (this.m_EnableHighlight && !this.isHighlighted)
		{
			for (int i = 0; i < this.m_MaterialDatas.Count; i++)
			{
				Interactable.MaterialData materialData = this.m_MaterialDatas[i];
				for (int j = 0; j < materialData.Materials.Count; j++)
				{
					materialData.Materials[j].SetFloat("_HighlightStrength", 0.05f);
					materialData.Materials[j].DOKill(false);
					materialData.Materials[j].DOFloat(0.09f, "_HighlightStrength", 0.25f).SetLoops(-1, LoopType.Yoyo);
				}
			}
			this.isHighlighted = true;
		}
		this.OnInteractEnter();
	}

	// Token: 0x06001064 RID: 4196 RVA: 0x000758CE File Offset: 0x00073CCE
	public virtual void OnInteractEnter()
	{
	}

	// Token: 0x06001065 RID: 4197 RVA: 0x000758D0 File Offset: 0x00073CD0
	public void Interact()
	{
		if (!this.m_Active)
		{
			return;
		}
		if (this.m_EnableSingleInteraction && this.isInteracted)
		{
			return;
		}
		if (this.m_EnableSingleInteraction)
		{
			this.isInteracted = true;
		}
		this.ExitHighlight();
		this.OnInteract();
		this.m_HasInteractedOnce = true;
		this.OnInteracted.Send(this);
	}

	// Token: 0x06001066 RID: 4198 RVA: 0x00075931 File Offset: 0x00073D31
	public virtual void OnInteract()
	{
	}

	// Token: 0x06001067 RID: 4199 RVA: 0x00075934 File Offset: 0x00073D34
	public void InteractExit()
	{
		if (!this.m_Active)
		{
			return;
		}
		if (this.m_EnableSingleInteraction && this.isInteracted)
		{
			return;
		}
		if (this.m_EnableHighlight && this.isHighlighted)
		{
			this.ExitHighlight();
		}
		this.OnInteractExit();
	}

	// Token: 0x06001068 RID: 4200 RVA: 0x00075988 File Offset: 0x00073D88
	private void ExitHighlight()
	{
		if (this.m_EnableHighlight)
		{
			for (int i = 0; i < this.m_MaterialDatas.Count; i++)
			{
				Interactable.MaterialData materialData = this.m_MaterialDatas[i];
				for (int j = 0; j < materialData.Materials.Count; j++)
				{
					materialData.Materials[j].DOKill(false);
					materialData.Materials[j].SetFloat("_HighlightStrength", 0f);
					this.ResetShimmer();
				}
			}
			this.isHighlighted = false;
		}
	}

	// Token: 0x06001069 RID: 4201 RVA: 0x00075A20 File Offset: 0x00073E20
	public virtual void OnInteractExit()
	{
	}

	// Token: 0x0600106A RID: 4202 RVA: 0x00075A22 File Offset: 0x00073E22
	public void SetActive(bool active)
	{
		this.m_Active = active;
	}

	// Token: 0x0600106B RID: 4203 RVA: 0x00075A2C File Offset: 0x00073E2C
	protected override void OnDisposed()
	{
		if (this.m_MaterialDatas != null)
		{
			for (int i = 0; i < this.m_MaterialDatas.Count; i++)
			{
				Interactable.MaterialData materialData = this.m_MaterialDatas[i];
				for (int j = 0; j < materialData.Materials.Count; j++)
				{
					materialData.Materials[j].DOKill(false);
				}
			}
			this.m_MaterialDatas.Clear();
			this.m_MaterialDatas = null;
		}
		base.OnDisposed();
	}

	// Token: 0x0400127F RID: 4735
	private const string SHADER_HIGHLIGHT_STRENGTH = "_HighlightStrength";

	// Token: 0x04001281 RID: 4737
	[Header("Interact Options")]
	[SerializeField]
	protected bool m_Active;

	// Token: 0x04001282 RID: 4738
	[SerializeField]
	private bool m_EnableSingleInteraction;

	// Token: 0x04001283 RID: 4739
	[Header("Highlight Options")]
	[SerializeField]
	private bool m_EnableHighlight = true;

	// Token: 0x04001284 RID: 4740
	[SerializeField]
	private bool m_HasShimmer;

	// Token: 0x04001285 RID: 4741
	[SerializeField]
	private List<MeshRenderer> m_HighlightMeshRenderers;

	// Token: 0x04001288 RID: 4744
	protected List<Interactable.MaterialData> m_MaterialDatas;

	// Token: 0x04001289 RID: 4745
	private float m_ShimmerTimer;

	// Token: 0x0400128A RID: 4746
	private float m_ShimmerTimerLimit = 5.25f;

	// Token: 0x0400128B RID: 4747
	private bool m_HasInteractedOnce;

	// Token: 0x0400128C RID: 4748
	private Transform m_Target;

	// Token: 0x020002CF RID: 719
	public class MaterialData
	{
		// Token: 0x0400128D RID: 4749
		public MeshRenderer MeshRenderer;

		// Token: 0x0400128E RID: 4750
		public List<Material> Materials = new List<Material>();
	}
}
