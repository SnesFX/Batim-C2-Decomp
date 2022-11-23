using System;
using TMG.Core;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace TMG.UI.Controls
{
	// Token: 0x02000301 RID: 769
	[RequireComponent(typeof(Button))]
	public class BaseUIButton : TMGMonoBehaviour, IPointerDownHandler, IPointerUpHandler, IPointerClickHandler, ISelectHandler, IDeselectHandler, IPointerEnterHandler, IPointerExitHandler, IEventSystemHandler
	{
		// Token: 0x14000028 RID: 40
		// (add) Token: 0x06001216 RID: 4630 RVA: 0x0008E718 File Offset: 0x0008CB18
		// (remove) Token: 0x06001217 RID: 4631 RVA: 0x0008E750 File Offset: 0x0008CB50
		public event EventHandler OnDown;

		// Token: 0x14000029 RID: 41
		// (add) Token: 0x06001218 RID: 4632 RVA: 0x0008E788 File Offset: 0x0008CB88
		// (remove) Token: 0x06001219 RID: 4633 RVA: 0x0008E7C0 File Offset: 0x0008CBC0
		public event EventHandler OnUp;

		// Token: 0x1400002A RID: 42
		// (add) Token: 0x0600121A RID: 4634 RVA: 0x0008E7F8 File Offset: 0x0008CBF8
		// (remove) Token: 0x0600121B RID: 4635 RVA: 0x0008E830 File Offset: 0x0008CC30
		public event EventHandler OnClick;

		// Token: 0x1400002B RID: 43
		// (add) Token: 0x0600121C RID: 4636 RVA: 0x0008E868 File Offset: 0x0008CC68
		// (remove) Token: 0x0600121D RID: 4637 RVA: 0x0008E8A0 File Offset: 0x0008CCA0
		public event EventHandler OnSelected;

		// Token: 0x1400002C RID: 44
		// (add) Token: 0x0600121E RID: 4638 RVA: 0x0008E8D8 File Offset: 0x0008CCD8
		// (remove) Token: 0x0600121F RID: 4639 RVA: 0x0008E910 File Offset: 0x0008CD10
		public event EventHandler OnDeselected;

		// Token: 0x1400002D RID: 45
		// (add) Token: 0x06001220 RID: 4640 RVA: 0x0008E948 File Offset: 0x0008CD48
		// (remove) Token: 0x06001221 RID: 4641 RVA: 0x0008E980 File Offset: 0x0008CD80
		public event EventHandler OnEnter;

		// Token: 0x1400002E RID: 46
		// (add) Token: 0x06001222 RID: 4642 RVA: 0x0008E9B8 File Offset: 0x0008CDB8
		// (remove) Token: 0x06001223 RID: 4643 RVA: 0x0008E9F0 File Offset: 0x0008CDF0
		public event EventHandler OnExit;

		// Token: 0x170002D5 RID: 725
		// (get) Token: 0x06001224 RID: 4644 RVA: 0x0008EA26 File Offset: 0x0008CE26
		// (set) Token: 0x06001225 RID: 4645 RVA: 0x0008EA2E File Offset: 0x0008CE2E
		public Button Button { get; private set; }

		// Token: 0x06001226 RID: 4646 RVA: 0x0008EA37 File Offset: 0x0008CE37
		public override void Init()
		{
			base.Init();
			this.Button = base.GetComponent<Button>();
		}

		// Token: 0x06001227 RID: 4647 RVA: 0x0008EA4B File Offset: 0x0008CE4B
		public void OnPointerDown(PointerEventData eventData)
		{
			if (!this.Button.interactable)
			{
				return;
			}
			this.OnDown.Send(this);
		}

		// Token: 0x06001228 RID: 4648 RVA: 0x0008EA6A File Offset: 0x0008CE6A
		public void OnPointerUp(PointerEventData eventData)
		{
			if (!this.Button.interactable)
			{
				return;
			}
			this.OnUp.Send(this);
		}

		// Token: 0x06001229 RID: 4649 RVA: 0x0008EA89 File Offset: 0x0008CE89
		public virtual void OnPointerClick(PointerEventData eventData)
		{
			if (!this.Button.interactable)
			{
				return;
			}
			this.OnClick.Send(this);
		}

		// Token: 0x0600122A RID: 4650 RVA: 0x0008EAA8 File Offset: 0x0008CEA8
		public void OnSelect(BaseEventData eventData)
		{
			if (!this.Button.interactable)
			{
				return;
			}
			this.OnSelected.Send(this);
		}

		// Token: 0x0600122B RID: 4651 RVA: 0x0008EAC7 File Offset: 0x0008CEC7
		public void OnDeselect(BaseEventData eventData)
		{
			if (!this.Button.interactable)
			{
				return;
			}
			this.OnDeselected.Send(this);
		}

		// Token: 0x0600122C RID: 4652 RVA: 0x0008EAE6 File Offset: 0x0008CEE6
		public void OnPointerEnter(PointerEventData eventData)
		{
			if (!this.Button.interactable)
			{
				return;
			}
			this.OnEnter.Send(this);
		}

		// Token: 0x0600122D RID: 4653 RVA: 0x0008EB05 File Offset: 0x0008CF05
		public void OnPointerExit(PointerEventData eventData)
		{
			if (!this.Button.interactable)
			{
				return;
			}
			this.OnExit.Send(this);
		}

		// Token: 0x0600122E RID: 4654 RVA: 0x0008EB24 File Offset: 0x0008CF24
		protected override void OnDisposed()
		{
			this.OnDown = null;
			this.OnUp = null;
			this.OnClick = null;
			this.OnSelected = null;
			this.OnDeselected = null;
			base.OnDisposed();
		}
	}
}
