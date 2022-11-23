using System;
using System.Collections.Generic;
using UnityEngine;

namespace TMG.Core
{
	// Token: 0x020002D7 RID: 727
	public class AssetManager : TMGAbstractDisposable
	{
		// Token: 0x060010A8 RID: 4264 RVA: 0x00088430 File Offset: 0x00086830
		public T GetSprite<T>(string lookupKey, string assetKey) where T : UnityEngine.Object
		{
			int hashCode = assetKey.GetHashCode();
			if (!this.m_SpriteAssets.ContainsKey(hashCode))
			{
				this.m_SpriteAssets.Add(hashCode, Resources.LoadAll(lookupKey));
			}
			for (int i = 0; i < this.m_SpriteAssets[hashCode].Length; i++)
			{
				if (this.m_SpriteAssets[hashCode][i].name == assetKey)
				{
					return (T)((object)this.m_SpriteAssets[hashCode][i]);
				}
			}
			return (T)((object)null);
		}

		// Token: 0x060010A9 RID: 4265 RVA: 0x000884C0 File Offset: 0x000868C0
		public T GetAsset<T>(string assetKey) where T : UnityEngine.Object
		{
			int hashCode = assetKey.GetHashCode();
			if (!this.m_Assets.ContainsKey(hashCode))
			{
				this.m_Assets.Add(hashCode, Resources.Load<T>(assetKey));
			}
			return (T)((object)this.m_Assets[hashCode]);
		}

		// Token: 0x060010AA RID: 4266 RVA: 0x0008850F File Offset: 0x0008690F
		public T CreateAsset<T>(string assetKey) where T : Component
		{
			return UnityEngine.Object.Instantiate<T>(this.GetAsset<T>(assetKey));
		}

		// Token: 0x060010AB RID: 4267 RVA: 0x00088520 File Offset: 0x00086920
		public T[] GetAssets<T>(string assetKey) where T : UnityEngine.Object
		{
			int hashCode = assetKey.GetHashCode();
			if (!this.m_AssetsLists.ContainsKey(hashCode))
			{
				this.m_AssetsLists.Add(hashCode, Resources.LoadAll<T>(assetKey));
			}
			return (T[])this.m_AssetsLists[hashCode];
		}

		// Token: 0x060010AC RID: 4268 RVA: 0x0008856C File Offset: 0x0008696C
		protected override void OnDisposed()
		{
			if (this.m_Assets != null)
			{
				this.m_Assets.Clear();
				this.m_Assets = null;
			}
			if (this.m_AssetsLists != null)
			{
				this.m_AssetsLists.Clear();
				this.m_AssetsLists = null;
			}
			if (this.m_SpriteAssets != null)
			{
				this.m_SpriteAssets.Clear();
				this.m_SpriteAssets = null;
			}
			base.OnDisposed();
		}

		// Token: 0x040012B5 RID: 4789
		private Dictionary<int, UnityEngine.Object> m_Assets = new Dictionary<int, UnityEngine.Object>();

		// Token: 0x040012B6 RID: 4790
		private Dictionary<int, UnityEngine.Object[]> m_AssetsLists = new Dictionary<int, UnityEngine.Object[]>();

		// Token: 0x040012B7 RID: 4791
		private Dictionary<int, UnityEngine.Object[]> m_SpriteAssets = new Dictionary<int, UnityEngine.Object[]>();
	}
}
