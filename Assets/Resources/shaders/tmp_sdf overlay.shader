Shader "TextMeshPro/Distance Field Overlay" {
	Properties {
		_FaceTex ("Face Texture", 2D) = "white" {}
		_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
		_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
		_FaceColor ("Face Color", Vector) = (1,1,1,1)
		_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
		_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_OutlineTex ("Outline Texture", 2D) = "white" {}
		_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
		_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
		_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
		_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
		_Bevel ("Bevel", Range(0, 1)) = 0.5
		_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
		_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
		_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
		_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
		_LightAngle ("Light Angle", Range(0, 6.283185)) = 3.1416
		_SpecularColor ("Specular", Vector) = (1,1,1,1)
		_SpecularPower ("Specular", Range(0, 4)) = 2
		_Reflectivity ("Reflectivity", Range(5, 15)) = 10
		_Diffuse ("Diffuse", Range(0, 1)) = 0.5
		_Ambient ("Ambient", Range(1, 0)) = 0.5
		_BumpMap ("Normal map", 2D) = "bump" {}
		_BumpOutline ("Bump Outline", Range(0, 1)) = 0
		_BumpFace ("Bump Face", Range(0, 1)) = 0
		_ReflectFaceColor ("Reflection Color", Vector) = (0,0,0,1)
		_ReflectOutlineColor ("Reflection Color", Vector) = (0,0,0,1)
		_Cube ("Reflection Cubemap", Cube) = "black" {}
		_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
		_UnderlayColor ("Border Color", Vector) = (0,0,0,0.5)
		_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
		_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
		_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
		_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
		_GlowColor ("Color", Vector) = (0,1,0,0.5)
		_GlowOffset ("Offset", Range(-1, 1)) = 0
		_GlowInner ("Inner", Range(0, 1)) = 0.05
		_GlowOuter ("Outer", Range(0, 1)) = 0.05
		_GlowPower ("Falloff", Range(1, 0)) = 0.75
		_WeightNormal ("Weight Normal", Float) = 0
		_WeightBold ("Weight Bold", Float) = 0.5
		_ShaderFlags ("Flags", Float) = 0
		_ScaleRatioA ("Scale RatioA", Float) = 1
		_ScaleRatioB ("Scale RatioB", Float) = 1
		_ScaleRatioC ("Scale RatioC", Float) = 1
		_MainTex ("Font Atlas", 2D) = "white" {}
		_TextureWidth ("Texture Width", Float) = 512
		_TextureHeight ("Texture Height", Float) = 512
		_GradientScale ("Gradient Scale", Float) = 5
		_ScaleX ("Scale X", Float) = 1
		_ScaleY ("Scale Y", Float) = 1
		_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
		_VertexOffsetX ("Vertex OffsetX", Float) = 0
		_VertexOffsetY ("Vertex OffsetY", Float) = 0
		_MaskCoord ("Mask Coordinates", Vector) = (0,0,10000,10000)
		_ClipRect ("Clip Rect", Vector) = (-10000,-10000,10000,10000)
		_MaskSoftnessX ("Mask SoftnessX", Float) = 0
		_MaskSoftnessY ("Mask SoftnessY", Float) = 0
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ColorMask 0 -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			Stencil {
				ReadMask 0
				WriteMask 0
				Comp Disabled
				Pass Keep
				Fail Keep
				ZFail Keep
			}
			Fog {
				Mode Off
			}
			GpuProgramID 64808
			Program "vp" {
				SubProgram "d3d9 " {
					"vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _ClipRect;
					//   row_major float4x4 _EnvMatrix;
					//   float _FaceDilate;
					//   float _GradientScale;
					//   float _MaskSoftnessX;
					//   float _MaskSoftnessY;
					//   float _OutlineSoftness;
					//   float _OutlineWidth;
					//   float _PerspectiveFilter;
					//   float _ScaleRatioA;
					//   float _ScaleX;
					//   float _ScaleY;
					//   float4 _ScreenParams;
					//   float _VertexOffsetX;
					//   float _VertexOffsetY;
					//   float _WeightBold;
					//   float _WeightNormal;
					//   float3 _WorldSpaceCameraPos;
					//   row_major float4x4 glstate_matrix_mvp;
					//   row_major float4x4 glstate_matrix_projection;
					//   row_major float4x4 unity_ObjectToWorld;
					//   row_major float4x4 unity_WorldToObject;
					//
					//
					// Registers:
					//
					//   Name                      Reg   Size
					//   ------------------------- ----- ----
					//   glstate_matrix_mvp        c0       4
					//   glstate_matrix_projection c4       4
					//   unity_ObjectToWorld       c8       3
					//   unity_WorldToObject       c11      3
					//   _EnvMatrix                c14      3
					//   _WorldSpaceCameraPos      c17      1
					//   _ScreenParams             c18      1
					//   _FaceDilate               c19      1
					//   _OutlineSoftness          c20      1
					//   _OutlineWidth             c21      1
					//   _WeightNormal             c22      1
					//   _WeightBold               c23      1
					//   _ScaleRatioA              c24      1
					//   _VertexOffsetX            c25      1
					//   _VertexOffsetY            c26      1
					//   _ClipRect                 c27      1
					//   _MaskSoftnessX            c28      1
					//   _MaskSoftnessY            c29      1
					//   _GradientScale            c30      1
					//   _ScaleX                   c31      1
					//   _ScaleY                   c32      1
					//   _PerspectiveFilter        c33      1
					//
					
					    vs_3_0
					    def c34, 0, 1.5, 1, 0.5
					    def c35, -2e+010, 2e+010, 0.000244140625, 4096
					    def c36, 0.001953125, 2, 0.25, 0
					    dcl_position v0
					    dcl_normal v1
					    dcl_color v2
					    dcl_texcoord v3
					    dcl_texcoord1 v4
					    dcl_position o0
					    dcl_color o1
					    dcl_texcoord o2
					    dcl_texcoord1 o3
					    dcl_texcoord2 o4
					    dcl_texcoord3 o5.xyz
					    mov r0.zw, v0
					    add r0.x, c25.x, v0.x
					    add r0.y, c26.x, v0.y
					    dp4 r5.x, c0, r0
					    dp4 r5.y, c1, r0
					    dp4 r5.z, c2, r0
					    dp4 r1.x, c8, r0
					    dp4 r1.y, c9, r0
					    dp4 r1.z, c10, r0
					    dp4 r0.z, c3, r0
					    add r1.xyz, -r1, c17
					    nrm r2.xyz, r1
					    mul r3.xyz, c12, v1.y
					    mad r3.xyz, v1.x, c11, r3
					    mad r3.xyz, v1.z, c13, r3
					    nrm r4.xyz, r3
					    dp3 r0.w, r4, r2
					    mov r2.xy, c18
					    mul r2.zw, r2.xyxy, c4.xyxy
					    add r1.w, r2.w, r2.z
					    mul r1.w, r1_abs.w, c31.x
					    rcp r3.x, r1.w
					    mul r2.xy, r2, c5
					    add r1.w, r2.y, r2.x
					    mul r1.w, r1_abs.w, c32.x
					    rcp r3.y, r1.w
					    mul r2.xy, r0.z, r3
					    mul r2.xy, r2, r2
					    add r1.w, r2.y, r2.x
					    rsq r1.w, r1.w
					    mul r2.x, c30.x, v4_abs.y
					    mul r1.w, r1.w, r2.x
					    mul r2.x, r1.w, c34.y
					    mov r2.z, c34.z
					    add r2.y, r2.z, -c33.x
					    mul r2.y, r2.y, r2_abs.x
					    mad r2.w, r1.w, c34.y, -r2.y
					    mad r0.w, r0_abs.w, r2.w, r2.y
					    mad r0.w, r1.w, -c34.y, r0.w
					    abs r1.w, c7.w
					    sge r1.w, -r1.w, r1.w
					    mad r2.y, r1.w, r0.w, r2.x
					    rcp r0.w, r2.y
					    sge r1.w, c34.x, v4.y
					    mov r2.x, c22.x
					    add r2.x, -r2.x, c23.x
					    mad r1.w, r1.w, r2.x, c22.x
					    mov r2.x, c24.x
					    mul r3.z, r2.x, c19.x
					    mul r3.z, r3.z, c34.w
					    rcp r3.w, c30.x
					    mad r2.w, r1.w, r3.w, r3.z
					    add r1.w, -r2.w, c34.w
					    mad o3.z, r0.w, c34.w, r1.w
					    mul r0.w, r0.w, c34.w
					    mad r1.w, c21.x, -r2.x, r2.z
					    mad r1.w, c20.x, -r2.x, r1.w
					    mad r0.w, r1.w, c34.w, -r0.w
					    add o3.x, -r2.w, r0.w
					    mov o3.yw, r2
					    mul r0.w, c35.z, v4.x
					    frc r1.w, r0.w
					    add r2.z, r0.w, -r1.w
					    mad r2.w, r2.z, -c35.w, v4.x
					    mul o2.zw, r2, c36.x
					    mov r2.x, c35.x
					    max r2, r2.x, c27
					    min r2, r2, c35.y
					    mad r0.xy, r0, c36.y, -r2
					    add o4.xy, -r2.zwzw, r0
					    mov r2.z, c36.z
					    mul r0.x, r2.z, c28.x
					    mul r0.y, r2.z, c29.x
					    mad r0.xy, r0.z, r3, r0
					    mov r5.w, r0.z
					    rcp r0.z, r0.x
					    rcp r0.w, r0.y
					    mul o4.zw, r0, c36.z
					    dp3 o5.x, c14, r1
					    dp3 o5.y, c15, r1
					    dp3 o5.z, c16, r1
					    mov o1, v2
					    mov o2.xy, v3
					    mad o0.xy, r5.w, c255, r5
					    mov o0.zw, r5
					
					// approximately 89 instruction slots used"
				}
				SubProgram "d3d11 " {
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 unused_0_3;
						float _OutlineWidth;
						vec4 unused_0_5[4];
						mat4x4 _EnvMatrix;
						vec4 unused_0_7[7];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_13[2];
						vec4 _ClipRect;
						float _MaskSoftnessX;
						float _MaskSoftnessY;
						float _GradientScale;
						float _ScaleX;
						float _ScaleY;
						float _PerspectiveFilter;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[5];
						mat4x4 glstate_matrix_projection;
						vec4 unused_3_2[13];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat8.x = in_TEXCOORD1.x * 0.000244140625;
					    u_xlat8.x = floor(u_xlat8.x);
					    u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_TEXCOORD1.x;
					    vs_TEXCOORD0.zw = u_xlat8.xy * vec2(0.001953125, 0.001953125);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat1.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat8.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat8.x = inversesqrt(u_xlat8.x);
					    u_xlat3.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat1.ww / u_xlat1.xy;
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat1.x = u_xlat12 * 1.5;
					    u_xlat5.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat5.x = u_xlat5.x * abs(u_xlat1.x);
					    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat5.x);
					    u_xlat8.x = abs(u_xlat8.x) * u_xlat12 + u_xlat5.x;
					    u_xlatb12 = glstate_matrix_projection[3].w==0.0;
					    u_xlat5.x = (u_xlatb12) ? u_xlat8.x : u_xlat1.x;
					    u_xlatb8 = 0.0>=in_TEXCOORD1.y;
					    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat12 = (-_WeightNormal) + _WeightBold;
					    u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
					    u_xlat8.x = u_xlat8.x / _GradientScale;
					    u_xlat12 = _FaceDilate * _ScaleRatioA;
					    u_xlat5.z = u_xlat12 * 0.5 + u_xlat8.x;
					    vs_TEXCOORD1.yw = u_xlat5.xz;
					    u_xlat8.x = 0.5 / u_xlat5.x;
					    u_xlat12 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
					    u_xlat12 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat12;
					    u_xlat12 = u_xlat12 * 0.5 + (-u_xlat8.x);
					    vs_TEXCOORD1.x = (-u_xlat5.z) + u_xlat12;
					    u_xlat12 = (-u_xlat5.z) + 0.5;
					    vs_TEXCOORD1.z = u_xlat8.x + u_xlat12;
					    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
					    vs_TEXCOORD2.xy = (-u_xlat1.zw) + u_xlat0.xy;
					    u_xlat0.xyz = u_xlat2.yyy * _EnvMatrix[1].xyz;
					    u_xlat0.xyz = _EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = _EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d9 " {
					"ps_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _ClipRect;
					//   float4 _FaceColor;
					//   sampler2D _FaceTex;
					//   float _FaceUVSpeedX;
					//   float _FaceUVSpeedY;
					//   sampler2D _MainTex;
					//   float4 _OutlineColor;
					//   float _OutlineSoftness;
					//   sampler2D _OutlineTex;
					//   float _OutlineUVSpeedX;
					//   float _OutlineUVSpeedY;
					//   float _OutlineWidth;
					//   float _ScaleRatioA;
					//   float4 _Time;
					//
					//
					// Registers:
					//
					//   Name             Reg   Size
					//   ---------------- ----- ----
					//   _Time            c0       1
					//   _FaceUVSpeedX    c1       1
					//   _FaceUVSpeedY    c2       1
					//   _FaceColor       c3       1
					//   _OutlineSoftness c4       1
					//   _OutlineUVSpeedX c5       1
					//   _OutlineUVSpeedY c6       1
					//   _OutlineColor    c7       1
					//   _OutlineWidth    c8       1
					//   _ScaleRatioA     c9       1
					//   _ClipRect        c10      1
					//   _FaceTex         s0       1
					//   _OutlineTex      s1       1
					//   _MainTex         s2       1
					//
					
					    ps_3_0
					    def c11, 0.5, 1, 0, 0
					    dcl_color_pp v0
					    dcl_texcoord v1
					    dcl_texcoord1 v2.xyz
					    dcl_texcoord2 v3
					    dcl_2d s0
					    dcl_2d s1
					    dcl_2d s2
					    texld r0, v1, s2
					    add r1, r0.w, -v2.x
					    add r0.x, -r0.w, v2.z
					    texkill r1
					    mov r1.x, c9.x
					    mul r0.y, r1.x, c8.x
					    mul_pp r0.z, r0.y, v2.y
					    mad r0.y, r0.y, -v2.y, c11.y
					    rsq r0.w, r0.z
					    mul_pp r0.z, r0.z, c11.x
					    rcp_pp r0.w, r0.w
					    cmp_pp r0.y, r0.y, r0.w, c11.y
					    mad_sat_pp r0.w, r0.x, v2.y, r0.z
					    mad_pp r0.x, r0.x, v2.y, -r0.z
					    mul_pp r0.y, r0.y, r0.w
					    mov r1.y, c0.y
					    mul r2.x, r1.y, c1.x
					    mul r2.y, r1.y, c2.x
					    add r0.zw, r2.xyxy, v1
					    texld r2, r0.zwzw, s0
					    mul_pp r3.xyz, c3, v0
					    mul_pp r2.xyz, r2, r3
					    mul_pp r3.w, r2.w, c3.w
					    mul_pp r3.xyz, r2, r3.w
					    mul r2.x, r1.y, c5.x
					    mul r2.y, r1.y, c6.x
					    add r0.zw, r2.xyxy, v1
					    texld r2, r0.zwzw, s1
					    mul_pp r2, r2, c7
					    mul_pp r2.xyz, r2.w, r2
					    lrp_pp r4, r0.y, r2, r3
					    mul r0.y, r1.x, c4.x
					    mul_pp r0.z, r0.y, v2.y
					    mad_pp r0.y, r0.y, v2.y, c11.y
					    rcp r0.y, r0.y
					    mad_pp r0.x, r0.z, c11.x, r0.x
					    mul_sat_pp r0.x, r0.y, r0.x
					    add_pp r0.x, -r0.x, c11.y
					    mul_pp r0, r0.x, r4
					    add r1.xy, -c10, c10.zwzw
					    add r1.xy, r1, -v3_abs
					    mul_sat_pp r1.xy, r1, v3.zwzw
					    mul_pp r1.x, r1.y, r1.x
					    mul_pp r0, r0, r1.x
					    mul_pp oC0, r0, v0.w
					
					// approximately 45 instruction slots used (3 texture, 42 arithmetic)"
				}
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _FaceUVSpeedX;
						float _FaceUVSpeedY;
						vec4 _FaceColor;
						float _OutlineSoftness;
						float _OutlineUVSpeedX;
						float _OutlineUVSpeedY;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_9[15];
						float _ScaleRatioA;
						vec4 unused_0_11[3];
						vec4 _ClipRect;
						vec4 unused_0_13[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FaceTex;
					uniform  sampler2D _OutlineTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.w + (-vs_TEXCOORD1.x);
					    u_xlat4 = (-u_xlat0.w) + vs_TEXCOORD1.z;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
					    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.y;
					    u_xlat8.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat8.x = sqrt(u_xlat8.x);
					    u_xlat12 = u_xlat4 * vs_TEXCOORD1.y + u_xlat0.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.x = u_xlat4 * vs_TEXCOORD1.y + (-u_xlat0.x);
					    u_xlat4 = u_xlat8.x * u_xlat12;
					    u_xlat8.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat1 = texture(_OutlineTex, u_xlat8.xy);
					    u_xlat1 = u_xlat1 * _OutlineColor;
					    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
					    u_xlat2.xyz = vs_COLOR0.xyz * _FaceColor.xyz;
					    u_xlat8.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
					    u_xlat3 = texture(_FaceTex, u_xlat8.xy);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat3.w = u_xlat3.w * _FaceColor.w;
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.www;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = vec4(u_xlat4) * u_xlat1 + u_xlat3;
					    u_xlat4 = _OutlineSoftness * _ScaleRatioA;
					    u_xlat8.x = u_xlat4 * vs_TEXCOORD1.y;
					    u_xlat4 = u_xlat4 * vs_TEXCOORD1.y + 1.0;
					    u_xlat0.x = u_xlat8.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x / u_xlat4;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat1.xy = u_xlat1.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    SV_Target0 = u_xlat0 * vs_COLOR0.wwww;
					    return;
					}"
				}
			}
		}
	}
	Fallback "TextMeshPro/Mobile/Distance Field"
	CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}