using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200025F RID: 607
public class ChapterOneFloorController : BaseController
{
	// Token: 0x06000CBB RID: 3259 RVA: 0x000774A8 File Offset: 0x000758A8
	public void Activate()
	{
		this.m_FallingEventTrigger.SetActive(true);
		this.m_FallingEventTrigger.OnEnter += this.HandleOnFallingEventTriggerOnEnter;
		for (int i = 0; i < this.m_Colliders.Count; i++)
		{
			this.m_Colliders[i].SetActive(true);
		}
		this.m_Floor.SetActive(false);
		this.m_BrokenFloor.SetActive(true);
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Floor_Boards_Break_01.L", AudioObjectType.SOUND_EFFECT, 0, false);
		int count = this.m_Rigidbodies.Count;
		for (int j = 0; j < count; j++)
		{
			this.m_Rigidbodies[j].AddExplosionForce(1000f, this.m_ExplosionForcePosition.position, 10f);
		}
		base.StartCoroutine(this.DelayKinematic());
	}

	// Token: 0x06000CBC RID: 3260 RVA: 0x00077588 File Offset: 0x00075988
	private IEnumerator DelayKinematic()
	{
		yield return new WaitForSeconds(5f);
		int rigidbodyCount = this.m_Rigidbodies.Count;
		for (int i = 0; i < rigidbodyCount; i++)
		{
			this.m_Rigidbodies[i].isKinematic = true;
		}
		yield break;
	}

	// Token: 0x06000CBD RID: 3261 RVA: 0x000775A4 File Offset: 0x000759A4
	private void HandleOnFallingEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_FallingEventTrigger.OnEnter -= this.HandleOnFallingEventTriggerOnEnter;
		this.m_LandingEventTrigger.SetActive(true);
		this.m_LandingEventTrigger.OnEnter += this.HandleOnLandingEventTriggerOnEnter;
		this.m_BendyController.DisableMusic();
		GameManager.Instance.AudioManager.Play("Audio/DIA/ChapterOne/Henry/DIA_Player_09A", AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Tumble_Down_Shaft_01", AudioObjectType.SOUND_EFFECT, 0, false);
	}

	// Token: 0x06000CBE RID: 3262 RVA: 0x00077628 File Offset: 0x00075A28
	private void HandleOnLandingEventTriggerOnEnter(object sender, EventArgs e)
	{
		this.m_LandingEventTrigger.OnEnter -= this.HandleOnLandingEventTriggerOnEnter;
		GameManager.Instance.AchievementManager.SetAchievement(AchievementName.HELLO_BENDY);
		GameManager.Instance.GameCamera.Camera.transform.DOKill(false);
		GameManager.Instance.GameCamera.Camera.transform.DOLocalMove(Vector3.zero, 0.15f, false);
		GameManager.Instance.AudioManager.Play("Audio/DIA/ChapterOne/Henry/DIA_Player_09B", AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Tumble_Down_Shaft_Body_Fall_01", AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.AudioManager.Play("Audio/MUS/MUS_Title_Music_Sketches", AudioObjectType.SOUND_EFFECT, 0, false);
		base.SendOnComplete();
	}

	// Token: 0x06000CBF RID: 3263 RVA: 0x000776EA File Offset: 0x00075AEA
	protected override void OnDisposed()
	{
		base.StopCoroutine(this.DelayKinematic());
		base.OnDisposed();
	}

	// Token: 0x04000ED5 RID: 3797
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_Floor;

	// Token: 0x04000ED6 RID: 3798
	[SerializeField]
	private GameObject m_BrokenFloor;

	// Token: 0x04000ED7 RID: 3799
	[SerializeField]
	private List<GameObject> m_Colliders;

	// Token: 0x04000ED8 RID: 3800
	[Header("Transforms")]
	[SerializeField]
	private Transform m_ExplosionForcePosition;

	// Token: 0x04000ED9 RID: 3801
	[Header("Rigidbodies")]
	[SerializeField]
	private List<Rigidbody> m_Rigidbodies;

	// Token: 0x04000EDA RID: 3802
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_FallingEventTrigger;

	// Token: 0x04000EDB RID: 3803
	[SerializeField]
	private EventTrigger m_LandingEventTrigger;

	// Token: 0x04000EDC RID: 3804
	[Header("Controllers")]
	[SerializeField]
	private ChapterOneBendyFinaleController m_BendyController;
}
