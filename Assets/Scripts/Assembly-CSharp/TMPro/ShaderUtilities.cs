using System;
using System.Linq;
using UnityEngine;

namespace TMPro
{
	// Token: 0x02000601 RID: 1537
	public static class ShaderUtilities
	{
		// Token: 0x06002C26 RID: 11302 RVA: 0x0010DF48 File Offset: 0x0010C148
		public static void GetShaderPropertyIDs()
		{
			if (!ShaderUtilities.isInitialized)
			{
				ShaderUtilities.isInitialized = true;
				ShaderUtilities.ID_MainTex = Shader.PropertyToID("_MainTex");
				ShaderUtilities.ID_FaceTex = Shader.PropertyToID("_FaceTex");
				ShaderUtilities.ID_FaceColor = Shader.PropertyToID("_FaceColor");
				ShaderUtilities.ID_FaceDilate = Shader.PropertyToID("_FaceDilate");
				ShaderUtilities.ID_Shininess = Shader.PropertyToID("_FaceShininess");
				ShaderUtilities.ID_UnderlayColor = Shader.PropertyToID("_UnderlayColor");
				ShaderUtilities.ID_UnderlayOffsetX = Shader.PropertyToID("_UnderlayOffsetX");
				ShaderUtilities.ID_UnderlayOffsetY = Shader.PropertyToID("_UnderlayOffsetY");
				ShaderUtilities.ID_UnderlayDilate = Shader.PropertyToID("_UnderlayDilate");
				ShaderUtilities.ID_UnderlaySoftness = Shader.PropertyToID("_UnderlaySoftness");
				ShaderUtilities.ID_WeightNormal = Shader.PropertyToID("_WeightNormal");
				ShaderUtilities.ID_WeightBold = Shader.PropertyToID("_WeightBold");
				ShaderUtilities.ID_OutlineTex = Shader.PropertyToID("_OutlineTex");
				ShaderUtilities.ID_OutlineWidth = Shader.PropertyToID("_OutlineWidth");
				ShaderUtilities.ID_OutlineSoftness = Shader.PropertyToID("_OutlineSoftness");
				ShaderUtilities.ID_OutlineColor = Shader.PropertyToID("_OutlineColor");
				ShaderUtilities.ID_GradientScale = Shader.PropertyToID("_GradientScale");
				ShaderUtilities.ID_ScaleX = Shader.PropertyToID("_ScaleX");
				ShaderUtilities.ID_ScaleY = Shader.PropertyToID("_ScaleY");
				ShaderUtilities.ID_PerspectiveFilter = Shader.PropertyToID("_PerspectiveFilter");
				ShaderUtilities.ID_TextureWidth = Shader.PropertyToID("_TextureWidth");
				ShaderUtilities.ID_TextureHeight = Shader.PropertyToID("_TextureHeight");
				ShaderUtilities.ID_BevelAmount = Shader.PropertyToID("_Bevel");
				ShaderUtilities.ID_LightAngle = Shader.PropertyToID("_LightAngle");
				ShaderUtilities.ID_EnvMap = Shader.PropertyToID("_Cube");
				ShaderUtilities.ID_EnvMatrix = Shader.PropertyToID("_EnvMatrix");
				ShaderUtilities.ID_EnvMatrixRotation = Shader.PropertyToID("_EnvMatrixRotation");
				ShaderUtilities.ID_GlowColor = Shader.PropertyToID("_GlowColor");
				ShaderUtilities.ID_GlowOffset = Shader.PropertyToID("_GlowOffset");
				ShaderUtilities.ID_GlowPower = Shader.PropertyToID("_GlowPower");
				ShaderUtilities.ID_GlowOuter = Shader.PropertyToID("_GlowOuter");
				ShaderUtilities.ID_MaskCoord = Shader.PropertyToID("_MaskCoord");
				ShaderUtilities.ID_ClipRect = Shader.PropertyToID("_ClipRect");
				ShaderUtilities.ID_UseClipRect = Shader.PropertyToID("_UseClipRect");
				ShaderUtilities.ID_MaskSoftnessX = Shader.PropertyToID("_MaskSoftnessX");
				ShaderUtilities.ID_MaskSoftnessY = Shader.PropertyToID("_MaskSoftnessY");
				ShaderUtilities.ID_VertexOffsetX = Shader.PropertyToID("_VertexOffsetX");
				ShaderUtilities.ID_VertexOffsetY = Shader.PropertyToID("_VertexOffsetY");
				ShaderUtilities.ID_StencilID = Shader.PropertyToID("_Stencil");
				ShaderUtilities.ID_StencilOp = Shader.PropertyToID("_StencilOp");
				ShaderUtilities.ID_StencilComp = Shader.PropertyToID("_StencilComp");
				ShaderUtilities.ID_StencilReadMask = Shader.PropertyToID("_StencilReadMask");
				ShaderUtilities.ID_StencilWriteMask = Shader.PropertyToID("_StencilWriteMask");
				ShaderUtilities.ID_ShaderFlags = Shader.PropertyToID("_ShaderFlags");
				ShaderUtilities.ID_ScaleRatio_A = Shader.PropertyToID("_ScaleRatioA");
				ShaderUtilities.ID_ScaleRatio_B = Shader.PropertyToID("_ScaleRatioB");
				ShaderUtilities.ID_ScaleRatio_C = Shader.PropertyToID("_ScaleRatioC");
			}
		}

		// Token: 0x06002C27 RID: 11303 RVA: 0x0010E228 File Offset: 0x0010C428
		public static void UpdateShaderRatios(Material mat, bool isBold)
		{
			bool flag = !mat.shaderKeywords.Contains(ShaderUtilities.Keyword_Ratios);
			float @float = mat.GetFloat(ShaderUtilities.ID_GradientScale);
			float float2 = mat.GetFloat(ShaderUtilities.ID_FaceDilate);
			float float3 = mat.GetFloat(ShaderUtilities.ID_OutlineWidth);
			float float4 = mat.GetFloat(ShaderUtilities.ID_OutlineSoftness);
			float num = isBold ? (mat.GetFloat(ShaderUtilities.ID_WeightBold) * 2f / @float) : (mat.GetFloat(ShaderUtilities.ID_WeightNormal) * 2f / @float);
			float num2 = Mathf.Max(1f, num + float2 + float3 + float4);
			float value = (!flag) ? 1f : ((@float - ShaderUtilities.m_clamp) / (@float * num2));
			mat.SetFloat(ShaderUtilities.ID_ScaleRatio_A, value);
			if (mat.HasProperty(ShaderUtilities.ID_GlowOffset))
			{
				float float5 = mat.GetFloat(ShaderUtilities.ID_GlowOffset);
				float float6 = mat.GetFloat(ShaderUtilities.ID_GlowOuter);
				float num3 = (num + float2) * (@float - ShaderUtilities.m_clamp);
				num2 = Mathf.Max(1f, float5 + float6);
				float value2 = (!flag) ? 1f : (Mathf.Max(0f, @float - ShaderUtilities.m_clamp - num3) / (@float * num2));
				mat.SetFloat(ShaderUtilities.ID_ScaleRatio_B, value2);
			}
			if (mat.HasProperty(ShaderUtilities.ID_UnderlayOffsetX))
			{
				float float7 = mat.GetFloat(ShaderUtilities.ID_UnderlayOffsetX);
				float float8 = mat.GetFloat(ShaderUtilities.ID_UnderlayOffsetY);
				float float9 = mat.GetFloat(ShaderUtilities.ID_UnderlayDilate);
				float float10 = mat.GetFloat(ShaderUtilities.ID_UnderlaySoftness);
				float num4 = (num + float2) * (@float - ShaderUtilities.m_clamp);
				num2 = Mathf.Max(1f, Mathf.Max(Mathf.Abs(float7), Mathf.Abs(float8)) + float9 + float10);
				float value3 = (!flag) ? 1f : (Mathf.Max(0f, @float - ShaderUtilities.m_clamp - num4) / (@float * num2));
				mat.SetFloat(ShaderUtilities.ID_ScaleRatio_C, value3);
			}
		}

		// Token: 0x06002C28 RID: 11304 RVA: 0x0001FD3D File Offset: 0x0001DF3D
		public static Vector4 GetFontExtent(Material material)
		{
			return Vector4.zero;
		}

		// Token: 0x06002C29 RID: 11305 RVA: 0x0010E43C File Offset: 0x0010C63C
		public static bool IsMaskingEnabled(Material material)
		{
			return !(material == null) && material.HasProperty(ShaderUtilities.ID_ClipRect) && (material.shaderKeywords.Contains(ShaderUtilities.Keyword_MASK_SOFT) || material.shaderKeywords.Contains(ShaderUtilities.Keyword_MASK_HARD) || material.shaderKeywords.Contains(ShaderUtilities.Keyword_MASK_TEX));
		}

		// Token: 0x06002C2A RID: 11306 RVA: 0x0010E4AC File Offset: 0x0010C6AC
		public static float GetPadding(Material material, bool enableExtraPadding, bool isBold)
		{
			if (!ShaderUtilities.isInitialized)
			{
				ShaderUtilities.GetShaderPropertyIDs();
			}
			if (material == null)
			{
				return 0f;
			}
			int num = (!enableExtraPadding) ? 0 : 4;
			if (!material.HasProperty(ShaderUtilities.ID_GradientScale))
			{
				return (float)num;
			}
			Vector4 a = Vector4.zero;
			Vector4 zero = Vector4.zero;
			float num2 = 0f;
			float num3 = 0f;
			float num4 = 0f;
			float num5 = 0f;
			float num6 = 0f;
			float num7 = 0f;
			float num8 = 0f;
			float num9 = 0f;
			ShaderUtilities.UpdateShaderRatios(material, isBold);
			string[] shaderKeywords = material.shaderKeywords;
			if (material.HasProperty(ShaderUtilities.ID_ScaleRatio_A))
			{
				num5 = material.GetFloat(ShaderUtilities.ID_ScaleRatio_A);
			}
			if (material.HasProperty(ShaderUtilities.ID_FaceDilate))
			{
				num2 = material.GetFloat(ShaderUtilities.ID_FaceDilate) * num5;
			}
			if (material.HasProperty(ShaderUtilities.ID_OutlineSoftness))
			{
				num3 = material.GetFloat(ShaderUtilities.ID_OutlineSoftness) * num5;
			}
			if (material.HasProperty(ShaderUtilities.ID_OutlineWidth))
			{
				num4 = material.GetFloat(ShaderUtilities.ID_OutlineWidth) * num5;
			}
			float num10 = num4 + num3 + num2;
			if (material.HasProperty(ShaderUtilities.ID_GlowOffset) && shaderKeywords.Contains(ShaderUtilities.Keyword_Glow))
			{
				if (material.HasProperty(ShaderUtilities.ID_ScaleRatio_B))
				{
					num6 = material.GetFloat(ShaderUtilities.ID_ScaleRatio_B);
				}
				num8 = material.GetFloat(ShaderUtilities.ID_GlowOffset) * num6;
				num9 = material.GetFloat(ShaderUtilities.ID_GlowOuter) * num6;
			}
			num10 = Mathf.Max(num10, num2 + num8 + num9);
			if (material.HasProperty(ShaderUtilities.ID_UnderlaySoftness) && shaderKeywords.Contains(ShaderUtilities.Keyword_Underlay))
			{
				if (material.HasProperty(ShaderUtilities.ID_ScaleRatio_C))
				{
					num7 = material.GetFloat(ShaderUtilities.ID_ScaleRatio_C);
				}
				float num11 = material.GetFloat(ShaderUtilities.ID_UnderlayOffsetX) * num7;
				float num12 = material.GetFloat(ShaderUtilities.ID_UnderlayOffsetY) * num7;
				float num13 = material.GetFloat(ShaderUtilities.ID_UnderlayDilate) * num7;
				float num14 = material.GetFloat(ShaderUtilities.ID_UnderlaySoftness) * num7;
				a.x = Mathf.Max(a.x, num2 + num13 + num14 - num11);
				a.y = Mathf.Max(a.y, num2 + num13 + num14 - num12);
				a.z = Mathf.Max(a.z, num2 + num13 + num14 + num11);
				a.w = Mathf.Max(a.w, num2 + num13 + num14 + num12);
			}
			a.x = Mathf.Max(a.x, num10);
			a.y = Mathf.Max(a.y, num10);
			a.z = Mathf.Max(a.z, num10);
			a.w = Mathf.Max(a.w, num10);
			a.x += (float)num;
			a.y += (float)num;
			a.z += (float)num;
			a.w += (float)num;
			a.x = Mathf.Min(a.x, 1f);
			a.y = Mathf.Min(a.y, 1f);
			a.z = Mathf.Min(a.z, 1f);
			a.w = Mathf.Min(a.w, 1f);
			zero.x = ((zero.x >= a.x) ? zero.x : a.x);
			zero.y = ((zero.y >= a.y) ? zero.y : a.y);
			zero.z = ((zero.z >= a.z) ? zero.z : a.z);
			zero.w = ((zero.w >= a.w) ? zero.w : a.w);
			float @float = material.GetFloat(ShaderUtilities.ID_GradientScale);
			a *= @float;
			num10 = Mathf.Max(a.x, a.y);
			num10 = Mathf.Max(a.z, num10);
			num10 = Mathf.Max(a.w, num10);
			return num10 + 0.5f;
		}

		// Token: 0x06002C2B RID: 11307 RVA: 0x0010E934 File Offset: 0x0010CB34
		public static float GetPadding(Material[] materials, bool enableExtraPadding, bool isBold)
		{
			if (!ShaderUtilities.isInitialized)
			{
				ShaderUtilities.GetShaderPropertyIDs();
			}
			if (materials == null)
			{
				return 0f;
			}
			int num = (!enableExtraPadding) ? 0 : 4;
			if (!materials[0].HasProperty(ShaderUtilities.ID_GradientScale))
			{
				return (float)num;
			}
			Vector4 a = Vector4.zero;
			Vector4 zero = Vector4.zero;
			float num2 = 0f;
			float num3 = 0f;
			float num4 = 0f;
			float num5 = 0f;
			float num6 = 0f;
			float num7 = 0f;
			float num8 = 0f;
			float num9 = 0f;
			float num10;
			for (int i = 0; i < materials.Length; i++)
			{
				ShaderUtilities.UpdateShaderRatios(materials[i], isBold);
				string[] shaderKeywords = materials[i].shaderKeywords;
				if (materials[i].HasProperty(ShaderUtilities.ID_ScaleRatio_A))
				{
					num5 = materials[i].GetFloat(ShaderUtilities.ID_ScaleRatio_A);
				}
				if (materials[i].HasProperty(ShaderUtilities.ID_FaceDilate))
				{
					num2 = materials[i].GetFloat(ShaderUtilities.ID_FaceDilate) * num5;
				}
				if (materials[i].HasProperty(ShaderUtilities.ID_OutlineSoftness))
				{
					num3 = materials[i].GetFloat(ShaderUtilities.ID_OutlineSoftness) * num5;
				}
				if (materials[i].HasProperty(ShaderUtilities.ID_OutlineWidth))
				{
					num4 = materials[i].GetFloat(ShaderUtilities.ID_OutlineWidth) * num5;
				}
				num10 = num4 + num3 + num2;
				if (materials[i].HasProperty(ShaderUtilities.ID_GlowOffset) && shaderKeywords.Contains(ShaderUtilities.Keyword_Glow))
				{
					if (materials[i].HasProperty(ShaderUtilities.ID_ScaleRatio_B))
					{
						num6 = materials[i].GetFloat(ShaderUtilities.ID_ScaleRatio_B);
					}
					num8 = materials[i].GetFloat(ShaderUtilities.ID_GlowOffset) * num6;
					num9 = materials[i].GetFloat(ShaderUtilities.ID_GlowOuter) * num6;
				}
				num10 = Mathf.Max(num10, num2 + num8 + num9);
				if (materials[i].HasProperty(ShaderUtilities.ID_UnderlaySoftness) && shaderKeywords.Contains(ShaderUtilities.Keyword_Underlay))
				{
					if (materials[i].HasProperty(ShaderUtilities.ID_ScaleRatio_C))
					{
						num7 = materials[i].GetFloat(ShaderUtilities.ID_ScaleRatio_C);
					}
					float num11 = materials[i].GetFloat(ShaderUtilities.ID_UnderlayOffsetX) * num7;
					float num12 = materials[i].GetFloat(ShaderUtilities.ID_UnderlayOffsetY) * num7;
					float num13 = materials[i].GetFloat(ShaderUtilities.ID_UnderlayDilate) * num7;
					float num14 = materials[i].GetFloat(ShaderUtilities.ID_UnderlaySoftness) * num7;
					a.x = Mathf.Max(a.x, num2 + num13 + num14 - num11);
					a.y = Mathf.Max(a.y, num2 + num13 + num14 - num12);
					a.z = Mathf.Max(a.z, num2 + num13 + num14 + num11);
					a.w = Mathf.Max(a.w, num2 + num13 + num14 + num12);
				}
				a.x = Mathf.Max(a.x, num10);
				a.y = Mathf.Max(a.y, num10);
				a.z = Mathf.Max(a.z, num10);
				a.w = Mathf.Max(a.w, num10);
				a.x += (float)num;
				a.y += (float)num;
				a.z += (float)num;
				a.w += (float)num;
				a.x = Mathf.Min(a.x, 1f);
				a.y = Mathf.Min(a.y, 1f);
				a.z = Mathf.Min(a.z, 1f);
				a.w = Mathf.Min(a.w, 1f);
				zero.x = ((zero.x >= a.x) ? zero.x : a.x);
				zero.y = ((zero.y >= a.y) ? zero.y : a.y);
				zero.z = ((zero.z >= a.z) ? zero.z : a.z);
				zero.w = ((zero.w >= a.w) ? zero.w : a.w);
			}
			float @float = materials[0].GetFloat(ShaderUtilities.ID_GradientScale);
			a *= @float;
			num10 = Mathf.Max(a.x, a.y);
			num10 = Mathf.Max(a.z, num10);
			num10 = Mathf.Max(a.w, num10);
			return num10 + 0.25f;
		}

		// Token: 0x0400319A RID: 12698
		public static int ID_MainTex;

		// Token: 0x0400319B RID: 12699
		public static int ID_FaceTex;

		// Token: 0x0400319C RID: 12700
		public static int ID_FaceColor;

		// Token: 0x0400319D RID: 12701
		public static int ID_FaceDilate;

		// Token: 0x0400319E RID: 12702
		public static int ID_Shininess;

		// Token: 0x0400319F RID: 12703
		public static int ID_UnderlayColor;

		// Token: 0x040031A0 RID: 12704
		public static int ID_UnderlayOffsetX;

		// Token: 0x040031A1 RID: 12705
		public static int ID_UnderlayOffsetY;

		// Token: 0x040031A2 RID: 12706
		public static int ID_UnderlayDilate;

		// Token: 0x040031A3 RID: 12707
		public static int ID_UnderlaySoftness;

		// Token: 0x040031A4 RID: 12708
		public static int ID_WeightNormal;

		// Token: 0x040031A5 RID: 12709
		public static int ID_WeightBold;

		// Token: 0x040031A6 RID: 12710
		public static int ID_OutlineTex;

		// Token: 0x040031A7 RID: 12711
		public static int ID_OutlineWidth;

		// Token: 0x040031A8 RID: 12712
		public static int ID_OutlineSoftness;

		// Token: 0x040031A9 RID: 12713
		public static int ID_OutlineColor;

		// Token: 0x040031AA RID: 12714
		public static int ID_GradientScale;

		// Token: 0x040031AB RID: 12715
		public static int ID_ScaleX;

		// Token: 0x040031AC RID: 12716
		public static int ID_ScaleY;

		// Token: 0x040031AD RID: 12717
		public static int ID_PerspectiveFilter;

		// Token: 0x040031AE RID: 12718
		public static int ID_TextureWidth;

		// Token: 0x040031AF RID: 12719
		public static int ID_TextureHeight;

		// Token: 0x040031B0 RID: 12720
		public static int ID_BevelAmount;

		// Token: 0x040031B1 RID: 12721
		public static int ID_GlowColor;

		// Token: 0x040031B2 RID: 12722
		public static int ID_GlowOffset;

		// Token: 0x040031B3 RID: 12723
		public static int ID_GlowPower;

		// Token: 0x040031B4 RID: 12724
		public static int ID_GlowOuter;

		// Token: 0x040031B5 RID: 12725
		public static int ID_LightAngle;

		// Token: 0x040031B6 RID: 12726
		public static int ID_EnvMap;

		// Token: 0x040031B7 RID: 12727
		public static int ID_EnvMatrix;

		// Token: 0x040031B8 RID: 12728
		public static int ID_EnvMatrixRotation;

		// Token: 0x040031B9 RID: 12729
		public static int ID_MaskCoord;

		// Token: 0x040031BA RID: 12730
		public static int ID_ClipRect;

		// Token: 0x040031BB RID: 12731
		public static int ID_MaskSoftnessX;

		// Token: 0x040031BC RID: 12732
		public static int ID_MaskSoftnessY;

		// Token: 0x040031BD RID: 12733
		public static int ID_VertexOffsetX;

		// Token: 0x040031BE RID: 12734
		public static int ID_VertexOffsetY;

		// Token: 0x040031BF RID: 12735
		public static int ID_UseClipRect;

		// Token: 0x040031C0 RID: 12736
		public static int ID_StencilID;

		// Token: 0x040031C1 RID: 12737
		public static int ID_StencilOp;

		// Token: 0x040031C2 RID: 12738
		public static int ID_StencilComp;

		// Token: 0x040031C3 RID: 12739
		public static int ID_StencilReadMask;

		// Token: 0x040031C4 RID: 12740
		public static int ID_StencilWriteMask;

		// Token: 0x040031C5 RID: 12741
		public static int ID_ShaderFlags;

		// Token: 0x040031C6 RID: 12742
		public static int ID_ScaleRatio_A;

		// Token: 0x040031C7 RID: 12743
		public static int ID_ScaleRatio_B;

		// Token: 0x040031C8 RID: 12744
		public static int ID_ScaleRatio_C;

		// Token: 0x040031C9 RID: 12745
		public static string Keyword_Bevel = "BEVEL_ON";

		// Token: 0x040031CA RID: 12746
		public static string Keyword_Glow = "GLOW_ON";

		// Token: 0x040031CB RID: 12747
		public static string Keyword_Underlay = "UNDERLAY_ON";

		// Token: 0x040031CC RID: 12748
		public static string Keyword_Ratios = "RATIOS_OFF";

		// Token: 0x040031CD RID: 12749
		public static string Keyword_MASK_SOFT = "MASK_SOFT";

		// Token: 0x040031CE RID: 12750
		public static string Keyword_MASK_HARD = "MASK_HARD";

		// Token: 0x040031CF RID: 12751
		public static string Keyword_MASK_TEX = "MASK_TEX";

		// Token: 0x040031D0 RID: 12752
		public static string Keyword_Outline = "OUTLINE_ON";

		// Token: 0x040031D1 RID: 12753
		public static string ShaderTag_ZTestMode = "unity_GUIZTestMode";

		// Token: 0x040031D2 RID: 12754
		public static string ShaderTag_CullMode = "_CullMode";

		// Token: 0x040031D3 RID: 12755
		private static float m_clamp = 1f;

		// Token: 0x040031D4 RID: 12756
		public static bool isInitialized;
	}
}
