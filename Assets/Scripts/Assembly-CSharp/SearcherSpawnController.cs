using System;
using System.Collections;
using DG.Tweening;
using TMG.Core;
using UnityEngine;

// Token: 0x02000299 RID: 665
public class SearcherSpawnController : TMGMonoBehaviour
{
	// Token: 0x14000016 RID: 22
	// (add) Token: 0x06000F2B RID: 3883 RVA: 0x00083960 File Offset: 0x00081D60
	// (remove) Token: 0x06000F2C RID: 3884 RVA: 0x00083998 File Offset: 0x00081D98
	public event EventHandler OnSpawned;

	// Token: 0x14000017 RID: 23
	// (add) Token: 0x06000F2D RID: 3885 RVA: 0x000839D0 File Offset: 0x00081DD0
	// (remove) Token: 0x06000F2E RID: 3886 RVA: 0x00083A08 File Offset: 0x00081E08
	public event EventHandler OnDeplete;

	// Token: 0x1700029F RID: 671
	// (get) Token: 0x06000F2F RID: 3887 RVA: 0x00083A3E File Offset: 0x00081E3E
	// (set) Token: 0x06000F30 RID: 3888 RVA: 0x00083A46 File Offset: 0x00081E46
	public bool IsActive { get; private set; }

	// Token: 0x06000F31 RID: 3889 RVA: 0x00083A50 File Offset: 0x00081E50
	public override void InitOnComplete()
	{
		base.InitOnComplete();
		this.m_AppearClips = new AudioClip[]
		{
			GameManager.Instance.GetAudioClip("Audio/SFX/Searchers/Appear/SearcherAppear01"),
			GameManager.Instance.GetAudioClip("Audio/SFX/Searchers/Appear/SearcherAppear02")
		};
		this.m_GenericClips = GameManager.Instance.GetAudioClips("Audio/SFX/Searchers/Generic/");
		this.m_AttackClips = GameManager.Instance.GetAudioClips("Audio/SFX/Searchers/Attack/");
		this.m_HurtClips = GameManager.Instance.GetAudioClips("Audio/SFX/Searchers/Hurt/");
	}

	// Token: 0x06000F32 RID: 3890 RVA: 0x00083AD2 File Offset: 0x00081ED2
	public void Activate()
	{
		this.m_TimeNext = Time.time + this.m_DelaySpawn;
		this.IsActive = true;
	}

	// Token: 0x06000F33 RID: 3891 RVA: 0x00083AF0 File Offset: 0x00081EF0
	private void Update()
	{
		if (!this.IsActive || this.m_IsDepleted)
		{
			return;
		}
		if (this.m_Target == null)
		{
			if (GameManager.Instance == null)
			{
				return;
			}
			if (GameManager.Instance.Player == null)
			{
				return;
			}
			this.m_Target = GameManager.Instance.Player.transform;
			if (this.m_Target == null)
			{
				return;
			}
		}
		this.m_SpawnerEye.LookAt(this.m_Target);
		RaycastHit raycastHit;
		if (Physics.Raycast(this.m_SpawnerEye.position, this.m_SpawnerEye.forward, out raycastHit, this.m_EyeDistance, this.m_LayerMask))
		{
			Debug.DrawLine(this.m_SpawnerEye.position, raycastHit.point, Color.red);
			if (raycastHit.collider.CompareTag("Player") && Time.time > this.m_TimeNext)
			{
				this.m_TimeNext = Time.time + this.m_SpawnRate;
				if (this.m_SpawnActiveCount < this.m_MaxSpawnCount)
				{
					SearcherAiController searcherAiController = UnityEngine.Object.Instantiate<SearcherAiController>(this.m_AiPrefab);
					searcherAiController.transform.position = this.m_SpawnPoint.position;
					Vector3 position = this.m_Target.position;
					position.y = searcherAiController.transform.position.y;
					searcherAiController.transform.LookAt(position);
					this.m_SpawnActiveCount++;
					base.StartCoroutine(this.ActivateAi(searcherAiController));
				}
			}
		}
	}

	// Token: 0x06000F34 RID: 3892 RVA: 0x00083C88 File Offset: 0x00082088
	private IEnumerator ActivateAi(SearcherAiController ai)
	{
		GameManager.Instance.AudioManager.PlayAtPosition(this.m_AppearClips[UnityEngine.Random.Range(0, this.m_AppearClips.Length)], ai.transform.position, AudioObjectType.SOUND_EFFECT, 0, false, null);
		yield return new WaitForSeconds(0.4f);
		if (!this.m_HasSpawned)
		{
			this.m_HasSpawned = true;
			this.OnSpawned.Send(this);
		}
		yield return new WaitForSeconds(0.2f);
		ai.Active(this.m_GenericClips, this.m_AttackClips, this.m_HurtClips);
		ai.OnDeath += this.HandleSearcherOnDeath;
		ai.OnHidden += this.HandleSearcherOnHidden;
		yield break;
	}

	// Token: 0x06000F35 RID: 3893 RVA: 0x00083CAA File Offset: 0x000820AA
	private void HandleSearcherOnHidden(object sender, EventArgs e)
	{
		(sender as SearcherAiController).OnHidden -= this.HandleSearcherOnHidden;
		this.m_SpawnActiveCount--;
	}

	// Token: 0x06000F36 RID: 3894 RVA: 0x00083CD1 File Offset: 0x000820D1
	private void HandleSearcherOnDeath(object sender, EventArgs e)
	{
		(sender as SearcherAiController).OnDeath -= this.HandleSearcherOnDeath;
		this.m_SpawnDeathCount++;
		if (this.m_SpawnDeathCount >= this.m_MaxSpawnCount)
		{
			this.Depleted();
		}
	}

	// Token: 0x06000F37 RID: 3895 RVA: 0x00083D0F File Offset: 0x0008210F
	private void Depleted()
	{
		this.OnDeplete.Send(this);
		this.m_Ink.DOScale(0f, 8f).SetDelay(2f).OnComplete(new TweenCallback(base.Dispose));
	}

	// Token: 0x06000F38 RID: 3896 RVA: 0x00083D4E File Offset: 0x0008214E
	protected override void OnDisposed()
	{
		this.OnSpawned = null;
		this.OnDeplete = null;
		this.m_GenericClips = null;
		this.m_AttackClips = null;
		this.m_HurtClips = null;
		base.OnDisposed();
	}

	// Token: 0x040010F4 RID: 4340
	[Header("Transforms")]
	[SerializeField]
	private Transform m_Target;

	// Token: 0x040010F5 RID: 4341
	[SerializeField]
	private Transform m_SpawnerEye;

	// Token: 0x040010F6 RID: 4342
	[SerializeField]
	private Transform m_SpawnPoint;

	// Token: 0x040010F7 RID: 4343
	[SerializeField]
	private Transform m_Ink;

	// Token: 0x040010F8 RID: 4344
	[Header("Options")]
	[SerializeField]
	private LayerMask m_LayerMask;

	// Token: 0x040010F9 RID: 4345
	[SerializeField]
	private int m_MaxSpawnCount;

	// Token: 0x040010FA RID: 4346
	[SerializeField]
	private float m_EyeDistance = 10f;

	// Token: 0x040010FB RID: 4347
	[SerializeField]
	private float m_SpawnRate = 1f;

	// Token: 0x040010FC RID: 4348
	[SerializeField]
	private float m_DelaySpawn;

	// Token: 0x040010FD RID: 4349
	[Header("PREFAB")]
	[SerializeField]
	private SearcherAiController m_AiPrefab;

	// Token: 0x040010FE RID: 4350
	private AudioClip[] m_AppearClips;

	// Token: 0x040010FF RID: 4351
	private AudioClip[] m_GenericClips;

	// Token: 0x04001100 RID: 4352
	private AudioClip[] m_AttackClips;

	// Token: 0x04001101 RID: 4353
	private AudioClip[] m_HurtClips;

	// Token: 0x04001102 RID: 4354
	private float m_TimeNext;

	// Token: 0x04001103 RID: 4355
	private int m_SpawnActiveCount;

	// Token: 0x04001104 RID: 4356
	private int m_SpawnDeathCount;

	// Token: 0x04001105 RID: 4357
	private bool m_HasSpawned;

	// Token: 0x04001106 RID: 4358
	private bool m_IsDepleted;
}
