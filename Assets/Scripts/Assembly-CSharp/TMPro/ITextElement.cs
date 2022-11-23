using System;
using UnityEngine;
using UnityEngine.UI;

namespace TMPro
{
	// Token: 0x020005CF RID: 1487
	public interface ITextElement
	{
		// Token: 0x1700049D RID: 1181
		// (get) Token: 0x06002ADA RID: 10970
		Material sharedMaterial { get; }

		// Token: 0x06002ADB RID: 10971
		void Rebuild(CanvasUpdate update);

		// Token: 0x06002ADC RID: 10972
		int GetInstanceID();
	}
}
