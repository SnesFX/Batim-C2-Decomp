using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace TMPro
{
	// Token: 0x020005C6 RID: 1478
	internal class TMP_ObjectPool<T> where T : new()
	{
		// Token: 0x06002A4A RID: 10826 RVA: 0x0001E5E9 File Offset: 0x0001C7E9
		public TMP_ObjectPool(UnityAction<T> actionOnGet, UnityAction<T> actionOnRelease)
		{
			this.m_ActionOnGet = actionOnGet;
			this.m_ActionOnRelease = actionOnRelease;
		}

		// Token: 0x17000466 RID: 1126
		// (get) Token: 0x06002A4B RID: 10827 RVA: 0x0001E60A File Offset: 0x0001C80A
		// (set) Token: 0x06002A4C RID: 10828 RVA: 0x0001E612 File Offset: 0x0001C812
		public int countAll { get; private set; }

		// Token: 0x17000467 RID: 1127
		// (get) Token: 0x06002A4D RID: 10829 RVA: 0x0001E61B File Offset: 0x0001C81B
		public int countActive
		{
			get
			{
				return this.countAll - this.countInactive;
			}
		}

		// Token: 0x17000468 RID: 1128
		// (get) Token: 0x06002A4E RID: 10830 RVA: 0x0001E62A File Offset: 0x0001C82A
		public int countInactive
		{
			get
			{
				return this.m_Stack.Count;
			}
		}

		// Token: 0x06002A4F RID: 10831 RVA: 0x001021F8 File Offset: 0x001003F8
		public T Get()
		{
			T t;
			if (this.m_Stack.Count == 0)
			{
				t = Activator.CreateInstance<T>();
				this.countAll++;
			}
			else
			{
				t = this.m_Stack.Pop();
			}
			if (this.m_ActionOnGet != null)
			{
				this.m_ActionOnGet(t);
			}
			return t;
		}

		// Token: 0x06002A50 RID: 10832 RVA: 0x00102254 File Offset: 0x00100454
		public void Release(T element)
		{
			if (this.m_Stack.Count > 0 && object.ReferenceEquals(this.m_Stack.Peek(), element))
			{
				Debug.LogError("Internal error. Trying to destroy object that is already released to pool.");
			}
			if (this.m_ActionOnRelease != null)
			{
				this.m_ActionOnRelease(element);
			}
			this.m_Stack.Push(element);
		}

		// Token: 0x04002F56 RID: 12118
		private readonly Stack<T> m_Stack = new Stack<T>();

		// Token: 0x04002F57 RID: 12119
		private readonly UnityAction<T> m_ActionOnGet;

		// Token: 0x04002F58 RID: 12120
		private readonly UnityAction<T> m_ActionOnRelease;
	}
}
