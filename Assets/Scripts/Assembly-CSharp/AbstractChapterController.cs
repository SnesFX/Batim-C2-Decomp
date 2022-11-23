using System;
using TMG.Core;
using UnityEngine;

// Token: 0x02000259 RID: 601
public abstract class AbstractChapterController : TMGMonoBehaviour
{
	// Token: 0x06000C72 RID: 3186
	public abstract void InitializeChapter();

	// Token: 0x04000E7A RID: 3706
	[SerializeField]
	protected Chapters m_Chapter;
}
