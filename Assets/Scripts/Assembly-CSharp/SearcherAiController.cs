using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x02000298 RID: 664
public class SearcherAiController : TMGMonoBehaviour
{
	// Token: 0x14000014 RID: 20
	// (add) Token: 0x06000F1B RID: 3867 RVA: 0x00082DD0 File Offset: 0x000811D0
	// (remove) Token: 0x06000F1C RID: 3868 RVA: 0x00082E08 File Offset: 0x00081208
	public event EventHandler OnDeath;

	// Token: 0x14000015 RID: 21
	// (add) Token: 0x06000F1D RID: 3869 RVA: 0x00082E40 File Offset: 0x00081240
	// (remove) Token: 0x06000F1E RID: 3870 RVA: 0x00082E78 File Offset: 0x00081278
	public event EventHandler OnHidden;

	// Token: 0x06000F1F RID: 3871 RVA: 0x00082EB0 File Offset: 0x000812B0
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_Velocity = UnityEngine.Random.Range(3f, 7f);
		this.m_Speed = this.m_Velocity;
		this.m_AudioTimeNext = Time.time + UnityEngine.Random.Range(0.65f, 3.65f);
		this.m_Target = GameManager.Instance.Player.transform;
	}

	// Token: 0x06000F20 RID: 3872 RVA: 0x00082F14 File Offset: 0x00081314
	public void Active(AudioClip[] genericClips, AudioClip[] attackClips, AudioClip[] hurtClips)
	{
		this.m_GenericClips = genericClips;
		this.m_AttackClips = attackClips;
		this.m_HurtClips = hurtClips;
		this.PlayAudio(ref this.m_GenericClips, base.transform);
		this.m_IsActive = true;
	}

	// Token: 0x06000F21 RID: 3873 RVA: 0x00082F48 File Offset: 0x00081348
	private void Update()
	{
		if (this.m_IsDead || this.m_IsHiding || base.IsDisposed)
		{
			return;
		}
		if (GameManager.Instance.isPaused)
		{
			this.m_Animator.enabled = false;
			return;
		}
		this.m_Animator.enabled = true;
		if (!this.m_CharacterController.isGrounded)
		{
			this.m_MoveDir.y = 0f;
		}
		if (Time.time > this.m_AudioTimeNext && (this.m_VocalAudioObject == null || !this.m_VocalAudioObject.AudioSource.isPlaying))
		{
			this.m_VocalAudioObject = this.PlayAudio(ref this.m_GenericClips, base.transform);
			if (this.m_VocalAudioObject != null)
			{
				this.m_VocalAudioObject.OnComplete += this.HandleAudioOnComplete;
			}
		}
	}

	// Token: 0x06000F22 RID: 3874 RVA: 0x00083038 File Offset: 0x00081438
	private void FixedUpdate()
	{
		if (this.m_IsDead || !this.m_IsActive || this.m_IsHiding || this.m_Target == null || base.IsDisposed)
		{
			return;
		}
		Vector3 position = this.m_Target.position;
		position.y = base.transform.position.y;
		base.transform.LookAt(position);
		if ((double)Vector3.Distance(position, base.transform.position) > 7.5)
		{
			this.m_Velocity = this.m_Speed;
			this.m_Animator.SetBool("Attack", false);
		}
		else
		{
			if (this.m_AttackVocalAudioObject == null)
			{
				this.m_AttackVocalAudioObject = this.PlayAudio(ref this.m_AttackClips, base.transform);
				if (this.m_AttackVocalAudioObject != null)
				{
					this.m_AttackVocalAudioObject.OnComplete += this.HandleAudioOnComplete;
				}
			}
			this.m_Velocity = this.m_Speed * 3f;
			this.m_Animator.SetBool("Attack", true);
		}
		Vector3 vector = base.transform.forward.normalized * this.m_Velocity;
		this.m_MoveDir.x = vector.x;
		this.m_MoveDir.z = vector.z;
		if (this.m_CharacterController.isGrounded)
		{
			this.m_MoveDir.y = -10f;
		}
		else
		{
			this.m_MoveDir += Physics.gravity * 3f * Time.fixedDeltaTime;
		}
		if (this.m_IsHiding)
		{
			return;
		}
		this.m_CollisionFlags = this.m_CharacterController.Move(this.m_MoveDir * Time.fixedDeltaTime);
		if (Vector3.Distance(position, base.transform.position) < 3f)
		{
			GameManager.Instance.ShowHurtBorder(false);
			this.Kill();
		}
		if (this.m_CharacterController.isGrounded && this.m_CharacterController.velocity.magnitude > 0f && Time.time > this.m_TimeNext)
		{
			this.m_TimeNext = Time.time + this.m_TimeRate;
			GameObject inkSplat = UnityEngine.Object.Instantiate<GameObject>(this.m_InkSplats[UnityEngine.Random.Range(0, this.m_InkSplats.Count)]);
			RaycastHit raycastHit;
			if (Physics.Raycast(base.transform.position + Vector3.up, Vector3.down, out raycastHit, 3f))
			{
				inkSplat.transform.position = raycastHit.point;
				inkSplat.transform.eulerAngles = base.transform.eulerAngles;
				Vector3 endValue = Vector3.one * UnityEngine.Random.Range(1f, 1.25f);
				inkSplat.transform.localScale = Vector3.zero;
				inkSplat.transform.DOScale(endValue, 0.25f).SetEase(Ease.OutQuad);
			}
			inkSplat.transform.DOScale(0f, 2f).SetDelay(UnityEngine.Random.Range(1f, 3f)).OnComplete(delegate
			{
				UnityEngine.Object.Destroy(inkSplat);
			});
		}
		if (Vector3.Distance(this.m_PreviousPosition, base.transform.position) < 0.01f)
		{
			this.m_DistanceCount += 1f;
			if (this.m_DistanceCount >= this.m_DistanceCountMax)
			{
				this.m_DistanceCount = 0f;
				base.StartCoroutine(this.DOHide());
				return;
			}
		}
		this.m_PreviousPosition = base.transform.position;
	}

	// Token: 0x06000F23 RID: 3875 RVA: 0x00083434 File Offset: 0x00081834
	public void Kill()
	{
		if (!this.m_IsActive)
		{
			return;
		}
		this.m_IsDead = true;
		this.m_Model.SetActive(false);
		this.m_CharacterController.enabled = false;
		if (this.m_AttackVocalAudioObject != null)
		{
			this.m_AttackVocalAudioObject.Clear();
			this.m_AttackVocalAudioObject = null;
		}
		this.PlayAudio(ref this.m_HurtClips, null);
		this.GetInkParticles(3f);
		this.OnDeath.Send(this);
		base.Dispose();
	}

	// Token: 0x06000F24 RID: 3876 RVA: 0x000834BC File Offset: 0x000818BC
	private void GetInkParticles(float heightOffset = 3f)
	{
		GameObject gameObject = UnityEngine.Object.Instantiate<GameObject>(this.m_InkParticles[UnityEngine.Random.Range(0, this.m_InkParticles.Count)]);
		gameObject.transform.position = base.transform.position + Vector3.up * heightOffset;
		UnityEngine.Object.Destroy(gameObject, 6f);
	}

	// Token: 0x06000F25 RID: 3877 RVA: 0x0008351C File Offset: 0x0008191C
	private AudioObject PlayAudio(ref AudioClip[] audioClips, Transform parent = null)
	{
		if (audioClips == null || audioClips.Length <= 0)
		{
			return null;
		}
		int num = UnityEngine.Random.Range(0, audioClips.Length);
		AudioClip audioClip = audioClips[num];
		AudioObject result = GameManager.Instance.AudioManager.PlayAtPosition(audioClip, base.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, parent);
		audioClips[num] = audioClips[0];
		audioClips[0] = audioClip;
		return result;
	}

	// Token: 0x06000F26 RID: 3878 RVA: 0x0008357C File Offset: 0x0008197C
	private void HandleAudioOnComplete(object sender, EventArgs e)
	{
		AudioObject audioObject = sender as AudioObject;
		if (audioObject != null)
		{
			audioObject.OnComplete -= this.HandleAudioOnComplete;
			audioObject.Clear();
		}
	}

	// Token: 0x06000F27 RID: 3879 RVA: 0x000835B6 File Offset: 0x000819B6
	private void OnControllerColliderHit(ControllerColliderHit hit)
	{
		if (base.IsDisposed || this.m_IsHiding)
		{
			return;
		}
		if (hit.gameObject.layer == LayerMask.NameToLayer("SearcherTrigger"))
		{
			base.StartCoroutine(this.DOHide());
		}
	}

	// Token: 0x06000F28 RID: 3880 RVA: 0x000835F8 File Offset: 0x000819F8
	private IEnumerator DOHide()
	{
		this.m_IsHiding = true;
		this.m_Animator.SetBool("Hide", true);
		yield return new WaitForSeconds(0.2f);
		GameObject inkSplat = UnityEngine.Object.Instantiate<GameObject>(this.m_InkSplats[UnityEngine.Random.Range(0, this.m_InkSplats.Count)]);
		RaycastHit hit;
		if (Physics.Raycast(base.transform.position + Vector3.up, Vector3.down, out hit, 3f))
		{
			inkSplat.transform.position = hit.point + base.transform.forward * 2.25f;
			inkSplat.transform.eulerAngles = base.transform.eulerAngles;
			Vector3 endValue = Vector3.one * 1.85f;
			inkSplat.transform.localScale = Vector3.zero;
			inkSplat.transform.DOScale(endValue, 0.25f).SetEase(Ease.OutQuad);
		}
		inkSplat.transform.DOScale(0f, 2f).SetDelay(UnityEngine.Random.Range(4f, 7f)).OnComplete(delegate
		{
			UnityEngine.Object.Destroy(inkSplat);
		});
		yield return new WaitForSeconds(0.2f);
		this.GetInkParticles(1f);
		yield return new WaitForSeconds(0.2f);
		this.OnHidden.Send(this);
		base.Dispose();
		yield break;
	}

	// Token: 0x06000F29 RID: 3881 RVA: 0x00083614 File Offset: 0x00081A14
	protected override void OnDisposed()
	{
		if (this.m_VocalAudioObject != null)
		{
			this.m_VocalAudioObject.Clear();
			this.m_VocalAudioObject = null;
		}
		if (this.m_AttackVocalAudioObject != null)
		{
			this.m_AttackVocalAudioObject.Clear();
			this.m_AttackVocalAudioObject = null;
		}
		base.OnDisposed();
	}

	// Token: 0x040010DA RID: 4314
	[Header("GameObjects")]
	[SerializeField]
	private GameObject m_Model;

	// Token: 0x040010DB RID: 4315
	[SerializeField]
	private List<GameObject> m_InkSplats;

	// Token: 0x040010DC RID: 4316
	[SerializeField]
	private List<GameObject> m_InkParticles;

	// Token: 0x040010DD RID: 4317
	[Header("Animator")]
	[SerializeField]
	private Animator m_Animator;

	// Token: 0x040010DE RID: 4318
	[Header("Colliders")]
	[SerializeField]
	private CharacterController m_CharacterController;

	// Token: 0x040010DF RID: 4319
	private CollisionFlags m_CollisionFlags;

	// Token: 0x040010E0 RID: 4320
	private Vector3 m_PreviousPosition;

	// Token: 0x040010E1 RID: 4321
	private Vector3 m_MoveDir;

	// Token: 0x040010E2 RID: 4322
	private Transform m_Target;

	// Token: 0x040010E3 RID: 4323
	private AudioObject m_VocalAudioObject;

	// Token: 0x040010E4 RID: 4324
	private AudioObject m_AttackVocalAudioObject;

	// Token: 0x040010E5 RID: 4325
	private AudioClip[] m_GenericClips;

	// Token: 0x040010E6 RID: 4326
	private AudioClip[] m_AttackClips;

	// Token: 0x040010E7 RID: 4327
	private AudioClip[] m_HurtClips;

	// Token: 0x040010E8 RID: 4328
	private float m_Velocity;

	// Token: 0x040010E9 RID: 4329
	private float m_DistanceCount;

	// Token: 0x040010EA RID: 4330
	private float m_DistanceCountMax = 3f;

	// Token: 0x040010EB RID: 4331
	private bool m_IsActive;

	// Token: 0x040010EC RID: 4332
	private bool m_IsDead;

	// Token: 0x040010ED RID: 4333
	private float m_TimeNext;

	// Token: 0x040010EE RID: 4334
	private float m_TimeRate = 0.45f;

	// Token: 0x040010EF RID: 4335
	private float m_AudioTimeNext;

	// Token: 0x040010F0 RID: 4336
	private float m_Speed;

	// Token: 0x040010F1 RID: 4337
	private bool m_IsHiding;
}
