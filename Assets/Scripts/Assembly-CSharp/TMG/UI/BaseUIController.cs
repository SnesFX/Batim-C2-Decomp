using System;
using TMG.Core;
using UnityEngine;

namespace TMG.UI
{
	// Token: 0x020002E8 RID: 744
	public class BaseUIController : TMGMonoBehaviour
	{
		// Token: 0x14000022 RID: 34
		// (add) Token: 0x0600114A RID: 4426 RVA: 0x000805A8 File Offset: 0x0007E9A8
		// (remove) Token: 0x0600114B RID: 4427 RVA: 0x000805E0 File Offset: 0x0007E9E0
		public event EventHandler OnPlayInComplete;

		// Token: 0x14000023 RID: 35
		// (add) Token: 0x0600114C RID: 4428 RVA: 0x00080618 File Offset: 0x0007EA18
		// (remove) Token: 0x0600114D RID: 4429 RVA: 0x00080650 File Offset: 0x0007EA50
		public event EventHandler OnPlayOutComplete;

		// Token: 0x170002D2 RID: 722
		// (get) Token: 0x0600114E RID: 4430 RVA: 0x00080686 File Offset: 0x0007EA86
		public RectTransform rectTransform
		{
			get
			{
				if (this.m_RectTransform == null)
				{
					this.m_RectTransform = base.GetComponent<RectTransform>();
				}
				return this.m_RectTransform;
			}
		}

		// Token: 0x0600114F RID: 4431 RVA: 0x000806AC File Offset: 0x0007EAAC
		public virtual void InitController(object _data)
		{
			Canvas component = base.GetComponent<Canvas>();
			Camera camera = GameManager.Instance.UIManager.Camera;
			component.worldCamera = camera;
			component.pixelPerfect = false;
			component.planeDistance = Math.Abs(component.transform.parent.position.z - camera.transform.position.z);
			component.sortingOrder = (int)(-(int)component.planeDistance);
		}

		// Token: 0x06001150 RID: 4432 RVA: 0x00080723 File Offset: 0x0007EB23
		public virtual void PlayIn()
		{
			this.PlayInComplete();
		}

		// Token: 0x06001151 RID: 4433 RVA: 0x0008072B File Offset: 0x0007EB2B
		public virtual void PlayInComplete()
		{
			this.OnPlayInComplete.Send(this);
		}

		// Token: 0x06001152 RID: 4434 RVA: 0x00080739 File Offset: 0x0007EB39
		public void Kill()
		{
			this.PlayOut();
		}

		// Token: 0x06001153 RID: 4435 RVA: 0x00080741 File Offset: 0x0007EB41
		public virtual void PlayOut()
		{
			this.PlayOutComplete();
		}

		// Token: 0x06001154 RID: 4436 RVA: 0x00080749 File Offset: 0x0007EB49
		public virtual void PlayOutComplete()
		{
			this.OnPlayOutComplete.Send(this);
			base.Dispose();
		}

		// Token: 0x0400133E RID: 4926
		private RectTransform m_RectTransform;
	}
}
