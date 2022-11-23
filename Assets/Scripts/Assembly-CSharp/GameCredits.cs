using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

// Token: 0x02000280 RID: 640
public class GameCredits : MonoBehaviour
{
	// Token: 0x06000E39 RID: 3641 RVA: 0x0007FFF4 File Offset: 0x0007E3F4
	private void Awake()
	{
		this.m_AudioSource = base.gameObject.AddComponent<AudioSource>();
		this.Background.color = new Color(this.Background.color.r, this.Background.color.g, this.Background.color.b, 0f);
		this.Logo.color = new Color(this.Logo.color.r, this.Logo.color.g, this.Logo.color.b, 0f);
		this.EndChapterLbl.alpha = 0f;
		this.MoneyLbl.alpha = 0f;
		this.BackgroundBlurred.enabled = false;
		this.LogoBlurred.enabled = false;
		Sequence sequence = DOTween.Sequence();
		float num = 0f;
		float num2 = 0.25f;
		sequence.InsertCallback(num, new TweenCallback(this.EnableImages));
		sequence.Insert(num, this.Background.DOFade(1f, num2).SetEase(Ease.Linear));
		sequence.Insert(num, this.Logo.DOFade(1f, num2).SetEase(Ease.Linear));
		sequence.Insert(num, this.BackgroundBlurred.DOFade(0f, num2).SetEase(Ease.Linear));
		sequence.Insert(num, this.LogoBlurred.DOFade(0f, num2).SetEase(Ease.Linear));
		num += num2 + 2f;
		sequence.Insert(num, this.Logo.DOFade(0f, 3f).SetEase(Ease.Linear));
		num += 3f;
		sequence.InsertCallback(num, new TweenCallback(this.PlayMusic));
		sequence.Insert(num + 2f, this.Blocker.DOFade(1f, 45f).SetEase(Ease.Linear));
		num += 1f;
		sequence.Insert(num, this.EndChapterLbl.DOFade(1f, 0.5f).SetEase(Ease.Linear));
		num += 4f;
		sequence.Insert(num, this.EndChapterLbl.DOFade(0f, 0.5f).SetEase(Ease.Linear));
		num += 1.5f;
		sequence.Insert(num, this.MoneyLbl.DOFade(1f, 0.5f).SetEase(Ease.Linear));
		num += 8f;
		sequence.Insert(num, this.MoneyLbl.DOFade(0f, 0.5f).SetEase(Ease.Linear));
		num += 1.5f;
		sequence.InsertCallback(num + 1f, delegate
		{
			this.canQuit = true;
		});
		sequence.Insert(num, this.Credits.DOAnchorPosY(this.m_EndAnchorPosition + (float)Screen.height, 30f, false).SetEase(Ease.Linear));
		sequence.Insert(num, this.Bendy.rectTransform.DOAnchorPosY(0f, 30f, false).SetEase(Ease.Linear));
		num += 30f;
		sequence.Insert(num, this.Bendy.DOFade(0f, 7.5f).SetEase(Ease.Linear));
		sequence.Insert(num, this.m_AudioSource.DOFade(0f, 7.5f).SetEase(Ease.Linear));
		sequence.OnComplete(new TweenCallback(this.ResetGame));
	}

	// Token: 0x06000E3A RID: 3642 RVA: 0x000803BB File Offset: 0x0007E7BB
	private void Update()
	{
		if (!this.canQuit)
		{
			return;
		}
		if (Input.GetKeyDown(KeyCode.Escape) || Input.GetMouseButtonDown(0))
		{
			this.ActualRestart();
		}
	}

	// Token: 0x06000E3B RID: 3643 RVA: 0x000803E8 File Offset: 0x0007E7E8
	private void EnableImages()
	{
		for (int i = 0; i < this.AudioClips.Count; i++)
		{
			this.m_AudioSource.PlayOneShot(this.AudioClips[i]);
		}
		this.BackgroundBlurred.enabled = true;
		this.LogoBlurred.enabled = true;
	}

	// Token: 0x06000E3C RID: 3644 RVA: 0x00080440 File Offset: 0x0007E840
	private void PlayMusic()
	{
		this.m_AudioSource.clip = this.Music;
		this.m_AudioSource.Play();
	}

	// Token: 0x06000E3D RID: 3645 RVA: 0x0008045E File Offset: 0x0007E85E
	private void ResetGame()
	{
		this.Visuals.gameObject.SetActive(false);
		this.audioListener.enabled = false;
		this.canQuit = false;
		this.SecretEnding.ShowSecretEnding();
	}

	// Token: 0x06000E3E RID: 3646 RVA: 0x0008048F File Offset: 0x0007E88F
	public void GameFinale()
	{
		this.SecretEnding.DisableSecretEnding();
		this.audioListener.enabled = true;
		this.Finale.gameObject.SetActive(true);
		base.StartCoroutine(this.Restart());
	}

	// Token: 0x06000E3F RID: 3647 RVA: 0x000804C8 File Offset: 0x0007E8C8
	private IEnumerator Restart()
	{
		yield return new WaitForSeconds(5f);
		this.ActualRestart();
		yield break;
	}

	// Token: 0x06000E40 RID: 3648 RVA: 0x000804E3 File Offset: 0x0007E8E3
	private void ActualRestart()
	{
		GameManager.Instance.ChapterOne.Reset();
		SceneManager.LoadScene("Reset");
	}

	// Token: 0x0400105E RID: 4190
	[Header("RectTransforms")]
	[SerializeField]
	private RectTransform Visuals;

	// Token: 0x0400105F RID: 4191
	[SerializeField]
	private RectTransform Credits;

	// Token: 0x04001060 RID: 4192
	[Header("Images")]
	[SerializeField]
	private Image Background;

	// Token: 0x04001061 RID: 4193
	[SerializeField]
	private Image BackgroundBlurred;

	// Token: 0x04001062 RID: 4194
	[SerializeField]
	private Image Logo;

	// Token: 0x04001063 RID: 4195
	[SerializeField]
	private Image LogoBlurred;

	// Token: 0x04001064 RID: 4196
	[SerializeField]
	private Image Bendy;

	// Token: 0x04001065 RID: 4197
	[SerializeField]
	private Image Blocker;

	// Token: 0x04001066 RID: 4198
	[SerializeField]
	private Image Finale;

	// Token: 0x04001067 RID: 4199
	[Header("TextMeshProUGUIs")]
	[SerializeField]
	private TextMeshProUGUI EndChapterLbl;

	// Token: 0x04001068 RID: 4200
	[SerializeField]
	private TextMeshProUGUI MoneyLbl;

	// Token: 0x04001069 RID: 4201
	[Header("Audio")]
	[SerializeField]
	private AudioClip Music;

	// Token: 0x0400106A RID: 4202
	[SerializeField]
	private List<AudioClip> AudioClips;

	// Token: 0x0400106B RID: 4203
	[SerializeField]
	private AudioListener audioListener;

	// Token: 0x0400106C RID: 4204
	[SerializeField]
	private GameComplete SecretEnding;

	// Token: 0x0400106D RID: 4205
	[Header("Anchor")]
	[SerializeField]
	private float m_EndAnchorPosition;

	// Token: 0x0400106E RID: 4206
	private AudioSource m_AudioSource;

	// Token: 0x0400106F RID: 4207
	private bool canQuit;
}
