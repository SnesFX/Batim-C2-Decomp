using System;
using System.Collections;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005A1 RID: 1441
	internal class TweenRunner<T> where T : struct, ITweenValue
	{
		// Token: 0x06002906 RID: 10502 RVA: 0x000FAE58 File Offset: 0x000F9058
		private static IEnumerator Start(T tweenInfo)
		{
			if (!tweenInfo.ValidTarget())
			{
				yield break;
			}
			float elapsedTime = 0f;
			while (elapsedTime < tweenInfo.duration)
			{
				elapsedTime += ((!tweenInfo.ignoreTimeScale) ? Time.deltaTime : Time.unscaledDeltaTime);
				float percentage = Mathf.Clamp01(elapsedTime / tweenInfo.duration);
				tweenInfo.TweenValue(percentage);
				yield return null;
			}
			tweenInfo.TweenValue(1f);
			yield break;
		}

		// Token: 0x06002907 RID: 10503 RVA: 0x0001D91A File Offset: 0x0001BB1A
		public void Init(MonoBehaviour coroutineContainer)
		{
			this.m_CoroutineContainer = coroutineContainer;
		}

		// Token: 0x06002908 RID: 10504 RVA: 0x000FAE74 File Offset: 0x000F9074
		public void StartTween(T info)
		{
			if (this.m_CoroutineContainer == null)
			{
				Debug.LogWarning("Coroutine container not configured... did you forget to call Init?");
				return;
			}
			this.StopTween();
			if (!this.m_CoroutineContainer.gameObject.activeInHierarchy)
			{
				info.TweenValue(1f);
				return;
			}
			this.m_Tween = TweenRunner<T>.Start(info);
			this.m_CoroutineContainer.StartCoroutine(this.m_Tween);
		}

		// Token: 0x06002909 RID: 10505 RVA: 0x0001D923 File Offset: 0x0001BB23
		public void StopTween()
		{
			if (this.m_Tween != null)
			{
				this.m_CoroutineContainer.StopCoroutine(this.m_Tween);
				this.m_Tween = null;
			}
		}

		// Token: 0x04002E73 RID: 11891
		protected MonoBehaviour m_CoroutineContainer;

		// Token: 0x04002E74 RID: 11892
		protected IEnumerator m_Tween;
	}
}
