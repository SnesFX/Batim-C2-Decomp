using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x0200027E RID: 638
public class CopyUGUIText : MonoBehaviour
{
	// Token: 0x06000E31 RID: 3633 RVA: 0x0007FE78 File Offset: 0x0007E278
	private void Awake()
	{
		this.m_TMPro = base.GetComponent<TextMeshProUGUI>();
	}

	// Token: 0x06000E32 RID: 3634 RVA: 0x0007FE86 File Offset: 0x0007E286
	private void Start()
	{
		this.m_TMPro.text = this.m_Text.text;
	}

	// Token: 0x04001052 RID: 4178
	[SerializeField]
	private Text m_Text;

	// Token: 0x04001053 RID: 4179
	private TextMeshProUGUI m_TMPro;
}
