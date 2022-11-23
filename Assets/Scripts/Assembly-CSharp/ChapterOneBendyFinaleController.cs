using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x0200025C RID: 604
public class ChapterOneBendyFinaleController : TMGMonoBehaviour
{
	// Token: 0x06000C80 RID: 3200 RVA: 0x00075EB0 File Offset: 0x000742B0
	public override void Init()
	{
		base.Init();
		Vector3 b = new Vector3(0f, 9.5f, 0f);
		this.m_HallwayDoor.localPosition += b;
		this.m_HenreyDeskDoor.localPosition += b;
		this.m_InkFloorCount = this.m_InkFloors.Count;
		this.m_Barricade.SetActive(false);
	}

	// Token: 0x06000C81 RID: 3201 RVA: 0x00075F24 File Offset: 0x00074324
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_MusicClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/MUS/MUS_Little_Devil_Darling_Loop_01");
		this.m_GateClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Gate_Close_01");
		this.m_JumpscareClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_ChapterOneBendyAppears");
		this.m_PipeStressClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_Pipes_Stress_01");
		this.m_InkFlowClip = GameManager.Instance.AssetManager.GetAsset<AudioClip>("Audio/SFX/SFX_batim_ink_dripping_loop_01");
	}

	// Token: 0x06000C82 RID: 3202 RVA: 0x00075FBC File Offset: 0x000743BC
	public void Activate()
	{
		this.m_Barricade.SetActive(true);
		for (int i = 0; i < this.m_InkFloorCount; i++)
		{
			this.m_InkFloors[i].ShowInk();
		}
	}

	// Token: 0x06000C83 RID: 3203 RVA: 0x00075FFD File Offset: 0x000743FD
	public void DisableMusic()
	{
		if (this.m_Music != null)
		{
			this.m_Music.AudioSource.DOFade(0f, 0.5f).OnComplete(delegate
			{
				this.m_Music.Clear();
				this.m_Music = null;
			});
		}
	}

	// Token: 0x06000C84 RID: 3204 RVA: 0x0007603C File Offset: 0x0007443C
	public bool CanActivate()
	{
		if (this.m_InkMachineMeshRenderer.isVisible)
		{
			base.StartCoroutine(this.DelayScare());
			return true;
		}
		return false;
	}

	// Token: 0x06000C85 RID: 3205 RVA: 0x00076060 File Offset: 0x00074460
	private IEnumerator DelayScare()
	{
		this.m_BENDY.SetActive(true);
		this.ActualActivate();
		yield return new WaitForSeconds(3f);
		this.m_StrobeLights.SetActive(false);
		yield break;
	}

	// Token: 0x06000C86 RID: 3206 RVA: 0x0007607B File Offset: 0x0007447B
	private void ShakeCamera()
	{
		GameManager.Instance.GameCamera.transform.DOShakePosition(0.15f, 0.15f, 7, 90f, false, false).SetEase(Ease.Linear).OnComplete(new TweenCallback(this.ShakeCamera));
	}

	// Token: 0x06000C87 RID: 3207 RVA: 0x000760BC File Offset: 0x000744BC
	private void ActualActivate()
	{
		this.ShakeCamera();
		this.m_SammysDoor.Close(0f, Ease.Linear, new Action(this.m_SammysDoor.Lock));
		GameManager.Instance.AudioManager.Play(this.m_JumpscareClip, AudioObjectType.SOUND_EFFECT, 0, false);
		GameManager.Instance.AudioManager.Play(this.m_PipeStressClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_Music = GameManager.Instance.AudioManager.Play(this.m_MusicClip, AudioObjectType.MUSIC, -1, false);
		this.m_Music.AudioSource.volume = 0.1f;
		this.m_Music.AudioSource.DOFade(1f, 2f).SetEase(Ease.Linear).SetDelay(0.2f);
		this.m_InkFlowLoop = GameManager.Instance.AudioManager.Play(this.m_InkFlowClip, AudioObjectType.SOUND_EFFECT, -1, false);
		this.m_SammysRoomController.UnlockRoom();
		this.m_ProjectorController.ShutDown();
		this.m_FinaleLighting.SetActive(true);
		for (int i = 0; i < this.m_LightFixtureControllers.Count; i++)
		{
			this.m_LightFixtureControllers[i].TurnOff();
		}
		for (int j = 0; j < this.m_Lights.Count; j++)
		{
			this.m_Lights[j].SetActive(false);
		}
		this.m_InkFinale.SetActive(true);
		for (int k = 0; k < this.m_InkFinaleTweens.Count; k++)
		{
			this.m_InkFinaleTweens[k].DOScale(0f, 1f).From<Tweener>();
		}
		this.m_HenreyDeskDoor.localPosition = Vector3.zero;
		GameManager.Instance.AudioManager.Play(this.m_GateClip, AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_HallwayDoor.gameObject.SetActive(true);
		this.m_HallwayDoor.DOLocalMoveY(0f, 0.5f, false).SetEase(Ease.Linear);
		this.m_InkDissolveMaterial.SetFloat("_DissolveAmount", 1f);
		this.m_InkDissolveMaterial.DOKill(false);
		this.m_InkDissolveMaterial.DOFloat(0.36f, "_DissolveAmount", 7.5f);
		if (this.m_BendyLoop != null)
		{
			this.m_BendyLoop.AudioSource.DOFade(0f, 1f).SetDelay(1f).OnComplete(delegate
			{
				this.m_BendyLoop.Clear();
				this.m_BendyLoop = null;
			});
		}
		if (this.m_InkFlowLoop != null)
		{
			this.m_InkFlowLoop.AudioSource.DOFade(0f, 2f).SetDelay(0f).OnComplete(delegate
			{
				this.m_InkFlowLoop.Clear();
				this.m_InkFlowLoop = null;
			});
		}
	}

	// Token: 0x06000C88 RID: 3208 RVA: 0x00076388 File Offset: 0x00074788
	protected override void OnDisposed()
	{
		this.m_InkDissolveMaterial.SetFloat("_DissolveAmount", 1f);
		this.m_InkDissolveMaterial.DOKill(false);
		if (this.m_BendyLoop != null)
		{
			this.m_BendyLoop.Stop();
			this.m_BendyLoop = null;
		}
		if (this.m_Music != null)
		{
			this.m_Music.Stop();
			this.m_Music = null;
		}
		this.m_MusicClip = null;
		this.m_GateClip = null;
		base.OnDisposed();
	}

	// Token: 0x04000E84 RID: 3716
	private const string DISSOLVE_AMOUNT = "_DissolveAmount";

	// Token: 0x04000E85 RID: 3717
	[Header("Transforms")]
	[SerializeField]
	private Transform m_HenreyDeskDoor;

	// Token: 0x04000E86 RID: 3718
	[SerializeField]
	private Transform m_HallwayDoor;

	// Token: 0x04000E87 RID: 3719
	[SerializeField]
	private Transform m_BreakForcePosition;

	// Token: 0x04000E88 RID: 3720
	[SerializeField]
	private Transform m_BendyAudioLoopPosition;

	// Token: 0x04000E89 RID: 3721
	[SerializeField]
	private List<Transform> m_InkFinaleTweens;

	// Token: 0x04000E8A RID: 3722
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_InkFinale;

	// Token: 0x04000E8B RID: 3723
	[SerializeField]
	private GameObject m_Barricade;

	// Token: 0x04000E8C RID: 3724
	[SerializeField]
	private GameObject m_StrobeLights;

	// Token: 0x04000E8D RID: 3725
	[Header("Materials")]
	[SerializeField]
	private Material m_InkDissolveMaterial;

	// Token: 0x04000E8E RID: 3726
	[Header("Ink Floors")]
	[SerializeField]
	private List<InkedFloor> m_InkFloors;

	// Token: 0x04000E8F RID: 3727
	[Header("Sammys Room")]
	[SerializeField]
	private ChapterOneSammysRoomController m_SammysRoomController;

	// Token: 0x04000E90 RID: 3728
	[SerializeField]
	private ChapterOneMainRoomProjectorController m_ProjectorController;

	// Token: 0x04000E91 RID: 3729
	[Header("Lights")]
	[SerializeField]
	private List<LightFixtureController> m_LightFixtureControllers;

	// Token: 0x04000E92 RID: 3730
	[SerializeField]
	private List<GameObject> m_Lights;

	// Token: 0x04000E93 RID: 3731
	[SerializeField]
	private GameObject m_FinaleLighting;

	// Token: 0x04000E94 RID: 3732
	[Header("Mesh Renderers")]
	[SerializeField]
	private MeshRenderer m_InkMachineMeshRenderer;

	// Token: 0x04000E95 RID: 3733
	[Header("Door")]
	[SerializeField]
	private DoorController m_SammysDoor;

	// Token: 0x04000E96 RID: 3734
	[Header("TEMP")]
	[SerializeField]
	private GameObject m_BENDY;

	// Token: 0x04000E97 RID: 3735
	[SerializeField]
	private Animator m_BendyAnimator;

	// Token: 0x04000E98 RID: 3736
	private AudioClip m_JumpscareClip;

	// Token: 0x04000E99 RID: 3737
	private AudioClip m_MusicClip;

	// Token: 0x04000E9A RID: 3738
	private AudioClip m_GateClip;

	// Token: 0x04000E9B RID: 3739
	private AudioClip m_PipeStressClip;

	// Token: 0x04000E9C RID: 3740
	private AudioClip m_InkFlowClip;

	// Token: 0x04000E9D RID: 3741
	private AudioObject m_Music;

	// Token: 0x04000E9E RID: 3742
	private AudioObject m_BendyLoop;

	// Token: 0x04000E9F RID: 3743
	private AudioObject m_InkFlowLoop;

	// Token: 0x04000EA0 RID: 3744
	private int m_InkFloorCount;
}
