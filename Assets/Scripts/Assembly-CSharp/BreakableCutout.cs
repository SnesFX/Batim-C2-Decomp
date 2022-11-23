using System;
using System.Collections;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x020002C9 RID: 713
public class BreakableCutout : TMGMonoBehaviour
{
	// Token: 0x0600102D RID: 4141 RVA: 0x00086C78 File Offset: 0x00085078
	public override void Init()
	{
		this.m_Collider = base.GetComponent<Collider>();
		this.m_RendererCollider = this.m_StaticRenderer.GetComponent<Collider>();
		this.m_BrokenCutout.SetActive(false);
		IEnumerator enumerator = this.m_BrokenCutout.transform.GetEnumerator();
		try
		{
			while (enumerator.MoveNext())
			{
				object obj = enumerator.Current;
				Transform transform = (Transform)obj;
				Rigidbody component = transform.GetComponent<Rigidbody>();
				if (component != null)
				{
					this.m_BrokenCutouts.Add(new BreakableCutout.BrokenCutout
					{
						Rigidbody = component,
						Renderer = transform.GetComponent<MeshRenderer>(),
						Origin = transform.position
					});
				}
			}
		}
		finally
		{
			IDisposable disposable;
			if ((disposable = (enumerator as IDisposable)) != null)
			{
				disposable.Dispose();
			}
		}
		this.m_BrokenCuroutsCount = this.m_BrokenCutouts.Count;
	}

	// Token: 0x0600102E RID: 4142 RVA: 0x00086D5C File Offset: 0x0008515C
	public void Update()
	{
		if (!this.m_IsBroken)
		{
			return;
		}
		this.m_IsVisible = false;
		for (int i = 0; i < this.m_BrokenCuroutsCount; i++)
		{
			if (this.m_BrokenCutouts[i].Renderer.isVisible)
			{
				this.m_IsVisible = true;
				break;
			}
		}
		if (!this.m_IsVisible && !this.m_StaticRenderer.isVisible)
		{
			this.m_BrokenCutout.SetActive(false);
			for (int j = 0; j < this.m_BrokenCuroutsCount; j++)
			{
				BreakableCutout.BrokenCutout brokenCutout = this.m_BrokenCutouts[j];
				brokenCutout.Rigidbody.velocity = Vector3.zero;
				brokenCutout.Rigidbody.transform.position = brokenCutout.Origin;
			}
			this.m_StaticRenderer.gameObject.layer = LayerMask.NameToLayer("Default");
			this.m_IsBroken = false;
			this.m_Collider.enabled = true;
			this.m_RendererCollider.enabled = true;
		}
	}

	// Token: 0x0600102F RID: 4143 RVA: 0x00086E64 File Offset: 0x00085264
	public void Break(Vector3 fromPosition)
	{
		this.m_Collider.enabled = false;
		this.m_RendererCollider.enabled = false;
		this.m_StaticRenderer.gameObject.layer = LayerMask.NameToLayer("Invisible");
		GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Bendy_Cutout_Impact_01", base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_BrokenCutout.SetActive(true);
		for (int i = 0; i < this.m_BrokenCuroutsCount; i++)
		{
			this.m_BrokenCutouts[i].Rigidbody.AddExplosionForce(1500f, fromPosition, 10f, 0.25f);
		}
		this.m_IsBroken = true;
	}

	// Token: 0x06001030 RID: 4144 RVA: 0x00086F17 File Offset: 0x00085317
	protected override void OnDisposed()
	{
		base.OnDisposed();
	}

	// Token: 0x04001267 RID: 4711
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_StaticCutout;

	// Token: 0x04001268 RID: 4712
	[SerializeField]
	private GameObject m_BrokenCutout;

	// Token: 0x04001269 RID: 4713
	[Header("MeshRenderer")]
	[SerializeField]
	private MeshRenderer m_StaticRenderer;

	// Token: 0x0400126A RID: 4714
	private List<BreakableCutout.BrokenCutout> m_BrokenCutouts = new List<BreakableCutout.BrokenCutout>();

	// Token: 0x0400126B RID: 4715
	private Collider m_Collider;

	// Token: 0x0400126C RID: 4716
	private Collider m_RendererCollider;

	// Token: 0x0400126D RID: 4717
	private int m_BrokenCuroutsCount;

	// Token: 0x0400126E RID: 4718
	private bool m_IsVisible;

	// Token: 0x0400126F RID: 4719
	private bool m_IsBroken;

	// Token: 0x020002CA RID: 714
	private class BrokenCutout
	{
		// Token: 0x04001270 RID: 4720
		public Rigidbody Rigidbody;

		// Token: 0x04001271 RID: 4721
		public MeshRenderer Renderer;

		// Token: 0x04001272 RID: 4722
		public Vector3 Origin;
	}
}
