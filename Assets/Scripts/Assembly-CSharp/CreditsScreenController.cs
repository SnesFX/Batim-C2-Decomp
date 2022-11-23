using System;
using System.Collections.Generic;
using DG.Tweening;
using TMG.UI;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

// Token: 0x020002FD RID: 765
public class CreditsScreenController : BaseUIController
{
	// Token: 0x170002D3 RID: 723
	// (get) Token: 0x060011E9 RID: 4585 RVA: 0x0008D9C5 File Offset: 0x0008BDC5
	// (set) Token: 0x060011EA RID: 4586 RVA: 0x0008D9CD File Offset: 0x0008BDCD
	public AudioObject CreditsMusic { get; private set; }

	// Token: 0x060011EB RID: 4587 RVA: 0x0008D9D8 File Offset: 0x0008BDD8
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_DataVO = (CreditsDataVO)_data;
		GameManager.Instance.LockPause();
		GameManager.Instance.KillCrosshair();
		GameManager.Instance.HideScreenBlocker(0f, 0f, null);
		GameManager.Instance.AudioManager.ListenerSetActive(true);
		this.Initialize();
	}

	// Token: 0x060011EC RID: 4588 RVA: 0x0008DA38 File Offset: 0x0008BE38
	private void Initialize()
	{
		this.m_BendyFace.sizeDelta = new Vector2((float)Screen.width, (float)Screen.height);
		this.m_Content.sizeDelta = new Vector2(0f, this.m_BendyFace.localPosition.y * -1f + this.m_BendyFace.sizeDelta.y);
		if (!this.m_DataVO.IsChapterTwo)
		{
			for (int i = 0; i < this.m_ChapterTwoItems.Count; i++)
			{
				this.m_ChapterTwoItems[i].SetActive(false);
			}
		}
		this.CreditsMusic = GameManager.Instance.AudioManager.Play("Audio/MUS/MUS_DrawnToDarkness", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_EndChapterLbl.alpha = 0f;
		this.m_CreditsCanvasGroup.alpha = 0f;
		this.m_ScrollView.verticalNormalizedPosition = 1f;
		this.m_BlackOutImage.enabled = true;
		this.m_LightFlickerImage.DOFade(0.1f, 0.1f).SetEase(Ease.Linear).SetLoops(-1, LoopType.Yoyo);
		this.DOCredits().OnComplete(new TweenCallback(this.SurpriseEnding));
	}

	// Token: 0x060011ED RID: 4589 RVA: 0x0008DB78 File Offset: 0x0008BF78
	private void SurpriseEnding()
	{
		Color color = this.m_BlackOutImage.color;
		color.a = 1f;
		this.m_BlackOutImage.color = color;
		this.m_BlackOutImage.DOFade(0f, 1f);
		this.m_Background_Special.gameObject.SetActive(true);
		GameManager.Instance.AudioManager.Play("Audio/MUS/MUS_Horror_Cue_02", AudioObjectType.SOUND_EFFECT, 0, false).OnComplete += delegate(object sender, EventArgs e)
		{
			this.m_BlackOutImage.DOFade(1f, 0.5f);
			GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_HUD_whoosh_01", AudioObjectType.SOUND_EFFECT, 0, false).OnComplete += delegate(object _sender, EventArgs _e)
			{
				SceneManager.LoadScene("Reset");
			};
		};
	}

	// Token: 0x060011EE RID: 4590 RVA: 0x0008DBF8 File Offset: 0x0008BFF8
	private Sequence DOCredits()
	{
		float num = 0f;
		float num2 = 1f;
		Sequence sequence = DOTween.Sequence();
		sequence.Insert(num, this.m_BlackOutImage.DOFade(0f, 1f));
		num += 3f;
		sequence.Insert(num, this.m_EndChapterLbl.DOFade(1f, num2));
		num += 3f;
		sequence.Insert(num, this.m_EndChapterLbl.DOFade(0f, num2));
		num += num2;
		sequence.Insert(num, this.m_CreditsCanvasGroup.DOFade(1f, 1f));
		sequence.Insert(num, this.m_ScrollView.DOVerticalNormalizedPos(0f, 110f, false).SetEase(Ease.Linear));
		num += 100f;
		sequence.Insert(num, this.m_Background_01.DOFade(0f, 10f));
		num += 15f;
		sequence.InsertCallback(num - 20f, delegate
		{
			this.m_Particles.Stop();
		});
		sequence.Insert(num, this.m_CreditsCanvasGroup.DOFade(0f, 3f).SetEase(Ease.Linear));
		sequence.InsertCallback(num, delegate
		{
			this.CreditsMusic.AudioSource.DOFade(0f, 3f).OnComplete(delegate
			{
				this.CreditsMusic.Clear();
				this.CreditsMusic = null;
			});
		});
		return sequence;
	}

	// Token: 0x060011EF RID: 4591 RVA: 0x0008DD3A File Offset: 0x0008C13A
	protected override void OnDisposed()
	{
		this.m_LightFlickerImage.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x040013B6 RID: 5046
	[Header("GameObjects")]
	[SerializeField]
	private List<GameObject> m_ChapterTwoItems;

	// Token: 0x040013B7 RID: 5047
	[Header("RectTransforms")]
	[SerializeField]
	private RectTransform m_Visuals;

	// Token: 0x040013B8 RID: 5048
	[SerializeField]
	private RectTransform m_Content;

	// Token: 0x040013B9 RID: 5049
	[SerializeField]
	private RectTransform m_BendyFace;

	// Token: 0x040013BA RID: 5050
	[Header("Scroll View")]
	[SerializeField]
	private ScrollRect m_ScrollView;

	// Token: 0x040013BB RID: 5051
	[Header("CanvasGroups")]
	[SerializeField]
	private CanvasGroup m_CreditsCanvasGroup;

	// Token: 0x040013BC RID: 5052
	[Header("Images")]
	[SerializeField]
	private Image m_BlackOutImage;

	// Token: 0x040013BD RID: 5053
	[SerializeField]
	private Image m_LightFlickerImage;

	// Token: 0x040013BE RID: 5054
	[Header("Backgrounds")]
	[SerializeField]
	private Image m_Background_01;

	// Token: 0x040013BF RID: 5055
	[SerializeField]
	private Image m_Background_Special;

	// Token: 0x040013C0 RID: 5056
	[Header("TextMeshPro")]
	[SerializeField]
	private TextMeshProUGUI m_EndChapterLbl;

	// Token: 0x040013C1 RID: 5057
	[Header("Particles")]
	[SerializeField]
	private ParticleSystem m_Particles;

	// Token: 0x040013C2 RID: 5058
	private CreditsDataVO m_DataVO;
}
