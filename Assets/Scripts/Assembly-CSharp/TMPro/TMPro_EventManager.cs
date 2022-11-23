using System;
using UnityEngine;

namespace TMPro
{
	// Token: 0x020005E7 RID: 1511
	public static class TMPro_EventManager
	{
		// Token: 0x06002BEF RID: 11247 RVA: 0x0001FAA3 File Offset: 0x0001DCA3
		public static void ON_PRE_RENDER_OBJECT_CHANGED()
		{
			TMPro_EventManager.OnPreRenderObject_Event.Call();
		}

		// Token: 0x06002BF0 RID: 11248 RVA: 0x0001FAAF File Offset: 0x0001DCAF
		public static void ON_MATERIAL_PROPERTY_CHANGED(bool isChanged, Material mat)
		{
			TMPro_EventManager.MATERIAL_PROPERTY_EVENT.Call(isChanged, mat);
		}

		// Token: 0x06002BF1 RID: 11249 RVA: 0x0001FABD File Offset: 0x0001DCBD
		public static void ON_FONT_PROPERTY_CHANGED(bool isChanged, TMP_FontAsset font)
		{
			TMPro_EventManager.FONT_PROPERTY_EVENT.Call(isChanged, font);
		}

		// Token: 0x06002BF2 RID: 11250 RVA: 0x0001FACB File Offset: 0x0001DCCB
		public static void ON_SPRITE_ASSET_PROPERTY_CHANGED(bool isChanged, UnityEngine.Object obj)
		{
			TMPro_EventManager.SPRITE_ASSET_PROPERTY_EVENT.Call(isChanged, obj);
		}

		// Token: 0x06002BF3 RID: 11251 RVA: 0x0001FAD9 File Offset: 0x0001DCD9
		public static void ON_TEXTMESHPRO_PROPERTY_CHANGED(bool isChanged, TextMeshPro obj)
		{
			TMPro_EventManager.TEXTMESHPRO_PROPERTY_EVENT.Call(isChanged, obj);
		}

		// Token: 0x06002BF4 RID: 11252 RVA: 0x0001FAE7 File Offset: 0x0001DCE7
		public static void ON_DRAG_AND_DROP_MATERIAL_CHANGED(GameObject sender, Material currentMaterial, Material newMaterial)
		{
			TMPro_EventManager.DRAG_AND_DROP_MATERIAL_EVENT.Call(sender, currentMaterial, newMaterial);
		}

		// Token: 0x06002BF5 RID: 11253 RVA: 0x0001FAF6 File Offset: 0x0001DCF6
		public static void ON_TEXT_STYLE_PROPERTY_CHANGED(bool isChanged)
		{
			TMPro_EventManager.TEXT_STYLE_PROPERTY_EVENT.Call(isChanged);
		}

		// Token: 0x06002BF6 RID: 11254 RVA: 0x0001FB03 File Offset: 0x0001DD03
		public static void ON_COLOR_GRAIDENT_PROPERTY_CHANGED(TMP_ColorGradient gradient)
		{
			TMPro_EventManager.COLOR_GRADIENT_PROPERTY_EVENT.Call(gradient);
		}

		// Token: 0x06002BF7 RID: 11255 RVA: 0x0001FB10 File Offset: 0x0001DD10
		public static void ON_TEXT_CHANGED(UnityEngine.Object obj)
		{
			TMPro_EventManager.TEXT_CHANGED_EVENT.Call(obj);
		}

		// Token: 0x06002BF8 RID: 11256 RVA: 0x0001FB1D File Offset: 0x0001DD1D
		public static void ON_TMP_SETTINGS_CHANGED()
		{
			TMPro_EventManager.TMP_SETTINGS_PROPERTY_EVENT.Call();
		}

		// Token: 0x06002BF9 RID: 11257 RVA: 0x0001FB29 File Offset: 0x0001DD29
		public static void ON_TEXTMESHPRO_UGUI_PROPERTY_CHANGED(bool isChanged, TextMeshProUGUI obj)
		{
			TMPro_EventManager.TEXTMESHPRO_UGUI_PROPERTY_EVENT.Call(isChanged, obj);
		}

		// Token: 0x06002BFA RID: 11258 RVA: 0x0001FB37 File Offset: 0x0001DD37
		public static void ON_COMPUTE_DT_EVENT(object Sender, Compute_DT_EventArgs e)
		{
			TMPro_EventManager.COMPUTE_DT_EVENT.Call(Sender, e);
		}

		// Token: 0x040030D8 RID: 12504
		public static readonly FastAction<object, Compute_DT_EventArgs> COMPUTE_DT_EVENT = new FastAction<object, Compute_DT_EventArgs>();

		// Token: 0x040030D9 RID: 12505
		public static readonly FastAction<bool, Material> MATERIAL_PROPERTY_EVENT = new FastAction<bool, Material>();

		// Token: 0x040030DA RID: 12506
		public static readonly FastAction<bool, TMP_FontAsset> FONT_PROPERTY_EVENT = new FastAction<bool, TMP_FontAsset>();

		// Token: 0x040030DB RID: 12507
		public static readonly FastAction<bool, UnityEngine.Object> SPRITE_ASSET_PROPERTY_EVENT = new FastAction<bool, UnityEngine.Object>();

		// Token: 0x040030DC RID: 12508
		public static readonly FastAction<bool, TextMeshPro> TEXTMESHPRO_PROPERTY_EVENT = new FastAction<bool, TextMeshPro>();

		// Token: 0x040030DD RID: 12509
		public static readonly FastAction<GameObject, Material, Material> DRAG_AND_DROP_MATERIAL_EVENT = new FastAction<GameObject, Material, Material>();

		// Token: 0x040030DE RID: 12510
		public static readonly FastAction<bool> TEXT_STYLE_PROPERTY_EVENT = new FastAction<bool>();

		// Token: 0x040030DF RID: 12511
		public static readonly FastAction<TMP_ColorGradient> COLOR_GRADIENT_PROPERTY_EVENT = new FastAction<TMP_ColorGradient>();

		// Token: 0x040030E0 RID: 12512
		public static readonly FastAction TMP_SETTINGS_PROPERTY_EVENT = new FastAction();

		// Token: 0x040030E1 RID: 12513
		public static readonly FastAction<bool, TextMeshProUGUI> TEXTMESHPRO_UGUI_PROPERTY_EVENT = new FastAction<bool, TextMeshProUGUI>();

		// Token: 0x040030E2 RID: 12514
		public static readonly FastAction OnPreRenderObject_Event = new FastAction();

		// Token: 0x040030E3 RID: 12515
		public static readonly FastAction<UnityEngine.Object> TEXT_CHANGED_EVENT = new FastAction<UnityEngine.Object>();
	}
}
