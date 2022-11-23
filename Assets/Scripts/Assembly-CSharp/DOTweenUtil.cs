using System;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using UnityEngine;

// Token: 0x02000306 RID: 774
public static class DOTweenUtil
{
	// Token: 0x06001250 RID: 4688 RVA: 0x0008F3E8 File Offset: 0x0008D7E8
	public static Tweener DOAudioListenerVolume(float endValue, float duration, Action onComplete = null)
	{
		float volume = AudioListener.volume;
		return DOTween.To(() => volume, delegate(float value)
		{
			volume = value;
		}, endValue, duration).OnUpdate(delegate
		{
			AudioListener.volume = volume;
		}).OnComplete(delegate
		{
			if (onComplete != null)
			{
				onComplete();
			}
		});
	}

	// Token: 0x06001251 RID: 4689 RVA: 0x0008F44E File Offset: 0x0008D84E
	public static void KillAll()
	{
		DOTween.KillAll(false);
		DOTween.Clear(false);
	}
}
