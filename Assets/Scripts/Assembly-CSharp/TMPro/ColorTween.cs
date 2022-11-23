using System;
using UnityEngine;
using UnityEngine.Events;

namespace TMPro
{
	// Token: 0x0200059C RID: 1436
	internal struct ColorTween : ITweenValue
	{
		// Token: 0x1700041C RID: 1052
		// (get) Token: 0x060028E7 RID: 10471 RVA: 0x0001D80D File Offset: 0x0001BA0D
		// (set) Token: 0x060028E8 RID: 10472 RVA: 0x0001D815 File Offset: 0x0001BA15
		public Color startColor
		{
			get
			{
				return this.m_StartColor;
			}
			set
			{
				this.m_StartColor = value;
			}
		}

		// Token: 0x1700041D RID: 1053
		// (get) Token: 0x060028E9 RID: 10473 RVA: 0x0001D81E File Offset: 0x0001BA1E
		// (set) Token: 0x060028EA RID: 10474 RVA: 0x0001D826 File Offset: 0x0001BA26
		public Color targetColor
		{
			get
			{
				return this.m_TargetColor;
			}
			set
			{
				this.m_TargetColor = value;
			}
		}

		// Token: 0x1700041E RID: 1054
		// (get) Token: 0x060028EB RID: 10475 RVA: 0x0001D82F File Offset: 0x0001BA2F
		// (set) Token: 0x060028EC RID: 10476 RVA: 0x0001D837 File Offset: 0x0001BA37
		public ColorTween.ColorTweenMode tweenMode
		{
			get
			{
				return this.m_TweenMode;
			}
			set
			{
				this.m_TweenMode = value;
			}
		}

		// Token: 0x1700041F RID: 1055
		// (get) Token: 0x060028ED RID: 10477 RVA: 0x0001D840 File Offset: 0x0001BA40
		// (set) Token: 0x060028EE RID: 10478 RVA: 0x0001D848 File Offset: 0x0001BA48
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

		// Token: 0x17000420 RID: 1056
		// (get) Token: 0x060028EF RID: 10479 RVA: 0x0001D851 File Offset: 0x0001BA51
		// (set) Token: 0x060028F0 RID: 10480 RVA: 0x0001D859 File Offset: 0x0001BA59
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

		// Token: 0x060028F1 RID: 10481 RVA: 0x000FAD80 File Offset: 0x000F8F80
		public void TweenValue(float floatPercentage)
		{
			if (!this.ValidTarget())
			{
				return;
			}
			Color arg = Color.Lerp(this.m_StartColor, this.m_TargetColor, floatPercentage);
			if (this.m_TweenMode == ColorTween.ColorTweenMode.Alpha)
			{
				arg.r = this.m_StartColor.r;
				arg.g = this.m_StartColor.g;
				arg.b = this.m_StartColor.b;
			}
			else if (this.m_TweenMode == ColorTween.ColorTweenMode.RGB)
			{
				arg.a = this.m_StartColor.a;
			}
			this.m_Target.Invoke(arg);
		}

		// Token: 0x060028F2 RID: 10482 RVA: 0x0001D862 File Offset: 0x0001BA62
		public void AddOnChangedCallback(UnityAction<Color> callback)
		{
			if (this.m_Target == null)
			{
				this.m_Target = new ColorTween.ColorTweenCallback();
			}
			this.m_Target.AddListener(callback);
		}

		// Token: 0x060028F3 RID: 10483 RVA: 0x0001D851 File Offset: 0x0001BA51
		public bool GetIgnoreTimescale()
		{
			return this.m_IgnoreTimeScale;
		}

		// Token: 0x060028F4 RID: 10484 RVA: 0x0001D840 File Offset: 0x0001BA40
		public float GetDuration()
		{
			return this.m_Duration;
		}

		// Token: 0x060028F5 RID: 10485 RVA: 0x0001D886 File Offset: 0x0001BA86
		public bool ValidTarget()
		{
			return this.m_Target != null;
		}

		// Token: 0x04002E64 RID: 11876
		private ColorTween.ColorTweenCallback m_Target;

		// Token: 0x04002E65 RID: 11877
		private Color m_StartColor;

		// Token: 0x04002E66 RID: 11878
		private Color m_TargetColor;

		// Token: 0x04002E67 RID: 11879
		private ColorTween.ColorTweenMode m_TweenMode;

		// Token: 0x04002E68 RID: 11880
		private float m_Duration;

		// Token: 0x04002E69 RID: 11881
		private bool m_IgnoreTimeScale;

		// Token: 0x0200059D RID: 1437
		public enum ColorTweenMode
		{
			// Token: 0x04002E6B RID: 11883
			All,
			// Token: 0x04002E6C RID: 11884
			RGB,
			// Token: 0x04002E6D RID: 11885
			Alpha
		}

		// Token: 0x0200059E RID: 1438
		public class ColorTweenCallback : UnityEvent<Color>
		{
		}
	}
}
