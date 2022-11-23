using System;
using System.Collections.Generic;

namespace TMPro
{
	// Token: 0x0200058C RID: 1420
	public class FastAction<A, B, C>
	{
		// Token: 0x060027EE RID: 10222 RVA: 0x0001CC3F File Offset: 0x0001AE3F
		public void Add(Action<A, B, C> rhs)
		{
			if (this.lookup.ContainsKey(rhs))
			{
				return;
			}
			this.lookup[rhs] = this.delegates.AddLast(rhs);
		}

		// Token: 0x060027EF RID: 10223 RVA: 0x000E8AE0 File Offset: 0x000E6CE0
		public void Remove(Action<A, B, C> rhs)
		{
			LinkedListNode<Action<A, B, C>> node;
			if (this.lookup.TryGetValue(rhs, out node))
			{
				this.lookup.Remove(rhs);
				this.delegates.Remove(node);
			}
		}

		// Token: 0x060027F0 RID: 10224 RVA: 0x000E8B1C File Offset: 0x000E6D1C
		public void Call(A a, B b, C c)
		{
			for (LinkedListNode<Action<A, B, C>> linkedListNode = this.delegates.First; linkedListNode != null; linkedListNode = linkedListNode.Next)
			{
				linkedListNode.Value(a, b, c);
			}
		}

		// Token: 0x04002DED RID: 11757
		private LinkedList<Action<A, B, C>> delegates = new LinkedList<Action<A, B, C>>();

		// Token: 0x04002DEE RID: 11758
		private Dictionary<Action<A, B, C>, LinkedListNode<Action<A, B, C>>> lookup = new Dictionary<Action<A, B, C>, LinkedListNode<Action<A, B, C>>>();
	}
}
