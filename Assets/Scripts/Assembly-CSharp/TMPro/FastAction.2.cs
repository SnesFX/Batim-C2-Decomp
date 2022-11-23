using System;
using System.Collections.Generic;

namespace TMPro
{
	// Token: 0x0200058A RID: 1418
	public class FastAction<A>
	{
		// Token: 0x060027E6 RID: 10214 RVA: 0x0001CBAB File Offset: 0x0001ADAB
		public void Add(Action<A> rhs)
		{
			if (this.lookup.ContainsKey(rhs))
			{
				return;
			}
			this.lookup[rhs] = this.delegates.AddLast(rhs);
		}

		// Token: 0x060027E7 RID: 10215 RVA: 0x000E89F8 File Offset: 0x000E6BF8
		public void Remove(Action<A> rhs)
		{
			LinkedListNode<Action<A>> node;
			if (this.lookup.TryGetValue(rhs, out node))
			{
				this.lookup.Remove(rhs);
				this.delegates.Remove(node);
			}
		}

		// Token: 0x060027E8 RID: 10216 RVA: 0x000E8A34 File Offset: 0x000E6C34
		public void Call(A a)
		{
			for (LinkedListNode<Action<A>> linkedListNode = this.delegates.First; linkedListNode != null; linkedListNode = linkedListNode.Next)
			{
				linkedListNode.Value(a);
			}
		}

		// Token: 0x04002DE9 RID: 11753
		private LinkedList<Action<A>> delegates = new LinkedList<Action<A>>();

		// Token: 0x04002DEA RID: 11754
		private Dictionary<Action<A>, LinkedListNode<Action<A>>> lookup = new Dictionary<Action<A>, LinkedListNode<Action<A>>>();
	}
}
