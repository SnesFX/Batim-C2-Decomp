using System;
using System.Collections.Generic;
using DG.Tweening;
using TMG.UI;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x020002F2 RID: 754
public class ChapterOneConclusionModalController : BaseUIController
{
	// Token: 0x060011A5 RID: 4517 RVA: 0x0008C7EC File Offset: 0x0008ABEC
	public override void InitController(object _data)
	{
		base.InitController(_data);
		for (int i = 0; i < this.m_Images.Count; i++)
		{
			this.m_Images[i].enabled = false;
		}
	}

	// Token: 0x060011A6 RID: 4518 RVA: 0x0008C830 File Offset: 0x0008AC30
	public void ShowImage(int index)
	{
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Camera_Flash_02", AudioObjectType.SOUND_EFFECT, 0, false);
		Image image = this.m_Images[index];
		image.enabled = true;
		image.transform.DOScale(1.05f, 0.75f).SetEase(Ease.Linear);
		image.DOFade(0f, 0.2f).SetDelay(0.3f).OnComplete(delegate
		{
			image.enabled = false;
		});
	}

	// Token: 0x060011A7 RID: 4519 RVA: 0x0008C8CC File Offset: 0x0008ACCC
	protected override void OnDisposed()
	{
		for (int i = 0; i < this.m_Images.Count; i++)
		{
			this.m_Images[i].DOKill(false);
			this.m_Images[i].transform.DOKill(false);
		}
		base.OnDisposed();
	}

	// Token: 0x04001383 RID: 4995
	[Header("RectTransforms")]
	[SerializeField]
	private List<Image> m_Images;
}
