using System;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

// Token: 0x02000270 RID: 624
public class ChapterTwoMainGateSwitchController : BaseController
{
	// Token: 0x06000D78 RID: 3448 RVA: 0x0007B654 File Offset: 0x00079A54
	public override void Init()
	{
		base.Init();
		this.m_PlankLight.SetActive(false);
		this.m_LightFixture.TurnOn();
		this.m_SwitchLightCount = this.m_GateButtons.Count;
		this.m_GateSwitchInteract.SetActive(false);
		for (int i = 0; i < this.m_GateSwitchLights.Count; i++)
		{
			ChapterTwoMainGateSwitchController.GateSwitchLights gateSwitchLights = this.m_GateSwitchLights[i];
			gateSwitchLights.OriginColor = gateSwitchLights.Light.color;
			gateSwitchLights.Flicker.enabled = true;
		}
		for (int j = 0; j < this.m_GateButtons.Count; j++)
		{
			this.m_GateButtons[j].Light.intensity = 0f;
		}
	}

	// Token: 0x06000D79 RID: 3449 RVA: 0x0007B718 File Offset: 0x00079B18
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_GenericButtonClips = GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/GenericButtons");
	}

	// Token: 0x06000D7A RID: 3450 RVA: 0x0007B73A File Offset: 0x00079B3A
	public void Activate()
	{
		this.m_GateObjective.OnEnter += this.HandleObjectiveOnEnter;
	}

	// Token: 0x06000D7B RID: 3451 RVA: 0x0007B754 File Offset: 0x00079B54
	private void HandleObjectiveOnEnter(object sender, EventArgs e)
	{
		this.m_GateObjective.OnEnter -= this.HandleObjectiveOnEnter;
		GameManager.Instance.ShowDialogue(DialogueDataVO.Create("Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_05", "Need to get power to this gate somehow.\nShould be a couple of switches nearby.\nThen maybe I can open it.", false)).OnComplete += delegate(object _sender, EventArgs _e)
		{
			GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_02;
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "REDIRECT POWER TO THE GATE", "TIP: FIND THREE SWITCHES", 4f, false));
		};
		this.AddListeners();
	}

	// Token: 0x06000D7C RID: 3452 RVA: 0x0007B7BC File Offset: 0x00079BBC
	private void HandleGateButtonOnInteract(object sender, EventArgs e)
	{
		ChapterTwoMainGateSwitchController.GateButton gateButton = null;
		for (int i = 0; i < this.m_GateButtons.Count; i++)
		{
			if (this.m_GateButtons[i].Interact.Equals(sender))
			{
				gateButton = this.m_GateButtons[i];
			}
		}
		if (gateButton == null)
		{
			return;
		}
		this.PlayGenericButtonSound(gateButton.Button.position);
		gateButton.Interact.OnInteracted -= this.HandleGateButtonOnInteract;
		gateButton.Button.DOLocalMoveZ(-0.025f, 0.5f, false).SetEase(Ease.OutBack);
		gateButton.Light.DOIntensity(8f, 0.25f).SetDelay(0.25f).SetEase(Ease.Linear);
		ChapterTwoMainGateSwitchController.GateSwitchLights gateSwitchLights = this.m_GateSwitchLights[this.m_LightsActivate];
		gateSwitchLights.Flicker.enabled = false;
		gateSwitchLights.Light.color = gateSwitchLights.OriginColor;
		this.m_LightsActivate++;
		if (this.m_LightsActivate >= this.m_SwitchLightCount)
		{
			this.m_IsReady = true;
			this.HandleShowGateObjective();
			this.m_GateSwitchInteract.SetActive(true);
			this.m_GateSwitchInteract.OnInteracted += this.HandleGateSwitchOnInteract;
		}
	}

	// Token: 0x06000D7D RID: 3453 RVA: 0x0007B901 File Offset: 0x00079D01
	private void HandleShowGateObjective()
	{
		GameManager.Instance.CurrentObjective = ObjectiveConstants.ChapterObjectives.OBJECTIVE_03;
		GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "RAISE THE GATE", string.Empty, 4f, false));
	}

	// Token: 0x06000D7E RID: 3454 RVA: 0x0007B934 File Offset: 0x00079D34
	private void HandleGateSwitchOnInteract(object sender, EventArgs e)
	{
		this.m_GateSwitchInteract.OnInteracted -= this.HandleGateSwitchOnInteract;
		base.SendOnComplete();
		Sequence sequence = DOTween.Sequence();
		float num = 0f;
		float num2 = 0.5f;
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Mainr_Power_Lever_Turn_On_01", AudioObjectType.SOUND_EFFECT, 0, false);
		sequence.Insert(num, this.m_GateSwitch.DOLocalMove(this.m_GateSwitchEndPos.localPosition, num2, false).SetEase(Ease.OutQuad));
		num += num2;
		sequence.InsertCallback(num, new TweenCallback(this.TurnOffLights));
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Gate_Open_Slow_01", AudioObjectType.SOUND_EFFECT, 0, false);
		});
		num += 2f;
		sequence.Insert(num, this.m_GateDoor.DOLocalMoveY(9.75f, 8f, false).SetEase(Ease.Linear));
		for (int i = 0; i < 7; i++)
		{
			sequence.Insert(num + (float)i * 1f, GameManager.Instance.GameCamera.Camera.DOShakePosition(1f, 0.05f, 10, 90f, false));
		}
		num += 7f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Light_Switch_Sammys_Room_01", AudioObjectType.SOUND_EFFECT, 0, false);
			GameManager.Instance.AudioManager.Play("Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_02", AudioObjectType.SOUND_EFFECT, 0, false);
			this.m_PlankLight.SetActive(true);
		});
		sequence.Insert(num, GameManager.Instance.GameCamera.Camera.DOShakePosition(1f, 0.05f, 10, 90f, true));
		num += 1f;
		sequence.InsertCallback(num, delegate
		{
			GameManager.Instance.GameCamera.Camera.transform.localPosition = Vector3.zero;
		});
		sequence.OnComplete(delegate
		{
			GameManager.Instance.ShowObjective(ObjectiveDataVO.Create("New Objective:", "FIND A NEW EXIT", string.Empty, 4f, false));
		});
	}

	// Token: 0x06000D7F RID: 3455 RVA: 0x0007BAFB File Offset: 0x00079EFB
	private void TurnOffLights()
	{
		GameManager.Instance.AudioManager.Play("Audio/SFX/SFX_Light_Switch_Sammys_Room_01", AudioObjectType.SOUND_EFFECT, 0, false);
		this.m_LightFixture.TurnOff();
	}

	// Token: 0x06000D80 RID: 3456 RVA: 0x0007BB20 File Offset: 0x00079F20
	private void PlayGenericButtonSound(Vector3 position)
	{
		if (this.m_GenericButtonClips == null || this.m_GenericButtonClips.Length <= 0)
		{
			return;
		}
		int num = UnityEngine.Random.Range(0, this.m_GenericButtonClips.Length);
		AudioClip audioClip = this.m_GenericButtonClips[num];
		GameManager.Instance.AudioManager.PlayAtPosition(audioClip, position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		this.m_GenericButtonClips[num] = this.m_GenericButtonClips[0];
		this.m_GenericButtonClips[0] = audioClip;
	}

	// Token: 0x06000D81 RID: 3457 RVA: 0x0007BB90 File Offset: 0x00079F90
	private void AddListeners()
	{
		for (int i = 0; i < this.m_GateButtons.Count; i++)
		{
			this.m_GateButtons[i].Interact.SetActive(true);
			this.m_GateButtons[i].Interact.OnInteracted += this.HandleGateButtonOnInteract;
		}
		this.m_GateSwitchInteract.OnInteracted += this.HandleGateSwitchOnInteract;
	}

	// Token: 0x06000D82 RID: 3458 RVA: 0x0007BC0C File Offset: 0x0007A00C
	private void RemoveListeners()
	{
		for (int i = 0; i < this.m_GateButtons.Count; i++)
		{
			this.m_GateButtons[i].Interact.OnInteracted -= this.HandleGateButtonOnInteract;
		}
		this.m_GateSwitchInteract.OnInteracted -= this.HandleGateSwitchOnInteract;
	}

	// Token: 0x06000D83 RID: 3459 RVA: 0x0007BC6E File Offset: 0x0007A06E
	protected override void OnDisposed()
	{
		this.RemoveListeners();
		base.OnDisposed();
	}

	// Token: 0x04000F95 RID: 3989
	[Header("Transform")]
	[SerializeField]
	private Transform m_GateDoor;

	// Token: 0x04000F96 RID: 3990
	[SerializeField]
	private Transform m_SearcherAudioPosition;

	// Token: 0x04000F97 RID: 3991
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_PlankLight;

	// Token: 0x04000F98 RID: 3992
	[Header("Gate Switches")]
	[SerializeField]
	private Transform m_GateSwitch;

	// Token: 0x04000F99 RID: 3993
	[SerializeField]
	private Transform m_GateSwitchEndPos;

	// Token: 0x04000F9A RID: 3994
	[SerializeField]
	private List<ChapterTwoMainGateSwitchController.GateButton> m_GateButtons;

	// Token: 0x04000F9B RID: 3995
	[SerializeField]
	private List<ChapterTwoMainGateSwitchController.GateSwitchLights> m_GateSwitchLights;

	// Token: 0x04000F9C RID: 3996
	[Header("Lights")]
	[SerializeField]
	private LightFixtureController m_LightFixture;

	// Token: 0x04000F9D RID: 3997
	[Header("Interactables")]
	[SerializeField]
	private Interactable m_GateSwitchInteract;

	// Token: 0x04000F9E RID: 3998
	[Header("Event Triggers")]
	[SerializeField]
	private EventTrigger m_GateObjective;

	// Token: 0x04000F9F RID: 3999
	private AudioClip[] m_GenericButtonClips;

	// Token: 0x04000FA0 RID: 4000
	private int m_SwitchLightCount;

	// Token: 0x04000FA1 RID: 4001
	private int m_LightsActivate;

	// Token: 0x04000FA2 RID: 4002
	private bool m_IsReady;

	// Token: 0x02000271 RID: 625
	[Serializable]
	public class GateButton
	{
		// Token: 0x04000FA7 RID: 4007
		public Interactable Interact;

		// Token: 0x04000FA8 RID: 4008
		public Transform Button;

		// Token: 0x04000FA9 RID: 4009
		public Light Light;
	}

	// Token: 0x02000272 RID: 626
	[Serializable]
	public class GateSwitchLights
	{
		// Token: 0x04000FAA RID: 4010
		public Light Light;

		// Token: 0x04000FAB RID: 4011
		public LightFlicker Flicker;

		// Token: 0x04000FAC RID: 4012
		public Color OriginColor;
	}
}
