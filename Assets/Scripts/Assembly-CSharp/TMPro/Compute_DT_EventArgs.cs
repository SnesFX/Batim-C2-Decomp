using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005E8 RID: 1512
	public class Compute_DT_EventArgs
	{
		// Token: 0x06002BFC RID: 11260 RVA: 0x0001FB45 File Offset: 0x0001DD45
		public Compute_DT_EventArgs(Compute_DistanceTransform_EventTypes type, float progress)
		{
			this.EventType = type;
			this.ProgressPercentage = progress;
		}

		// Token: 0x06002BFD RID: 11261 RVA: 0x0001FB5B File Offset: 0x0001DD5B
		public Compute_DT_EventArgs(Compute_DistanceTransform_EventTypes type, Color[] colors)
		{
			this.EventType = type;
			this.Colors = colors;
		}

		// Token: 0x040030E4 RID: 12516
		public Compute_DistanceTransform_EventTypes EventType;

		// Token: 0x040030E5 RID: 12517
		public float ProgressPercentage;

		// Token: 0x040030E6 RID: 12518
		public Color[] Colors;
	}
}
