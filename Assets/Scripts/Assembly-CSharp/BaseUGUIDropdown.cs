using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x02000300 RID: 768
[RequireComponent(typeof(Dropdown))]
public class BaseUGUIDropdown : MonoBehaviour
{
	// Token: 0x040013E5 RID: 5093
	[SerializeField]
	public TextMeshProUGUI CaptionText;

	// Token: 0x040013E6 RID: 5094
	[SerializeField]
	public TextMeshProUGUI ItemTextMeshPro;

	// Token: 0x040013E7 RID: 5095
	[SerializeField]
	public Dropdown Dropdown;
}
