using System;
using TMG.Core;
using TMG.UI.Controls;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x02000303 RID: 771
public class MenuItemButton : TMGMonoBehaviour
{
	// Token: 0x1400002F RID: 47
	// (add) Token: 0x06001233 RID: 4659 RVA: 0x0008ECB8 File Offset: 0x0008D0B8
	// (remove) Token: 0x06001234 RID: 4660 RVA: 0x0008ECF0 File Offset: 0x0008D0F0
	public event EventHandler OnSelected;

	// Token: 0x170002D6 RID: 726
	// (get) Token: 0x06001235 RID: 4661 RVA: 0x0008ED26 File Offset: 0x0008D126
	public BaseUIButton Button
	{
		get
		{
			return this.m_Button;
		}
	}

	// Token: 0x06001236 RID: 4662 RVA: 0x0008ED2E File Offset: 0x0008D12E
	public void Init(MenuItemButtonDataVO vo)
	{
		this.m_Label.text = vo.Label;
		this.m_Callback = vo.Callback;
		this.m_SelectedImg.enabled = false;
		this.AddListeners();
	}

	// Token: 0x06001237 RID: 4663 RVA: 0x0008ED5F File Offset: 0x0008D15F
	private void HandleButtonOnSelected(object sender, EventArgs e)
	{
		this.m_SelectedImg.enabled = true;
	}

	// Token: 0x06001238 RID: 4664 RVA: 0x0008ED6D File Offset: 0x0008D16D
	private void HandleButtonOnDeselected(object sender, EventArgs e)
	{
		this.m_SelectedImg.enabled = false;
	}

	// Token: 0x06001239 RID: 4665 RVA: 0x0008ED7B File Offset: 0x0008D17B
	private void HandleButtonOnClick(object sender, EventArgs e)
	{
		this.RemoveListeners();
		this.m_SelectedImg.enabled = true;
		this.OnSelected.Send(this);
		if (this.m_Callback != null)
		{
			this.m_Callback();
		}
	}

	// Token: 0x0600123A RID: 4666 RVA: 0x0008EDB1 File Offset: 0x0008D1B1
	public void Deselect()
	{
		this.AddListeners();
		this.m_SelectedImg.enabled = false;
	}

	// Token: 0x0600123B RID: 4667 RVA: 0x0008EDC8 File Offset: 0x0008D1C8
	private void AddListeners()
	{
		this.m_Button.OnClick += this.HandleButtonOnClick;
		if (this.m_SelectedImg != null)
		{
			this.m_Button.OnEnter += this.HandleButtonOnSelected;
			this.m_Button.OnExit += this.HandleButtonOnDeselected;
		}
	}

	// Token: 0x0600123C RID: 4668 RVA: 0x0008EE2C File Offset: 0x0008D22C
	private void RemoveListeners()
	{
		this.m_Button.OnClick -= this.HandleButtonOnClick;
		if (this.m_SelectedImg != null)
		{
			this.m_Button.OnEnter -= this.HandleButtonOnSelected;
			this.m_Button.OnExit -= this.HandleButtonOnDeselected;
		}
	}

	// Token: 0x0600123D RID: 4669 RVA: 0x0008EE8F File Offset: 0x0008D28F
	protected override void OnDisposed()
	{
		this.RemoveListeners();
		this.OnSelected = null;
		this.m_Callback = null;
		base.OnDisposed();
	}

	// Token: 0x040013F3 RID: 5107
	[Header("TextMeshProUGUI")]
	[SerializeField]
	private TextMeshProUGUI m_Label;

	// Token: 0x040013F4 RID: 5108
	[Header("Images")]
	[SerializeField]
	private Image m_SelectedImg;

	// Token: 0x040013F5 RID: 5109
	[Header("Button")]
	[SerializeField]
	private BaseUIButton m_Button;

	// Token: 0x040013F6 RID: 5110
	private Action m_Callback;
}
