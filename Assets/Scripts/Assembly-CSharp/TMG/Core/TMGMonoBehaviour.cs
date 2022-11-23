using System;
using UnityEngine;

namespace TMG.Core
{
	// Token: 0x020002AA RID: 682
	public class TMGMonoBehaviour : MonoBehaviour, IDisposable
	{
		// Token: 0x170002AF RID: 687
		// (get) Token: 0x06000FD9 RID: 4057 RVA: 0x00075319 File Offset: 0x00073719
		// (set) Token: 0x06000FDA RID: 4058 RVA: 0x00075321 File Offset: 0x00073721
		public bool IsDisposed { get; private set; }

		// Token: 0x170002B0 RID: 688
		// (get) Token: 0x06000FDB RID: 4059 RVA: 0x0007532A File Offset: 0x0007372A
		// (set) Token: 0x06000FDC RID: 4060 RVA: 0x00075332 File Offset: 0x00073732
		public bool IsDestroyed { get; private set; }

		// Token: 0x06000FDD RID: 4061 RVA: 0x0007533B File Offset: 0x0007373B
		public void Awake()
		{
			this.Init();
		}

		// Token: 0x06000FDE RID: 4062 RVA: 0x00075343 File Offset: 0x00073743
		public void Start()
		{
			this.InitOnComplete();
		}

		// Token: 0x06000FDF RID: 4063 RVA: 0x0007534B File Offset: 0x0007374B
		public virtual void Init()
		{
		}

		// Token: 0x06000FE0 RID: 4064 RVA: 0x0007534D File Offset: 0x0007374D
		public virtual void InitOnComplete()
		{
		}

		// Token: 0x06000FE1 RID: 4065 RVA: 0x0007534F File Offset: 0x0007374F
		public virtual void OnEnable()
		{
		}

		// Token: 0x06000FE2 RID: 4066 RVA: 0x00075351 File Offset: 0x00073751
		public virtual void OnDisable()
		{
		}

		// Token: 0x06000FE3 RID: 4067 RVA: 0x00075353 File Offset: 0x00073753
		protected virtual void OnDisposed()
		{
		}

		// Token: 0x170002B1 RID: 689
		// (get) Token: 0x06000FE4 RID: 4068 RVA: 0x00075355 File Offset: 0x00073755
		public new Transform transform
		{
			get
			{
				if (this.m_Transform == null)
				{
					this.m_Transform = base.transform;
				}
				return this.m_Transform;
			}
		}

		// Token: 0x170002B2 RID: 690
		// (get) Token: 0x06000FE5 RID: 4069 RVA: 0x0007537A File Offset: 0x0007377A
		public new GameObject gameObject
		{
			get
			{
				if (this.m_GameObject == null)
				{
					this.m_GameObject = base.gameObject;
				}
				return this.m_GameObject;
			}
		}

		// Token: 0x170002B3 RID: 691
		// (get) Token: 0x06000FE6 RID: 4070 RVA: 0x0007539F File Offset: 0x0007379F
		public Rigidbody rigidBody
		{
			get
			{
				if (this.m_Rigidbody == null)
				{
					this.m_Rigidbody = base.GetComponent<Rigidbody>();
				}
				return this.m_Rigidbody;
			}
		}

		// Token: 0x06000FE7 RID: 4071 RVA: 0x000753C4 File Offset: 0x000737C4
		public void Dispose()
		{
			if (this.IsDisposed)
			{
				return;
			}
			this.OnDisposed();
			this.IsDisposed = true;
			GC.SuppressFinalize(this);
			if (!this.IsDestroyed)
			{
				this.IsDestroyed = true;
				UnityEngine.Object.Destroy(this.gameObject);
			}
		}

		// Token: 0x06000FE8 RID: 4072 RVA: 0x00075402 File Offset: 0x00073802
		public void OnDestroy()
		{
			if (!this.IsDestroyed)
			{
				this.IsDestroyed = true;
				this.Dispose();
			}
		}

		// Token: 0x04001160 RID: 4448
		private Transform m_Transform;

		// Token: 0x04001161 RID: 4449
		private GameObject m_GameObject;

		// Token: 0x04001162 RID: 4450
		private Rigidbody m_Rigidbody;
	}
}
