using System;
using DG.Tweening;
using TMG.UI;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x020002F5 RID: 757
public class CollectableModalController : BaseUIController
{
	// Token: 0x060011BA RID: 4538 RVA: 0x0008CE68 File Offset: 0x0008B268
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_DataVO = (CollectableDataVO)_data;
		this.m_Collectable.sprite = GameManager.Instance.AssetManager.GetSprite<Sprite>(this.m_DataVO.SpriteLookup.Lookup, this.m_DataVO.SpriteLookup.Sprite);
		if (this.m_Collectable.sprite == null)
		{
			base.Kill();
			return;
		}
		this.m_Collectable.SetNativeSize();
		this.m_Collectable.rectTransform.localScale = Vector3.zero;
		this.m_Collectable.color = new Color(this.m_Collectable.color.r, this.m_Collectable.color.g, this.m_Collectable.color.b, 0f);
	}

	// Token: 0x060011BB RID: 4539 RVA: 0x0008CF50 File Offset: 0x0008B350
	public override void PlayIn()
	{
		if (!string.IsNullOrEmpty(this.m_DataVO.AudioClip))
		{
			GameManager.Instance.AudioManager.Play(this.m_DataVO.AudioClip, AudioObjectType.SOUND_EFFECT, 0, false);
		}
		this.m_Collectable.DOFade(1f, 0.5f);
		this.m_Collectable.rectTransform.DOScale(1f, 0.5f).SetEase(Ease.OutBack).OnComplete(new TweenCallback(this.PlayInComplete));
	}

	// Token: 0x060011BC RID: 4540 RVA: 0x0008CFDA File Offset: 0x0008B3DA
	public override void PlayInComplete()
	{
		base.Kill();
	}

	// Token: 0x060011BD RID: 4541 RVA: 0x0008CFE2 File Offset: 0x0008B3E2
	public void Hide()
	{
		this.m_PlayOutDelay = 0f;
		base.Kill();
	}

	// Token: 0x060011BE RID: 4542 RVA: 0x0008CFF8 File Offset: 0x0008B3F8
	public override void PlayOut()
	{
		if (this.m_Collectable.sprite != null)
		{
			Sequence sequence = DOTween.Sequence();
			sequence.Insert(1.5f, this.m_Collectable.DOFade(0f, 0.5f));
			sequence.Insert(1.5f, this.m_Collectable.rectTransform.DOScale(0f, 0.5f).SetEase(Ease.InBack));
			sequence.OnComplete(new TweenCallback(this.PlayOutComplete));
		}
		else
		{
			this.PlayOutComplete();
		}
	}

	// Token: 0x060011BF RID: 4543 RVA: 0x0008D08E File Offset: 0x0008B48E
	public override void PlayOutComplete()
	{
		base.PlayOutComplete();
	}

	// Token: 0x060011C0 RID: 4544 RVA: 0x0008D096 File Offset: 0x0008B496
	protected override void OnDisposed()
	{
		this.m_DataVO = null;
		this.m_Collectable.rectTransform.DOKill(false);
		this.m_Collectable.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x04001398 RID: 5016
	[Header("Image")]
	[SerializeField]
	private Image m_Collectable;

	// Token: 0x04001399 RID: 5017
	private CollectableDataVO m_DataVO;

	// Token: 0x0400139A RID: 5018
	private float m_PlayOutDelay = 2f;
}
