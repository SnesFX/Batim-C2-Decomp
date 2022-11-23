using System;
using DG.Tweening;
using UnityEngine;

// Token: 0x0200027F RID: 639
public class GameComplete : MonoBehaviour
{
	// Token: 0x06000E34 RID: 3636 RVA: 0x0007FEA8 File Offset: 0x0007E2A8
	private void ShowCredits()
	{
		this.Game.SetActive(false);
		this.Intro.SetActive(false);
		this.Credits.SetActive(true);
		this.Player.transform.SetParent(this.EndPosition);
		this.Player.transform.position = this.EndPosition.position;
		this.Player.transform.rotation = this.EndPosition.rotation;
		this.PlayerCamera.eulerAngles = new Vector3(0f, -90f, 0f);
		this.Player.Lock();
		this.PlayerHand.SetActive(false);
		this.WeaponCam.SetActive(false);
		RenderSettings.ambientLight = Color.black;
	}

	// Token: 0x06000E35 RID: 3637 RVA: 0x0007FF71 File Offset: 0x0007E371
	public void ShowSecretEnding()
	{
		this.SecretEnding.SetActive(true);
	}

	// Token: 0x06000E36 RID: 3638 RVA: 0x0007FF7F File Offset: 0x0007E37F
	public void DisableSecretEnding()
	{
		this.SecretEnding.SetActive(false);
	}

	// Token: 0x06000E37 RID: 3639 RVA: 0x0007FF90 File Offset: 0x0007E390
	private void OnTriggerEnter(Collider other)
	{
		if (this.isTriggered)
		{
			return;
		}
		if (other.CompareTag("Player"))
		{
			this.isTriggered = true;
			Camera.main.transform.DOKill(false);
			Camera.main.transform.localPosition = Vector3.zero;
			this.ShowCredits();
		}
	}

	// Token: 0x04001054 RID: 4180
	[SerializeField]
	private GameObject Game;

	// Token: 0x04001055 RID: 4181
	[SerializeField]
	private GameObject Intro;

	// Token: 0x04001056 RID: 4182
	[SerializeField]
	private GameObject Credits;

	// Token: 0x04001057 RID: 4183
	[SerializeField]
	private GameObject SecretEnding;

	// Token: 0x04001058 RID: 4184
	[SerializeField]
	private Transform EndPosition;

	// Token: 0x04001059 RID: 4185
	[SerializeField]
	private PlayerController Player;

	// Token: 0x0400105A RID: 4186
	[SerializeField]
	private Transform PlayerCamera;

	// Token: 0x0400105B RID: 4187
	[SerializeField]
	private GameObject PlayerHand;

	// Token: 0x0400105C RID: 4188
	[SerializeField]
	private GameObject WeaponCam;

	// Token: 0x0400105D RID: 4189
	private bool isTriggered;
}
