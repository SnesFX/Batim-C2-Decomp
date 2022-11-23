using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000294 RID: 660
public class ParticleAudioTrigger : MonoBehaviour
{
	// Token: 0x06000EFD RID: 3837 RVA: 0x000823D8 File Offset: 0x000807D8
	private void OnParticleTrigger()
	{
		int triggerParticles = this.m_Particles.GetTriggerParticles(ParticleSystemTriggerEventType.Enter, this.enter);
		for (int i = 0; i < triggerParticles; i++)
		{
			this.m_AudioSource.PlayOneShot(this.m_AudioSource.clip);
		}
	}

	// Token: 0x040010B4 RID: 4276
	[SerializeField]
	private ParticleSystem m_Particles;

	// Token: 0x040010B5 RID: 4277
	[SerializeField]
	private AudioSource m_AudioSource;

	// Token: 0x040010B6 RID: 4278
	private List<ParticleSystem.Particle> enter = new List<ParticleSystem.Particle>();
}
