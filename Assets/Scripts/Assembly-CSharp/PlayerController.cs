using System;
using System.Collections.Generic;
using DG.Tweening;
using TMG.Controls;
using TMG.Core;
using UnityEngine;

// Token: 0x0200029D RID: 669
public class PlayerController : TMGMonoBehaviour
{
	// Token: 0x170002A3 RID: 675
	// (get) Token: 0x06000F5D RID: 3933 RVA: 0x000845E2 File Offset: 0x000829E2
	public Transform HeadContainer
	{
		get
		{
			return this.m_HeadContainer;
		}
	}

	// Token: 0x170002A4 RID: 676
	// (get) Token: 0x06000F5E RID: 3934 RVA: 0x000845EA File Offset: 0x000829EA
	public Transform CameraParent
	{
		get
		{
			return this.m_CameraContainer;
		}
	}

	// Token: 0x170002A5 RID: 677
	// (get) Token: 0x06000F5F RID: 3935 RVA: 0x000845F2 File Offset: 0x000829F2
	public Transform WeaponParent
	{
		get
		{
			return this.m_WeaponParent;
		}
	}

	// Token: 0x170002A6 RID: 678
	// (get) Token: 0x06000F60 RID: 3936 RVA: 0x000845FA File Offset: 0x000829FA
	// (set) Token: 0x06000F61 RID: 3937 RVA: 0x00084602 File Offset: 0x00082A02
	public bool isLocked { get; private set; }

	// Token: 0x170002A7 RID: 679
	// (get) Token: 0x06000F62 RID: 3938 RVA: 0x0008460B File Offset: 0x00082A0B
	public bool useGravity
	{
		get
		{
			return this.m_EnableGravity;
		}
	}

	// Token: 0x170002A8 RID: 680
	// (get) Token: 0x06000F63 RID: 3939 RVA: 0x00084613 File Offset: 0x00082A13
	// (set) Token: 0x06000F64 RID: 3940 RVA: 0x0008461B File Offset: 0x00082A1B
	public bool isSlowed { get; private set; }

	// Token: 0x170002A9 RID: 681
	// (get) Token: 0x06000F65 RID: 3941 RVA: 0x00084624 File Offset: 0x00082A24
	// (set) Token: 0x06000F66 RID: 3942 RVA: 0x0008462C File Offset: 0x00082A2C
	public bool isMoveLocked { get; private set; }

	// Token: 0x170002AA RID: 682
	// (get) Token: 0x06000F67 RID: 3943 RVA: 0x00084635 File Offset: 0x00082A35
	// (set) Token: 0x06000F68 RID: 3944 RVA: 0x0008463D File Offset: 0x00082A3D
	public bool canJump { get; private set; }

	// Token: 0x170002AB RID: 683
	// (get) Token: 0x06000F69 RID: 3945 RVA: 0x00084646 File Offset: 0x00082A46
	// (set) Token: 0x06000F6A RID: 3946 RVA: 0x0008464E File Offset: 0x00082A4E
	public bool canCameraSway { get; private set; }

	// Token: 0x170002AC RID: 684
	// (get) Token: 0x06000F6B RID: 3947 RVA: 0x00084657 File Offset: 0x00082A57
	// (set) Token: 0x06000F6C RID: 3948 RVA: 0x0008465F File Offset: 0x00082A5F
	public bool canRun { get; private set; }

	// Token: 0x06000F6D RID: 3949 RVA: 0x00084668 File Offset: 0x00082A68
	public override void Init()
	{
		base.Init();
		Cursor.visible = false;
		Cursor.lockState = CursorLockMode.Locked;
		GameManager.Instance.Player = this;
		this.Lock();
		this.m_CharacterController = base.GetComponent<CharacterController>();
		List<FootstepsDataVO> list = new List<FootstepsDataVO>();
		list.Add(FootstepsDataVO.Create(FootstepTypes.WOOD, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Player/Wood")));
		list.Add(FootstepsDataVO.Create(FootstepTypes.WOOD_STAIRS, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Player/WoodStairs")));
		list.Add(FootstepsDataVO.Create(FootstepTypes.INK, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Player/Ink")));
		list.Add(FootstepsDataVO.Create(FootstepTypes.INK_STAIRS, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Player/InkStairs")));
		list.Add(FootstepsDataVO.Create(FootstepTypes.INK_DEEP, GameManager.Instance.AssetManager.GetAssets<AudioClip>("Audio/SFX/Footsteps/Player/InkDeep")));
		this.canJump = this.m_EnableJump;
		this.canRun = this.m_EnableRun;
		this.m_PlayerFootsteps.Init(list, false);
		this.m_HeadBob.Init(this.m_HeadContainer, this.m_PlayerFootsteps.StepInterval);
		this.m_CameraMovement.Init(this.m_HeadContainer, this.m_CameraContainer);
		this.m_PlayerLook.Init(base.transform, this.m_HeadContainer);
		this.m_Interaction.Init();
	}

	// Token: 0x06000F6E RID: 3950 RVA: 0x000847C4 File Offset: 0x00082BC4
	private void Update()
	{
		if (GameManager.Instance.isPaused)
		{
			return;
		}
		this.CameraSway();
		this.RotateView();
		if (this.m_CharacterController.isGrounded)
		{
			if (!this.m_JumpInput && this.m_EnableJump && this.canJump && !this.isLocked && !this.isMoveLocked)
			{
				this.m_JumpInput = PlayerInput.Jump();
			}
			if (!this.m_PreviouslyGrounded)
			{
				base.StartCoroutine(this.m_HeadBob.DoJumpBob());
				this.m_MoveDir.y = 0f;
				this.m_IsJumping = false;
			}
		}
		if (!this.m_CharacterController.isGrounded && !this.m_IsJumping && this.m_PreviouslyGrounded)
		{
			this.m_MoveDir.y = 0f;
		}
		this.m_PreviouslyGrounded = this.m_CharacterController.isGrounded;
		this.m_Interaction.UpdateInteraction(this.m_HeadContainer.position, this.m_HeadContainer.forward);
	}

	// Token: 0x06000F6F RID: 3951 RVA: 0x000848DC File Offset: 0x00082CDC
	private void FixedUpdate()
	{
		if (GameManager.Instance.isPaused)
		{
			return;
		}
		float speed = 0f;
		this.GetInput(out speed);
		if (!this.isMoveLocked)
		{
			this.Move(speed);
		}
		this.m_PlayerLook.UpdateCursorLock();
	}

	// Token: 0x06000F70 RID: 3952 RVA: 0x00084924 File Offset: 0x00082D24
	private void CameraSway()
	{
		if (this.isLocked && !this.canCameraSway)
		{
			return;
		}
		this.m_CameraMovement.Sway(this.m_HeadContainer);
	}

	// Token: 0x06000F71 RID: 3953 RVA: 0x0008494E File Offset: 0x00082D4E
	private void RotateView()
	{
		if (this.isLocked)
		{
			return;
		}
		this.m_PlayerLook.Rotation(base.transform, new Transform[]
		{
			this.m_HeadContainer,
			this.m_HandContainer
		});
	}

	// Token: 0x06000F72 RID: 3954 RVA: 0x00084988 File Offset: 0x00082D88
	private void GetInput(out float speed)
	{
		if (this.isLocked)
		{
			speed = 0f;
			return;
		}
		float x = PlayerInput.MoveX();
		float num = PlayerInput.MoveY();
		if (num > 0f)
		{
			this.m_IsRunning = (this.m_EnableRun && PlayerInput.Run());
		}
		else
		{
			this.m_IsRunning = false;
		}
		speed = ((!this.m_IsRunning) ? this.m_MoveSpeed : this.m_RunSpeed);
		if (this.isSlowed)
		{
			speed = this.m_SlowedMoveSpeed;
			this.m_IsRunning = false;
		}
		if (!this.canRun)
		{
			speed = this.m_MoveSpeed;
		}
		this.m_Input = new Vector2(x, num);
		if (this.m_Input.sqrMagnitude > 1f)
		{
			this.m_Input.Normalize();
		}
	}

	// Token: 0x06000F73 RID: 3955 RVA: 0x00084A60 File Offset: 0x00082E60
	private void Move(float speed)
	{
		Vector3 vector = base.transform.forward * this.m_Input.y + base.transform.right * this.m_Input.x;
		RaycastHit raycastHit;
		Physics.SphereCast(base.transform.position, this.m_CharacterController.radius, Vector3.down, out raycastHit, this.m_CharacterController.height / 2f, -1, QueryTriggerInteraction.Ignore);
		if (raycastHit.transform != null)
		{
			if (raycastHit.transform.gameObject.layer == LayerMask.NameToLayer("StaticPlank"))
			{
				vector = (base.transform.position - raycastHit.point).normalized;
			}
			else
			{
				vector = Vector3.ProjectOnPlane(vector, raycastHit.normal).normalized;
			}
		}
		this.m_MoveDir.x = vector.x * speed;
		this.m_MoveDir.z = vector.z * speed;
		if (this.m_CharacterController.isGrounded)
		{
			this.m_MoveDir.y = -this.m_StickToGroundForce;
			if (this.m_JumpInput)
			{
				this.m_MoveDir.y = this.m_JumpSpeed;
				this.m_JumpInput = false;
				this.m_IsJumping = true;
			}
		}
		else if (this.m_EnableGravity)
		{
			this.m_MoveDir += Physics.gravity * this.m_GravityMultiplier * Time.fixedDeltaTime;
		}
		this.m_CollisionFlags = this.m_CharacterController.Move(this.m_MoveDir * Time.fixedDeltaTime);
		if (this.m_CharacterController.isGrounded)
		{
			float magnitude = this.m_CharacterController.velocity.magnitude;
			FootstepTypes footstepType = FootstepTypes.WOOD;
			RaycastHit raycastHit2;
			if (Physics.Raycast(base.transform.position, Vector3.down, out raycastHit2, 6f))
			{
				if (raycastHit2.collider.tag == "Ink")
				{
					footstepType = FootstepTypes.INK;
				}
				else if (raycastHit2.collider.tag == "Stairs")
				{
					footstepType = FootstepTypes.WOOD_STAIRS;
				}
				else if (raycastHit2.collider.tag == "DeepInk")
				{
					footstepType = FootstepTypes.INK_DEEP;
				}
			}
			this.m_PlayerFootsteps.SetFootstepType(footstepType);
			this.m_PlayerFootsteps.ProgressStepCycle(magnitude, speed);
			this.m_HeadBob.UpdateCameraPosition(magnitude, speed);
		}
		if (GameManager.Instance.GameCamera != null)
		{
			if (this.m_IsRunning && this.m_CharacterController.velocity.magnitude > 0.01f)
			{
				GameManager.Instance.GameCamera.Camera.DOKill(false);
				GameManager.Instance.GameCamera.Camera.DOFieldOfView(this.m_RunFOV, 0.5f);
				GameManager.Instance.GameCamera.WeaponCamera.DOKill(false);
				GameManager.Instance.GameCamera.WeaponCamera.DOFieldOfView(this.m_RunFOV, 0.5f);
			}
			else
			{
				if (GameManager.Instance.GameCamera.Camera.fieldOfView != this.m_BaseFOV)
				{
					GameManager.Instance.GameCamera.Camera.DOKill(false);
					GameManager.Instance.GameCamera.Camera.DOFieldOfView(this.m_BaseFOV, 0.5f);
				}
				GameManager.Instance.GameCamera.WeaponCamera.DOKill(false);
				GameManager.Instance.GameCamera.WeaponCamera.DOFieldOfView(this.m_BaseFOV, 0.5f);
			}
		}
	}

	// Token: 0x06000F74 RID: 3956 RVA: 0x00084E2D File Offset: 0x0008322D
	public void LookRotation(Quaternion playerRotation)
	{
		this.m_PlayerLook.ForceRotation(playerRotation);
	}

	// Token: 0x06000F75 RID: 3957 RVA: 0x00084E3B File Offset: 0x0008323B
	public void LookRotation(Quaternion playerRotation, Quaternion cameraRotation)
	{
		this.m_PlayerLook.ForceRotation(playerRotation);
		this.m_PlayerLook.ForceCameraRotation(cameraRotation);
	}

	// Token: 0x06000F76 RID: 3958 RVA: 0x00084E55 File Offset: 0x00083255
	public void SetSensitivity(float value)
	{
		this.m_PlayerLook.SetSensitivity(value);
	}

	// Token: 0x06000F77 RID: 3959 RVA: 0x00084E63 File Offset: 0x00083263
	public void LockMovement()
	{
		this.isMoveLocked = true;
	}

	// Token: 0x06000F78 RID: 3960 RVA: 0x00084E6C File Offset: 0x0008326C
	public void UnlockMovement()
	{
		this.isMoveLocked = false;
	}

	// Token: 0x06000F79 RID: 3961 RVA: 0x00084E75 File Offset: 0x00083275
	public void Lock()
	{
		this.isLocked = true;
	}

	// Token: 0x06000F7A RID: 3962 RVA: 0x00084E7E File Offset: 0x0008327E
	public void Unlock()
	{
		this.isLocked = false;
	}

	// Token: 0x06000F7B RID: 3963 RVA: 0x00084E87 File Offset: 0x00083287
	public void SlowSpeed()
	{
		this.isSlowed = true;
	}

	// Token: 0x06000F7C RID: 3964 RVA: 0x00084E90 File Offset: 0x00083290
	public void ResetSpeed()
	{
		this.isSlowed = false;
	}

	// Token: 0x06000F7D RID: 3965 RVA: 0x00084E99 File Offset: 0x00083299
	public void LockJump()
	{
		this.canJump = false;
	}

	// Token: 0x06000F7E RID: 3966 RVA: 0x00084EA2 File Offset: 0x000832A2
	public void UnlockJump()
	{
		this.canJump = true;
	}

	// Token: 0x06000F7F RID: 3967 RVA: 0x00084EAB File Offset: 0x000832AB
	public void LockRun()
	{
		this.canRun = false;
	}

	// Token: 0x06000F80 RID: 3968 RVA: 0x00084EB4 File Offset: 0x000832B4
	public void EquipWeapon()
	{
		this.m_Interaction.HasWeapon = true;
	}

	// Token: 0x06000F81 RID: 3969 RVA: 0x00084EC2 File Offset: 0x000832C2
	public void UnEquipWeapon()
	{
		this.m_Interaction.HasWeapon = false;
	}

	// Token: 0x06000F82 RID: 3970 RVA: 0x00084ED0 File Offset: 0x000832D0
	public void LockRotation(float x, float y)
	{
		this.m_PlayerLook.HorizontalClampSetActive(true);
		this.m_PlayerLook.SetHorizontalClamp(x);
		this.m_PlayerLook.SetVerticalClamp(y);
	}

	// Token: 0x06000F83 RID: 3971 RVA: 0x00084EF6 File Offset: 0x000832F6
	public void UnlockRotation()
	{
		this.m_PlayerLook.HorizontalClampSetActive(false);
		this.m_PlayerLook.ResetVerticalClamp();
	}

	// Token: 0x06000F84 RID: 3972 RVA: 0x00084F0F File Offset: 0x0008330F
	public void DisableInteraction()
	{
		this.m_Interaction.SetActive(false);
	}

	// Token: 0x06000F85 RID: 3973 RVA: 0x00084F1D File Offset: 0x0008331D
	public void EnableInteraction()
	{
		this.m_Interaction.SetActive(true);
	}

	// Token: 0x06000F86 RID: 3974 RVA: 0x00084F2B File Offset: 0x0008332B
	public void CameraSwaySetActive(bool active)
	{
		this.canCameraSway = active;
	}

	// Token: 0x06000F87 RID: 3975 RVA: 0x00084F34 File Offset: 0x00083334
	protected override void OnDisposed()
	{
		GameManager.Instance.Player = null;
		base.OnDisposed();
	}

	// Token: 0x0400111F RID: 4383
	[Header("Transforms")]
	[SerializeField]
	private Transform m_HeadContainer;

	// Token: 0x04001120 RID: 4384
	[SerializeField]
	private Transform m_HandContainer;

	// Token: 0x04001121 RID: 4385
	[SerializeField]
	private Transform m_WeaponParent;

	// Token: 0x04001122 RID: 4386
	[SerializeField]
	private Transform m_CameraContainer;

	// Token: 0x04001123 RID: 4387
	[Header("Movement Options")]
	[SerializeField]
	private float m_SlowedMoveSpeed = 4f;

	// Token: 0x04001124 RID: 4388
	[SerializeField]
	private float m_MoveSpeed = 7f;

	// Token: 0x04001125 RID: 4389
	[SerializeField]
	private float m_RunSpeed = 10f;

	// Token: 0x04001126 RID: 4390
	[Header("Run Options")]
	[SerializeField]
	private bool m_EnableRun = true;

	// Token: 0x04001127 RID: 4391
	[SerializeField]
	private float m_BaseFOV = 64f;

	// Token: 0x04001128 RID: 4392
	[SerializeField]
	private float m_RunFOV = 68f;

	// Token: 0x04001129 RID: 4393
	[Header("Jump Options")]
	[SerializeField]
	private bool m_EnableJump = true;

	// Token: 0x0400112A RID: 4394
	[SerializeField]
	private float m_JumpSpeed = 10f;

	// Token: 0x0400112B RID: 4395
	[SerializeField]
	private List<AudioClip> m_JumpClips;

	// Token: 0x0400112C RID: 4396
	[Header("Gravity")]
	[SerializeField]
	private bool m_EnableGravity = true;

	// Token: 0x0400112D RID: 4397
	[SerializeField]
	private float m_StickToGroundForce = 10f;

	// Token: 0x0400112E RID: 4398
	[SerializeField]
	private float m_GravityMultiplier = 3f;

	// Token: 0x0400112F RID: 4399
	[Space]
	[SerializeField]
	private CharacterLook m_PlayerLook;

	// Token: 0x04001130 RID: 4400
	[Space]
	[SerializeField]
	private CameraMovements m_CameraMovement;

	// Token: 0x04001131 RID: 4401
	[Space]
	[SerializeField]
	private CharacterFootsteps m_PlayerFootsteps;

	// Token: 0x04001132 RID: 4402
	[Space]
	[SerializeField]
	private FirstPersonHeadBob m_HeadBob;

	// Token: 0x04001133 RID: 4403
	[Space]
	[SerializeField]
	private InteractableInputController m_Interaction;

	// Token: 0x04001134 RID: 4404
	[HideInInspector]
	public GameObject WeaponGameObject;

	// Token: 0x0400113B RID: 4411
	private CharacterController m_CharacterController;

	// Token: 0x0400113C RID: 4412
	private CollisionFlags m_CollisionFlags;

	// Token: 0x0400113D RID: 4413
	private Vector2 m_Input;

	// Token: 0x0400113E RID: 4414
	private Vector3 m_MoveDir = Vector3.zero;

	// Token: 0x0400113F RID: 4415
	private bool m_IsRunning;

	// Token: 0x04001140 RID: 4416
	private bool m_PreviouslyGrounded = true;

	// Token: 0x04001141 RID: 4417
	private bool m_JumpInput;

	// Token: 0x04001142 RID: 4418
	private bool m_IsJumping;
}
