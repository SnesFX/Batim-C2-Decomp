using System;
using System.Collections.Generic;

namespace TMPro
{
	// Token: 0x0200058B RID: 1419
	public class FastAction<A, B>
	{
		// Token: 0x060027EA RID: 10218 RVA: 0x0001CBF5 File Offset: 0x0001ADF5
		public void Add(Action<A, B> rhs)
		{
			if (this.lookup.ContainsKey(rhs))
			{
				return;
			}
			this.lookup[rhs] = this.delegates.AddLast(rhs);
		}

		// Token: 0x060027EB RID: 10219 RVA: 0x000E8A6C File Offset: 0x000E6C6C
		public void Remove(Action<A, B> rhs)
		{
			LinkedListNode<Action<A, B>> node;
			if (this.lookup.TryGetValue(rhs, out node))
			{
				this.lookup.Remove(rhs);
				this.delegates.Remove(node);
			}
		}

		// Token: 0x060027EC RID: 10220 RVA: 0x000E8AA8 File Offset: 0x000E6CA8
		public void Call(A a, B b)
		{
			for (LinkedListNode<Action<A, B>> linkedListNode = this.delegates.First; linkedListNode != null; linkedListNode = linkedListNode.Next)
			{
				linkedListNode.Value(a, b);
			}
		}

		// Token: 0x04002DEB RID: 11755
		private LinkedList<Action<A, B>> delegates = new LinkedList<Action<A, B>>();

		// Token: 0x04002DEC RID: 11756
		private Dictionary<Action<A, B>, LinkedListNode<Action<A, B>>> lookup = new Dictionary<Action<A, B>, LinkedListNode<Action<A, B>>>();
	}
}
