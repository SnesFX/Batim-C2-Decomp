using System;
using System.Collections.Generic;
using TMG.Core;
using UnityEngine;

// Token: 0x0200026A RID: 618
public class ChapterTwoAxeBreakController : TMGMonoBehaviour
{
	// Token: 0x06000D29 RID: 3369 RVA: 0x00079C60 File Offset: 0x00078060
	public override void Init()
	{
		base.Init();
		for (int i = 0; i < this.m_FinalPlanks.Count; i++)
		{
			this.m_FinalPlanks[i].OnBroken += this.HandlePlankOnBroken;
		}
		this.m_BrokenPlanksMax = this.m_FinalPlanks.Count;
	}

	// Token: 0x06000D2A RID: 3370 RVA: 0x00079CC0 File Offset: 0x000780C0
	private void HandlePlankOnBroken(object sender, EventArgs e)
	{
		Breakable x = (Breakable)sender;
		if (x != null)
		{
			this.m_BrokenPlanks++;
		}
		if (this.m_BrokenPlanks >= this.m_BrokenPlanksMax)
		{
			this.DisableWeapon();
		}
	}

	// Token: 0x06000D2B RID: 3371 RVA: 0x00079D08 File Offset: 0x00078108
	private void DisableWeapon()
	{
		this.m_Collider.SetActive(false);
		GameManager.Instance.AudioManager.Play("Audio/SFX/Axe/SFX_Axe_Pick_Up_01", AudioObjectType.SOUND_EFFECT, 0, false);
		BrokenWeapon brokenWeapon = UnityEngine.Object.Instantiate<BrokenWeapon>(this.m_BrokenAxe);
		brokenWeapon.Break(GameManager.Instance.Player.WeaponGameObject.transform, GameManager.Instance.Player.transform.position + Vector3.up * 5f);
		UnityEngine.Object.Destroy(GameManager.Instance.Player.WeaponGameObject);
		GameManager.Instance.Player.UnEquipWeapon();
	}

	// Token: 0x06000D2C RID: 3372 RVA: 0x00079DAC File Offset: 0x000781AC
	protected override void OnDisposed()
	{
		for (int i = 0; i < this.m_FinalPlanks.Count; i++)
		{
			if (this.m_FinalPlanks[i] != null)
			{
				this.m_FinalPlanks[i].OnBroken -= this.HandlePlankOnBroken;
			}
		}
		base.OnDisposed();
	}

	// Token: 0x04000F47 RID: 3911
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_Collider;

	// Token: 0x04000F48 RID: 3912
	[SerializeField]
	private BrokenWeapon m_BrokenAxe;

	// Token: 0x04000F49 RID: 3913
	[Header("Planks")]
	[SerializeField]
	private List<Breakable> m_FinalPlanks;

	// Token: 0x04000F4A RID: 3914
	private int m_BrokenPlanks;

	// Token: 0x04000F4B RID: 3915
	private int m_BrokenPlanksMax;
}
