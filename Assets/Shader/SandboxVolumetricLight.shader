Shader "Sandbox/VolumetricLight" {
	Properties {
		[HideInInspector] _MainTex ("Texture", 2D) = "white" {}
		[HideInInspector] _ZTest ("ZTest", Float) = 0
		[HideInInspector] _LightColor ("_LightColor", Vector) = (1,1,1,1)
	}
	SubShader {
		LOD 100
		Tags { "RenderType" = "Opaque" }
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			Blend One One, One One
			ZClip Off
			ZWrite Off
			Cull Front
			GpuProgramID 55361
			Program "vp" {
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					float u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat11;
					bool u_xlatb11;
					float u_xlat12;
					bvec2 u_xlatb15;
					float u_xlat19;
					float u_xlat22;
					float u_xlat24;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat7.xyz = u_xlat7.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat8 = dot(_CameraForward.xyz, u_xlat7.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat8;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb15.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb15.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb15.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlat22 = u_xlat22 * _VolumetricLight.y;
					    u_xlat22 = u_xlat22 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat9.xyz = u_xlat1.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat24 = u_xlat22;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat11.xyz = u_xlat9.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat11.xyz, u_xlat11.xyz);
					        u_xlat12 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat12));
					        u_xlat24 = _VolumetricLight.y * u_xlat0.x + u_xlat24;
					        u_xlat12 = u_xlat2.x * u_xlat6.x;
					        u_xlat19 = u_xlat24 * -1.44269502;
					        u_xlat19 = exp2(u_xlat19);
					        u_xlat12 = u_xlat19 * u_xlat12;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat5);
					        u_xlat11.x = dot(u_xlat11.xyz, (-u_xlat7.xyz));
					        u_xlat11.x = (-_MieG.z) * u_xlat11.x + _MieG.y;
					        u_xlat11.x = log2(u_xlat11.x);
					        u_xlat11.x = u_xlat11.x * 1.5;
					        u_xlat11.x = exp2(u_xlat11.x);
					        u_xlat11.x = _MieG.x / u_xlat11.x;
					        u_xlat11.x = u_xlat11.x * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat12) * u_xlat11.xxx + u_xlat3.xyz;
					        u_xlat9.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat9.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					vec3 u_xlat13;
					bvec2 u_xlatb17;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13.x = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, u_xlat13.xx);
					        u_xlat13.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat13.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat13.xyz;
					        u_xlat13.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat13.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat13.xyz, -8.0);
					        u_xlat13.x = u_xlat6.x * u_xlat7.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13.x = u_xlat2.x * u_xlat13.x;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13.x = u_xlat21 * u_xlat13.x;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = u_xlat13.xxx * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					vec3 u_xlat13;
					bvec2 u_xlatb17;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13.x = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, u_xlat13.xx);
					        u_xlat13.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat13.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat13.xyz;
					        u_xlat13.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat13.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat13.xyz, -8.0);
					        u_xlat13.x = u_xlat6.x * u_xlat7.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13.x = u_xlat2.x * u_xlat13.x;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13.x = u_xlat21 * u_xlat13.x;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = u_xlat13.xxx * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					bvec2 u_xlatb17;
					float u_xlat21;
					float u_xlat25;
					float u_xlat27;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.xyz = u_xlat1.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat27 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat10.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat13));
					        u_xlat13 = sqrt(u_xlat5);
					        u_xlat13 = u_xlat13 * _LightPositionRange.w;
					        u_xlat13 = u_xlat13 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat12.xyz);
					        u_xlatb13 = u_xlat7.x<u_xlat13;
					        u_xlat13 = (u_xlatb13) ? _LightShadowData.x : 1.0;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat27 = _VolumetricLight.y * u_xlat0.x + u_xlat27;
					        u_xlat13 = u_xlat2.x * u_xlat13;
					        u_xlat21 = u_xlat27 * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13 = u_xlat21 * u_xlat13;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat13) * u_xlat12.xxx + u_xlat3.xyz;
					        u_xlat10.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat10.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					bvec2 u_xlatb17;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat13));
					        u_xlat13 = sqrt(u_xlat5);
					        u_xlat13 = u_xlat13 * _LightPositionRange.w;
					        u_xlat13 = u_xlat13 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat12.xyz);
					        u_xlatb13 = u_xlat7.x<u_xlat13;
					        u_xlat13 = (u_xlatb13) ? _LightShadowData.x : 1.0;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat13 = u_xlat13 * u_xlat6.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13 = u_xlat2.x * u_xlat13;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13 = u_xlat21 * u_xlat13;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = vec3(u_xlat13) * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					bvec2 u_xlatb17;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat13));
					        u_xlat13 = sqrt(u_xlat5);
					        u_xlat13 = u_xlat13 * _LightPositionRange.w;
					        u_xlat13 = u_xlat13 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat12.xyz);
					        u_xlatb13 = u_xlat7.x<u_xlat13;
					        u_xlat13 = (u_xlatb13) ? _LightShadowData.x : 1.0;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat13 = u_xlat13 * u_xlat6.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13 = u_xlat2.x * u_xlat13;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13 = u_xlat21 * u_xlat13;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = vec3(u_xlat13) * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat16.xyz = fract(u_xlat16.xyz);
					        u_xlat8 = texture(_NoiseTexture, u_xlat16.xyz);
					        u_xlat31 = u_xlat8.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat31 = u_xlat32 * u_xlat7.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					float u_xlat8;
					bvec2 u_xlatb15;
					float u_xlat16;
					float u_xlat22;
					int u_xlati23;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat7.xyz = u_xlat7.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat8 = dot(_CameraForward.xyz, u_xlat7.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat8;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb15.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb15.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb15.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlat22 = u_xlat22 * _VolumetricLight.y;
					    u_xlat22 = u_xlat22 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat16 = u_xlat22;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat25 = u_xlat24 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat25));
					        u_xlat25 = u_xlat4.y + _HeightFog.x;
					        u_xlat25 = (-u_xlat25) * _HeightFog.y;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat26 = u_xlat2.x * u_xlat25;
					        u_xlat16 = u_xlat2.y * u_xlat25 + u_xlat16;
					        u_xlat25 = u_xlat26 * u_xlat6.x;
					        u_xlat26 = u_xlat16 * -1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat24 = inversesqrt(u_xlat24);
					        u_xlat5.xyz = vec3(u_xlat24) * u_xlat5.xyz;
					        u_xlat24 = dot(u_xlat5.xyz, (-u_xlat7.xyz));
					        u_xlat24 = (-_MieG.z) * u_xlat24 + _MieG.y;
					        u_xlat24 = log2(u_xlat24);
					        u_xlat24 = u_xlat24 * 1.5;
					        u_xlat24 = exp2(u_xlat24);
					        u_xlat24 = _MieG.x / u_xlat24;
					        u_xlat24 = u_xlat24 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat25) * vec3(u_xlat24) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat14;
					bvec2 u_xlatb17;
					float u_xlat18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat14.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat14.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat14.xyz;
					        u_xlat14.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat14.xyz;
					        u_xlat14.xyz = u_xlat14.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat14.xyz, -8.0);
					        u_xlat28 = u_xlat6.x * u_xlat7.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat14;
					bvec2 u_xlatb17;
					float u_xlat18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat14.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat14.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat14.xyz;
					        u_xlat14.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat14.xyz;
					        u_xlat14.xyz = u_xlat14.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat14.xyz, -8.0);
					        u_xlat28 = u_xlat6.x * u_xlat7.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					bvec2 u_xlatb17;
					float u_xlat18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat28 = sqrt(u_xlat27);
					        u_xlat28 = u_xlat28 * _LightPositionRange.w;
					        u_xlat28 = u_xlat28 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat5.xyz);
					        u_xlatb28 = u_xlat7.x<u_xlat28;
					        u_xlat28 = (u_xlatb28) ? _LightShadowData.x : 1.0;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					bvec2 u_xlatb17;
					float u_xlat18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat28 = sqrt(u_xlat27);
					        u_xlat28 = u_xlat28 * _LightPositionRange.w;
					        u_xlat28 = u_xlat28 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat5.xyz);
					        u_xlatb28 = u_xlat7.x<u_xlat28;
					        u_xlat28 = (u_xlatb28) ? _LightShadowData.x : 1.0;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat28 = u_xlat28 * u_xlat6.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					bvec2 u_xlatb17;
					float u_xlat18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat28 = sqrt(u_xlat27);
					        u_xlat28 = u_xlat28 * _LightPositionRange.w;
					        u_xlat28 = u_xlat28 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat5.xyz);
					        u_xlatb28 = u_xlat7.x<u_xlat28;
					        u_xlat28 = (u_xlatb28) ? _LightShadowData.x : 1.0;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat28 = u_xlat28 * u_xlat6.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat16.xyz = fract(u_xlat16.xyz);
					        u_xlat8 = texture(_NoiseTexture, u_xlat16.xyz);
					        u_xlat31 = u_xlat8.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat4.y + _HeightFog.x;
					        u_xlat32 = (-u_xlat32) * _HeightFog.y;
					        u_xlat32 = u_xlat32 * 1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat31 = u_xlat32 * u_xlat7.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat4.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			Blend One One, One One
			ZClip Off
			ZWrite Off
			Cull Front
			GpuProgramID 79072
			Program "vp" {
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					float u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat11;
					bool u_xlatb11;
					bvec2 u_xlatb15;
					float u_xlat18;
					float u_xlat22;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat7.xyz = u_xlat7.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat8 = dot(_CameraForward.xyz, u_xlat7.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat8;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb15.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb15.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb15.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlat22 = u_xlat22 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat22 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat9.x = float(0.0);
					    u_xlat9.y = float(0.0);
					    u_xlat9.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat11.xyz = (-u_xlat3.xyz) + _LightPos.xyz;
					        u_xlat5.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat5.xyz = _MyLightMatrix0[0].xyw * u_xlat3.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = _MyLightMatrix0[2].xyw * u_xlat3.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat5.xy = u_xlat5.xy / u_xlat5.zz;
					        u_xlat6 = texture(_LightTexture0, u_xlat5.xy, -8.0);
					        u_xlatb5 = u_xlat5.z<0.0;
					        u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					        u_xlat5.x = u_xlat5.x * u_xlat6.w;
					        u_xlat11.x = dot(u_xlat11.xyz, u_xlat11.xyz);
					        u_xlat11.x = u_xlat11.x * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, u_xlat11.xx);
					        u_xlat11.x = u_xlat5.x * u_xlat6.x;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat11.x = u_xlat2.x * u_xlat11.x;
					        u_xlat18 = u_xlat3.w * -1.44269502;
					        u_xlat18 = exp2(u_xlat18);
					        u_xlat11.x = u_xlat18 * u_xlat11.x;
					        u_xlat5.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat18 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat18 = inversesqrt(u_xlat18);
					        u_xlat5.xyz = vec3(u_xlat18) * u_xlat5.xyz;
					        u_xlat18 = dot(u_xlat5.xyz, (-u_xlat7.xyz));
					        u_xlat18 = (-_MieG.z) * u_xlat18 + _MieG.y;
					        u_xlat18 = log2(u_xlat18);
					        u_xlat18 = u_xlat18 * 1.5;
					        u_xlat18 = exp2(u_xlat18);
					        u_xlat18 = _MieG.x / u_xlat18;
					        u_xlat18 = u_xlat18 * _MieG.w;
					        u_xlat9.xyz = u_xlat11.xxx * vec3(u_xlat18) + u_xlat9.xyz;
					        u_xlat3.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat9.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb17;
					float u_xlat18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat10 = u_xlat0.x * _VolumetricLight.x;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = (-u_xlat4.xyz) + _LightPos.xyz;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyw * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyw * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat6.xy = u_xlat6.xy / u_xlat6.zz;
					        u_xlat7 = texture(_LightTexture0, u_xlat6.xy, -8.0);
					        u_xlatb27 = u_xlat6.z<0.0;
					        u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					        u_xlat27 = u_xlat27 * u_xlat7.w;
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat28 * _LightPos.w;
					        u_xlat5 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat27 = u_xlat27 * u_xlat5.x;
					        u_xlat5 = u_xlat4.yyyy * _MyWorld2Shadow[1];
					        u_xlat5 = _MyWorld2Shadow[0] * u_xlat4.xxxx + u_xlat5;
					        u_xlat5 = _MyWorld2Shadow[2] * u_xlat4.zzzz + u_xlat5;
					        u_xlat5 = u_xlat5 + _MyWorld2Shadow[3];
					        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
					        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
					        u_xlat28 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x + _LightShadowData.x;
					        u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
					        u_xlat27 = u_xlat27 * u_xlat28;
					        u_xlat18 = _VolumetricLight.y * u_xlat0.x + u_xlat18;
					        u_xlat27 = u_xlat10 * u_xlat27;
					        u_xlat28 = u_xlat18 * -1.44269502;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat27 = u_xlat27 * u_xlat28;
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
					        u_xlat28 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat28 = (-_MieG.z) * u_xlat28 + _MieG.y;
					        u_xlat28 = log2(u_xlat28);
					        u_xlat28 = u_xlat28 * 1.5;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat28 = _MieG.x / u_xlat28;
					        u_xlat28 = u_xlat28 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat27) * vec3(u_xlat28) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb30 = u_xlat7.z<0.0;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 * u_xlat8.w;
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat31 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat30 = u_xlat30 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat31 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat30 = u_xlat30 * u_xlat32;
					        u_xlat31 = u_xlat29 * -1.44269502;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat30 = u_xlat30 * u_xlat31;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = inversesqrt(u_xlat31);
					        u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
					        u_xlat31 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat31 = (-_MieG.z) * u_xlat31 + _MieG.y;
					        u_xlat31 = log2(u_xlat31);
					        u_xlat31 = u_xlat31 * 1.5;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat31 = _MieG.x / u_xlat31;
					        u_xlat31 = u_xlat31 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat31) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec2 u_xlat11;
					bvec2 u_xlatb19;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat11.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb31 = u_xlat7.z<0.0;
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 * u_xlat8.w;
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = u_xlat32 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat32));
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat6 = u_xlat5.yyyy * _MyWorld2Shadow[1];
					        u_xlat6 = _MyWorld2Shadow[0] * u_xlat5.xxxx + u_xlat6;
					        u_xlat6 = _MyWorld2Shadow[2] * u_xlat5.zzzz + u_xlat6;
					        u_xlat6 = u_xlat6 + _MyWorld2Shadow[3];
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat6.www;
					        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
					        u_xlat32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat32 = u_xlat32 * u_xlat2.x + _LightShadowData.x;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat32 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat6.x = u_xlat11.x * u_xlat32;
					        u_xlat29 = u_xlat11.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = inversesqrt(u_xlat32);
					        u_xlat6.xyz = vec3(u_xlat32) * u_xlat6.xyz;
					        u_xlat32 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat32 = (-_MieG.z) * u_xlat32 + _MieG.y;
					        u_xlat32 = log2(u_xlat32);
					        u_xlat32 = u_xlat32 * 1.5;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat32 = _MieG.x / u_xlat32;
					        u_xlat32 = u_xlat32 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat32) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					bvec2 u_xlatb17;
					float u_xlat18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = (-u_xlat4.xyz) + _LightPos.xyz;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyw * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyw * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat6.xy = u_xlat6.xy / u_xlat6.zz;
					        u_xlat7 = texture(_LightTexture0, u_xlat6.xy, -8.0);
					        u_xlatb27 = u_xlat6.z<0.0;
					        u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					        u_xlat27 = u_xlat27 * u_xlat7.w;
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat28 * _LightPos.w;
					        u_xlat5 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat27 = u_xlat27 * u_xlat5.x;
					        u_xlat28 = u_xlat4.y + _HeightFog.x;
					        u_xlat28 = (-u_xlat28) * _HeightFog.y;
					        u_xlat28 = u_xlat28 * 1.44269502;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat5.x = u_xlat2.x * u_xlat28;
					        u_xlat18 = u_xlat2.y * u_xlat28 + u_xlat18;
					        u_xlat27 = u_xlat27 * u_xlat5.x;
					        u_xlat28 = u_xlat18 * -1.44269502;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat27 = u_xlat27 * u_xlat28;
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
					        u_xlat28 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat28 = (-_MieG.z) * u_xlat28 + _MieG.y;
					        u_xlat28 = log2(u_xlat28);
					        u_xlat28 = u_xlat28 * 1.5;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat28 = _MieG.x / u_xlat28;
					        u_xlat28 = u_xlat28 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat27) * vec3(u_xlat28) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec2 u_xlat10;
					float u_xlat13;
					bvec2 u_xlatb17;
					float u_xlat25;
					float u_xlat26;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat10.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat26 = u_xlat25;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = (-u_xlat4.xyz) + _LightPos.xyz;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyw * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyw * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat6.xy = u_xlat6.xy / u_xlat6.zz;
					        u_xlat7 = texture(_LightTexture0, u_xlat6.xy, -8.0);
					        u_xlatb28 = u_xlat6.z<0.0;
					        u_xlat28 = u_xlatb28 ? 1.0 : float(0.0);
					        u_xlat28 = u_xlat28 * u_xlat7.w;
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.x = u_xlat5.x * _LightPos.w;
					        u_xlat5 = texture(_LightTextureB0, u_xlat5.xx);
					        u_xlat28 = u_xlat28 * u_xlat5.x;
					        u_xlat5 = u_xlat4.yyyy * _MyWorld2Shadow[1];
					        u_xlat5 = _MyWorld2Shadow[0] * u_xlat4.xxxx + u_xlat5;
					        u_xlat5 = _MyWorld2Shadow[2] * u_xlat4.zzzz + u_xlat5;
					        u_xlat5 = u_xlat5 + _MyWorld2Shadow[3];
					        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
					        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
					        u_xlat5.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat5.x = u_xlat5.x * u_xlat2.x + _LightShadowData.x;
					        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					        u_xlat28 = u_xlat28 * u_xlat5.x;
					        u_xlat5.x = u_xlat4.y + _HeightFog.x;
					        u_xlat5.x = (-u_xlat5.x) * _HeightFog.y;
					        u_xlat5.x = u_xlat5.x * 1.44269502;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat13 = u_xlat10.x * u_xlat5.x;
					        u_xlat26 = u_xlat10.y * u_xlat5.x + u_xlat26;
					        u_xlat28 = u_xlat28 * u_xlat13;
					        u_xlat5.x = u_xlat26 * -1.44269502;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat28 = u_xlat28 * u_xlat5.x;
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = inversesqrt(u_xlat29);
					        u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
					        u_xlat5.x = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat5.x = (-_MieG.z) * u_xlat5.x + _MieG.y;
					        u_xlat5.x = log2(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 1.5;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat5.x = _MieG.x / u_xlat5.x;
					        u_xlat5.x = u_xlat5.x * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat5.xxx + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					bvec2 u_xlatb19;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb30 = u_xlat7.z<0.0;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 * u_xlat8.w;
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat31 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat30 = u_xlat30 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat31 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat5.y + _HeightFog.x;
					        u_xlat32 = (-u_xlat32) * _HeightFog.y;
					        u_xlat32 = u_xlat32 * 1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat30 = u_xlat30 * u_xlat32;
					        u_xlat31 = u_xlat29 * -1.44269502;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat30 = u_xlat30 * u_xlat31;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = inversesqrt(u_xlat31);
					        u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
					        u_xlat31 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat31 = (-_MieG.z) * u_xlat31 + _MieG.y;
					        u_xlat31 = log2(u_xlat31);
					        u_xlat31 = u_xlat31 * 1.5;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat31 = _MieG.x / u_xlat31;
					        u_xlat31 = u_xlat31 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat31) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec2 u_xlat11;
					bvec2 u_xlatb19;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat11.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb31 = u_xlat7.z<0.0;
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 * u_xlat8.w;
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = u_xlat32 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat32));
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat6 = u_xlat5.yyyy * _MyWorld2Shadow[1];
					        u_xlat6 = _MyWorld2Shadow[0] * u_xlat5.xxxx + u_xlat6;
					        u_xlat6 = _MyWorld2Shadow[2] * u_xlat5.zzzz + u_xlat6;
					        u_xlat6 = u_xlat6 + _MyWorld2Shadow[3];
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat6.www;
					        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
					        u_xlat32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat32 = u_xlat32 * u_xlat2.x + _LightShadowData.x;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat32 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat6.x = u_xlat5.y + _HeightFog.x;
					        u_xlat6.x = (-u_xlat6.x) * _HeightFog.y;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat32 = u_xlat32 * u_xlat6.x;
					        u_xlat6.x = u_xlat11.x * u_xlat32;
					        u_xlat29 = u_xlat11.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = inversesqrt(u_xlat32);
					        u_xlat6.xyz = vec3(u_xlat32) * u_xlat6.xyz;
					        u_xlat32 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat32 = (-_MieG.z) * u_xlat32 + _MieG.y;
					        u_xlat32 = log2(u_xlat32);
					        u_xlat32 = u_xlat32 * 1.5;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat32 = _MieG.x / u_xlat32;
					        u_xlat32 = u_xlat32 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat32) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			Blend One One, One One
			ZClip Off
			ZWrite Off
			GpuProgramID 134564
			Program "vp" {
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[15];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					float u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat11;
					bool u_xlatb11;
					float u_xlat12;
					float u_xlat15;
					bvec2 u_xlatb16;
					float u_xlat19;
					float u_xlat22;
					float u_xlat24;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat7.xyz = u_xlat7.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat7.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat22 * u_xlat22 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8 = (-u_xlat1.x) + (-u_xlat22);
					    u_xlat1.x = u_xlat1.x + (-u_xlat22);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat15 = dot(_CameraForward.xyz, u_xlat7.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat15;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat7.xyz * vec3(u_xlat8) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb16.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb16.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb16.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat8 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat8;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlat22 = u_xlat22 * _VolumetricLight.y;
					    u_xlat22 = u_xlat22 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat9.xyz = u_xlat1.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat24 = u_xlat22;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat11.xyz = u_xlat9.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat11.xyz, u_xlat11.xyz);
					        u_xlat12 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat12));
					        u_xlat24 = _VolumetricLight.y * u_xlat0.x + u_xlat24;
					        u_xlat12 = u_xlat2.x * u_xlat6.x;
					        u_xlat19 = u_xlat24 * -1.44269502;
					        u_xlat19 = exp2(u_xlat19);
					        u_xlat12 = u_xlat19 * u_xlat12;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat5);
					        u_xlat11.x = dot(u_xlat11.xyz, (-u_xlat7.xyz));
					        u_xlat11.x = (-_MieG.z) * u_xlat11.x + _MieG.y;
					        u_xlat11.x = log2(u_xlat11.x);
					        u_xlat11.x = u_xlat11.x * 1.5;
					        u_xlat11.x = exp2(u_xlat11.x);
					        u_xlat11.x = _MieG.x / u_xlat11.x;
					        u_xlat11.x = u_xlat11.x * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat12) * u_xlat11.xxx + u_xlat3.xyz;
					        u_xlat9.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat9.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					vec3 u_xlat13;
					float u_xlat17;
					bvec2 u_xlatb18;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13.x = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, u_xlat13.xx);
					        u_xlat13.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat13.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat13.xyz;
					        u_xlat13.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat13.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat13.xyz, -8.0);
					        u_xlat13.x = u_xlat6.x * u_xlat7.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13.x = u_xlat2.x * u_xlat13.x;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13.x = u_xlat21 * u_xlat13.x;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = u_xlat13.xxx * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					vec3 u_xlat13;
					float u_xlat17;
					bvec2 u_xlatb18;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13.x = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, u_xlat13.xx);
					        u_xlat13.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat13.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat13.xyz;
					        u_xlat13.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat13.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat13.xyz, -8.0);
					        u_xlat13.x = u_xlat6.x * u_xlat7.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13.x = u_xlat2.x * u_xlat13.x;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13.x = u_xlat21 * u_xlat13.x;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = u_xlat13.xxx * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat16.xyz = fract(u_xlat16.xyz);
					        u_xlat8 = texture(_NoiseTexture, u_xlat16.xyz);
					        u_xlat31 = u_xlat8.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat31 = u_xlat32 * u_xlat7.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat17;
					bvec2 u_xlatb18;
					float u_xlat21;
					float u_xlat25;
					float u_xlat27;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.xyz = u_xlat1.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat27 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat10.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat13));
					        u_xlat13 = sqrt(u_xlat5);
					        u_xlat13 = u_xlat13 * _LightPositionRange.w;
					        u_xlat13 = u_xlat13 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat12.xyz);
					        u_xlatb13 = u_xlat7.x<u_xlat13;
					        u_xlat13 = (u_xlatb13) ? _LightShadowData.x : 1.0;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat27 = _VolumetricLight.y * u_xlat0.x + u_xlat27;
					        u_xlat13 = u_xlat2.x * u_xlat13;
					        u_xlat21 = u_xlat27 * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13 = u_xlat21 * u_xlat13;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat13) * u_xlat12.xxx + u_xlat3.xyz;
					        u_xlat10.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat10.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat17;
					bvec2 u_xlatb18;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat13));
					        u_xlat13 = sqrt(u_xlat5);
					        u_xlat13 = u_xlat13 * _LightPositionRange.w;
					        u_xlat13 = u_xlat13 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat12.xyz);
					        u_xlatb13 = u_xlat7.x<u_xlat13;
					        u_xlat13 = (u_xlatb13) ? _LightShadowData.x : 1.0;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat13 = u_xlat13 * u_xlat6.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13 = u_xlat2.x * u_xlat13;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13 = u_xlat21 * u_xlat13;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = vec3(u_xlat13) * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					int u_xlati4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat17;
					bvec2 u_xlatb18;
					float u_xlat21;
					float u_xlat25;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat25 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat10.x = float(0.0);
					    u_xlat10.y = float(0.0);
					    u_xlat10.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat12.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat5 = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat13 = u_xlat5 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat13));
					        u_xlat13 = sqrt(u_xlat5);
					        u_xlat13 = u_xlat13 * _LightPositionRange.w;
					        u_xlat13 = u_xlat13 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat12.xyz);
					        u_xlatb13 = u_xlat7.x<u_xlat13;
					        u_xlat13 = (u_xlatb13) ? _LightShadowData.x : 1.0;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat3.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat3.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat13 = u_xlat13 * u_xlat6.w;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat13 = u_xlat2.x * u_xlat13;
					        u_xlat21 = u_xlat3.w * -1.44269502;
					        u_xlat21 = exp2(u_xlat21);
					        u_xlat13 = u_xlat21 * u_xlat13;
					        u_xlat5 = inversesqrt(u_xlat5);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat5);
					        u_xlat12.x = dot(u_xlat12.xyz, (-u_xlat8.xyz));
					        u_xlat12.x = (-_MieG.z) * u_xlat12.x + _MieG.y;
					        u_xlat12.x = log2(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 1.5;
					        u_xlat12.x = exp2(u_xlat12.x);
					        u_xlat12.x = _MieG.x / u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * _MieG.w;
					        u_xlat10.xyz = vec3(u_xlat13) * u_xlat12.xxx + u_xlat10.xyz;
					        u_xlat3.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					float u_xlat8;
					float u_xlat15;
					float u_xlat16;
					bvec2 u_xlatb16;
					float u_xlat22;
					int u_xlati23;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat7.xyz = u_xlat7.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat7.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat22 * u_xlat22 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8 = (-u_xlat1.x) + (-u_xlat22);
					    u_xlat1.x = u_xlat1.x + (-u_xlat22);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat15 = dot(_CameraForward.xyz, u_xlat7.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat15;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat7.xyz * vec3(u_xlat8) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb16.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb16.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb16.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat8 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat8;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlat22 = u_xlat22 * _VolumetricLight.y;
					    u_xlat22 = u_xlat22 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat16 = u_xlat22;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat25 = u_xlat24 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat25));
					        u_xlat25 = u_xlat4.y + _HeightFog.x;
					        u_xlat25 = (-u_xlat25) * _HeightFog.y;
					        u_xlat25 = u_xlat25 * 1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat26 = u_xlat2.x * u_xlat25;
					        u_xlat16 = u_xlat2.y * u_xlat25 + u_xlat16;
					        u_xlat25 = u_xlat26 * u_xlat6.x;
					        u_xlat26 = u_xlat16 * -1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat24 = inversesqrt(u_xlat24);
					        u_xlat5.xyz = vec3(u_xlat24) * u_xlat5.xyz;
					        u_xlat24 = dot(u_xlat5.xyz, (-u_xlat7.xyz));
					        u_xlat24 = (-_MieG.z) * u_xlat24 + _MieG.y;
					        u_xlat24 = log2(u_xlat24);
					        u_xlat24 = u_xlat24 * 1.5;
					        u_xlat24 = exp2(u_xlat24);
					        u_xlat24 = _MieG.x / u_xlat24;
					        u_xlat24 = u_xlat24 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat25) * vec3(u_xlat24) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat14;
					float u_xlat17;
					float u_xlat18;
					bvec2 u_xlatb18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat14.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat14.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat14.xyz;
					        u_xlat14.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat14.xyz;
					        u_xlat14.xyz = u_xlat14.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat14.xyz, -8.0);
					        u_xlat28 = u_xlat6.x * u_xlat7.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					vec3 u_xlat14;
					float u_xlat17;
					float u_xlat18;
					bvec2 u_xlatb18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat14.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat14.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat14.xyz;
					        u_xlat14.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat14.xyz;
					        u_xlat14.xyz = u_xlat14.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat14.xyz, -8.0);
					        u_xlat28 = u_xlat6.x * u_xlat7.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat16.xyz = fract(u_xlat16.xyz);
					        u_xlat8 = texture(_NoiseTexture, u_xlat16.xyz);
					        u_xlat31 = u_xlat8.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat4.y + _HeightFog.x;
					        u_xlat32 = (-u_xlat32) * _HeightFog.y;
					        u_xlat32 = u_xlat32 * 1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat31 = u_xlat32 * u_xlat7.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec3 u_xlat16;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat16.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat16.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat16.xyz;
					        u_xlat16.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat16.xyz;
					        u_xlat16.xyz = u_xlat16.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat8 = texture(_LightTexture0, u_xlat16.xyz, -8.0);
					        u_xlat31 = u_xlat7.x * u_xlat8.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					float u_xlat17;
					float u_xlat18;
					bvec2 u_xlatb18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat28 = sqrt(u_xlat27);
					        u_xlat28 = u_xlat28 * _LightPositionRange.w;
					        u_xlat28 = u_xlat28 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat5.xyz);
					        u_xlatb28 = u_xlat7.x<u_xlat28;
					        u_xlat28 = (u_xlatb28) ? _LightShadowData.x : 1.0;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					float u_xlat17;
					float u_xlat18;
					bvec2 u_xlatb18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat28 = sqrt(u_xlat27);
					        u_xlat28 = u_xlat28 * _LightPositionRange.w;
					        u_xlat28 = u_xlat28 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat5.xyz);
					        u_xlatb28 = u_xlat7.x<u_xlat28;
					        u_xlat28 = (u_xlatb28) ? _LightShadowData.x : 1.0;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat28 = u_xlat28 * u_xlat6.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					float u_xlat17;
					float u_xlat18;
					bvec2 u_xlatb18;
					float u_xlat25;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat8.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat25 * u_xlat25 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9 = (-u_xlat1.x) + (-u_xlat25);
					    u_xlat1.x = u_xlat1.x + (-u_xlat25);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat17 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat17;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat8.xyz * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb18.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb18.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb18.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat9 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat27 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat28 = sqrt(u_xlat27);
					        u_xlat28 = u_xlat28 * _LightPositionRange.w;
					        u_xlat28 = u_xlat28 * 0.970000029;
					        u_xlat7 = texture(_ShadowMapTexture, u_xlat5.xyz);
					        u_xlatb28 = u_xlat7.x<u_xlat28;
					        u_xlat28 = (u_xlatb28) ? _LightShadowData.x : 1.0;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyz * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyz * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat6 = texture(_LightTexture0, u_xlat6.xyz, -8.0);
					        u_xlat28 = u_xlat28 * u_xlat6.w;
					        u_xlat29 = u_xlat4.y + _HeightFog.x;
					        u_xlat29 = (-u_xlat29) * _HeightFog.y;
					        u_xlat29 = u_xlat29 * 1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat6.x = u_xlat2.x * u_xlat29;
					        u_xlat18 = u_xlat2.y * u_xlat29 + u_xlat18;
					        u_xlat28 = u_xlat28 * u_xlat6.x;
					        u_xlat29 = u_xlat18 * -1.44269502;
					        u_xlat29 = exp2(u_xlat29);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat27 = inversesqrt(u_xlat27);
					        u_xlat5.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					        u_xlat27 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat27 = (-_MieG.z) * u_xlat27 + _MieG.y;
					        u_xlat27 = log2(u_xlat27);
					        u_xlat27 = u_xlat27 * 1.5;
					        u_xlat27 = exp2(u_xlat27);
					        u_xlat27 = _MieG.x / u_xlat27;
					        u_xlat27 = u_xlat27 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * vec3(u_xlat27) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[21];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat4.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat5.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat5.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "POINT_COOKIE" "SHADOWS_CUBE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _ShadowMapTexture;
					uniform  samplerCube _LightTexture0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					float u_xlat19;
					bvec2 u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					float u_xlat33;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat1.xyz = (-_LightPos.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat9.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-_VolumetricLight.z) * _VolumetricLight.z + u_xlat1.x;
					    u_xlat1.x = u_xlat28 * u_xlat28 + (-u_xlat1.x);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = (-u_xlat1.x) + (-u_xlat28);
					    u_xlat1.x = u_xlat1.x + (-u_xlat28);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat19 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat19;
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xzw = u_xlat9.xyz * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = (-u_xlat10) + u_xlat0.x;
					    u_xlat2.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.125, 0.125);
					    u_xlatb20.xy = greaterThanEqual(u_xlat2.xyxy, (-u_xlat2.xyxy)).xy;
					    u_xlat2.xy = fract(abs(u_xlat2.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat2;
					        hlslcc_movcTemp.x = (u_xlatb20.x) ? u_xlat2.x : (-u_xlat2.x);
					        hlslcc_movcTemp.y = (u_xlatb20.y) ? u_xlat2.y : (-u_xlat2.y);
					        u_xlat2 = hlslcc_movcTemp;
					    }
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat2.xy);
					    u_xlat10 = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat10;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * u_xlat2.www + u_xlat1.xzw;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat30 * _LightPos.w;
					        u_xlat7 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat31 = sqrt(u_xlat30);
					        u_xlat31 = u_xlat31 * _LightPositionRange.w;
					        u_xlat31 = u_xlat31 * 0.970000029;
					        u_xlat8 = texture(_ShadowMapTexture, u_xlat6.xyz);
					        u_xlatb31 = u_xlat8.x<u_xlat31;
					        u_xlat31 = (u_xlatb31) ? _LightShadowData.x : 1.0;
					        u_xlat31 = u_xlat31 * u_xlat7.x;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyz;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyz * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyz * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyz;
					        u_xlat7 = texture(_LightTexture0, u_xlat7.xyz, -8.0);
					        u_xlat31 = u_xlat31 * u_xlat7.w;
					        u_xlat7.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat7.xyz = fract(u_xlat7.xyz);
					        u_xlat7 = texture(_NoiseTexture, u_xlat7.xyz);
					        u_xlat32 = u_xlat7.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat33 = u_xlat5.y + _HeightFog.x;
					        u_xlat33 = (-u_xlat33) * _HeightFog.y;
					        u_xlat33 = u_xlat33 * 1.44269502;
					        u_xlat33 = exp2(u_xlat33);
					        u_xlat32 = u_xlat32 * u_xlat33;
					        u_xlat33 = u_xlat3.x * u_xlat32;
					        u_xlat29 = u_xlat3.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat33;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat30 = inversesqrt(u_xlat30);
					        u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					        u_xlat30 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat30 = (-_MieG.z) * u_xlat30 + _MieG.y;
					        u_xlat30 = log2(u_xlat30);
					        u_xlat30 = u_xlat30 * 1.5;
					        u_xlat30 = exp2(u_xlat30);
					        u_xlat30 = _MieG.x / u_xlat30;
					        u_xlat30 = u_xlat30 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat30) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			Blend One One, One One
			ZClip Off
			ZWrite Off
			GpuProgramID 232084
			Program "vp" {
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[15];
						mat4x4 _WorldViewProj;
						vec4 unused_0_2[18];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * _WorldViewProj[1];
					    u_xlat0 = _WorldViewProj[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = _WorldViewProj[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = _WorldViewProj[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec4 u_xlat3;
					bvec2 u_xlatb3;
					int u_xlati4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					int u_xlati8;
					vec3 u_xlat9;
					vec3 u_xlat11;
					bool u_xlatb11;
					float u_xlat15;
					bvec2 u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					int u_xlati17;
					float u_xlat18;
					float u_xlat22;
					float u_xlat23;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat7.xyz = u_xlat7.xyz / u_xlat1.xxx;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat7.xyz);
					    u_xlat9.x = dot(_ConeAxis.xyz, u_xlat8.xyz);
					    u_xlat9.x = u_xlat9.x + _PlaneD;
					    u_xlat9.x = (-u_xlat9.x) / u_xlat2.x;
					    u_xlatb16 = u_xlat9.x<0.0;
					    u_xlat9.x = (u_xlatb16) ? 100000.0 : u_xlat9.x;
					    u_xlat8.xyz = u_xlat8.xyz + (-_ConeApex.xyz);
					    u_xlat16 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat23 = dot(u_xlat8.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat8.xyz, u_xlat7.xyz);
					    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat15 = _CosAngle * _CosAngle;
					    u_xlat22 = u_xlat15 * u_xlat16;
					    u_xlat22 = u_xlat2.x * u_xlat2.x + (-u_xlat22);
					    u_xlat16 = u_xlat15 * u_xlat3.x;
					    u_xlat16 = u_xlat23 * u_xlat2.x + (-u_xlat16);
					    u_xlat16 = u_xlat16 + u_xlat16;
					    u_xlat8.x = u_xlat15 * u_xlat8.x;
					    u_xlat8.x = u_xlat23 * u_xlat23 + (-u_xlat8.x);
					    u_xlat8.x = u_xlat22 * u_xlat8.x;
					    u_xlat8.x = u_xlat8.x * 4.0;
					    u_xlat8.x = u_xlat16 * u_xlat16 + (-u_xlat8.x);
					    u_xlatb15.x = 0.0<u_xlat8.x;
					    u_xlat3.y = sqrt(u_xlat8.x);
					    u_xlati8 = int((0.0<u_xlat22) ? 0xFFFFFFFFu : uint(0));
					    u_xlati17 = int((u_xlat22<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati8 = (-u_xlati8) + u_xlati17;
					    u_xlat8.x = float(u_xlati8);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat8.xx * u_xlat3.xy + (-vec2(u_xlat16));
					    u_xlat8.x = u_xlat22 + u_xlat22;
					    u_xlat8.xz = u_xlat3.xy / u_xlat8.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat8.xz + vec2(u_xlat23);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat8.xz = u_xlat8.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat8.xy = (u_xlatb15.x) ? u_xlat8.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat22 = dot(_CameraForward.xyz, u_xlat7.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat22;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat8.y, u_xlat8.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat9.x);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb15.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb15.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb15.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlat22 = u_xlat22 * _VolumetricLight.y;
					    u_xlat1.w = u_xlat22 * 0.5;
					    u_xlat2.x = u_xlat0.x * _VolumetricLight.x;
					    u_xlat9.x = float(0.0);
					    u_xlat9.y = float(0.0);
					    u_xlat9.z = float(0.0);
					    u_xlat3 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat11.xyz = (-u_xlat3.xyz) + _LightPos.xyz;
					        u_xlat5.xyz = u_xlat3.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat5.xyz = _MyLightMatrix0[0].xyw * u_xlat3.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = _MyLightMatrix0[2].xyw * u_xlat3.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat5.xy = u_xlat5.xy / u_xlat5.zz;
					        u_xlat6 = texture(_LightTexture0, u_xlat5.xy, -8.0);
					        u_xlatb5 = u_xlat5.z<0.0;
					        u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					        u_xlat5.x = u_xlat5.x * u_xlat6.w;
					        u_xlat11.x = dot(u_xlat11.xyz, u_xlat11.xyz);
					        u_xlat11.x = u_xlat11.x * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, u_xlat11.xx);
					        u_xlat11.x = u_xlat5.x * u_xlat6.x;
					        u_xlat3.w = _VolumetricLight.y * u_xlat0.x + u_xlat3.w;
					        u_xlat11.x = u_xlat2.x * u_xlat11.x;
					        u_xlat18 = u_xlat3.w * -1.44269502;
					        u_xlat18 = exp2(u_xlat18);
					        u_xlat11.x = u_xlat18 * u_xlat11.x;
					        u_xlat5.xyz = u_xlat3.xyz + (-_LightPos.xyz);
					        u_xlat18 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat18 = inversesqrt(u_xlat18);
					        u_xlat5.xyz = vec3(u_xlat18) * u_xlat5.xyz;
					        u_xlat18 = dot(u_xlat5.xyz, (-u_xlat7.xyz));
					        u_xlat18 = (-_MieG.z) * u_xlat18 + _MieG.y;
					        u_xlat18 = log2(u_xlat18);
					        u_xlat18 = u_xlat18 * 1.5;
					        u_xlat18 = exp2(u_xlat18);
					        u_xlat18 = _MieG.x / u_xlat18;
					        u_xlat18 = u_xlat18 * _MieG.w;
					        u_xlat9.xyz = u_xlat11.xxx * vec3(u_xlat18) + u_xlat9.xyz;
					        u_xlat3.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    }
					    u_xlat0.xyz = u_xlat9.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec2 u_xlat3;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					int u_xlati10;
					float u_xlat11;
					float u_xlat19;
					bvec2 u_xlatb19;
					float u_xlat20;
					bool u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat10.xyz = u_xlat9.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat9.xyz);
					    u_xlat11 = dot(_ConeAxis.xyz, u_xlat10.xyz);
					    u_xlat11 = u_xlat11 + _PlaneD;
					    u_xlat11 = (-u_xlat11) / u_xlat2.x;
					    u_xlatb20 = u_xlat11<0.0;
					    u_xlat11 = (u_xlatb20) ? 100000.0 : u_xlat11;
					    u_xlat10.xyz = u_xlat10.xyz + (-_ConeApex.xyz);
					    u_xlat20 = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat29 = dot(u_xlat10.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat10.xyz, u_xlat9.xyz);
					    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat19 = _CosAngle * _CosAngle;
					    u_xlat28 = u_xlat19 * u_xlat20;
					    u_xlat28 = u_xlat2.x * u_xlat2.x + (-u_xlat28);
					    u_xlat20 = u_xlat19 * u_xlat3.x;
					    u_xlat20 = u_xlat29 * u_xlat2.x + (-u_xlat20);
					    u_xlat20 = u_xlat20 + u_xlat20;
					    u_xlat10.x = u_xlat19 * u_xlat10.x;
					    u_xlat10.x = u_xlat29 * u_xlat29 + (-u_xlat10.x);
					    u_xlat10.x = u_xlat28 * u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * 4.0;
					    u_xlat10.x = u_xlat20 * u_xlat20 + (-u_xlat10.x);
					    u_xlatb19.x = 0.0<u_xlat10.x;
					    u_xlat3.y = sqrt(u_xlat10.x);
					    u_xlati10 = int((0.0<u_xlat28) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = int((u_xlat28<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati10 = (-u_xlati10) + u_xlati21;
					    u_xlat10.x = float(u_xlati10);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat10.xx * u_xlat3.xy + (-vec2(u_xlat20));
					    u_xlat10.x = u_xlat28 + u_xlat28;
					    u_xlat10.xz = u_xlat3.xy / u_xlat10.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat10.xz + vec2(u_xlat29);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat10.xz = u_xlat10.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat10.xy = (u_xlatb19.x) ? u_xlat10.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat28 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat28;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat10.y, u_xlat10.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat11);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb30 = u_xlat7.z<0.0;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 * u_xlat8.w;
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat31 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat30 = u_xlat30 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat31 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat30 = u_xlat30 * u_xlat32;
					        u_xlat31 = u_xlat29 * -1.44269502;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat30 = u_xlat30 * u_xlat31;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = inversesqrt(u_xlat31);
					        u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
					        u_xlat31 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat31 = (-_MieG.z) * u_xlat31 + _MieG.y;
					        u_xlat31 = log2(u_xlat31);
					        u_xlat31 = u_xlat31 * 1.5;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat31 = _MieG.x / u_xlat31;
					        u_xlat31 = u_xlat31 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat31) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[3];
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					int u_xlati9;
					float u_xlat10;
					float u_xlat17;
					bvec2 u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					int u_xlati19;
					float u_xlat25;
					float u_xlat26;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat8.xyz);
					    u_xlat10 = dot(_ConeAxis.xyz, u_xlat9.xyz);
					    u_xlat10 = u_xlat10 + _PlaneD;
					    u_xlat10 = (-u_xlat10) / u_xlat2.x;
					    u_xlatb18 = u_xlat10<0.0;
					    u_xlat10 = (u_xlatb18) ? 100000.0 : u_xlat10;
					    u_xlat9.xyz = u_xlat9.xyz + (-_ConeApex.xyz);
					    u_xlat18 = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat26 = dot(u_xlat9.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat9.xyz, u_xlat8.xyz);
					    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat17 = _CosAngle * _CosAngle;
					    u_xlat25 = u_xlat17 * u_xlat18;
					    u_xlat25 = u_xlat2.x * u_xlat2.x + (-u_xlat25);
					    u_xlat18 = u_xlat17 * u_xlat3.x;
					    u_xlat18 = u_xlat26 * u_xlat2.x + (-u_xlat18);
					    u_xlat18 = u_xlat18 + u_xlat18;
					    u_xlat9.x = u_xlat17 * u_xlat9.x;
					    u_xlat9.x = u_xlat26 * u_xlat26 + (-u_xlat9.x);
					    u_xlat9.x = u_xlat25 * u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 4.0;
					    u_xlat9.x = u_xlat18 * u_xlat18 + (-u_xlat9.x);
					    u_xlatb17.x = 0.0<u_xlat9.x;
					    u_xlat3.y = sqrt(u_xlat9.x);
					    u_xlati9 = int((0.0<u_xlat25) ? 0xFFFFFFFFu : uint(0));
					    u_xlati19 = int((u_xlat25<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati9 = (-u_xlati9) + u_xlati19;
					    u_xlat9.x = float(u_xlati9);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat9.xx * u_xlat3.xy + (-vec2(u_xlat18));
					    u_xlat9.x = u_xlat25 + u_xlat25;
					    u_xlat9.xz = u_xlat3.xy / u_xlat9.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat9.xz + vec2(u_xlat26);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat9.xz = u_xlat9.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat9.xy = (u_xlatb17.x) ? u_xlat9.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat25 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat25;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat9.y, u_xlat9.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat10);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat10 = u_xlat0.x * _VolumetricLight.x;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = (-u_xlat4.xyz) + _LightPos.xyz;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyw * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyw * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat6.xy = u_xlat6.xy / u_xlat6.zz;
					        u_xlat7 = texture(_LightTexture0, u_xlat6.xy, -8.0);
					        u_xlatb27 = u_xlat6.z<0.0;
					        u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					        u_xlat27 = u_xlat27 * u_xlat7.w;
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat28 * _LightPos.w;
					        u_xlat5 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat27 = u_xlat27 * u_xlat5.x;
					        u_xlat5 = u_xlat4.yyyy * _MyWorld2Shadow[1];
					        u_xlat5 = _MyWorld2Shadow[0] * u_xlat4.xxxx + u_xlat5;
					        u_xlat5 = _MyWorld2Shadow[2] * u_xlat4.zzzz + u_xlat5;
					        u_xlat5 = u_xlat5 + _MyWorld2Shadow[3];
					        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
					        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
					        u_xlat28 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x + _LightShadowData.x;
					        u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
					        u_xlat27 = u_xlat27 * u_xlat28;
					        u_xlat18 = _VolumetricLight.y * u_xlat0.x + u_xlat18;
					        u_xlat27 = u_xlat10 * u_xlat27;
					        u_xlat28 = u_xlat18 * -1.44269502;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat27 = u_xlat27 * u_xlat28;
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
					        u_xlat28 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat28 = (-_MieG.z) * u_xlat28 + _MieG.y;
					        u_xlat28 = log2(u_xlat28);
					        u_xlat28 = u_xlat28 * 1.5;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat28 = _MieG.x / u_xlat28;
					        u_xlat28 = u_xlat28 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat27) * vec3(u_xlat28) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_11;
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					int u_xlati10;
					vec2 u_xlat11;
					float u_xlat19;
					bvec2 u_xlatb19;
					float u_xlat20;
					bool u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat10.xyz = u_xlat9.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat9.xyz);
					    u_xlat11.x = dot(_ConeAxis.xyz, u_xlat10.xyz);
					    u_xlat11.x = u_xlat11.x + _PlaneD;
					    u_xlat11.x = (-u_xlat11.x) / u_xlat2.x;
					    u_xlatb20 = u_xlat11.x<0.0;
					    u_xlat11.x = (u_xlatb20) ? 100000.0 : u_xlat11.x;
					    u_xlat10.xyz = u_xlat10.xyz + (-_ConeApex.xyz);
					    u_xlat20 = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat29 = dot(u_xlat10.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat10.xyz, u_xlat9.xyz);
					    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat19 = _CosAngle * _CosAngle;
					    u_xlat28 = u_xlat19 * u_xlat20;
					    u_xlat28 = u_xlat2.x * u_xlat2.x + (-u_xlat28);
					    u_xlat20 = u_xlat19 * u_xlat3.x;
					    u_xlat20 = u_xlat29 * u_xlat2.x + (-u_xlat20);
					    u_xlat20 = u_xlat20 + u_xlat20;
					    u_xlat10.x = u_xlat19 * u_xlat10.x;
					    u_xlat10.x = u_xlat29 * u_xlat29 + (-u_xlat10.x);
					    u_xlat10.x = u_xlat28 * u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * 4.0;
					    u_xlat10.x = u_xlat20 * u_xlat20 + (-u_xlat10.x);
					    u_xlatb19.x = 0.0<u_xlat10.x;
					    u_xlat3.y = sqrt(u_xlat10.x);
					    u_xlati10 = int((0.0<u_xlat28) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = int((u_xlat28<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati10 = (-u_xlati10) + u_xlati21;
					    u_xlat10.x = float(u_xlati10);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat10.xx * u_xlat3.xy + (-vec2(u_xlat20));
					    u_xlat10.x = u_xlat28 + u_xlat28;
					    u_xlat10.xz = u_xlat3.xy / u_xlat10.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat10.xz + vec2(u_xlat29);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat10.xz = u_xlat10.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat10.xy = (u_xlatb19.x) ? u_xlat10.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat28 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat28;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat10.y, u_xlat10.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat11.x);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat11.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb31 = u_xlat7.z<0.0;
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 * u_xlat8.w;
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = u_xlat32 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat32));
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat6 = u_xlat5.yyyy * _MyWorld2Shadow[1];
					        u_xlat6 = _MyWorld2Shadow[0] * u_xlat5.xxxx + u_xlat6;
					        u_xlat6 = _MyWorld2Shadow[2] * u_xlat5.zzzz + u_xlat6;
					        u_xlat6 = u_xlat6 + _MyWorld2Shadow[3];
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat6.www;
					        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
					        u_xlat32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat32 = u_xlat32 * u_xlat2.x + _LightShadowData.x;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat32 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat6.x = u_xlat11.x * u_xlat32;
					        u_xlat29 = u_xlat11.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = inversesqrt(u_xlat32);
					        u_xlat6.xyz = vec3(u_xlat32) * u_xlat6.xyz;
					        u_xlat32 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat32 = (-_MieG.z) * u_xlat32 + _MieG.y;
					        u_xlat32 = log2(u_xlat32);
					        u_xlat32 = u_xlat32 * 1.5;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat32 = _MieG.x / u_xlat32;
					        u_xlat32 = u_xlat32 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat32) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					int u_xlati9;
					float u_xlat10;
					float u_xlat17;
					bvec2 u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					int u_xlati19;
					float u_xlat25;
					float u_xlat26;
					int u_xlati26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat8.xyz);
					    u_xlat10 = dot(_ConeAxis.xyz, u_xlat9.xyz);
					    u_xlat10 = u_xlat10 + _PlaneD;
					    u_xlat10 = (-u_xlat10) / u_xlat2.x;
					    u_xlatb18 = u_xlat10<0.0;
					    u_xlat10 = (u_xlatb18) ? 100000.0 : u_xlat10;
					    u_xlat9.xyz = u_xlat9.xyz + (-_ConeApex.xyz);
					    u_xlat18 = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat26 = dot(u_xlat9.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat9.xyz, u_xlat8.xyz);
					    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat17 = _CosAngle * _CosAngle;
					    u_xlat25 = u_xlat17 * u_xlat18;
					    u_xlat25 = u_xlat2.x * u_xlat2.x + (-u_xlat25);
					    u_xlat18 = u_xlat17 * u_xlat3.x;
					    u_xlat18 = u_xlat26 * u_xlat2.x + (-u_xlat18);
					    u_xlat18 = u_xlat18 + u_xlat18;
					    u_xlat9.x = u_xlat17 * u_xlat9.x;
					    u_xlat9.x = u_xlat26 * u_xlat26 + (-u_xlat9.x);
					    u_xlat9.x = u_xlat25 * u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 4.0;
					    u_xlat9.x = u_xlat18 * u_xlat18 + (-u_xlat9.x);
					    u_xlatb17.x = 0.0<u_xlat9.x;
					    u_xlat3.y = sqrt(u_xlat9.x);
					    u_xlati9 = int((0.0<u_xlat25) ? 0xFFFFFFFFu : uint(0));
					    u_xlati19 = int((u_xlat25<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati9 = (-u_xlati9) + u_xlati19;
					    u_xlat9.x = float(u_xlati9);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat9.xx * u_xlat3.xy + (-vec2(u_xlat18));
					    u_xlat9.x = u_xlat25 + u_xlat25;
					    u_xlat9.xz = u_xlat3.xy / u_xlat9.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat9.xz + vec2(u_xlat26);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat9.xz = u_xlat9.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat9.xy = (u_xlatb17.x) ? u_xlat9.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat25 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat25;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat9.y, u_xlat9.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat10);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat18 = u_xlat25;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = (-u_xlat4.xyz) + _LightPos.xyz;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyw * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyw * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat6.xy = u_xlat6.xy / u_xlat6.zz;
					        u_xlat7 = texture(_LightTexture0, u_xlat6.xy, -8.0);
					        u_xlatb27 = u_xlat6.z<0.0;
					        u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					        u_xlat27 = u_xlat27 * u_xlat7.w;
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = u_xlat28 * _LightPos.w;
					        u_xlat5 = texture(_LightTextureB0, vec2(u_xlat28));
					        u_xlat27 = u_xlat27 * u_xlat5.x;
					        u_xlat28 = u_xlat4.y + _HeightFog.x;
					        u_xlat28 = (-u_xlat28) * _HeightFog.y;
					        u_xlat28 = u_xlat28 * 1.44269502;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat5.x = u_xlat2.x * u_xlat28;
					        u_xlat18 = u_xlat2.y * u_xlat28 + u_xlat18;
					        u_xlat27 = u_xlat27 * u_xlat5.x;
					        u_xlat28 = u_xlat18 * -1.44269502;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat27 = u_xlat27 * u_xlat28;
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
					        u_xlat28 = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat28 = (-_MieG.z) * u_xlat28 + _MieG.y;
					        u_xlat28 = log2(u_xlat28);
					        u_xlat28 = u_xlat28 * 1.5;
					        u_xlat28 = exp2(u_xlat28);
					        u_xlat28 = _MieG.x / u_xlat28;
					        u_xlat28 = u_xlat28 * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat27) * vec3(u_xlat28) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						vec4 unused_0_5[4];
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec2 u_xlat3;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					int u_xlati10;
					float u_xlat11;
					float u_xlat19;
					bvec2 u_xlatb19;
					float u_xlat20;
					bool u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					float u_xlat30;
					bool u_xlatb30;
					float u_xlat31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat10.xyz = u_xlat9.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat9.xyz);
					    u_xlat11 = dot(_ConeAxis.xyz, u_xlat10.xyz);
					    u_xlat11 = u_xlat11 + _PlaneD;
					    u_xlat11 = (-u_xlat11) / u_xlat2.x;
					    u_xlatb20 = u_xlat11<0.0;
					    u_xlat11 = (u_xlatb20) ? 100000.0 : u_xlat11;
					    u_xlat10.xyz = u_xlat10.xyz + (-_ConeApex.xyz);
					    u_xlat20 = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat29 = dot(u_xlat10.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat10.xyz, u_xlat9.xyz);
					    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat19 = _CosAngle * _CosAngle;
					    u_xlat28 = u_xlat19 * u_xlat20;
					    u_xlat28 = u_xlat2.x * u_xlat2.x + (-u_xlat28);
					    u_xlat20 = u_xlat19 * u_xlat3.x;
					    u_xlat20 = u_xlat29 * u_xlat2.x + (-u_xlat20);
					    u_xlat20 = u_xlat20 + u_xlat20;
					    u_xlat10.x = u_xlat19 * u_xlat10.x;
					    u_xlat10.x = u_xlat29 * u_xlat29 + (-u_xlat10.x);
					    u_xlat10.x = u_xlat28 * u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * 4.0;
					    u_xlat10.x = u_xlat20 * u_xlat20 + (-u_xlat10.x);
					    u_xlatb19.x = 0.0<u_xlat10.x;
					    u_xlat3.y = sqrt(u_xlat10.x);
					    u_xlati10 = int((0.0<u_xlat28) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = int((u_xlat28<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati10 = (-u_xlati10) + u_xlati21;
					    u_xlat10.x = float(u_xlati10);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat10.xx * u_xlat3.xy + (-vec2(u_xlat20));
					    u_xlat10.x = u_xlat28 + u_xlat28;
					    u_xlat10.xz = u_xlat3.xy / u_xlat10.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat10.xz + vec2(u_xlat29);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat10.xz = u_xlat10.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat10.xy = (u_xlatb19.x) ? u_xlat10.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat28 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat28;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat10.y, u_xlat10.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat11);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat3.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat2.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb30 = u_xlat7.z<0.0;
					        u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 * u_xlat8.w;
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = u_xlat31 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat31));
					        u_xlat30 = u_xlat30 * u_xlat6.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat2.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat31 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * _NoiseData.y;
					        u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
					        u_xlat32 = u_xlat5.y + _HeightFog.x;
					        u_xlat32 = (-u_xlat32) * _HeightFog.y;
					        u_xlat32 = u_xlat32 * 1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat32 = u_xlat3.x * u_xlat31;
					        u_xlat29 = u_xlat3.y * u_xlat31 + u_xlat29;
					        u_xlat30 = u_xlat30 * u_xlat32;
					        u_xlat31 = u_xlat29 * -1.44269502;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat30 = u_xlat30 * u_xlat31;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat31 = inversesqrt(u_xlat31);
					        u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
					        u_xlat31 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat31 = (-_MieG.z) * u_xlat31 + _MieG.y;
					        u_xlat31 = log2(u_xlat31);
					        u_xlat31 = u_xlat31 * 1.5;
					        u_xlat31 = exp2(u_xlat31);
					        u_xlat31 = _MieG.x / u_xlat31;
					        u_xlat31 = u_xlat31 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat30) * vec3(u_xlat31) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_9[2];
						vec4 _HeightFog;
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					int u_xlati9;
					vec2 u_xlat10;
					float u_xlat13;
					float u_xlat17;
					bvec2 u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					int u_xlati19;
					float u_xlat25;
					float u_xlat26;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat8.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat8.xyz = u_xlat8.xyz / u_xlat1.xxx;
					    u_xlat9.xyz = u_xlat8.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat8.xyz);
					    u_xlat10.x = dot(_ConeAxis.xyz, u_xlat9.xyz);
					    u_xlat10.x = u_xlat10.x + _PlaneD;
					    u_xlat10.x = (-u_xlat10.x) / u_xlat2.x;
					    u_xlatb18 = u_xlat10.x<0.0;
					    u_xlat10.x = (u_xlatb18) ? 100000.0 : u_xlat10.x;
					    u_xlat9.xyz = u_xlat9.xyz + (-_ConeApex.xyz);
					    u_xlat18 = dot(u_xlat8.xyz, u_xlat8.xyz);
					    u_xlat26 = dot(u_xlat9.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat9.xyz, u_xlat8.xyz);
					    u_xlat9.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat17 = _CosAngle * _CosAngle;
					    u_xlat25 = u_xlat17 * u_xlat18;
					    u_xlat25 = u_xlat2.x * u_xlat2.x + (-u_xlat25);
					    u_xlat18 = u_xlat17 * u_xlat3.x;
					    u_xlat18 = u_xlat26 * u_xlat2.x + (-u_xlat18);
					    u_xlat18 = u_xlat18 + u_xlat18;
					    u_xlat9.x = u_xlat17 * u_xlat9.x;
					    u_xlat9.x = u_xlat26 * u_xlat26 + (-u_xlat9.x);
					    u_xlat9.x = u_xlat25 * u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * 4.0;
					    u_xlat9.x = u_xlat18 * u_xlat18 + (-u_xlat9.x);
					    u_xlatb17.x = 0.0<u_xlat9.x;
					    u_xlat3.y = sqrt(u_xlat9.x);
					    u_xlati9 = int((0.0<u_xlat25) ? 0xFFFFFFFFu : uint(0));
					    u_xlati19 = int((u_xlat25<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati9 = (-u_xlati9) + u_xlati19;
					    u_xlat9.x = float(u_xlati9);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat9.xx * u_xlat3.xy + (-vec2(u_xlat18));
					    u_xlat9.x = u_xlat25 + u_xlat25;
					    u_xlat9.xz = u_xlat3.xy / u_xlat9.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat9.xz + vec2(u_xlat26);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat9.xz = u_xlat9.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat9.xy = (u_xlatb17.x) ? u_xlat9.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat25 = dot(_CameraForward.xyz, u_xlat8.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat25;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat9.y, u_xlat9.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat10.x);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb17.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb17.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb17.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat25 = sqrt(u_xlat25);
					    u_xlat25 = u_xlat25 * _VolumetricLight.y;
					    u_xlat25 = u_xlat25 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat10.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat26 = u_xlat25;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = (-u_xlat4.xyz) + _LightPos.xyz;
					        u_xlat6.xyz = u_xlat4.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat6.xyz = _MyLightMatrix0[0].xyw * u_xlat4.xxx + u_xlat6.xyz;
					        u_xlat6.xyz = _MyLightMatrix0[2].xyw * u_xlat4.zzz + u_xlat6.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat6.xy = u_xlat6.xy / u_xlat6.zz;
					        u_xlat7 = texture(_LightTexture0, u_xlat6.xy, -8.0);
					        u_xlatb28 = u_xlat6.z<0.0;
					        u_xlat28 = u_xlatb28 ? 1.0 : float(0.0);
					        u_xlat28 = u_xlat28 * u_xlat7.w;
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.x = u_xlat5.x * _LightPos.w;
					        u_xlat5 = texture(_LightTextureB0, u_xlat5.xx);
					        u_xlat28 = u_xlat28 * u_xlat5.x;
					        u_xlat5 = u_xlat4.yyyy * _MyWorld2Shadow[1];
					        u_xlat5 = _MyWorld2Shadow[0] * u_xlat4.xxxx + u_xlat5;
					        u_xlat5 = _MyWorld2Shadow[2] * u_xlat4.zzzz + u_xlat5;
					        u_xlat5 = u_xlat5 + _MyWorld2Shadow[3];
					        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
					        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
					        u_xlat5.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat5.x = u_xlat5.x * u_xlat2.x + _LightShadowData.x;
					        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					        u_xlat28 = u_xlat28 * u_xlat5.x;
					        u_xlat5.x = u_xlat4.y + _HeightFog.x;
					        u_xlat5.x = (-u_xlat5.x) * _HeightFog.y;
					        u_xlat5.x = u_xlat5.x * 1.44269502;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat13 = u_xlat10.x * u_xlat5.x;
					        u_xlat26 = u_xlat10.y * u_xlat5.x + u_xlat26;
					        u_xlat28 = u_xlat28 * u_xlat13;
					        u_xlat5.x = u_xlat26 * -1.44269502;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat28 = u_xlat28 * u_xlat5.x;
					        u_xlat5.xyz = u_xlat4.xyz + (-_LightPos.xyz);
					        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat29 = inversesqrt(u_xlat29);
					        u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
					        u_xlat5.x = dot(u_xlat5.xyz, (-u_xlat8.xyz));
					        u_xlat5.x = (-_MieG.z) * u_xlat5.x + _MieG.y;
					        u_xlat5.x = log2(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 1.5;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat5.x = _MieG.x / u_xlat5.x;
					        u_xlat5.x = u_xlat5.x * _MieG.w;
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat5.xxx + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat8.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    }
					    u_xlat0.xyz = u_xlat3.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[4];
						vec4 _LightPos;
						vec4 _LightColor;
						vec4 unused_0_3[13];
						mat4x4 _MyLightMatrix0;
						mat4x4 _MyWorld2Shadow;
						vec3 _CameraForward;
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						int _SampleCount;
						float _CosAngle;
						vec4 _ConeAxis;
						vec4 _ConeApex;
						float _PlaneD;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[24];
						vec4 _LightShadowData;
						vec4 unused_2_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					ivec3 u_xlati2;
					bvec3 u_xlatb2;
					vec3 u_xlat3;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					int u_xlati10;
					vec2 u_xlat11;
					float u_xlat19;
					bvec2 u_xlatb19;
					float u_xlat20;
					bool u_xlatb20;
					int u_xlati21;
					float u_xlat28;
					float u_xlat29;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat9.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat9.xyz = u_xlat9.xyz / u_xlat1.xxx;
					    u_xlat10.xyz = u_xlat9.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(_ConeAxis.xyz, u_xlat9.xyz);
					    u_xlat11.x = dot(_ConeAxis.xyz, u_xlat10.xyz);
					    u_xlat11.x = u_xlat11.x + _PlaneD;
					    u_xlat11.x = (-u_xlat11.x) / u_xlat2.x;
					    u_xlatb20 = u_xlat11.x<0.0;
					    u_xlat11.x = (u_xlatb20) ? 100000.0 : u_xlat11.x;
					    u_xlat10.xyz = u_xlat10.xyz + (-_ConeApex.xyz);
					    u_xlat20 = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat29 = dot(u_xlat10.xyz, _ConeAxis.xyz);
					    u_xlat3.x = dot(u_xlat10.xyz, u_xlat9.xyz);
					    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat19 = _CosAngle * _CosAngle;
					    u_xlat28 = u_xlat19 * u_xlat20;
					    u_xlat28 = u_xlat2.x * u_xlat2.x + (-u_xlat28);
					    u_xlat20 = u_xlat19 * u_xlat3.x;
					    u_xlat20 = u_xlat29 * u_xlat2.x + (-u_xlat20);
					    u_xlat20 = u_xlat20 + u_xlat20;
					    u_xlat10.x = u_xlat19 * u_xlat10.x;
					    u_xlat10.x = u_xlat29 * u_xlat29 + (-u_xlat10.x);
					    u_xlat10.x = u_xlat28 * u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * 4.0;
					    u_xlat10.x = u_xlat20 * u_xlat20 + (-u_xlat10.x);
					    u_xlatb19.x = 0.0<u_xlat10.x;
					    u_xlat3.y = sqrt(u_xlat10.x);
					    u_xlati10 = int((0.0<u_xlat28) ? 0xFFFFFFFFu : uint(0));
					    u_xlati21 = int((u_xlat28<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati10 = (-u_xlati10) + u_xlati21;
					    u_xlat10.x = float(u_xlati10);
					    u_xlat3.x = (-u_xlat3.y);
					    u_xlat3.xy = u_xlat10.xx * u_xlat3.xy + (-vec2(u_xlat20));
					    u_xlat10.x = u_xlat28 + u_xlat28;
					    u_xlat10.xz = u_xlat3.xy / u_xlat10.xx;
					    u_xlat2.xz = u_xlat2.xx * u_xlat10.xz + vec2(u_xlat29);
					    u_xlatb2.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
					    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xzxx).xy;
					    u_xlati2.xz = ivec2((uvec2(u_xlatb2.xz) * 0xffffffffu) & (uvec2(u_xlatb3.xy) * 0xffffffffu));
					    u_xlat3.xy = uintBitsToFloat(uvec2(u_xlati2.xz) & uvec2(1065353216u, 1065353216u));
					    u_xlat2.x = (u_xlati2.x != 0) ? float(0.0) : float(10000.0);
					    u_xlat2.z = (u_xlati2.z != 0) ? float(0.0) : float(10000.0);
					    u_xlat10.xz = u_xlat10.xz * u_xlat3.xy + u_xlat2.xz;
					    u_xlat10.xy = (u_xlatb19.x) ? u_xlat10.xz : vec2(10000.0, 10000.0);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat28 = dot(_CameraForward.xyz, u_xlat9.xyz);
					    u_xlat0.x = u_xlat0.x / u_xlat28;
					    u_xlat0.x = (-u_xlat1.x) + u_xlat0.x;
					    u_xlat1.x = min(u_xlat10.y, u_xlat10.x);
					    u_xlat1.x = min(u_xlat1.x, u_xlat11.x);
					    u_xlat0.x = min(u_xlat0.x, u_xlat1.x);
					    u_xlat1.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.125, 0.125);
					    u_xlatb19.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb19.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb19.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat1.xy + vec2(0.0625, 0.0625);
					    u_xlat1 = texture(_DitherTexture, u_xlat1.xy);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat9.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.www + vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat28 = sqrt(u_xlat28);
					    u_xlat28 = u_xlat28 * _VolumetricLight.y;
					    u_xlat28 = u_xlat28 * 0.5;
					    u_xlat2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat11.xy = u_xlat0.xx * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.xyz = u_xlat1.xyz;
					    u_xlat29 = u_xlat28;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = (-u_xlat5.xyz) + _LightPos.xyz;
					        u_xlat7.xyz = u_xlat5.yyy * _MyLightMatrix0[1].xyw;
					        u_xlat7.xyz = _MyLightMatrix0[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = _MyLightMatrix0[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + _MyLightMatrix0[3].xyw;
					        u_xlat7.xy = u_xlat7.xy / u_xlat7.zz;
					        u_xlat8 = texture(_LightTexture0, u_xlat7.xy, -8.0);
					        u_xlatb31 = u_xlat7.z<0.0;
					        u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
					        u_xlat31 = u_xlat31 * u_xlat8.w;
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = u_xlat32 * _LightPos.w;
					        u_xlat6 = texture(_LightTextureB0, vec2(u_xlat32));
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat6 = u_xlat5.yyyy * _MyWorld2Shadow[1];
					        u_xlat6 = _MyWorld2Shadow[0] * u_xlat5.xxxx + u_xlat6;
					        u_xlat6 = _MyWorld2Shadow[2] * u_xlat5.zzzz + u_xlat6;
					        u_xlat6 = u_xlat6 + _MyWorld2Shadow[3];
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat6.www;
					        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
					        u_xlat32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					        u_xlat32 = u_xlat32 * u_xlat2.x + _LightShadowData.x;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat32 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat32 = u_xlat32 * _NoiseData.y;
					        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
					        u_xlat6.x = u_xlat5.y + _HeightFog.x;
					        u_xlat6.x = (-u_xlat6.x) * _HeightFog.y;
					        u_xlat6.x = u_xlat6.x * 1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat32 = u_xlat32 * u_xlat6.x;
					        u_xlat6.x = u_xlat11.x * u_xlat32;
					        u_xlat29 = u_xlat11.y * u_xlat32 + u_xlat29;
					        u_xlat31 = u_xlat31 * u_xlat6.x;
					        u_xlat32 = u_xlat29 * -1.44269502;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat31 = u_xlat31 * u_xlat32;
					        u_xlat6.xyz = u_xlat5.xyz + (-_LightPos.xyz);
					        u_xlat32 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat32 = inversesqrt(u_xlat32);
					        u_xlat6.xyz = vec3(u_xlat32) * u_xlat6.xyz;
					        u_xlat32 = dot(u_xlat6.xyz, (-u_xlat9.xyz));
					        u_xlat32 = (-_MieG.z) * u_xlat32 + _MieG.y;
					        u_xlat32 = log2(u_xlat32);
					        u_xlat32 = u_xlat32 * 1.5;
					        u_xlat32 = exp2(u_xlat32);
					        u_xlat32 = _MieG.x / u_xlat32;
					        u_xlat32 = u_xlat32 * _MieG.w;
					        u_xlat4.xyz = vec3(u_xlat31) * vec3(u_xlat32) + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat9.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    }
					    u_xlat0.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			Blend One One
			ZClip Off
			ZWrite Off
			Cull Off
			GpuProgramID 293957
			Program "vp" {
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[11];
						vec4 _FrustumCorners[4];
						vec4 unused_0_2[22];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					uint u_xlatu0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = in_TEXCOORD0.y * 2.0 + in_TEXCOORD0.x;
					    u_xlatu0 = uint(u_xlat0.x);
					    vs_TEXCOORD1.xyz = _FrustumCorners[int(u_xlatu0)].xyz;
					    return;
					}"
				}
			}
			Program "fp" {
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					int u_xlati2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat3.xyz = u_xlat3.xyz / u_xlat1.xxx;
					    u_xlat1.x = min(u_xlat1.x, _MaxRayLength);
					    u_xlat4.x = float(_SampleCount);
					    u_xlat1.x = u_xlat1.x / u_xlat4.x;
					    u_xlat3.x = dot(_LightDir.xyz, (-u_xlat3.xyz));
					    u_xlat6 = u_xlat1.x * _VolumetricLight.x;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat9 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat9 = _VolumetricLight.y * u_xlat1.x + u_xlat9;
					        u_xlat5 = u_xlat9 * -1.44269502;
					        u_xlat5 = exp2(u_xlat5);
					        u_xlat4.xyz = vec3(u_xlat6) * vec3(u_xlat5) + u_xlat4.xyz;
					    }
					    u_xlat3.x = (-_MieG.z) * u_xlat3.x + _MieG.y;
					    u_xlat3.x = log2(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 1.5;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat3.x = _MieG.x / u_xlat3.x;
					    u_xlat3.x = u_xlat3.x * _MieG.w;
					    u_xlat1.xyz = u_xlat3.xxx * u_xlat4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.x = u_xlat9 * -1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat6 = (-u_xlat3.x) + 1.0;
					    u_xlat6 = _VolumetricLight.w * u_xlat6 + u_xlat3.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat6 : u_xlat3.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					int u_xlati2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat3.xyz = u_xlat3.xyz / u_xlat1.xxx;
					    u_xlat1.x = min(u_xlat1.x, _MaxRayLength);
					    u_xlat4.x = float(_SampleCount);
					    u_xlat1.x = u_xlat1.x / u_xlat4.x;
					    u_xlat3.x = dot(_LightDir.xyz, (-u_xlat3.xyz));
					    u_xlat6 = u_xlat1.x * _VolumetricLight.x;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat9 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat9 = _VolumetricLight.y * u_xlat1.x + u_xlat9;
					        u_xlat5 = u_xlat9 * -1.44269502;
					        u_xlat5 = exp2(u_xlat5);
					        u_xlat4.xyz = vec3(u_xlat6) * vec3(u_xlat5) + u_xlat4.xyz;
					    }
					    u_xlat3.x = (-_MieG.z) * u_xlat3.x + _MieG.y;
					    u_xlat3.x = log2(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 1.5;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat3.x = _MieG.x / u_xlat3.x;
					    u_xlat3.x = u_xlat3.x * _MieG.w;
					    u_xlat1.xyz = u_xlat3.xxx * u_xlat4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.x = u_xlat9 * -1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat6 = (-u_xlat3.x) + 1.0;
					    u_xlat6 = _VolumetricLight.w * u_xlat6 + u_xlat3.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat6 : u_xlat3.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					int u_xlati2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat3.xyz = u_xlat3.xyz / u_xlat1.xxx;
					    u_xlat1.x = min(u_xlat1.x, _MaxRayLength);
					    u_xlat4.x = float(_SampleCount);
					    u_xlat1.x = u_xlat1.x / u_xlat4.x;
					    u_xlat3.x = dot(_LightDir.xyz, (-u_xlat3.xyz));
					    u_xlat6 = u_xlat1.x * _VolumetricLight.x;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat9 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat9 = _VolumetricLight.y * u_xlat1.x + u_xlat9;
					        u_xlat5 = u_xlat9 * -1.44269502;
					        u_xlat5 = exp2(u_xlat5);
					        u_xlat4.xyz = vec3(u_xlat6) * vec3(u_xlat5) + u_xlat4.xyz;
					    }
					    u_xlat3.x = (-_MieG.z) * u_xlat3.x + _MieG.y;
					    u_xlat3.x = log2(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 1.5;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlat3.x = _MieG.x / u_xlat3.x;
					    u_xlat3.x = u_xlat3.x * _MieG.w;
					    u_xlat1.xyz = u_xlat3.xxx * u_xlat4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.x = u_xlat9 * -1.44269502;
					    u_xlat3.x = exp2(u_xlat3.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat6 = (-u_xlat3.x) + 1.0;
					    u_xlat6 = _VolumetricLight.w * u_xlat6 + u_xlat3.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat6 : u_xlat3.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					bvec4 u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					float u_xlat12;
					vec3 u_xlat15;
					float u_xlat20;
					float u_xlat22;
					float u_xlat32;
					int u_xlati33;
					float u_xlat34;
					bool u_xlatb34;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat10.xyz = u_xlat0.xxx * u_xlat10.xyz;
					    u_xlat1 = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat10.xyz = u_xlat10.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat11.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat11.xy = u_xlat11.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat11.xyxx, (-u_xlat11.xyxx)).xy;
					    u_xlat11.xy = fract(abs(u_xlat11.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat11;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat11.x : (-u_xlat11.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat11.y : (-u_xlat11.y);
					        u_xlat11 = hlslcc_movcTemp;
					    }
					    u_xlat11.xy = u_xlat11.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat11.xy);
					    u_xlat11.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat11.x;
					    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat10.xyz));
					    u_xlat12 = (-_LightShadowData.x) + 1.0;
					    u_xlat22 = u_xlat1 * _VolumetricLight.x;
					    u_xlat4.xyz = u_xlat11.xyz;
					    u_xlat32 = 0.0;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat6.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat7.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat8.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlatb5 = lessThan(u_xlat5, unity_ShadowSplitSqRadii);
					        u_xlat6.x = u_xlatb5.x ? float(1.0) : 0.0;
					        u_xlat6.y = u_xlatb5.y ? float(1.0) : 0.0;
					        u_xlat6.z = u_xlatb5.z ? float(1.0) : 0.0;
					        u_xlat6.w = u_xlatb5.w ? float(1.0) : 0.0;
					;
					        u_xlat5.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
					        u_xlat5.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
					        u_xlat5.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
					        u_xlat5.xyz = u_xlat5.xyz + u_xlat6.yzw;
					        u_xlat6.yzw = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat34 = dot(u_xlat6, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb5.x = u_xlat34<4.0;
					        u_xlat15.xyz = u_xlat4.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat15.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat4.xxx + u_xlat15.xyz;
					        u_xlat15.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat4.zzz + u_xlat15.xyz;
					        u_xlat15.xyz = u_xlat15.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat7.xyz = u_xlat4.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat7.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat4.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat4.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat8.xyz = u_xlat4.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat4.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat4.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat9.xyz = u_xlat4.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat4.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat4.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat7.xyz = u_xlat6.yyy * u_xlat7.xyz;
					        u_xlat15.xyz = u_xlat15.xyz * u_xlat6.xxx + u_xlat7.xyz;
					        u_xlat15.xyz = u_xlat8.xyz * u_xlat6.zzz + u_xlat15.xyz;
					        u_xlat15.xyz = u_xlat9.xyz * u_xlat6.www + u_xlat15.xyz;
					        u_xlat34 = (-u_xlat34) + u_xlat15.z;
					        u_xlat34 = u_xlat34 + 1.0;
					        vec3 txVec0 = vec3(u_xlat15.xy,u_xlat34);
					        u_xlat34 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat34 = (u_xlatb5.x) ? u_xlat34 : 1.0;
					        u_xlat34 = u_xlat34 * u_xlat12 + _LightShadowData.x;
					        u_xlat32 = _VolumetricLight.y * u_xlat1 + u_xlat32;
					        u_xlat34 = u_xlat22 * u_xlat34;
					        u_xlat5.x = u_xlat32 * -1.44269502;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat3.xyz = vec3(u_xlat34) * u_xlat5.xxx + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat10.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 1.5;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat10.x = _MieG.x / u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * _MieG.w;
					    u_xlat10.xyz = u_xlat10.xxx * u_xlat3.xyz;
					    u_xlat10.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat10.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat10.x = u_xlat32 * -1.44269502;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat20 = (-u_xlat10.x) + 1.0;
					    u_xlat20 = _VolumetricLight.w * u_xlat20 + u_xlat10.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat20 : u_xlat10.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					bvec4 u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					float u_xlat12;
					vec3 u_xlat15;
					float u_xlat20;
					float u_xlat22;
					float u_xlat32;
					int u_xlati33;
					float u_xlat34;
					bool u_xlatb34;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat10.xyz = u_xlat0.xxx * u_xlat10.xyz;
					    u_xlat1 = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat10.xyz = u_xlat10.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat11.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat11.xy = u_xlat11.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat11.xyxx, (-u_xlat11.xyxx)).xy;
					    u_xlat11.xy = fract(abs(u_xlat11.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat11;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat11.x : (-u_xlat11.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat11.y : (-u_xlat11.y);
					        u_xlat11 = hlslcc_movcTemp;
					    }
					    u_xlat11.xy = u_xlat11.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat11.xy);
					    u_xlat11.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat11.x;
					    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat10.xyz));
					    u_xlat12 = (-_LightShadowData.x) + 1.0;
					    u_xlat22 = u_xlat1 * _VolumetricLight.x;
					    u_xlat4.xyz = u_xlat11.xyz;
					    u_xlat32 = 0.0;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat6.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat7.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat8.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlatb5 = lessThan(u_xlat5, unity_ShadowSplitSqRadii);
					        u_xlat6.x = u_xlatb5.x ? float(1.0) : 0.0;
					        u_xlat6.y = u_xlatb5.y ? float(1.0) : 0.0;
					        u_xlat6.z = u_xlatb5.z ? float(1.0) : 0.0;
					        u_xlat6.w = u_xlatb5.w ? float(1.0) : 0.0;
					;
					        u_xlat5.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
					        u_xlat5.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
					        u_xlat5.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
					        u_xlat5.xyz = u_xlat5.xyz + u_xlat6.yzw;
					        u_xlat6.yzw = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat34 = dot(u_xlat6, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb5.x = u_xlat34<4.0;
					        u_xlat15.xyz = u_xlat4.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat15.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat4.xxx + u_xlat15.xyz;
					        u_xlat15.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat4.zzz + u_xlat15.xyz;
					        u_xlat15.xyz = u_xlat15.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat7.xyz = u_xlat4.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat7.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat4.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat4.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat8.xyz = u_xlat4.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat4.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat4.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat9.xyz = u_xlat4.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat4.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat4.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat7.xyz = u_xlat6.yyy * u_xlat7.xyz;
					        u_xlat15.xyz = u_xlat15.xyz * u_xlat6.xxx + u_xlat7.xyz;
					        u_xlat15.xyz = u_xlat8.xyz * u_xlat6.zzz + u_xlat15.xyz;
					        u_xlat15.xyz = u_xlat9.xyz * u_xlat6.www + u_xlat15.xyz;
					        u_xlat34 = (-u_xlat34) + u_xlat15.z;
					        u_xlat34 = u_xlat34 + 1.0;
					        vec3 txVec0 = vec3(u_xlat15.xy,u_xlat34);
					        u_xlat34 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat34 = (u_xlatb5.x) ? u_xlat34 : 1.0;
					        u_xlat34 = u_xlat34 * u_xlat12 + _LightShadowData.x;
					        u_xlat32 = _VolumetricLight.y * u_xlat1 + u_xlat32;
					        u_xlat34 = u_xlat22 * u_xlat34;
					        u_xlat5.x = u_xlat32 * -1.44269502;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat3.xyz = vec3(u_xlat34) * u_xlat5.xxx + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat10.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 1.5;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat10.x = _MieG.x / u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * _MieG.w;
					    u_xlat10.xyz = u_xlat10.xxx * u_xlat3.xyz;
					    u_xlat10.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat10.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat10.x = u_xlat32 * -1.44269502;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat20 = (-u_xlat10.x) + 1.0;
					    u_xlat20 = _VolumetricLight.w * u_xlat20 + u_xlat10.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat20 : u_xlat10.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[3];
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					bvec4 u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					float u_xlat12;
					vec3 u_xlat15;
					float u_xlat20;
					float u_xlat22;
					float u_xlat32;
					int u_xlati33;
					float u_xlat34;
					bool u_xlatb34;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat10.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat10.xyz = u_xlat0.xxx * u_xlat10.xyz;
					    u_xlat1 = dot(u_xlat10.xyz, u_xlat10.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat10.xyz = u_xlat10.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat11.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat11.xy = u_xlat11.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat11.xyxx, (-u_xlat11.xyxx)).xy;
					    u_xlat11.xy = fract(abs(u_xlat11.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat11;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat11.x : (-u_xlat11.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat11.y : (-u_xlat11.y);
					        u_xlat11 = hlslcc_movcTemp;
					    }
					    u_xlat11.xy = u_xlat11.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat11.xy);
					    u_xlat11.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat11.x;
					    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat10.xyz));
					    u_xlat12 = (-_LightShadowData.x) + 1.0;
					    u_xlat22 = u_xlat1 * _VolumetricLight.x;
					    u_xlat4.xyz = u_xlat11.xyz;
					    u_xlat32 = 0.0;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat6.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat7.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat8.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlatb5 = lessThan(u_xlat5, unity_ShadowSplitSqRadii);
					        u_xlat6.x = u_xlatb5.x ? float(1.0) : 0.0;
					        u_xlat6.y = u_xlatb5.y ? float(1.0) : 0.0;
					        u_xlat6.z = u_xlatb5.z ? float(1.0) : 0.0;
					        u_xlat6.w = u_xlatb5.w ? float(1.0) : 0.0;
					;
					        u_xlat5.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
					        u_xlat5.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
					        u_xlat5.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
					        u_xlat5.xyz = u_xlat5.xyz + u_xlat6.yzw;
					        u_xlat6.yzw = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat34 = dot(u_xlat6, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb5.x = u_xlat34<4.0;
					        u_xlat15.xyz = u_xlat4.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat15.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat4.xxx + u_xlat15.xyz;
					        u_xlat15.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat4.zzz + u_xlat15.xyz;
					        u_xlat15.xyz = u_xlat15.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat7.xyz = u_xlat4.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat7.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat4.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat4.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat8.xyz = u_xlat4.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat4.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat4.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat9.xyz = u_xlat4.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat4.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat4.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat7.xyz = u_xlat6.yyy * u_xlat7.xyz;
					        u_xlat15.xyz = u_xlat15.xyz * u_xlat6.xxx + u_xlat7.xyz;
					        u_xlat15.xyz = u_xlat8.xyz * u_xlat6.zzz + u_xlat15.xyz;
					        u_xlat15.xyz = u_xlat9.xyz * u_xlat6.www + u_xlat15.xyz;
					        u_xlat34 = (-u_xlat34) + u_xlat15.z;
					        u_xlat34 = u_xlat34 + 1.0;
					        vec3 txVec0 = vec3(u_xlat15.xy,u_xlat34);
					        u_xlat34 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat34 = (u_xlatb5.x) ? u_xlat34 : 1.0;
					        u_xlat34 = u_xlat34 * u_xlat12 + _LightShadowData.x;
					        u_xlat32 = _VolumetricLight.y * u_xlat1 + u_xlat32;
					        u_xlat34 = u_xlat22 * u_xlat34;
					        u_xlat5.x = u_xlat32 * -1.44269502;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat3.xyz = vec3(u_xlat34) * u_xlat5.xxx + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat10.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat10.x = log2(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 1.5;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlat10.x = _MieG.x / u_xlat10.x;
					    u_xlat10.x = u_xlat10.x * _MieG.w;
					    u_xlat10.xyz = u_xlat10.xxx * u_xlat3.xyz;
					    u_xlat10.xyz = u_xlat10.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat10.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat10.x = u_xlat32 * -1.44269502;
					    u_xlat10.x = exp2(u_xlat10.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat20 = (-u_xlat10.x) + 1.0;
					    u_xlat20 = _VolumetricLight.w * u_xlat20 + u_xlat10.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat20 : u_xlat10.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" }
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "NOISE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec2 u_xlat9;
					float u_xlat14;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat7.xyz = u_xlat7.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat8.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat8.xyxx, (-u_xlat8.xyxx)).xy;
					    u_xlat8.xy = fract(abs(u_xlat8.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat8;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat8.x : (-u_xlat8.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat8.y : (-u_xlat8.y);
					        u_xlat8 = hlslcc_movcTemp;
					    }
					    u_xlat8.xy = u_xlat8.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat8.xy);
					    u_xlat8.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat8.x;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat1);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat7.xyz));
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.xyz = u_xlat8.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat23 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat25 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat25 = u_xlat25 * _NoiseData.y;
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat26 = u_xlat9.x * u_xlat25;
					        u_xlat23 = u_xlat9.y * u_xlat25 + u_xlat23;
					        u_xlat25 = u_xlat23 * -1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat5.xyz = vec3(u_xlat26) * vec3(u_xlat25) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat7.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 1.5;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = _MieG.x / u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * _MieG.w;
					    u_xlat7.xyz = u_xlat7.xxx * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.x = u_xlat23 * -1.44269502;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat14 = (-u_xlat7.x) + 1.0;
					    u_xlat14 = _VolumetricLight.w * u_xlat14 + u_xlat7.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat14 : u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "NOISE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec2 u_xlat9;
					float u_xlat14;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat7.xyz = u_xlat7.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat8.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat8.xyxx, (-u_xlat8.xyxx)).xy;
					    u_xlat8.xy = fract(abs(u_xlat8.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat8;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat8.x : (-u_xlat8.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat8.y : (-u_xlat8.y);
					        u_xlat8 = hlslcc_movcTemp;
					    }
					    u_xlat8.xy = u_xlat8.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat8.xy);
					    u_xlat8.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat8.x;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat1);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat7.xyz));
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.xyz = u_xlat8.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat23 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat25 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat25 = u_xlat25 * _NoiseData.y;
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat26 = u_xlat9.x * u_xlat25;
					        u_xlat23 = u_xlat9.y * u_xlat25 + u_xlat23;
					        u_xlat25 = u_xlat23 * -1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat5.xyz = vec3(u_xlat26) * vec3(u_xlat25) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat7.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 1.5;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = _MieG.x / u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * _MieG.w;
					    u_xlat7.xyz = u_xlat7.xxx * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.x = u_xlat23 * -1.44269502;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat14 = (-u_xlat7.x) + 1.0;
					    u_xlat14 = _VolumetricLight.w * u_xlat14 + u_xlat7.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat14 : u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "NOISE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec2 u_xlat9;
					float u_xlat14;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat7.xyz = u_xlat7.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat8.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat8.xyxx, (-u_xlat8.xyxx)).xy;
					    u_xlat8.xy = fract(abs(u_xlat8.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat8;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat8.x : (-u_xlat8.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat8.y : (-u_xlat8.y);
					        u_xlat8 = hlslcc_movcTemp;
					    }
					    u_xlat8.xy = u_xlat8.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat8.xy);
					    u_xlat8.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat8.x;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat1);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat7.xyz));
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.xyz = u_xlat8.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat23 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat25 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat25 = u_xlat25 * _NoiseData.y;
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat26 = u_xlat9.x * u_xlat25;
					        u_xlat23 = u_xlat9.y * u_xlat25 + u_xlat23;
					        u_xlat25 = u_xlat23 * -1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat5.xyz = vec3(u_xlat26) * vec3(u_xlat25) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat7.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 1.5;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = _MieG.x / u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * _MieG.w;
					    u_xlat7.xyz = u_xlat7.xxx * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.x = u_xlat23 * -1.44269502;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat14 = (-u_xlat7.x) + 1.0;
					    u_xlat14 = _VolumetricLight.w * u_xlat14 + u_xlat7.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat14 : u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					bvec4 u_xlatb6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat17;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat36;
					int u_xlati37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat5.xyz = u_xlat12.xyz;
					    u_xlat36 = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat7.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat8.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat9.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					        u_xlatb6 = lessThan(u_xlat6, unity_ShadowSplitSqRadii);
					        u_xlat7.x = u_xlatb6.x ? float(1.0) : 0.0;
					        u_xlat7.y = u_xlatb6.y ? float(1.0) : 0.0;
					        u_xlat7.z = u_xlatb6.z ? float(1.0) : 0.0;
					        u_xlat7.w = u_xlatb6.w ? float(1.0) : 0.0;
					;
					        u_xlat6.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
					        u_xlat6.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
					        u_xlat6.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat7.yzw;
					        u_xlat7.yzw = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat38 = dot(u_xlat7, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb6.x = u_xlat38<4.0;
					        u_xlat17.xyz = u_xlat5.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat17.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat5.xxx + u_xlat17.xyz;
					        u_xlat17.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat5.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat17.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat5.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat5.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat5.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat5.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat5.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat5.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat5.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat5.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat5.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat7.yyy * u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xxx + u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat9.xyz * u_xlat7.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat10.xyz * u_xlat7.www + u_xlat17.xyz;
					        u_xlat38 = (-u_xlat38) + u_xlat17.z;
					        u_xlat38 = u_xlat38 + 1.0;
					        vec3 txVec0 = vec3(u_xlat17.xy,u_xlat38);
					        u_xlat38 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat38 = (u_xlatb6.x) ? u_xlat38 : 1.0;
					        u_xlat38 = u_xlat38 * u_xlat13 + _LightShadowData.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat6.x = u_xlat6.x + (-_NoiseData.z);
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat6.x * _NoiseData.y;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat17.x = u_xlat24.x * u_xlat6.x;
					        u_xlat36 = u_xlat24.y * u_xlat6.x + u_xlat36;
					        u_xlat38 = u_xlat38 * u_xlat17.x;
					        u_xlat6.x = u_xlat36 * -1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat4.xyz = vec3(u_xlat38) * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat5.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					bvec4 u_xlatb6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat17;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat36;
					int u_xlati37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat5.xyz = u_xlat12.xyz;
					    u_xlat36 = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat7.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat8.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat9.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					        u_xlatb6 = lessThan(u_xlat6, unity_ShadowSplitSqRadii);
					        u_xlat7.x = u_xlatb6.x ? float(1.0) : 0.0;
					        u_xlat7.y = u_xlatb6.y ? float(1.0) : 0.0;
					        u_xlat7.z = u_xlatb6.z ? float(1.0) : 0.0;
					        u_xlat7.w = u_xlatb6.w ? float(1.0) : 0.0;
					;
					        u_xlat6.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
					        u_xlat6.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
					        u_xlat6.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat7.yzw;
					        u_xlat7.yzw = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat38 = dot(u_xlat7, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb6.x = u_xlat38<4.0;
					        u_xlat17.xyz = u_xlat5.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat17.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat5.xxx + u_xlat17.xyz;
					        u_xlat17.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat5.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat17.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat5.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat5.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat5.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat5.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat5.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat5.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat5.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat5.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat5.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat7.yyy * u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xxx + u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat9.xyz * u_xlat7.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat10.xyz * u_xlat7.www + u_xlat17.xyz;
					        u_xlat38 = (-u_xlat38) + u_xlat17.z;
					        u_xlat38 = u_xlat38 + 1.0;
					        vec3 txVec0 = vec3(u_xlat17.xy,u_xlat38);
					        u_xlat38 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat38 = (u_xlatb6.x) ? u_xlat38 : 1.0;
					        u_xlat38 = u_xlat38 * u_xlat13 + _LightShadowData.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat6.x = u_xlat6.x + (-_NoiseData.z);
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat6.x * _NoiseData.y;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat17.x = u_xlat24.x * u_xlat6.x;
					        u_xlat36 = u_xlat24.y * u_xlat6.x + u_xlat36;
					        u_xlat38 = u_xlat38 * u_xlat17.x;
					        u_xlat6.x = u_xlat36 * -1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat4.xyz = vec3(u_xlat38) * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat5.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 unused_0_9;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					bvec4 u_xlatb6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat17;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat36;
					int u_xlati37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat5.xyz = u_xlat12.xyz;
					    u_xlat36 = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat7.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat8.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat9.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					        u_xlatb6 = lessThan(u_xlat6, unity_ShadowSplitSqRadii);
					        u_xlat7.x = u_xlatb6.x ? float(1.0) : 0.0;
					        u_xlat7.y = u_xlatb6.y ? float(1.0) : 0.0;
					        u_xlat7.z = u_xlatb6.z ? float(1.0) : 0.0;
					        u_xlat7.w = u_xlatb6.w ? float(1.0) : 0.0;
					;
					        u_xlat6.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
					        u_xlat6.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
					        u_xlat6.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat7.yzw;
					        u_xlat7.yzw = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat38 = dot(u_xlat7, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb6.x = u_xlat38<4.0;
					        u_xlat17.xyz = u_xlat5.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat17.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat5.xxx + u_xlat17.xyz;
					        u_xlat17.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat5.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat17.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat5.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat5.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat5.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat5.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat5.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat5.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat5.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat5.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat5.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat7.yyy * u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xxx + u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat9.xyz * u_xlat7.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat10.xyz * u_xlat7.www + u_xlat17.xyz;
					        u_xlat38 = (-u_xlat38) + u_xlat17.z;
					        u_xlat38 = u_xlat38 + 1.0;
					        vec3 txVec0 = vec3(u_xlat17.xy,u_xlat38);
					        u_xlat38 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat38 = (u_xlatb6.x) ? u_xlat38 : 1.0;
					        u_xlat38 = u_xlat38 * u_xlat13 + _LightShadowData.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat6.x = u_xlat6.x + (-_NoiseData.z);
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat6.x * _NoiseData.y;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat17.x = u_xlat24.x * u_xlat6.x;
					        u_xlat36 = u_xlat24.y * u_xlat6.x + u_xlat36;
					        u_xlat38 = u_xlat38 * u_xlat17.x;
					        u_xlat6.x = u_xlat36 * -1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat4.xyz = vec3(u_xlat38) * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat5.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "HEIGHT_FOG" }
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					int u_xlati3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat11;
					float u_xlat12;
					float u_xlat14;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    u_xlat1 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat4.xyz = u_xlat4.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat5.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat5.xy = u_xlat5.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
					    u_xlat5.xy = fract(abs(u_xlat5.xy));
					    {
					        vec2 hlslcc_movcTemp = u_xlat5;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat5.x : (-u_xlat5.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat5.y : (-u_xlat5.y);
					        u_xlat5 = hlslcc_movcTemp;
					    }
					    u_xlat5.xy = u_xlat5.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat5.xy);
					    u_xlat5.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat5.x;
					    u_xlat5.x = u_xlat4.y * u_xlat1;
					    u_xlat5.x = u_xlat5.x * u_xlat2.w + _WorldSpaceCameraPos.y;
					    u_xlat4.x = dot(_LightDir.xyz, (-u_xlat4.xyz));
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat12 = u_xlat5.x;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat14 = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat7 = u_xlat12 + _HeightFog.x;
					        u_xlat7 = (-u_xlat7) * _HeightFog.y;
					        u_xlat7 = u_xlat7 * 1.44269502;
					        u_xlat7 = exp2(u_xlat7);
					        u_xlat11 = u_xlat9.x * u_xlat7;
					        u_xlat14 = u_xlat9.y * u_xlat7 + u_xlat14;
					        u_xlat7 = u_xlat14 * -1.44269502;
					        u_xlat7 = exp2(u_xlat7);
					        u_xlat2.xyz = vec3(u_xlat11) * vec3(u_xlat7) + u_xlat2.xyz;
					        u_xlat12 = u_xlat4.y * u_xlat1 + u_xlat12;
					    }
					    u_xlat4.x = (-_MieG.z) * u_xlat4.x + _MieG.y;
					    u_xlat4.x = log2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 1.5;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat4.x = _MieG.x / u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * _MieG.w;
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.x = u_xlat14 * -1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat8 = (-u_xlat4.x) + 1.0;
					    u_xlat8 = _VolumetricLight.w * u_xlat8 + u_xlat4.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat8 : u_xlat4.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					int u_xlati3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat11;
					float u_xlat12;
					float u_xlat14;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    u_xlat1 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat4.xyz = u_xlat4.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat5.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat5.xy = u_xlat5.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
					    u_xlat5.xy = fract(abs(u_xlat5.xy));
					    {
					        vec2 hlslcc_movcTemp = u_xlat5;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat5.x : (-u_xlat5.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat5.y : (-u_xlat5.y);
					        u_xlat5 = hlslcc_movcTemp;
					    }
					    u_xlat5.xy = u_xlat5.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat5.xy);
					    u_xlat5.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat5.x;
					    u_xlat5.x = u_xlat4.y * u_xlat1;
					    u_xlat5.x = u_xlat5.x * u_xlat2.w + _WorldSpaceCameraPos.y;
					    u_xlat4.x = dot(_LightDir.xyz, (-u_xlat4.xyz));
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat12 = u_xlat5.x;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat14 = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat7 = u_xlat12 + _HeightFog.x;
					        u_xlat7 = (-u_xlat7) * _HeightFog.y;
					        u_xlat7 = u_xlat7 * 1.44269502;
					        u_xlat7 = exp2(u_xlat7);
					        u_xlat11 = u_xlat9.x * u_xlat7;
					        u_xlat14 = u_xlat9.y * u_xlat7 + u_xlat14;
					        u_xlat7 = u_xlat14 * -1.44269502;
					        u_xlat7 = exp2(u_xlat7);
					        u_xlat2.xyz = vec3(u_xlat11) * vec3(u_xlat7) + u_xlat2.xyz;
					        u_xlat12 = u_xlat4.y * u_xlat1 + u_xlat12;
					    }
					    u_xlat4.x = (-_MieG.z) * u_xlat4.x + _MieG.y;
					    u_xlat4.x = log2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 1.5;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat4.x = _MieG.x / u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * _MieG.w;
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.x = u_xlat14 * -1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat8 = (-u_xlat4.x) + 1.0;
					    u_xlat8 = _VolumetricLight.w * u_xlat8 + u_xlat4.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat8 : u_xlat4.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					int u_xlati3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					float u_xlat7;
					bool u_xlatb7;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat11;
					float u_xlat12;
					float u_xlat14;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat4.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
					    u_xlat1 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat4.xyz = u_xlat4.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat5.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat5.xy = u_xlat5.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat5.xyxx, (-u_xlat5.xyxx)).xy;
					    u_xlat5.xy = fract(abs(u_xlat5.xy));
					    {
					        vec2 hlslcc_movcTemp = u_xlat5;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat5.x : (-u_xlat5.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat5.y : (-u_xlat5.y);
					        u_xlat5 = hlslcc_movcTemp;
					    }
					    u_xlat5.xy = u_xlat5.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat5.xy);
					    u_xlat5.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat5.x;
					    u_xlat5.x = u_xlat4.y * u_xlat1;
					    u_xlat5.x = u_xlat5.x * u_xlat2.w + _WorldSpaceCameraPos.y;
					    u_xlat4.x = dot(_LightDir.xyz, (-u_xlat4.xyz));
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat12 = u_xlat5.x;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat14 = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat7 = u_xlat12 + _HeightFog.x;
					        u_xlat7 = (-u_xlat7) * _HeightFog.y;
					        u_xlat7 = u_xlat7 * 1.44269502;
					        u_xlat7 = exp2(u_xlat7);
					        u_xlat11 = u_xlat9.x * u_xlat7;
					        u_xlat14 = u_xlat9.y * u_xlat7 + u_xlat14;
					        u_xlat7 = u_xlat14 * -1.44269502;
					        u_xlat7 = exp2(u_xlat7);
					        u_xlat2.xyz = vec3(u_xlat11) * vec3(u_xlat7) + u_xlat2.xyz;
					        u_xlat12 = u_xlat4.y * u_xlat1 + u_xlat12;
					    }
					    u_xlat4.x = (-_MieG.z) * u_xlat4.x + _MieG.y;
					    u_xlat4.x = log2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 1.5;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat4.x = _MieG.x / u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * _MieG.w;
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.x = u_xlat14 * -1.44269502;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat8 = (-u_xlat4.x) + 1.0;
					    u_xlat8 = _VolumetricLight.w * u_xlat8 + u_xlat4.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat8 : u_xlat4.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					bvec4 u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat27;
					float u_xlat36;
					int u_xlati37;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat4.xyz = u_xlat12.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat36 = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat6.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat7.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat8.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlatb5 = lessThan(u_xlat5, unity_ShadowSplitSqRadii);
					        u_xlat6.x = u_xlatb5.x ? float(1.0) : 0.0;
					        u_xlat6.y = u_xlatb5.y ? float(1.0) : 0.0;
					        u_xlat6.z = u_xlatb5.z ? float(1.0) : 0.0;
					        u_xlat6.w = u_xlatb5.w ? float(1.0) : 0.0;
					;
					        u_xlat5.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
					        u_xlat5.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
					        u_xlat5.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
					        u_xlat5.xyz = u_xlat5.xyz + u_xlat6.yzw;
					        u_xlat6.yzw = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat5.x = dot(u_xlat6, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb16 = u_xlat5.x<4.0;
					        u_xlat7.xyz = u_xlat4.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat7.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat4.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat4.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat4.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat4.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat4.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat4.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat4.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat4.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat4.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat4.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat4.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat6.yyy * u_xlat8.xyz;
					        u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx + u_xlat8.xyz;
					        u_xlat6.xyz = u_xlat9.xyz * u_xlat6.zzz + u_xlat7.xyz;
					        u_xlat6.xyz = u_xlat10.xyz * u_xlat6.www + u_xlat6.xyz;
					        u_xlat5.x = (-u_xlat5.x) + u_xlat6.z;
					        u_xlat5.x = u_xlat5.x + 1.0;
					        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat5.x);
					        u_xlat5.x = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat5.x = (u_xlatb16) ? u_xlat5.x : 1.0;
					        u_xlat5.x = u_xlat5.x * u_xlat13 + _LightShadowData.x;
					        u_xlat16 = u_xlat4.y + _HeightFog.x;
					        u_xlat16 = (-u_xlat16) * _HeightFog.y;
					        u_xlat16 = u_xlat16 * 1.44269502;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat27 = u_xlat24.x * u_xlat16;
					        u_xlat36 = u_xlat24.y * u_xlat16 + u_xlat36;
					        u_xlat5.x = u_xlat27 * u_xlat5.x;
					        u_xlat16 = u_xlat36 * -1.44269502;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat3.xyz = u_xlat5.xxx * vec3(u_xlat16) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat3.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					bvec4 u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat27;
					float u_xlat36;
					int u_xlati37;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat4.xyz = u_xlat12.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat36 = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat6.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat7.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat8.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlatb5 = lessThan(u_xlat5, unity_ShadowSplitSqRadii);
					        u_xlat6.x = u_xlatb5.x ? float(1.0) : 0.0;
					        u_xlat6.y = u_xlatb5.y ? float(1.0) : 0.0;
					        u_xlat6.z = u_xlatb5.z ? float(1.0) : 0.0;
					        u_xlat6.w = u_xlatb5.w ? float(1.0) : 0.0;
					;
					        u_xlat5.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
					        u_xlat5.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
					        u_xlat5.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
					        u_xlat5.xyz = u_xlat5.xyz + u_xlat6.yzw;
					        u_xlat6.yzw = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat5.x = dot(u_xlat6, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb16 = u_xlat5.x<4.0;
					        u_xlat7.xyz = u_xlat4.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat7.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat4.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat4.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat4.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat4.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat4.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat4.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat4.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat4.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat4.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat4.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat4.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat6.yyy * u_xlat8.xyz;
					        u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx + u_xlat8.xyz;
					        u_xlat6.xyz = u_xlat9.xyz * u_xlat6.zzz + u_xlat7.xyz;
					        u_xlat6.xyz = u_xlat10.xyz * u_xlat6.www + u_xlat6.xyz;
					        u_xlat5.x = (-u_xlat5.x) + u_xlat6.z;
					        u_xlat5.x = u_xlat5.x + 1.0;
					        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat5.x);
					        u_xlat5.x = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat5.x = (u_xlatb16) ? u_xlat5.x : 1.0;
					        u_xlat5.x = u_xlat5.x * u_xlat13 + _LightShadowData.x;
					        u_xlat16 = u_xlat4.y + _HeightFog.x;
					        u_xlat16 = (-u_xlat16) * _HeightFog.y;
					        u_xlat16 = u_xlat16 * 1.44269502;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat27 = u_xlat24.x * u_xlat16;
					        u_xlat36 = u_xlat24.y * u_xlat16 + u_xlat36;
					        u_xlat5.x = u_xlat27 * u_xlat5.x;
					        u_xlat16 = u_xlat36 * -1.44269502;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat3.xyz = u_xlat5.xxx * vec3(u_xlat16) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat3.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 unused_0_7[2];
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[2];
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					bvec4 u_xlatb5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat27;
					float u_xlat36;
					int u_xlati37;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat4.xyz = u_xlat12.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat36 = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat6.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat7.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat8.xyz = u_xlat4.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat5.y = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat5.z = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat5.w = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlatb5 = lessThan(u_xlat5, unity_ShadowSplitSqRadii);
					        u_xlat6.x = u_xlatb5.x ? float(1.0) : 0.0;
					        u_xlat6.y = u_xlatb5.y ? float(1.0) : 0.0;
					        u_xlat6.z = u_xlatb5.z ? float(1.0) : 0.0;
					        u_xlat6.w = u_xlatb5.w ? float(1.0) : 0.0;
					;
					        u_xlat5.x = (u_xlatb5.x) ? float(-1.0) : float(-0.0);
					        u_xlat5.y = (u_xlatb5.y) ? float(-1.0) : float(-0.0);
					        u_xlat5.z = (u_xlatb5.z) ? float(-1.0) : float(-0.0);
					        u_xlat5.xyz = u_xlat5.xyz + u_xlat6.yzw;
					        u_xlat6.yzw = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat5.x = dot(u_xlat6, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb16 = u_xlat5.x<4.0;
					        u_xlat7.xyz = u_xlat4.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat7.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat4.xxx + u_xlat7.xyz;
					        u_xlat7.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat4.zzz + u_xlat7.xyz;
					        u_xlat7.xyz = u_xlat7.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat4.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat4.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat4.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat4.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat4.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat4.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat4.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat4.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat4.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat6.yyy * u_xlat8.xyz;
					        u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx + u_xlat8.xyz;
					        u_xlat6.xyz = u_xlat9.xyz * u_xlat6.zzz + u_xlat7.xyz;
					        u_xlat6.xyz = u_xlat10.xyz * u_xlat6.www + u_xlat6.xyz;
					        u_xlat5.x = (-u_xlat5.x) + u_xlat6.z;
					        u_xlat5.x = u_xlat5.x + 1.0;
					        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat5.x);
					        u_xlat5.x = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat5.x = (u_xlatb16) ? u_xlat5.x : 1.0;
					        u_xlat5.x = u_xlat5.x * u_xlat13 + _LightShadowData.x;
					        u_xlat16 = u_xlat4.y + _HeightFog.x;
					        u_xlat16 = (-u_xlat16) * _HeightFog.y;
					        u_xlat16 = u_xlat16 * 1.44269502;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat27 = u_xlat24.x * u_xlat16;
					        u_xlat36 = u_xlat24.y * u_xlat16 + u_xlat36;
					        u_xlat5.x = u_xlat27 * u_xlat5.x;
					        u_xlat16 = u_xlat36 * -1.44269502;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat3.xyz = u_xlat5.xxx * vec3(u_xlat16) + u_xlat3.xyz;
					        u_xlat4.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat3.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec2 u_xlat9;
					float u_xlat14;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat7.xyz = u_xlat7.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat8.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat8.xyxx, (-u_xlat8.xyxx)).xy;
					    u_xlat8.xy = fract(abs(u_xlat8.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat8;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat8.x : (-u_xlat8.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat8.y : (-u_xlat8.y);
					        u_xlat8 = hlslcc_movcTemp;
					    }
					    u_xlat8.xy = u_xlat8.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat8.xy);
					    u_xlat8.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat8.x;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat1);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat7.xyz));
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.xyz = u_xlat8.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat23 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat25 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat25 = u_xlat25 * _NoiseData.y;
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat26 = u_xlat4.y + _HeightFog.x;
					        u_xlat26 = (-u_xlat26) * _HeightFog.y;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat26 = u_xlat9.x * u_xlat25;
					        u_xlat23 = u_xlat9.y * u_xlat25 + u_xlat23;
					        u_xlat25 = u_xlat23 * -1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat5.xyz = vec3(u_xlat26) * vec3(u_xlat25) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat7.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 1.5;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = _MieG.x / u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * _MieG.w;
					    u_xlat7.xyz = u_xlat7.xxx * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.x = u_xlat23 * -1.44269502;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat14 = (-u_xlat7.x) + 1.0;
					    u_xlat14 = _VolumetricLight.w * u_xlat14 + u_xlat7.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat14 : u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec2 u_xlat9;
					float u_xlat14;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat7.xyz = u_xlat7.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat8.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat8.xyxx, (-u_xlat8.xyxx)).xy;
					    u_xlat8.xy = fract(abs(u_xlat8.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat8;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat8.x : (-u_xlat8.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat8.y : (-u_xlat8.y);
					        u_xlat8 = hlslcc_movcTemp;
					    }
					    u_xlat8.xy = u_xlat8.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat8.xy);
					    u_xlat8.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat8.x;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat1);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat7.xyz));
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.xyz = u_xlat8.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat23 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat25 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat25 = u_xlat25 * _NoiseData.y;
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat26 = u_xlat4.y + _HeightFog.x;
					        u_xlat26 = (-u_xlat26) * _HeightFog.y;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat26 = u_xlat9.x * u_xlat25;
					        u_xlat23 = u_xlat9.y * u_xlat25 + u_xlat23;
					        u_xlat25 = u_xlat23 * -1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat5.xyz = vec3(u_xlat26) * vec3(u_xlat25) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat7.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 1.5;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = _MieG.x / u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * _MieG.w;
					    u_xlat7.xyz = u_xlat7.xxx * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.x = u_xlat23 * -1.44269502;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat14 = (-u_xlat7.x) + 1.0;
					    u_xlat14 = _VolumetricLight.w * u_xlat14 + u_xlat7.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat14 : u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec2 u_xlat9;
					float u_xlat14;
					float u_xlat23;
					int u_xlati24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
					    u_xlat1 = dot(u_xlat7.xyz, u_xlat7.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat7.xyz = u_xlat7.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat8.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat8.xyxx, (-u_xlat8.xyxx)).xy;
					    u_xlat8.xy = fract(abs(u_xlat8.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat8;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat8.x : (-u_xlat8.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat8.y : (-u_xlat8.y);
					        u_xlat8 = hlslcc_movcTemp;
					    }
					    u_xlat8.xy = u_xlat8.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat8.xy);
					    u_xlat8.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat8.x;
					    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat1);
					    u_xlat8.xyz = u_xlat8.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat7.xyz));
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat9.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat4.xyz = u_xlat8.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat23 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat4.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat25 = u_xlat6.x + (-_NoiseData.z);
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat25 = u_xlat25 * _NoiseData.y;
					        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
					        u_xlat26 = u_xlat4.y + _HeightFog.x;
					        u_xlat26 = (-u_xlat26) * _HeightFog.y;
					        u_xlat26 = u_xlat26 * 1.44269502;
					        u_xlat26 = exp2(u_xlat26);
					        u_xlat25 = u_xlat25 * u_xlat26;
					        u_xlat26 = u_xlat9.x * u_xlat25;
					        u_xlat23 = u_xlat9.y * u_xlat25 + u_xlat23;
					        u_xlat25 = u_xlat23 * -1.44269502;
					        u_xlat25 = exp2(u_xlat25);
					        u_xlat5.xyz = vec3(u_xlat26) * vec3(u_xlat25) + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat1) + u_xlat4.xyz;
					    }
					    u_xlat7.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat7.x = log2(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x * 1.5;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlat7.x = _MieG.x / u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * _MieG.w;
					    u_xlat7.xyz = u_xlat7.xxx * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat7.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat7.x = u_xlat23 * -1.44269502;
					    u_xlat7.x = exp2(u_xlat7.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat14 = (-u_xlat7.x) + 1.0;
					    u_xlat14 = _VolumetricLight.w * u_xlat14 + u_xlat7.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat14 : u_xlat7.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[28];
						vec4 _VolumetricLight;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    SV_Target0.w = u_xlatb0 ? _VolumetricLight.w : float(0.0);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					bvec4 u_xlatb6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat17;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat36;
					int u_xlati37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat5.xyz = u_xlat12.xyz;
					    u_xlat36 = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat7.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat8.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat9.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					        u_xlatb6 = lessThan(u_xlat6, unity_ShadowSplitSqRadii);
					        u_xlat7.x = u_xlatb6.x ? float(1.0) : 0.0;
					        u_xlat7.y = u_xlatb6.y ? float(1.0) : 0.0;
					        u_xlat7.z = u_xlatb6.z ? float(1.0) : 0.0;
					        u_xlat7.w = u_xlatb6.w ? float(1.0) : 0.0;
					;
					        u_xlat6.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
					        u_xlat6.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
					        u_xlat6.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat7.yzw;
					        u_xlat7.yzw = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat38 = dot(u_xlat7, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb6.x = u_xlat38<4.0;
					        u_xlat17.xyz = u_xlat5.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat17.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat5.xxx + u_xlat17.xyz;
					        u_xlat17.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat5.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat17.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat5.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat5.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat5.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat5.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat5.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat5.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat5.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat5.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat5.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat7.yyy * u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xxx + u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat9.xyz * u_xlat7.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat10.xyz * u_xlat7.www + u_xlat17.xyz;
					        u_xlat38 = (-u_xlat38) + u_xlat17.z;
					        u_xlat38 = u_xlat38 + 1.0;
					        vec3 txVec0 = vec3(u_xlat17.xy,u_xlat38);
					        u_xlat38 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat38 = (u_xlatb6.x) ? u_xlat38 : 1.0;
					        u_xlat38 = u_xlat38 * u_xlat13 + _LightShadowData.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat6.x = u_xlat6.x + (-_NoiseData.z);
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat6.x * _NoiseData.y;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat17.x = u_xlat5.y + _HeightFog.x;
					        u_xlat17.x = (-u_xlat17.x) * _HeightFog.y;
					        u_xlat17.x = u_xlat17.x * 1.44269502;
					        u_xlat17.x = exp2(u_xlat17.x);
					        u_xlat6.x = u_xlat17.x * u_xlat6.x;
					        u_xlat17.x = u_xlat24.x * u_xlat6.x;
					        u_xlat36 = u_xlat24.y * u_xlat6.x + u_xlat36;
					        u_xlat38 = u_xlat38 * u_xlat17.x;
					        u_xlat6.x = u_xlat36 * -1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat4.xyz = vec3(u_xlat38) * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat5.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					bvec4 u_xlatb6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat17;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat36;
					int u_xlati37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat5.xyz = u_xlat12.xyz;
					    u_xlat36 = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat7.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat8.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat9.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					        u_xlatb6 = lessThan(u_xlat6, unity_ShadowSplitSqRadii);
					        u_xlat7.x = u_xlatb6.x ? float(1.0) : 0.0;
					        u_xlat7.y = u_xlatb6.y ? float(1.0) : 0.0;
					        u_xlat7.z = u_xlatb6.z ? float(1.0) : 0.0;
					        u_xlat7.w = u_xlatb6.w ? float(1.0) : 0.0;
					;
					        u_xlat6.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
					        u_xlat6.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
					        u_xlat6.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat7.yzw;
					        u_xlat7.yzw = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat38 = dot(u_xlat7, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb6.x = u_xlat38<4.0;
					        u_xlat17.xyz = u_xlat5.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat17.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat5.xxx + u_xlat17.xyz;
					        u_xlat17.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat5.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat17.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat5.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat5.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat5.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat5.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat5.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat5.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat5.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat5.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat5.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat7.yyy * u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xxx + u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat9.xyz * u_xlat7.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat10.xyz * u_xlat7.www + u_xlat17.xyz;
					        u_xlat38 = (-u_xlat38) + u_xlat17.z;
					        u_xlat38 = u_xlat38 + 1.0;
					        vec3 txVec0 = vec3(u_xlat17.xy,u_xlat38);
					        u_xlat38 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat38 = (u_xlatb6.x) ? u_xlat38 : 1.0;
					        u_xlat38 = u_xlat38 * u_xlat13 + _LightShadowData.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat6.x = u_xlat6.x + (-_NoiseData.z);
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat6.x * _NoiseData.y;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat17.x = u_xlat5.y + _HeightFog.x;
					        u_xlat17.x = (-u_xlat17.x) * _HeightFog.y;
					        u_xlat17.x = u_xlat17.x * 1.44269502;
					        u_xlat17.x = exp2(u_xlat17.x);
					        u_xlat6.x = u_xlat17.x * u_xlat6.x;
					        u_xlat17.x = u_xlat24.x * u_xlat6.x;
					        u_xlat36 = u_xlat24.y * u_xlat6.x + u_xlat36;
					        u_xlat38 = u_xlat38 * u_xlat17.x;
					        u_xlat6.x = u_xlat36 * -1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat4.xyz = vec3(u_xlat38) * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat5.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRECTIONAL_COOKIE" "SHADOWS_DEPTH" "NOISE" "HEIGHT_FOG" }
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
						vec4 unused_0_0[3];
						vec4 _LightDir;
						vec4 unused_0_2;
						vec4 _LightColor;
						vec4 unused_0_4[22];
						vec4 _VolumetricLight;
						vec4 _MieG;
						vec4 _NoiseData;
						vec4 _NoiseVelocity;
						vec4 _HeightFog;
						float _MaxRayLength;
						int _SampleCount;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					layout(std140) uniform UnityShadows {
						vec4 unity_ShadowSplitSpheres[4];
						vec4 unused_2_1[3];
						vec4 unity_ShadowSplitSqRadii;
						vec4 unused_2_3[3];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_2_5[12];
						vec4 _LightShadowData;
						vec4 unused_2_7;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _DitherTexture;
					uniform  sampler3D _NoiseTexture;
					uniform  sampler2D _CascadeShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_CascadeShadowMapTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					bvec4 u_xlatb6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat17;
					float u_xlat22;
					vec2 u_xlat24;
					float u_xlat36;
					int u_xlati37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat11.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat1 = dot(u_xlat11.xyz, u_xlat11.xyz);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat11.xyz = u_xlat11.xyz / vec3(u_xlat1);
					    u_xlat1 = min(u_xlat1, _MaxRayLength);
					    u_xlat12.xy = floor(hlslcc_FragCoord.xy);
					    u_xlat12.xy = u_xlat12.xy * vec2(0.125, 0.125);
					    u_xlatb2.xy = greaterThanEqual(u_xlat12.xyxx, (-u_xlat12.xyxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat12.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat12;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					        u_xlat12 = hlslcc_movcTemp;
					    }
					    u_xlat12.xy = u_xlat12.xy + vec2(0.0625, 0.0625);
					    u_xlat2 = texture(_DitherTexture, u_xlat12.xy);
					    u_xlat12.x = float(_SampleCount);
					    u_xlat1 = u_xlat1 / u_xlat12.x;
					    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat1);
					    u_xlat12.xyz = u_xlat12.xyz * u_xlat2.www + _WorldSpaceCameraPos.xyz;
					    u_xlat2.x = dot(_LightDir.xyz, (-u_xlat11.xyz));
					    u_xlat13 = (-_LightShadowData.x) + 1.0;
					    u_xlat3.xz = _NoiseVelocity.xy * _Time.yy;
					    u_xlat24.xy = vec2(u_xlat1) * _VolumetricLight.xy;
					    u_xlat3.y = 0.0;
					    u_xlat5.xyz = u_xlat12.xyz;
					    u_xlat36 = 0.0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[0].xyz);
					        u_xlat7.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[1].xyz);
					        u_xlat8.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[2].xyz);
					        u_xlat9.xyz = u_xlat5.xyz + (-unity_ShadowSplitSpheres[3].xyz);
					        u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
					        u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
					        u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
					        u_xlatb6 = lessThan(u_xlat6, unity_ShadowSplitSqRadii);
					        u_xlat7.x = u_xlatb6.x ? float(1.0) : 0.0;
					        u_xlat7.y = u_xlatb6.y ? float(1.0) : 0.0;
					        u_xlat7.z = u_xlatb6.z ? float(1.0) : 0.0;
					        u_xlat7.w = u_xlatb6.w ? float(1.0) : 0.0;
					;
					        u_xlat6.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
					        u_xlat6.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
					        u_xlat6.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat7.yzw;
					        u_xlat7.yzw = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					        u_xlat38 = dot(u_xlat7, vec4(1.0, 1.0, 1.0, 1.0));
					        u_xlatb6.x = u_xlat38<4.0;
					        u_xlat17.xyz = u_xlat5.yyy * unity_WorldToShadow[1 / 4][1 % 4].xyz;
					        u_xlat17.xyz = unity_WorldToShadow[0 / 4][0 % 4].xyz * u_xlat5.xxx + u_xlat17.xyz;
					        u_xlat17.xyz = unity_WorldToShadow[2 / 4][2 % 4].xyz * u_xlat5.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat17.xyz + unity_WorldToShadow[3 / 4][3 % 4].xyz;
					        u_xlat8.xyz = u_xlat5.yyy * unity_WorldToShadow[5 / 4][5 % 4].xyz;
					        u_xlat8.xyz = unity_WorldToShadow[4 / 4][4 % 4].xyz * u_xlat5.xxx + u_xlat8.xyz;
					        u_xlat8.xyz = unity_WorldToShadow[6 / 4][6 % 4].xyz * u_xlat5.zzz + u_xlat8.xyz;
					        u_xlat8.xyz = u_xlat8.xyz + unity_WorldToShadow[7 / 4][7 % 4].xyz;
					        u_xlat9.xyz = u_xlat5.yyy * unity_WorldToShadow[9 / 4][9 % 4].xyz;
					        u_xlat9.xyz = unity_WorldToShadow[8 / 4][8 % 4].xyz * u_xlat5.xxx + u_xlat9.xyz;
					        u_xlat9.xyz = unity_WorldToShadow[10 / 4][10 % 4].xyz * u_xlat5.zzz + u_xlat9.xyz;
					        u_xlat9.xyz = u_xlat9.xyz + unity_WorldToShadow[11 / 4][11 % 4].xyz;
					        u_xlat10.xyz = u_xlat5.yyy * unity_WorldToShadow[13 / 4][13 % 4].xyz;
					        u_xlat10.xyz = unity_WorldToShadow[12 / 4][12 % 4].xyz * u_xlat5.xxx + u_xlat10.xyz;
					        u_xlat10.xyz = unity_WorldToShadow[14 / 4][14 % 4].xyz * u_xlat5.zzz + u_xlat10.xyz;
					        u_xlat10.xyz = u_xlat10.xyz + unity_WorldToShadow[15 / 4][15 % 4].xyz;
					        u_xlat8.xyz = u_xlat7.yyy * u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat17.xyz * u_xlat7.xxx + u_xlat8.xyz;
					        u_xlat17.xyz = u_xlat9.xyz * u_xlat7.zzz + u_xlat17.xyz;
					        u_xlat17.xyz = u_xlat10.xyz * u_xlat7.www + u_xlat17.xyz;
					        u_xlat38 = (-u_xlat38) + u_xlat17.z;
					        u_xlat38 = u_xlat38 + 1.0;
					        vec3 txVec0 = vec3(u_xlat17.xy,u_xlat38);
					        u_xlat38 = textureLod(hlslcc_zcmp_CascadeShadowMapTexture, txVec0, 0.0);
					        u_xlat38 = (u_xlatb6.x) ? u_xlat38 : 1.0;
					        u_xlat38 = u_xlat38 * u_xlat13 + _LightShadowData.x;
					        u_xlat6.xyz = u_xlat5.xyz * _NoiseData.xxx + u_xlat3.xyz;
					        u_xlat6.xyz = fract(u_xlat6.xyz);
					        u_xlat6 = texture(_NoiseTexture, u_xlat6.xyz);
					        u_xlat6.x = u_xlat6.x + (-_NoiseData.z);
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat6.x * _NoiseData.y;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat17.x = u_xlat5.y + _HeightFog.x;
					        u_xlat17.x = (-u_xlat17.x) * _HeightFog.y;
					        u_xlat17.x = u_xlat17.x * 1.44269502;
					        u_xlat17.x = exp2(u_xlat17.x);
					        u_xlat6.x = u_xlat17.x * u_xlat6.x;
					        u_xlat17.x = u_xlat24.x * u_xlat6.x;
					        u_xlat36 = u_xlat24.y * u_xlat6.x + u_xlat36;
					        u_xlat38 = u_xlat38 * u_xlat17.x;
					        u_xlat6.x = u_xlat36 * -1.44269502;
					        u_xlat6.x = exp2(u_xlat6.x);
					        u_xlat4.xyz = vec3(u_xlat38) * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat5.xyz = u_xlat11.xyz * vec3(u_xlat1) + u_xlat5.xyz;
					    }
					    u_xlat11.x = (-_MieG.z) * u_xlat2.x + _MieG.y;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 1.5;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = _MieG.x / u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * _MieG.w;
					    u_xlat11.xyz = u_xlat11.xxx * u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.xyz * _LightColor.xyz;
					    SV_Target0.xyz = max(u_xlat11.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat11.x = u_xlat36 * -1.44269502;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlatb0 = 0.999998987<u_xlat0.x;
					    u_xlat22 = (-u_xlat11.x) + 1.0;
					    u_xlat22 = _VolumetricLight.w * u_xlat22 + u_xlat11.x;
					    SV_Target0.w = (u_xlatb0) ? u_xlat22 : u_xlat11.x;
					    return;
					}"
				}
			}
		}
	}
}