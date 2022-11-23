Shader "TextMeshPro/Mobile/Distance Field Overlay" {
	Properties {
		_FaceColor ("Face Color", Vector) = (1,1,1,1)
		_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
		_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
		_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
		_UnderlayColor ("Border Color", Vector) = (0,0,0,0.5)
		_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
		_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
		_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
		_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
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
			GpuProgramID 55352
			Program "vp" {
				SubProgram "d3d9 " {
					"vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _ClipRect;
					//   float4 _FaceColor;
					//   float _FaceDilate;
					//   float _GradientScale;
					//   float _MaskSoftnessX;
					//   float _MaskSoftnessY;
					//   float4 _OutlineColor;
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
					//   _WorldSpaceCameraPos      c14      1
					//   _ScreenParams             c15      1
					//   _FaceColor                c16      1
					//   _FaceDilate               c17      1
					//   _OutlineSoftness          c18      1
					//   _OutlineColor             c19      1
					//   _OutlineWidth             c20      1
					//   _WeightNormal             c21      1
					//   _WeightBold               c22      1
					//   _ScaleRatioA              c23      1
					//   _VertexOffsetX            c24      1
					//   _VertexOffsetY            c25      1
					//   _ClipRect                 c26      1
					//   _MaskSoftnessX            c27      1
					//   _MaskSoftnessY            c28      1
					//   _GradientScale            c29      1
					//   _ScaleX                   c30      1
					//   _ScaleY                   c31      1
					//   _PerspectiveFilter        c32      1
					//
					
					    vs_3_0
					    def c33, 0, 1.5, 1, 0.5
					    def c34, -2e+010, 2e+010, 2, 0.25
					    dcl_position v0
					    dcl_normal v1
					    dcl_color v2
					    dcl_texcoord v3
					    dcl_texcoord1 v4
					    dcl_position o0
					    dcl_color o1
					    dcl_color1 o2
					    dcl_texcoord o3
					    dcl_texcoord1 o4
					    dcl_texcoord2 o5
					    mov r0.zw, v0
					    add r0.x, c24.x, v0.x
					    add r0.y, c25.x, v0.y
					    dp4 r6.x, c0, r0
					    dp4 r6.y, c1, r0
					    dp4 r6.z, c2, r0
					    dp4 r1.x, c8, r0
					    dp4 r1.y, c9, r0
					    dp4 r1.z, c10, r0
					    dp4 r0.z, c3, r0
					    add r1.xyz, -r1, c14
					    nrm r2.xyz, r1
					    mul r1.xyz, c12, v1.y
					    mad r1.xyz, v1.x, c11, r1
					    mad r1.xyz, v1.z, c13, r1
					    nrm r3.xyz, r1
					    dp3 r0.w, r3, r2
					    mov r1.xy, c15
					    mul r1.zw, r1.xyxy, c4.xyxy
					    add r1.z, r1.w, r1.z
					    mul r1.z, r1_abs.z, c30.x
					    rcp r2.x, r1.z
					    mul r1.xy, r1, c5
					    add r1.x, r1.y, r1.x
					    mul r1.x, r1_abs.x, c31.x
					    rcp r2.y, r1.x
					    mul r1.xy, r0.z, r2
					    mul r1.xy, r1, r1
					    add r1.x, r1.y, r1.x
					    rsq r1.x, r1.x
					    mul r1.y, c29.x, v4_abs.y
					    mul r1.x, r1.x, r1.y
					    mov r1.z, c33.z
					    add r1.y, r1.z, -c32.x
					    mul r1.z, r1.x, c33.y
					    mul r1.y, r1.y, r1_abs.z
					    mad r1.w, r1.x, c33.y, -r1.y
					    mad r0.w, r0_abs.w, r1.w, r1.y
					    mad r0.w, r1.x, -c33.y, r0.w
					    abs r1.x, c7.w
					    sge r1.x, -r1.x, r1.x
					    mad r0.w, r1.x, r0.w, r1.z
					    mov r1.x, c23.x
					    mul r1.y, r1.x, c18.x
					    mad r1.y, r1.y, r0.w, c33.z
					    rcp r1.y, r1.y
					    mul r3.x, r0.w, r1.y
					    mul r0.w, r1.x, c20.x
					    mul r0.w, r0.w, c33.w
					    mul r1.y, r3.x, r0.w
					    add r1.y, r1.y, r1.y
					    min r1.y, r1.y, c33.z
					    rsq r1.y, r1.y
					    rcp r1.y, r1.y
					    mul r4.w, c19.w, v2.w
					    mul r4.xyz, r4.w, c19
					    mul r5, c16, v2
					    mul r5.xyz, r5.w, r5
					    add r4, r4, -r5
					    mad o2, r1.y, r4, r5
					    mov o1, r5
					    mov r4.xw, c34
					    max r5, r4.x, c26
					    min r5, r5, c34.y
					    add r1.yz, r0.xxyw, -r5.xxyw
					    mad r0.xy, r0, c34.z, -r5
					    add o5.xy, -r5.zwzw, r0
					    add r0.xy, -r5, r5.zwzw
					    rcp r2.z, r0.x
					    rcp r2.w, r0.y
					    mul o3.zw, r1.xyyz, r2
					    sge r0.x, c33.x, v4.y
					    mov r4.x, c21.x
					    add r0.y, -r4.x, c22.x
					    mad r0.x, r0.x, r0.y, c21.x
					    mul r0.y, r1.x, c17.x
					    mul r0.y, r0.y, c33.w
					    rcp r1.x, c29.x
					    mad r0.x, r0.x, r1.x, r0.y
					    add r0.x, -r0.x, c33.w
					    mad r3.w, r0.x, r3.x, -c33.w
					    mad o4.y, r0.w, -r3.x, r3.w
					    mad o4.z, r0.w, r3.x, r3.w
					    mov o4.xw, r3
					    mul r0.x, r4.w, c27.x
					    mul r0.y, r4.w, c28.x
					    mad r0.xy, r0.z, r2, r0
					    mov r6.w, r0.z
					    rcp r0.z, r0.x
					    rcp r0.w, r0.y
					    mul o5.zw, r0, c34.w
					    mov o3.xy, v3
					    mad o0.xy, r6.w, c255, r6
					    mov o0.zw, r6
					
					// approximately 98 instruction slots used"
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
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
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
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    u_xlat2 = in_COLOR0 * _FaceColor;
					    u_xlat2.xyz = u_xlat2.www * u_xlat2.xyz;
					    vs_COLOR0 = u_xlat2;
					    u_xlat3.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat3.xyz = u_xlat3.www * _OutlineColor.xyz;
					    u_xlat3 = (-u_xlat2) + u_xlat3;
					    u_xlat1.xyz = u_xlat0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat4.xyz = vec3(u_xlat10) * u_xlat4.xyz;
					    u_xlat10 = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat1.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat1.xy = vec2(_FaceDilate, _OutlineSoftness) * vec2(vec2(_ScaleRatioA, _ScaleRatioA));
					    u_xlat15 = u_xlat1.y * u_xlat10 + 1.0;
					    u_xlat4.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat4.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat3 + u_xlat2;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x / _GradientScale;
					    u_xlat0.x = u_xlat1.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + 0.5;
					    u_xlat4.w = u_xlat0.x * u_xlat4.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat4.x + u_xlat4.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat4.x + u_xlat4.w;
					    vs_TEXCOORD1.xw = u_xlat4.xw;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					"vs_4_0_level_9_1
					
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
						vec4 unused_0_0[3];
						vec4 _FaceColor;
						float _FaceDilate;
						float _OutlineSoftness;
						vec4 _OutlineColor;
						float _OutlineWidth;
						vec4 unused_0_6[15];
						float _WeightNormal;
						float _WeightBold;
						float _ScaleRatioA;
						float _VertexOffsetX;
						float _VertexOffsetY;
						vec4 unused_0_12[2];
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
					out vec4 vs_COLOR1;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
					    u_xlat1 = u_xlat0.yyyy * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    u_xlat2 = in_COLOR0 * _FaceColor;
					    u_xlat2.xyz = u_xlat2.www * u_xlat2.xyz;
					    vs_COLOR0 = u_xlat2;
					    u_xlat3.w = in_COLOR0.w * _OutlineColor.w;
					    u_xlat3.xyz = u_xlat3.www * _OutlineColor.xyz;
					    u_xlat3 = (-u_xlat2) + u_xlat3;
					    u_xlat1.xyz = u_xlat0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat4.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat4.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat4.xyz = vec3(u_xlat10) * u_xlat4.xyz;
					    u_xlat10 = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat1.xy = _ScreenParams.yy * glstate_matrix_projection[1].xy;
					    u_xlat1.xy = glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(_ScaleX, _ScaleY);
					    u_xlat1.xy = u_xlat1.ww / u_xlat1.xy;
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + u_xlat1.xy;
					    vs_TEXCOORD2.zw = vec2(0.25, 0.25) / u_xlat1.xy;
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat1.x = abs(in_TEXCOORD1.y) * _GradientScale;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * 1.5;
					    u_xlat6.x = (-_PerspectiveFilter) + 1.0;
					    u_xlat6.x = u_xlat6.x * abs(u_xlat1.x);
					    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat6.x);
					    u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat6.x;
					    u_xlatb15 = glstate_matrix_projection[3].w==0.0;
					    u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat1.x;
					    u_xlat1.xy = vec2(_FaceDilate, _OutlineSoftness) * vec2(vec2(_ScaleRatioA, _ScaleRatioA));
					    u_xlat15 = u_xlat1.y * u_xlat10 + 1.0;
					    u_xlat4.x = u_xlat10 / u_xlat15;
					    u_xlat10 = _OutlineWidth * _ScaleRatioA;
					    u_xlat10 = u_xlat10 * 0.5;
					    u_xlat15 = u_xlat4.x * u_xlat10;
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = sqrt(u_xlat15);
					    vs_COLOR1 = vec4(u_xlat15) * u_xlat3 + u_xlat2;
					    u_xlat2 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
					    u_xlat2 = min(u_xlat2, vec4(2e+10, 2e+10, 2e+10, 2e+10));
					    u_xlat6.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + (-u_xlat2.xy);
					    vs_TEXCOORD2.xy = (-u_xlat2.zw) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat2.zw;
					    vs_TEXCOORD0.zw = u_xlat6.xy / u_xlat0.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5 = (-_WeightNormal) + _WeightBold;
					    u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
					    u_xlat0.x = u_xlat0.x / _GradientScale;
					    u_xlat0.x = u_xlat1.x * 0.5 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + 0.5;
					    u_xlat4.w = u_xlat0.x * u_xlat4.x + -0.5;
					    vs_TEXCOORD1.y = (-u_xlat10) * u_xlat4.x + u_xlat4.w;
					    vs_TEXCOORD1.z = u_xlat10 * u_xlat4.x + u_xlat4.w;
					    vs_TEXCOORD1.xw = u_xlat4.xw;
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
					//   sampler2D _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _ClipRect    c0       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    dcl_color_pp v0
					    dcl_texcoord v1.xy
					    dcl_texcoord1_pp v2.xw
					    dcl_texcoord2 v3
					    dcl_2d s0
					    add r0.xy, -c0, c0.zwzw
					    add r0.xy, r0, -v3_abs
					    mul_sat_pp r0.xy, r0, v3.zwzw
					    mul_pp r0.x, r0.y, r0.x
					    texld r1, v1, s0
					    mad_sat_pp r0.y, r1.w, v2.x, -v2.w
					    mul_pp r1, r0.y, v0
					    mul_pp oC0, r0.x, r1
					
					// approximately 8 instruction slots used (1 texture, 7 arithmetic)"
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
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					"ps_4_0_level_9_1
					
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
						vec4 unused_0_0[26];
						vec4 _ClipRect;
						vec4 unused_0_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
					    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = u_xlat1.w * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat1 = vec4(u_xlat2) * vs_COLOR0;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
					    return;
					}"
				}
			}
		}
	}
	CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}