using System;
using System.Collections.Generic;

namespace TMPro
{
	// Token: 0x02000589 RID: 1417
	public class FastAction
	{
		// Token: 0x060027E2 RID: 10210 RVA: 0x0001CB61 File Offset: 0x0001AD61
		public void Add(Action rhs)
		{
			if (this.lookup.ContainsKey(rhs))
			{
				return;
			}
			this.lookup[rhs] = this.delegates.AddLast(rhs);
		}

		// Token: 0x060027E3 RID: 10211 RVA: 0x000E8984 File Offset: 0x000E6B84
		public void Remove(Action rhs)
		{
			LinkedListNode<Action> node;
			if (this.lookup.TryGetValue(rhs, out node))
			{
				this.lookup.Remove(rhs);
				this.delegates.Remove(node);
			}
		}

		// Token: 0x060027E4 RID: 10212 RVA: 0x000E89C0 File Offset: 0x000E6BC0
		public void Call()
		{
			for (LinkedListNode<Action> linkedListNode = this.delegates.First; linkedListNode != null; linkedListNode = linkedListNode.Next)
			{
				linkedListNode.Value();
			}
		}

		// Token: 0x04002DE7 RID: 11751
		private LinkedList<Action> delegates = new LinkedList<Action>();

		// Token: 0x04002DE8 RID: 11752
		private Dictionary<Action, LinkedListNode<Action>> lookup = new Dictionary<Action, LinkedListNode<Action>>();
	}
}
