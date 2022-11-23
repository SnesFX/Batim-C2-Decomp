using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x020002E0 RID: 736
public class LargeReelsController : TMGMonoBehaviour
{
	// Token: 0x0600111F RID: 4383 RVA: 0x0008A00F File Offset: 0x0008840F
	public override void InitOnComplete()
	{
		this.TurnOn();
		base.StartCoroutine(this.FindPlayer());
	}

	// Token: 0x06001120 RID: 4384 RVA: 0x0008A024 File Offset: 0x00088424
	private IEnumerator FindPlayer()
	{
		while (this.m_Target == null)
		{
			if (GameManager.Instance.Player != null)
			{
				this.m_Target = GameManager.Instance.Player.transform;
			}
			yield return null;
		}
		yield break;
	}

	// Token: 0x06001121 RID: 4385 RVA: 0x0008A040 File Offset: 0x00088440
	public void Update()
	{
		if (this.m_Target == null || this.m_AudioObject == null)
		{
			return;
		}
		if (this.m_Target.position.x < this.m_Right.position.x && this.m_Target.position.x > this.m_Left.position.x)
		{
			Vector3 worldPosition = this.m_AudioObject.WorldPosition;
			worldPosition.x = this.m_Target.position.x;
			this.m_AudioObject.WorldPosition = worldPosition;
		}
	}

	// Token: 0x06001122 RID: 4386 RVA: 0x0008A0FC File Offset: 0x000884FC
	public void TurnOn()
	{
		this.ClearAudioObject();
		this.m_AudioObject = GameManager.Instance.AudioManager.PlayAtPosition("Audio/SFX/SFX_Wall_Pulleys_Turn_01", this.m_Right.position, AudioObjectType.SOUND_EFFECT, -1, false, null);
		int count = this.m_Reels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_Reels[i].DOLocalRotate(new Vector3(0f, 0f, 360f), 1.8f, RotateMode.LocalAxisAdd).SetEase(Ease.Linear).SetLoops(-1, LoopType.Restart);
		}
		float num = -1f;
		int count2 = this.m_Tapes.Count;
		for (int j = 0; j < count2; j++)
		{
			this.m_Tapes[j].localEulerAngles = new Vector3(0f, 0f, num);
			this.m_Tapes[j].DOLocalRotate(new Vector3(0f, 0f, -num), 1.8f, RotateMode.LocalAxisAdd).SetEase(Ease.Linear).SetLoops(-1, LoopType.Yoyo);
			num = 1f;
		}
	}

	// Token: 0x06001123 RID: 4387 RVA: 0x0008A218 File Offset: 0x00088618
	public void TurnOff()
	{
		this.ClearAudioObject();
		int count = this.m_Reels.Count;
		for (int i = 0; i < count; i++)
		{
			this.m_Reels[i].DOKill(false);
		}
	}

	// Token: 0x06001124 RID: 4388 RVA: 0x0008A25C File Offset: 0x0008865C
	private void ClearAudioObject()
	{
		if (this.m_AudioObject != null)
		{
			this.m_AudioObject.Clear();
			this.m_AudioObject = null;
		}
	}

	// Token: 0x06001125 RID: 4389 RVA: 0x0008A281 File Offset: 0x00088681
	protected override void OnDisposed()
	{
		this.TurnOff();
		base.OnDisposed();
	}

	// Token: 0x040012F8 RID: 4856
	[Header("Transforms")]
	[SerializeField]
	private List<Transform> m_Reels;

	// Token: 0x040012F9 RID: 4857
	[SerializeField]
	private List<Transform> m_Tapes;

	// Token: 0x040012FA RID: 4858
	[Header("Positions")]
	[SerializeField]
	private Transform m_Left;

	// Token: 0x040012FB RID: 4859
	[SerializeField]
	private Transform m_Right;

	// Token: 0x040012FC RID: 4860
	private AudioObject m_AudioObject;

	// Token: 0x040012FD RID: 4861
	private Transform m_Target;
}
