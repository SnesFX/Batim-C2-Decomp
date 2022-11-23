using System;
using TMG.Core;
using UnityEngine;

// Token: 0x02000309 RID: 777
public class EditorScenePlay : TMGMonoBehaviour
{
	// Token: 0x0600125B RID: 4699 RVA: 0x0008F643 File Offset: 0x0008DA43
	public override void Init()
	{
		base.Init();
		base.Dispose();

		if(GameManager.Instance.AssetManager == null)
		{
			GameObject obj = Resources.Load<GameObject>("ui/UIVisualControls");

			Instantiate(obj);
			InitializeGame.Initialize();
		}

		GameManager.Instance.AudioManager.ListenerSetActive(false);
	}

	// Token: 0x040013FF RID: 5119
	[SerializeField]
	private GameObject UIVisuals;

	// Token: 0x04001400 RID: 5120
	[SerializeField]
	private GameObject GameInitializer;
}
