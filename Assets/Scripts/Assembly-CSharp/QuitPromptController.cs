using System;
using DG.Tweening;
using DG.Tweening.Core;
using DG.Tweening.Plugins.Options;
using TMG.UI.Controls;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

// Token: 0x020002FB RID: 763
public class QuitPromptController : AbstractPromptController
{
	// Token: 0x060011D7 RID: 4567 RVA: 0x0008D57C File Offset: 0x0008B97C
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_FullBlocker.enabled = false;
		this.m_FullBlocker.color = new Color(this.m_FullBlocker.color.r, this.m_FullBlocker.color.g, this.m_FullBlocker.color.b, 0f);
	}

	// Token: 0x060011D8 RID: 4568 RVA: 0x0008D5EA File Offset: 0x0008B9EA
	public override void PlayInComplete()
	{
		this.AddListeners();
	}

	// Token: 0x060011D9 RID: 4569 RVA: 0x0008D5F2 File Offset: 0x0008B9F2
	private void HandleYesBtnOnClick(object sender, EventArgs e)
	{
		this.RemoveListeners();
		this.m_IsQuitting = true;
		base.Kill();
	}

	// Token: 0x060011DA RID: 4570 RVA: 0x0008D607 File Offset: 0x0008BA07
	private void HandleNoBtnOnClick(object sender, EventArgs e)
	{
		this.RemoveListeners();
		this.m_IsQuitting = false;
		base.Kill();
	}

	// Token: 0x060011DB RID: 4571 RVA: 0x0008D61C File Offset: 0x0008BA1C
	public override void PlayOutComplete()
	{
		if (this.m_IsQuitting)
		{
			float volume = GameManager.Instance.PlayerSettings.Volume;
			DOTween.To(() => volume, delegate(float value)
			{
				volume = value;
			}, 0f, 0.4f).SetEase(Ease.Linear).OnUpdate(delegate
			{
				AudioListener.volume = volume;
			});
			this.m_FullBlocker.enabled = true;
			this.m_FullBlocker.DOFade(1f, 0.5f).SetEase(Ease.Linear).OnComplete(delegate
			{
				SceneManager.LoadScene("Reset");
				base.PlayInComplete();
			});
		}
	}

	// Token: 0x060011DC RID: 4572 RVA: 0x0008D6CE File Offset: 0x0008BACE
	private void AddListeners()
	{
		this.YesBtn.OnClick += this.HandleYesBtnOnClick;
		this.NoBtn.OnClick += this.HandleNoBtnOnClick;
	}

	// Token: 0x060011DD RID: 4573 RVA: 0x0008D6FE File Offset: 0x0008BAFE
	private void RemoveListeners()
	{
		this.YesBtn.OnClick -= this.HandleYesBtnOnClick;
		this.NoBtn.OnClick -= this.HandleNoBtnOnClick;
	}

	// Token: 0x060011DE RID: 4574 RVA: 0x0008D72E File Offset: 0x0008BB2E
	protected override void OnDisposed()
	{
		this.RemoveListeners();
		this.m_FullBlocker.DOKill(false);
		base.OnDisposed();
	}

	// Token: 0x040013AD RID: 5037
	[Header("Blockers")]
	[SerializeField]
	private Image m_FullBlocker;

	// Token: 0x040013AE RID: 5038
	[Header("Buttons")]
	[SerializeField]
	private BaseUIButton YesBtn;

	// Token: 0x040013AF RID: 5039
	[SerializeField]
	private BaseUIButton NoBtn;

	// Token: 0x040013B0 RID: 5040
	private bool m_IsQuitting;
}
