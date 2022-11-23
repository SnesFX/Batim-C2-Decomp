using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using TMG.UI;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

// Token: 0x020002EC RID: 748
public class GenericLoaderController : BaseUIController
{
	// Token: 0x14000027 RID: 39
	// (add) Token: 0x06001174 RID: 4468 RVA: 0x0008B5C8 File Offset: 0x000899C8
	// (remove) Token: 0x06001175 RID: 4469 RVA: 0x0008B600 File Offset: 0x00089A00
	public event EventHandler OnLoaded;

	// Token: 0x06001176 RID: 4470 RVA: 0x0008B638 File Offset: 0x00089A38
	public override void InitController(object _data)
	{
		base.InitController(_data);
		this.m_DataVO = (GenericLoaderDataVO)_data;
		this.m_Loader.DOFade(0f, 0f);
		this.m_Blocker.enabled = false;
		this.m_Loader.enabled = false;
		this.m_ControlsImage.enabled = false;
		this.m_SpriteCount = this.m_LoaderSprites.Count;
		this.m_Visuals.gameObject.SetActive(false);
	}

	// Token: 0x06001177 RID: 4471 RVA: 0x0008B6B4 File Offset: 0x00089AB4
	public void LoadScene(GenericLoaderDataVO data)
	{
		this.m_DataVO = data;
		this.m_SceneName = this.m_DataVO.SceneName;
		this.m_HasControllerTutorial = this.m_DataVO.HasControlTutorial;
		this.m_ControlsImage.enabled = this.m_DataVO.HasControlTutorial;
		if (this.m_DataVO.HasControlTutorial)
		{
			Color color = this.m_ControlsImage.color;
			color.a = 0f;
			this.m_ControlsImage.color = color;
			this.m_ControlsImage.DOFade(1f, 0.5f).SetDelay(0.5f).OnComplete(delegate
			{
				base.StartCoroutine(this.LoadAsync());
			});
		}
		else
		{
			base.StartCoroutine(this.LoadAsync());
		}
	}

	// Token: 0x06001178 RID: 4472 RVA: 0x0008B778 File Offset: 0x00089B78
	private IEnumerator LoadAsync()
	{
		this.m_Async = SceneManager.LoadSceneAsync(this.m_SceneName);
		this.m_Async.allowSceneActivation = false;
		this.m_Visuals.gameObject.SetActive(true);
		this.m_Blocker.enabled = true;
		this.m_Loader.enabled = true;
		this.m_Loader.DOKill(false);
		this.m_Loader.DOFade(1f, 0.5f);
		while (this.m_Async.progress < 0.9f)
		{
			for (int i = 0; i < this.m_SpriteCount; i++)
			{
				this.m_Loader.sprite = this.m_LoaderSprites[i];
				yield return new WaitForSeconds(0.1f);
			}
		}
		this.m_Loader.DOKill(false);
		this.m_Loader.DOFade(0f, 0.5f).OnComplete(new TweenCallback(this.LaunchLoadedScene));
		yield break;
	}

	// Token: 0x06001179 RID: 4473 RVA: 0x0008B794 File Offset: 0x00089B94
	public void HideLoader()
	{
		this.m_Async = null;
		this.m_Loader.DOKill(false);
		this.m_Loader.DOFade(0f, 0f);
		this.m_Blocker.enabled = false;
		this.m_Loader.enabled = false;
		this.m_Visuals.gameObject.SetActive(false);
	}

	// Token: 0x0600117A RID: 4474 RVA: 0x0008B7F4 File Offset: 0x00089BF4
	private void LaunchLoadedScene()
	{
		if (this.m_DataVO.HasControlTutorial)
		{
			this.m_ControlsImage.DOFade(0f, 1f).SetDelay(1f).OnComplete(()=> {ActualLaunchLoadedScene();});
		}
		else
		{
			this.ActualLaunchLoadedScene();
		}
	}

	// Token: 0x0600117B RID: 4475 RVA: 0x0008B84D File Offset: 0x00089C4D
	private void ActualLaunchLoadedScene()
	{
		this.m_Async.allowSceneActivation = true;

		SceneManager.sceneLoaded += SceneFinish;
	}

	private void SceneFinish(Scene scene,LoadSceneMode mode)
	{
		SceneManager.SetActiveScene(SceneManager.GetSceneByName(this.m_SceneName));
		this.OnLoaded.Send(this);

		SceneManager.sceneLoaded -= SceneFinish;
	}

	// Token: 0x0600117C RID: 4476 RVA: 0x0008B878 File Offset: 0x00089C78
	protected override void OnDisposed()
	{
		this.m_Async = null;
		base.OnDisposed();
	}

	// Token: 0x0400134F RID: 4943
	[Header("RectTransforms")]
	[SerializeField]
	private RectTransform m_Visuals;

	// Token: 0x04001350 RID: 4944
	[Header("Images")]
	[SerializeField]
	private Image m_Blocker;

	// Token: 0x04001351 RID: 4945
	[SerializeField]
	private Image m_Loader;

	// Token: 0x04001352 RID: 4946
	[SerializeField]
	private Image m_ControlsImage;

	// Token: 0x04001353 RID: 4947
	[SerializeField]
	private List<Sprite> m_LoaderSprites;

	// Token: 0x04001354 RID: 4948
	private GenericLoaderDataVO m_DataVO;

	// Token: 0x04001355 RID: 4949
	private AsyncOperation m_Async;

	// Token: 0x04001356 RID: 4950
	private bool m_HasControllerTutorial;

	// Token: 0x04001357 RID: 4951
	private string m_SceneName;

	// Token: 0x04001358 RID: 4952
	private int m_SpriteCount;
}
