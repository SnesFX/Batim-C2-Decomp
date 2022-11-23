using System;
using System.Collections.Generic;
using DG.Tweening;
using TMG.UI;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x020002EA RID: 746
public class HurtBordersController : BaseUIController
{
	// Token: 0x14000026 RID: 38
	// (add) Token: 0x06001162 RID: 4450 RVA: 0x0008AF90 File Offset: 0x00089390
	// (remove) Token: 0x06001163 RID: 4451 RVA: 0x0008AFC8 File Offset: 0x000893C8
	public event EventHandler OnMaxHit;

	// Token: 0x06001164 RID: 4452 RVA: 0x0008B000 File Offset: 0x00089400
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_BlackImage.color = new Color(0f, 0f, 0f, 0f);
		this.m_HitMax = this.m_Borders.Count;
		for (int i = 0; i < this.m_HitMax; i++)
		{
			this.m_Borders[i].enabled = false;
		}
		this.m_HurtClips = GameManager.Instance.GetAudioClips("Audio/SFX/Henry/Hurt/");
		this.m_DeathClips = GameManager.Instance.GetAudioClips("Audio/SFX/Henry/Death/");
		this.ShuffleAudio(ref this.m_HurtClips);
		this.ShuffleAudio(ref this.m_DeathClips);
	}

	// Token: 0x06001165 RID: 4453 RVA: 0x0008B0B4 File Offset: 0x000894B4
	private void Update()
	{
		if (!this.m_IsHit)
		{
			return;
		}
		this.m_Timer += Time.deltaTime;
		if (this.m_Timer >= this.m_RelaxTime)
		{
			this.HideBorder();
		}
	}

	// Token: 0x06001166 RID: 4454 RVA: 0x0008B0EC File Offset: 0x000894EC
	public void ShowBorder(bool isSilent = false)
	{
		if (this.m_HitCount >= this.m_HitMax)
		{
			if (!this.m_IsHitMax)
			{
				GameManager.Instance.isDead = true;
				this.m_HitCount--;
				this.m_IsHitMax = true;
				this.m_BlackImage.DOKill(false);
				this.m_BlackImage.DOFade(1f, 0.2f).SetEase(Ease.Linear);
				GameManager.Instance.ShowScreenBlocker(0f, 0f, null);
				GameManager.Instance.HideCrosshair();
				this.PlayAudio(ref this.m_DeathClips).OnComplete += delegate(object sender, EventArgs e)
				{
					this.OnMaxHit.Send(this);
				};
			}
		}
		else
		{
			if (!isSilent)
			{
				this.PlayAudio(ref this.m_HurtClips);
			}
			this.m_IsHit = true;
			this.m_Timer = 0f;
			Transform transform = GameManager.Instance.GameCamera.transform;
			transform.DOKill(false);
			transform.localPosition = Vector3.zero;
			transform.DOShakePosition(1f, 0.25f, 10, 90f, false, true);
			for (int i = 0; i < this.m_HitMax; i++)
			{
				if (i > this.m_HitCount)
				{
					break;
				}
				Image image = this.m_Borders[i];
				image.DOKill(false);
				image.rectTransform.DOKill(false);
				image.enabled = true;
				image.color = Color.white;
				image.rectTransform.localScale = Vector3.one;
				image.rectTransform.DOScale(1.005f, 0.25f + (float)i * 0.005f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
			}
			this.m_HitCount++;
		}
	}

	// Token: 0x06001167 RID: 4455 RVA: 0x0008B2A8 File Offset: 0x000896A8
	private void HideBorder()
	{
		this.m_Timer = 0f;
		this.m_HitCount = 0;
		this.m_IsHit = false;
		for (int i = 0; i < this.m_HitMax; i++)
		{
			Image hitBorder = this.m_Borders[i];
			hitBorder.DOKill(false);
			hitBorder.rectTransform.DOKill(false);
			hitBorder.DOFade(0f, 1.5f).SetEase(Ease.Linear).OnComplete(delegate
			{
				hitBorder.DOKill(false);
				hitBorder.rectTransform.DOKill(false);
				hitBorder.rectTransform.localScale = Vector3.one;
				hitBorder.enabled = false;
				hitBorder.color = new Color(1f, 1f, 1f, 0f);
			});
		}
	}

	// Token: 0x06001168 RID: 4456 RVA: 0x0008B34C File Offset: 0x0008974C
	private AudioObject PlayAudio(ref AudioClip[] audioClips)
	{
		if (audioClips == null || audioClips.Length <= 0)
		{
			return null;
		}
		int num = UnityEngine.Random.Range(0, audioClips.Length);
		AudioClip audioClip = audioClips[num];
		AudioObject result = GameManager.Instance.AudioManager.Play(audioClip, AudioObjectType.SOUND_EFFECT, 0, false);
		audioClips[num] = audioClips[0];
		audioClips[0] = audioClip;
		return result;
	}

	// Token: 0x06001169 RID: 4457 RVA: 0x0008B3A0 File Offset: 0x000897A0
	private void ShuffleAudio(ref AudioClip[] audioClips)
	{
		int num = UnityEngine.Random.Range(0, audioClips.Length);
		AudioClip audioClip = audioClips[num];
		audioClips[num] = audioClips[0];
		audioClips[0] = audioClip;
	}

	// Token: 0x0600116A RID: 4458 RVA: 0x0008B3CC File Offset: 0x000897CC
	protected override void OnDisposed()
	{
		this.m_HitCount = 0;
		this.m_DeathClips = null;
		this.m_HurtClips = null;
		for (int i = 0; i < this.m_HitMax; i++)
		{
			this.m_Borders[i].DOKill(false);
			this.m_Borders[i].rectTransform.DOKill(false);
		}
		base.OnDisposed();
	}

	// Token: 0x04001343 RID: 4931
	[Header("Images")]
	[SerializeField]
	private Image m_BlackImage;

	// Token: 0x04001344 RID: 4932
	[SerializeField]
	private List<Image> m_Borders;

	// Token: 0x04001345 RID: 4933
	private int m_HitCount;

	// Token: 0x04001346 RID: 4934
	private int m_HitMax;

	// Token: 0x04001347 RID: 4935
	private float m_Timer;

	// Token: 0x04001348 RID: 4936
	private float m_RelaxTime = 2f;

	// Token: 0x04001349 RID: 4937
	private bool m_IsHit;

	// Token: 0x0400134A RID: 4938
	private bool m_IsHitMax;

	// Token: 0x0400134B RID: 4939
	private AudioClip[] m_HurtClips;

	// Token: 0x0400134C RID: 4940
	private AudioClip[] m_DeathClips;
}
