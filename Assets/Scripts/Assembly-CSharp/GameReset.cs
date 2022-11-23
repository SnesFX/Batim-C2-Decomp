using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using DG.Tweening.Core;
using TMG.Core;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x020002C5 RID: 709
public class GameReset : TMGMonoBehaviour
{
	// Token: 0x06001017 RID: 4119 RVA: 0x00086620 File Offset: 0x00084A20
	public override void Init()
	{
		base.Init();
		this.m_GameObjects = UnityEngine.Object.FindObjectsOfType<GameObject>().ToList<GameObject>();
		this.m_GameObjects.Remove(base.gameObject);
		AudioListener.volume = GameManager.Instance.PlayerSettings.Volume;
		foreach (GameObject gameObject in this.m_GameObjects)
		{
			if (!(gameObject.GetComponent<DOTweenComponent>() != null))
			{
				UnityEngine.Object.Destroy(gameObject);
			}
		}
		GameManager.Instance.Dispose();
		GameManager.Instance.isGameLoaded = true;
	}

	// Token: 0x06001018 RID: 4120 RVA: 0x000866E4 File Offset: 0x00084AE4
	public override void InitOnComplete()
	{
		base.StartCoroutine(this.GoToMainMenu());
	}

	// Token: 0x06001019 RID: 4121 RVA: 0x000866F4 File Offset: 0x00084AF4
	private IEnumerator GoToMainMenu()
	{
		AsyncOperation async = SceneManager.LoadSceneAsync("InitializeGame");
		async.allowSceneActivation = false;
		while (async.progress < 0.9f)
		{
			yield return new WaitForEndOfFrame();
		}
		async.allowSceneActivation = true;
		SceneManager.SetActiveScene(SceneManager.GetSceneByName("InitializeGame"));
		yield break;
	}

	// Token: 0x0600101A RID: 4122 RVA: 0x00086708 File Offset: 0x00084B08
	protected override void OnDisposed()
	{
		if (this.m_GameObjects != null)
		{
			this.m_GameObjects.Clear();
			this.m_GameObjects = null;
		}
		base.OnDisposed();
	}

	// Token: 0x0400125A RID: 4698
	private List<GameObject> m_GameObjects = new List<GameObject>();
}
