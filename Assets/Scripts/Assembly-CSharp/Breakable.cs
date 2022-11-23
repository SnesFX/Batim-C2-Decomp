using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x020002C8 RID: 712
public class Breakable : TMGMonoBehaviour
{
	// Token: 0x14000019 RID: 25
	// (add) Token: 0x06001027 RID: 4135 RVA: 0x00086AA8 File Offset: 0x00084EA8
	// (remove) Token: 0x06001028 RID: 4136 RVA: 0x00086AE0 File Offset: 0x00084EE0
	public event EventHandler OnBroken;

	// Token: 0x06001029 RID: 4137 RVA: 0x00086B18 File Offset: 0x00084F18
	public void Destroy(Vector3 fromPosition)
	{
		this.isDestroyed = true;
		this.PlayAudio();
		this.BrokenPrefab.SetActive(true);
		Collider[] array = Physics.OverlapSphere(fromPosition, 10f);
		foreach (Collider collider in array)
		{
			if (collider.transform.IsChildOf(this.BrokenPrefab.transform))
			{
				Rigidbody component = collider.GetComponent<Rigidbody>();
				if (component != null)
				{
					component.transform.SetParent(null);
					component.AddExplosionForce(1500f, fromPosition, 10f, 0.25f);
				}
			}
		}
		this.OnBroken.Send(this);
		base.Dispose();
	}

	// Token: 0x0600102A RID: 4138 RVA: 0x00086BD0 File Offset: 0x00084FD0
	private void PlayAudio()
	{
		if (this.m_AudioClips.Count <= 0)
		{
			return;
		}
		int index = UnityEngine.Random.Range(0, this.m_AudioClips.Count);
		AudioClip audioClip = this.m_AudioClips[index];
		GameManager.Instance.AudioManager.PlayAtPosition(audioClip, base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_AudioClips[index] = this.m_AudioClips[0];
		this.m_AudioClips[0] = audioClip;
	}

	// Token: 0x0600102B RID: 4139 RVA: 0x00086C53 File Offset: 0x00085053
	protected override void OnDisposed()
	{
		this.OnBroken = null;
		base.OnDisposed();
	}

	// Token: 0x04001264 RID: 4708
	[SerializeField]
	private GameObject BrokenPrefab;

	// Token: 0x04001265 RID: 4709
	[SerializeField]
	private List<AudioClip> m_AudioClips;

	// Token: 0x04001266 RID: 4710
	[HideInInspector]
	public bool isDestroyed;
}
