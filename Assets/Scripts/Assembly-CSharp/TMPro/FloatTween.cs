using System;
using UnityEngine;
using UnityEngine.Events;

namespace TMPro
{
	// Token: 0x0200059F RID: 1439
	internal struct FloatTween : ITweenValue
	{
		// Token: 0x17000421 RID: 1057
		// (get) Token: 0x060028F7 RID: 10487 RVA: 0x0001D89C File Offset: 0x0001BA9C
		// (set) Token: 0x060028F8 RID: 10488 RVA: 0x0001D8A4 File Offset: 0x0001BAA4
		public float startValue
		{
			get
			{
				return this.m_StartValue;
			}
			set
			{
				this.m_StartValue = value;
			}
		}

		// Token: 0x17000422 RID: 1058
		// (get) Token: 0x060028F9 RID: 10489 RVA: 0x0001D8AD File Offset: 0x0001BAAD
		// (set) Token: 0x060028FA RID: 10490 RVA: 0x0001D8B5 File Offset: 0x0001BAB5
		public float targetValue
		{
			get
			{
				return this.m_TargetValue;
			}
			set
			{
				this.m_TargetValue = value;
			}
		}

		// Token: 0x17000423 RID: 1059
		// (get) Token: 0x060028FB RID: 10491 RVA: 0x0001D8BE File Offset: 0x0001BABE
		// (set) Token: 0x060028FC RID: 10492 RVA: 0x0001D8C6 File Offset: 0x0001BAC6
		public float duration
		{
			get
			{
				return this.m_Duration;
			}
			set
			{
				this.m_Duration = value;
			}
		}

		// Token: 0x17000424 RID: 1060
		// (get) Token: 0x060028FD RID: 10493 RVA: 0x0001D8CF File Offset: 0x0001BACF
		// (set) Token: 0x060028FE RID: 10494 RVA: 0x0001D8D7 File Offset: 0x0001BAD7
		public bool ignoreTimeScale
		{
			get
			{
				return this.m_IgnoreTimeScale;
			}
			set
			{
				this.m_IgnoreTimeScale = value;
			}
		}

		// Token: 0x060028FF RID: 10495 RVA: 0x000FAE20 File Offset: 0x000F9020
		public void TweenValue(float floatPercentage)
		{
			if (!this.ValidTarget())
			{
				return;
			}
			float arg = Mathf.Lerp(this.m_StartValue, this.m_TargetValue, floatPercentage);
			this.m_Target.Invoke(arg);
		}

		// Token: 0x06002900 RID: 10496 RVA: 0x0001D8E0 File Offset: 0x0001BAE0
		public void AddOnChangedCallback(UnityAction<float> callback)
		{
			if (this.m_Target == null)
			{
				this.m_Target = new FloatTween.FloatTweenCallback();
			}
			this.m_Target.AddListener(callback);
		}

		// Token: 0x06002901 RID: 10497 RVA: 0x0001D8CF File Offset: 0x0001BACF
		public bool GetIgnoreTimescale()
		{
			return this.m_IgnoreTimeScale;
		}

		// Token: 0x06002902 RID: 10498 RVA: 0x0001D8BE File Offset: 0x0001BABE
		public float GetDuration()
		{
			return this.m_Duration;
		}

		// Token: 0x06002903 RID: 10499 RVA: 0x0001D904 File Offset: 0x0001BB04
		public bool ValidTarget()
		{
			return this.m_Target != null;
		}

		// Token: 0x04002E6E RID: 11886
		private FloatTween.FloatTweenCallback m_Target;

		// Token: 0x04002E6F RID: 11887
		private float m_StartValue;

		// Token: 0x04002E70 RID: 11888
		private float m_TargetValue;

		// Token: 0x04002E71 RID: 11889
		private float m_Duration;

		// Token: 0x04002E72 RID: 11890
		private bool m_IgnoreTimeScale;

		// Token: 0x020005A0 RID: 1440
		public class FloatTweenCallback : UnityEvent<float>
		{
		}
	}
}
