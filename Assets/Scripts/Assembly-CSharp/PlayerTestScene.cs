using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200030A RID: 778
public class PlayerTestScene : MonoBehaviour
{
	// Token: 0x0600125D RID: 4701 RVA: 0x0008F65C File Offset: 0x0008DA5C
	private void Update()
	{
		if (Input.GetKeyDown(KeyCode.T))
		{
			for (int i = 0; i < this.audioTest.Count; i++)
			{
				GameManager.Instance.AudioManager.Play(this.audioTest[i], AudioObjectType.DIALOGUE, 0, true);
			}
		}
		if (Input.GetKeyDown(KeyCode.Y))
		{
			GameManager.Instance.AudioManager.PlayAtPosition(this.audioTest[1], Vector3.zero, AudioObjectType.DIALOGUE, 0, true, null);
		}
	}

	// Token: 0x04001401 RID: 5121
	[SerializeField]
	private GameObject PlayerController;

	// Token: 0x04001402 RID: 5122
	[SerializeField]
	private List<AudioClip> audioTest;
}
