using System;
using TMG.Core;
using UnityEngine;

// Token: 0x020002D2 RID: 722
public class LightFlicker : TMGMonoBehaviour
{
	// Token: 0x06001085 RID: 4229 RVA: 0x00087873 File Offset: 0x00085C73
	public override void Init()
	{
		base.Init();
		this.m_Light = base.GetComponent<Light>();
		this.m_OriginalColor = this.m_Light.color;
	}

	// Token: 0x06001086 RID: 4230 RVA: 0x00087898 File Offset: 0x00085C98
	public void Update()
	{
		this.m_Light.color = this.m_OriginalColor * this.EvalWave();
	}

	// Token: 0x06001087 RID: 4231 RVA: 0x000878B8 File Offset: 0x00085CB8
	private float EvalWave()
	{
		float num = (Time.time + this.m_Phase) * this.m_Frequency;
		num -= Mathf.Floor(num);
		float num2;
		switch (this.m_WaveType)
		{
		case LightFlicker.WaveType.SIN:
			num2 = Mathf.Sin(num * 2f * 3.1415927f);
			break;
		case LightFlicker.WaveType.TRI:
			if (num < 0.5f)
			{
				num2 = 4f * num - 1f;
			}
			else
			{
				num2 = -4f * num + 3f;
			}
			break;
		case LightFlicker.WaveType.SQR:
			if (num < 0.5f)
			{
				num2 = 1f;
			}
			else
			{
				num2 = -1f;
			}
			break;
		case LightFlicker.WaveType.SAW:
			num2 = num;
			break;
		case LightFlicker.WaveType.INV:
			num2 = 1f - num;
			break;
		case LightFlicker.WaveType.NOISE:
			num2 = 1f - UnityEngine.Random.value * 2f;
			break;
		default:
			num2 = 1f;
			break;
		}
		return num2 * this.m_Amplitude + this.m_Base;
	}

	// Token: 0x06001088 RID: 4232 RVA: 0x000879C1 File Offset: 0x00085DC1
	protected override void OnDisposed()
	{
		this.m_Light = null;
		base.OnDisposed();
	}

	// Token: 0x0400129B RID: 4763
	[SerializeField]
	private LightFlicker.WaveType m_WaveType;

	// Token: 0x0400129C RID: 4764
	[SerializeField]
	private float m_Base;

	// Token: 0x0400129D RID: 4765
	[SerializeField]
	private float m_Amplitude;

	// Token: 0x0400129E RID: 4766
	[SerializeField]
	private float m_Phase;

	// Token: 0x0400129F RID: 4767
	[SerializeField]
	private float m_Frequency;

	// Token: 0x040012A0 RID: 4768
	private Color m_OriginalColor;

	// Token: 0x040012A1 RID: 4769
	private Light m_Light;

	// Token: 0x020002D3 RID: 723
	private enum WaveType
	{
		// Token: 0x040012A3 RID: 4771
		SIN,
		// Token: 0x040012A4 RID: 4772
		TRI,
		// Token: 0x040012A5 RID: 4773
		SQR,
		// Token: 0x040012A6 RID: 4774
		SAW,
		// Token: 0x040012A7 RID: 4775
		INV,
		// Token: 0x040012A8 RID: 4776
		NOISE
	}
}
