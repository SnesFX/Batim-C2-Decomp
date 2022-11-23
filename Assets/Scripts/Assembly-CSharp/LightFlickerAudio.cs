using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002D4 RID: 724
public class LightFlickerAudio : TMGMonoBehaviour
{
	// Token: 0x0600108A RID: 4234 RVA: 0x000879D8 File Offset: 0x00085DD8
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_LightFlickerClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Lights_Flicker_Loop_03");
	}

	// Token: 0x0600108B RID: 4235 RVA: 0x000879FC File Offset: 0x00085DFC
	private void Update()
	{
		this.m_IsFlickering = this.m_FlickeringLight.enabled;
		if (this.m_IsFlickering)
		{
			if (this.m_LightFlickerAudioObject == null)
			{
				this.m_LightFlickerAudioObject = GameManager.Instance.AudioManager.PlayAtPosition(this.m_LightFlickerClip, base.transform.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
			}
		}
		else
		{
			this.ClearAudioObject();
		}
	}

	// Token: 0x0600108C RID: 4236 RVA: 0x00087A6B File Offset: 0x00085E6B
	private void ClearAudioObject()
	{
		if (this.m_LightFlickerAudioObject != null)
		{
			this.m_LightFlickerAudioObject.Clear();
			this.m_LightFlickerAudioObject = null;
		}
	}

	// Token: 0x0600108D RID: 4237 RVA: 0x00087A90 File Offset: 0x00085E90
	protected override void OnDisposed()
	{
		this.m_LightFlickerClip = null;
		this.ClearAudioObject();
		base.OnDisposed();
	}

	// Token: 0x040012A9 RID: 4777
	[SerializeField]
	private Light m_FlickeringLight;

	// Token: 0x040012AA RID: 4778
	private AudioObject m_LightFlickerAudioObject;

	// Token: 0x040012AB RID: 4779
	private AudioClip m_LightFlickerClip;

	// Token: 0x040012AC RID: 4780
	private bool m_IsFlickering;
}
