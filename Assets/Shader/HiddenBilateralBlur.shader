Shader "Hidden/BilateralBlur" {
	Properties {
		_MainTex ("Texture", any) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 57047
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat6;
					float u_xlat7;
					float u_xlat15;
					float u_xlat16;
					float u_xlat17;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-5, 0));
					    u_xlat1 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-6, 0));
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-7, 0));
					    u_xlat4 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(-7, 0));
					    u_xlat15 = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat4 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat16 = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
					    u_xlat16 = float(1.0) / u_xlat16;
					    u_xlat15 = (-u_xlat15) + u_xlat16;
					    u_xlat15 = abs(u_xlat15) * 0.5;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = u_xlat15 * -1.44269502;
					    u_xlat15 = exp2(u_xlat15);
					    u_xlat18 = u_xlat15 * 0.0277537704;
					    u_xlat15 = u_xlat15 * 0.0277537704 + 0.0854876339;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat18);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0854876339, 0.0854876339, 0.0854876339) + u_xlat3.xyz;
					    SV_Target0.w = u_xlat2.w;
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(-6, 0));
					    u_xlat17 = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat17 = float(1.0) / u_xlat17;
					    u_xlat17 = u_xlat16 + (-u_xlat17);
					    u_xlat17 = abs(u_xlat17) * 0.5;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat17 = u_xlat17 * -1.44269502;
					    u_xlat17 = exp2(u_xlat17);
					    u_xlat3.x = u_xlat17 * 0.03740637;
					    u_xlat15 = u_xlat17 * 0.03740637 + u_xlat15;
					    u_xlat1.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(-5, 0));
					    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat2.x = u_xlat16 + (-u_xlat2.x);
					    u_xlat2.x = abs(u_xlat2.x) * 0.5;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * -1.44269502;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat7 = u_xlat2.x * 0.048153419;
					    u_xlat15 = u_xlat2.x * 0.048153419 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat7) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-4, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(-4, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0592061132;
					    u_xlat15 = u_xlat1.x * 0.0592061132 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-3, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(-3, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0695286617;
					    u_xlat15 = u_xlat1.x * 0.0695286617 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-2, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(-2, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0779864416;
					    u_xlat15 = u_xlat1.x * 0.0779864416 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-1, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(-1, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0835472643;
					    u_xlat15 = u_xlat1.x * 0.0835472643 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(1, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(1, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0835472643;
					    u_xlat15 = u_xlat1.x * 0.0835472643 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(2, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(2, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0779864416;
					    u_xlat15 = u_xlat1.x * 0.0779864416 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(3, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(3, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0695286617;
					    u_xlat15 = u_xlat1.x * 0.0695286617 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(4, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(4, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0592061132;
					    u_xlat15 = u_xlat1.x * 0.0592061132 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(5, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(5, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.048153419;
					    u_xlat15 = u_xlat1.x * 0.048153419 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(6, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(6, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.03740637;
					    u_xlat15 = u_xlat1.x * 0.03740637 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(7, 0));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(7, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0277537704;
					    u_xlat15 = u_xlat1.x * 0.0277537704 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat15);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 68448
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat6;
					float u_xlat7;
					float u_xlat15;
					float u_xlat16;
					float u_xlat17;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -5));
					    u_xlat1 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -6));
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -7));
					    u_xlat4 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, -7));
					    u_xlat15 = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat4 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat16 = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
					    u_xlat16 = float(1.0) / u_xlat16;
					    u_xlat15 = (-u_xlat15) + u_xlat16;
					    u_xlat15 = abs(u_xlat15) * 0.5;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = u_xlat15 * -1.44269502;
					    u_xlat15 = exp2(u_xlat15);
					    u_xlat18 = u_xlat15 * 0.0277537704;
					    u_xlat15 = u_xlat15 * 0.0277537704 + 0.0854876339;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat18);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0854876339, 0.0854876339, 0.0854876339) + u_xlat3.xyz;
					    SV_Target0.w = u_xlat2.w;
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, -6));
					    u_xlat17 = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat17 = float(1.0) / u_xlat17;
					    u_xlat17 = u_xlat16 + (-u_xlat17);
					    u_xlat17 = abs(u_xlat17) * 0.5;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat17 = u_xlat17 * -1.44269502;
					    u_xlat17 = exp2(u_xlat17);
					    u_xlat3.x = u_xlat17 * 0.03740637;
					    u_xlat15 = u_xlat17 * 0.03740637 + u_xlat15;
					    u_xlat1.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, -5));
					    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat2.x = u_xlat16 + (-u_xlat2.x);
					    u_xlat2.x = abs(u_xlat2.x) * 0.5;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * -1.44269502;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat7 = u_xlat2.x * 0.048153419;
					    u_xlat15 = u_xlat2.x * 0.048153419 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat7) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -4));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, -4));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0592061132;
					    u_xlat15 = u_xlat1.x * 0.0592061132 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -3));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, -3));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0695286617;
					    u_xlat15 = u_xlat1.x * 0.0695286617 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -2));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, -2));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0779864416;
					    u_xlat15 = u_xlat1.x * 0.0779864416 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -1));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, -1));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0835472643;
					    u_xlat15 = u_xlat1.x * 0.0835472643 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 1));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, 1));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0835472643;
					    u_xlat15 = u_xlat1.x * 0.0835472643 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 2));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, 2));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0779864416;
					    u_xlat15 = u_xlat1.x * 0.0779864416 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 3));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, 3));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0695286617;
					    u_xlat15 = u_xlat1.x * 0.0695286617 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 4));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, 4));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0592061132;
					    u_xlat15 = u_xlat1.x * 0.0592061132 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 5));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, 5));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.048153419;
					    u_xlat15 = u_xlat1.x * 0.048153419 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 6));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, 6));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.03740637;
					    u_xlat15 = u_xlat1.x * 0.03740637 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 7));
					    u_xlat3 = textureOffset(_CameraDepthTexture, vs_TEXCOORD0.xy, ivec2(0, 7));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat16;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 0.0277537704;
					    u_xlat15 = u_xlat1.x * 0.0277537704 + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat15);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 156271
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _HalfResDepthBuffer;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-4, 0));
					    u_xlat1 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-5, 0));
					    u_xlat2 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-5, 0));
					    u_xlat12 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat2 = texture(_HalfResDepthBuffer, vs_TEXCOORD0.xy);
					    u_xlat13 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat12 = (-u_xlat12) + u_xlat13;
					    u_xlat12 = abs(u_xlat12) * 0.5;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * -1.44269502;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat2.x = u_xlat12 * 0.0388552807;
					    u_xlat12 = u_xlat12 * 0.0388552807 + 0.119682692;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.119682692, 0.119682692, 0.119682692) + u_xlat1.xyz;
					    SV_Target0.w = u_xlat2.w;
					    u_xlat2 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-4, 0));
					    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat2.x = u_xlat13 + (-u_xlat2.x);
					    u_xlat2.x = abs(u_xlat2.x) * 0.5;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * -1.44269502;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat6 = u_xlat2.x * 0.058255814;
					    u_xlat12 = u_xlat2.x * 0.058255814 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-3, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-3, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0798255801;
					    u_xlat12 = u_xlat1.x * 0.0798255801 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-2, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-2, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0999673903;
					    u_xlat12 = u_xlat1.x * 0.0999673903 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-1, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-1, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.114416353;
					    u_xlat12 = u_xlat1.x * 0.114416353 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(1, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(1, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.114416353;
					    u_xlat12 = u_xlat1.x * 0.114416353 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(2, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(2, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0999673903;
					    u_xlat12 = u_xlat1.x * 0.0999673903 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(3, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(3, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0798255801;
					    u_xlat12 = u_xlat1.x * 0.0798255801 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(4, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(4, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.058255814;
					    u_xlat12 = u_xlat1.x * 0.058255814 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(5, 0));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(5, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0388552807;
					    u_xlat12 = u_xlat1.x * 0.0388552807 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat12);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 218870
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _HalfResDepthBuffer;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -4));
					    u_xlat1 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -5));
					    u_xlat2 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -5));
					    u_xlat12 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat2 = texture(_HalfResDepthBuffer, vs_TEXCOORD0.xy);
					    u_xlat13 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat12 = (-u_xlat12) + u_xlat13;
					    u_xlat12 = abs(u_xlat12) * 0.5;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * -1.44269502;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat2.x = u_xlat12 * 0.0388552807;
					    u_xlat12 = u_xlat12 * 0.0388552807 + 0.119682692;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.119682692, 0.119682692, 0.119682692) + u_xlat1.xyz;
					    SV_Target0.w = u_xlat2.w;
					    u_xlat2 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -4));
					    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat2.x = u_xlat13 + (-u_xlat2.x);
					    u_xlat2.x = abs(u_xlat2.x) * 0.5;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * -1.44269502;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat6 = u_xlat2.x * 0.058255814;
					    u_xlat12 = u_xlat2.x * 0.058255814 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -3));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -3));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0798255801;
					    u_xlat12 = u_xlat1.x * 0.0798255801 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -2));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -2));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0999673903;
					    u_xlat12 = u_xlat1.x * 0.0999673903 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -1));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -1));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.114416353;
					    u_xlat12 = u_xlat1.x * 0.114416353 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 1));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 1));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.114416353;
					    u_xlat12 = u_xlat1.x * 0.114416353 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 2));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 2));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0999673903;
					    u_xlat12 = u_xlat1.x * 0.0999673903 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 3));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 3));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0798255801;
					    u_xlat12 = u_xlat1.x * 0.0798255801 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 4));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 4));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.058255814;
					    u_xlat12 = u_xlat1.x * 0.058255814 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 5));
					    u_xlat3 = textureOffset(_HalfResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 5));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0388552807;
					    u_xlat12 = u_xlat1.x * 0.0388552807 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat12);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 299131
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out float SV_Target0;
					vec4 u_xlat0;
					ivec2 u_xlati0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = hlslcc_FragCoord.xyxy + hlslcc_FragCoord.xyxy;
					    u_xlatb0 = greaterThanEqual(u_xlat0, (-u_xlat0.zwzw));
					    u_xlat0.x = (u_xlatb0.x) ? float(2.0) : float(-2.0);
					    u_xlat0.y = (u_xlatb0.y) ? float(2.0) : float(-2.0);
					    u_xlat0.z = (u_xlatb0.z) ? float(0.5) : float(-0.5);
					    u_xlat0.w = (u_xlatb0.w) ? float(0.5) : float(-0.5);
					    u_xlat4.xy = u_xlat0.zw * hlslcc_FragCoord.xy;
					    u_xlat4.xy = fract(u_xlat4.xy);
					    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
					    u_xlati0.xy = ivec2(u_xlat0.xy);
					    u_xlati0.x = u_xlati0.y + u_xlati0.x;
					    u_xlatb0.x = u_xlati0.x==1;
					    u_xlat1 = textureGather(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat2.xy = min(u_xlat1.yw, u_xlat1.xz);
					    u_xlat1.xy = max(u_xlat1.yw, u_xlat1.xz);
					    u_xlat6 = max(u_xlat1.y, u_xlat1.x);
					    u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
					    SV_Target0 = (u_xlatb0.x) ? u_xlat2.x : u_xlat6;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 346751
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
						vec4 unused_0_0[3];
						vec4 _HalfResDepthBuffer_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat4;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = (-_HalfResDepthBuffer_TexelSize.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat4.x = _HalfResDepthBuffer_TexelSize.x;
					    u_xlat4.y = 0.0;
					    vs_TEXCOORD3.xy = u_xlat4.xy + u_xlat0.xy;
					    u_xlat1.x = 0.0;
					    u_xlat1.y = _HalfResDepthBuffer_TexelSize.y;
					    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat1.xy;
					    vs_TEXCOORD4.xy = u_xlat0.xy + _HalfResDepthBuffer_TexelSize.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _HalfResDepthBuffer;
					uniform  sampler2D _HalfResColor;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1 = texture(_HalfResDepthBuffer, vs_TEXCOORD1.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat4;
					    u_xlat2 = texture(_HalfResDepthBuffer, vs_TEXCOORD3.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat1.y = float(1.0) / u_xlat4;
					    u_xlat2 = texture(_HalfResDepthBuffer, vs_TEXCOORD2.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat1.z = float(1.0) / u_xlat4;
					    u_xlat2 = texture(_HalfResDepthBuffer, vs_TEXCOORD4.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat1.w = float(1.0) / u_xlat4;
					    u_xlat0 = (-u_xlat0.xxxx) + u_xlat1.zxyw;
					    u_xlat1.x = dot(abs(u_xlat0.yzxw), vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb1 = u_xlat1.x<1.5;
					    if(u_xlatb1){
					        SV_Target0 = texture(_HalfResColor, vs_TEXCOORD0.xy);
					    }
					    if(!u_xlatb1){
					        u_xlatb1 = abs(u_xlat0.z)<abs(u_xlat0.y);
					        u_xlat2.x = abs(u_xlat0.z);
					        u_xlat2.yz = vs_TEXCOORD3.xy;
					        u_xlat3.x = abs(u_xlat0.y);
					        u_xlat3.yz = vs_TEXCOORD1.xy;
					        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat2.xyz : u_xlat3.xyz;
					        u_xlatb13 = abs(u_xlat0.x)<u_xlat1.x;
					        u_xlat0.x = abs(u_xlat0.x);
					        u_xlat0.yz = vs_TEXCOORD2.xy;
					        u_xlat0.xyz = (bool(u_xlatb13)) ? u_xlat0.xyz : u_xlat1.xyz;
					        u_xlatb0 = abs(u_xlat0.w)<u_xlat0.x;
					        u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : u_xlat0.yz;
					        SV_Target0 = texture(_HalfResColor, u_xlat0.xy);
					    }
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 449503
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					
					#version 430
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
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_LOCATION(0) uniform  sampler2D _HalfResDepthBuffer;
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out float SV_Target0;
					vec4 u_xlat0;
					ivec2 u_xlati0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = hlslcc_FragCoord.xyxy + hlslcc_FragCoord.xyxy;
					    u_xlatb0 = greaterThanEqual(u_xlat0, (-u_xlat0.zwzw));
					    u_xlat0.x = (u_xlatb0.x) ? float(2.0) : float(-2.0);
					    u_xlat0.y = (u_xlatb0.y) ? float(2.0) : float(-2.0);
					    u_xlat0.z = (u_xlatb0.z) ? float(0.5) : float(-0.5);
					    u_xlat0.w = (u_xlatb0.w) ? float(0.5) : float(-0.5);
					    u_xlat4.xy = u_xlat0.zw * hlslcc_FragCoord.xy;
					    u_xlat4.xy = fract(u_xlat4.xy);
					    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
					    u_xlati0.xy = ivec2(u_xlat0.xy);
					    u_xlati0.x = u_xlati0.y + u_xlati0.x;
					    u_xlatb0.x = u_xlati0.x==1;
					    u_xlat1 = textureGather(_HalfResDepthBuffer, vs_TEXCOORD0.xy);
					    u_xlat2.xy = min(u_xlat1.yw, u_xlat1.xz);
					    u_xlat1.xy = max(u_xlat1.yw, u_xlat1.xz);
					    u_xlat6 = max(u_xlat1.y, u_xlat1.x);
					    u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
					    SV_Target0 = (u_xlatb0.x) ? u_xlat2.x : u_xlat6;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 516784
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
						vec4 unused_0_0[4];
						vec4 _QuarterResDepthBuffer_TexelSize;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat4;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.xy = (-_QuarterResDepthBuffer_TexelSize.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    u_xlat4.x = _QuarterResDepthBuffer_TexelSize.x;
					    u_xlat4.y = 0.0;
					    vs_TEXCOORD3.xy = u_xlat4.xy + u_xlat0.xy;
					    u_xlat1.x = 0.0;
					    u_xlat1.y = _QuarterResDepthBuffer_TexelSize.y;
					    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat1.xy;
					    vs_TEXCOORD4.xy = u_xlat0.xy + _QuarterResDepthBuffer_TexelSize.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _QuarterResDepthBuffer;
					uniform  sampler2D _QuarterResColor;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1 = texture(_QuarterResDepthBuffer, vs_TEXCOORD1.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat4;
					    u_xlat2 = texture(_QuarterResDepthBuffer, vs_TEXCOORD3.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat1.y = float(1.0) / u_xlat4;
					    u_xlat2 = texture(_QuarterResDepthBuffer, vs_TEXCOORD2.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat1.z = float(1.0) / u_xlat4;
					    u_xlat2 = texture(_QuarterResDepthBuffer, vs_TEXCOORD4.xy);
					    u_xlat4 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat1.w = float(1.0) / u_xlat4;
					    u_xlat0 = (-u_xlat0.xxxx) + u_xlat1.zxyw;
					    u_xlat1.x = dot(abs(u_xlat0.yzxw), vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlatb1 = u_xlat1.x<1.5;
					    if(u_xlatb1){
					        SV_Target0 = texture(_QuarterResColor, vs_TEXCOORD0.xy);
					    }
					    if(!u_xlatb1){
					        u_xlatb1 = abs(u_xlat0.z)<abs(u_xlat0.y);
					        u_xlat2.x = abs(u_xlat0.z);
					        u_xlat2.yz = vs_TEXCOORD3.xy;
					        u_xlat3.x = abs(u_xlat0.y);
					        u_xlat3.yz = vs_TEXCOORD1.xy;
					        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat2.xyz : u_xlat3.xyz;
					        u_xlatb13 = abs(u_xlat0.x)<u_xlat1.x;
					        u_xlat0.x = abs(u_xlat0.x);
					        u_xlat0.yz = vs_TEXCOORD2.xy;
					        u_xlat0.xyz = (bool(u_xlatb13)) ? u_xlat0.xyz : u_xlat1.xyz;
					        u_xlatb0 = abs(u_xlat0.w)<u_xlat0.x;
					        u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : u_xlat0.yz;
					        SV_Target0 = texture(_QuarterResColor, u_xlat0.xy);
					    }
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 525237
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _QuarterResDepthBuffer;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-5, 0));
					    u_xlat1 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-6, 0));
					    u_xlat2 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-6, 0));
					    u_xlat12 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat2 = texture(_QuarterResDepthBuffer, vs_TEXCOORD0.xy);
					    u_xlat13 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat12 = (-u_xlat12) + u_xlat13;
					    u_xlat12 = abs(u_xlat12) * 0.5;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * -1.44269502;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat2.x = u_xlat12 * 0.0323794;
					    u_xlat12 = u_xlat12 * 0.0323794 + 0.0997355729;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.0997355729, 0.0997355729, 0.0997355729) + u_xlat1.xyz;
					    SV_Target0.w = u_xlat2.w;
					    u_xlat2 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-5, 0));
					    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat2.x = u_xlat13 + (-u_xlat2.x);
					    u_xlat2.x = abs(u_xlat2.x) * 0.5;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * -1.44269502;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat6 = u_xlat2.x * 0.0456622727;
					    u_xlat12 = u_xlat2.x * 0.0456622727 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-4, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-4, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0604926832;
					    u_xlat12 = u_xlat1.x * 0.0604926832 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-3, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-3, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0752843618;
					    u_xlat12 = u_xlat1.x * 0.0752843618 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-2, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-2, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0880163312;
					    u_xlat12 = u_xlat1.x * 0.0880163312 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(-1, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(-1, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.096667029;
					    u_xlat12 = u_xlat1.x * 0.096667029 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(1, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(1, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.096667029;
					    u_xlat12 = u_xlat1.x * 0.096667029 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(2, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(2, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0880163312;
					    u_xlat12 = u_xlat1.x * 0.0880163312 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(3, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(3, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0752843618;
					    u_xlat12 = u_xlat1.x * 0.0752843618 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(4, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(4, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0604926832;
					    u_xlat12 = u_xlat1.x * 0.0604926832 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(5, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(5, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0456622727;
					    u_xlat12 = u_xlat1.x * 0.0456622727 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(6, 0));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(6, 0));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0323794;
					    u_xlat12 = u_xlat1.x * 0.0323794 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat12);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 597659
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _QuarterResDepthBuffer;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat5;
					float u_xlat6;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -5));
					    u_xlat1 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -6));
					    u_xlat2 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -6));
					    u_xlat12 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat2 = texture(_QuarterResDepthBuffer, vs_TEXCOORD0.xy);
					    u_xlat13 = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat12 = (-u_xlat12) + u_xlat13;
					    u_xlat12 = abs(u_xlat12) * 0.5;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * -1.44269502;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat2.x = u_xlat12 * 0.0323794;
					    u_xlat12 = u_xlat12 * 0.0323794 + 0.0997355729;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.0997355729, 0.0997355729, 0.0997355729) + u_xlat1.xyz;
					    SV_Target0.w = u_xlat2.w;
					    u_xlat2 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -5));
					    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat2.x = u_xlat13 + (-u_xlat2.x);
					    u_xlat2.x = abs(u_xlat2.x) * 0.5;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * -1.44269502;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat6 = u_xlat2.x * 0.0456622727;
					    u_xlat12 = u_xlat2.x * 0.0456622727 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -4));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -4));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0604926832;
					    u_xlat12 = u_xlat1.x * 0.0604926832 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -3));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -3));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0752843618;
					    u_xlat12 = u_xlat1.x * 0.0752843618 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -2));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -2));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0880163312;
					    u_xlat12 = u_xlat1.x * 0.0880163312 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, -1));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, -1));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.096667029;
					    u_xlat12 = u_xlat1.x * 0.096667029 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 1));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 1));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.096667029;
					    u_xlat12 = u_xlat1.x * 0.096667029 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 2));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 2));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0880163312;
					    u_xlat12 = u_xlat1.x * 0.0880163312 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 3));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 3));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0752843618;
					    u_xlat12 = u_xlat1.x * 0.0752843618 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 4));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 4));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0604926832;
					    u_xlat12 = u_xlat1.x * 0.0604926832 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 5));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 5));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0456622727;
					    u_xlat12 = u_xlat1.x * 0.0456622727 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat2 = textureOffset(_MainTex, vs_TEXCOORD0.xy, ivec2(0, 6));
					    u_xlat3 = textureOffset(_QuarterResDepthBuffer, vs_TEXCOORD0.xy, ivec2(0, 6));
					    u_xlat1.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat13;
					    u_xlat1.x = abs(u_xlat1.x) * 0.5;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * -1.44269502;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat5 = u_xlat1.x * 0.0323794;
					    u_xlat12 = u_xlat1.x * 0.0323794 + u_xlat12;
					    u_xlat0.xyz = vec3(u_xlat5) * u_xlat2.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat12);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 717619
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
						vec4 unused_0_0[2];
						vec4 _CameraDepthTexture_TexelSize;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xz = _CameraDepthTexture_TexelSize.xy;
					    u_xlat1.xy = (-_CameraDepthTexture_TexelSize.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    u_xlat1.w = u_xlat0.z + u_xlat1.y;
					    phase0_Output0_0 = u_xlat1.xyxw;
					    u_xlat0.y = 0.0;
					    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat1.xy;
					    vs_TEXCOORD3.xy = u_xlat1.xy + _CameraDepthTexture_TexelSize.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD1 = phase0_Output0_0.zw;
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					layout(location = 0) out float SV_Target0;
					vec4 u_xlat0;
					ivec2 u_xlati0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = hlslcc_FragCoord.xyxy + hlslcc_FragCoord.xyxy;
					    u_xlatb0 = greaterThanEqual(u_xlat0, (-u_xlat0.zwzw));
					    u_xlat0.x = (u_xlatb0.x) ? float(2.0) : float(-2.0);
					    u_xlat0.y = (u_xlatb0.y) ? float(2.0) : float(-2.0);
					    u_xlat0.z = (u_xlatb0.z) ? float(0.5) : float(-0.5);
					    u_xlat0.w = (u_xlatb0.w) ? float(0.5) : float(-0.5);
					    u_xlat6.xy = u_xlat0.zw * hlslcc_FragCoord.xy;
					    u_xlat6.xy = fract(u_xlat6.xy);
					    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
					    u_xlati0.xy = ivec2(u_xlat0.xy);
					    u_xlati0.x = u_xlati0.y + u_xlati0.x;
					    u_xlatb0.x = u_xlati0.x==1;
					    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
					    u_xlat2 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat3 = min(u_xlat1.x, u_xlat2.x);
					    u_xlat6.x = max(u_xlat1.x, u_xlat2.x);
					    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD2.xy);
					    u_xlat2 = texture(_CameraDepthTexture, vs_TEXCOORD3.xy);
					    u_xlat9 = min(u_xlat1.x, u_xlat2.x);
					    u_xlat1.x = max(u_xlat1.x, u_xlat2.x);
					    u_xlat6.x = max(u_xlat6.x, u_xlat1.x);
					    u_xlat3 = min(u_xlat9, u_xlat3);
					    SV_Target0 = (u_xlatb0.x) ? u_xlat3 : u_xlat6.x;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 731912
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
						vec4 unused_0_0[3];
						vec4 _HalfResDepthBuffer_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xz = _HalfResDepthBuffer_TexelSize.xy;
					    u_xlat1.xy = (-_HalfResDepthBuffer_TexelSize.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    u_xlat1.w = u_xlat0.z + u_xlat1.y;
					    phase0_Output0_0 = u_xlat1.xyxw;
					    u_xlat0.y = 0.0;
					    vs_TEXCOORD2.xy = u_xlat0.xy + u_xlat1.xy;
					    vs_TEXCOORD3.xy = u_xlat1.xy + _HalfResDepthBuffer_TexelSize.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD1 = phase0_Output0_0.zw;
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _HalfResDepthBuffer;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					layout(location = 0) out float SV_Target0;
					vec4 u_xlat0;
					ivec2 u_xlati0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = hlslcc_FragCoord.xyxy + hlslcc_FragCoord.xyxy;
					    u_xlatb0 = greaterThanEqual(u_xlat0, (-u_xlat0.zwzw));
					    u_xlat0.x = (u_xlatb0.x) ? float(2.0) : float(-2.0);
					    u_xlat0.y = (u_xlatb0.y) ? float(2.0) : float(-2.0);
					    u_xlat0.z = (u_xlatb0.z) ? float(0.5) : float(-0.5);
					    u_xlat0.w = (u_xlatb0.w) ? float(0.5) : float(-0.5);
					    u_xlat6.xy = u_xlat0.zw * hlslcc_FragCoord.xy;
					    u_xlat6.xy = fract(u_xlat6.xy);
					    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
					    u_xlati0.xy = ivec2(u_xlat0.xy);
					    u_xlati0.x = u_xlati0.y + u_xlati0.x;
					    u_xlatb0.x = u_xlati0.x==1;
					    u_xlat1 = texture(_HalfResDepthBuffer, vs_TEXCOORD0.xy);
					    u_xlat2 = texture(_HalfResDepthBuffer, vs_TEXCOORD1.xy);
					    u_xlat3 = min(u_xlat1.x, u_xlat2.x);
					    u_xlat6.x = max(u_xlat1.x, u_xlat2.x);
					    u_xlat1 = texture(_HalfResDepthBuffer, vs_TEXCOORD2.xy);
					    u_xlat2 = texture(_HalfResDepthBuffer, vs_TEXCOORD3.xy);
					    u_xlat9 = min(u_xlat1.x, u_xlat2.x);
					    u_xlat1.x = max(u_xlat1.x, u_xlat2.x);
					    u_xlat6.x = max(u_xlat6.x, u_xlat1.x);
					    u_xlat3 = min(u_xlat9, u_xlat3);
					    SV_Target0 = (u_xlatb0.x) ? u_xlat3 : u_xlat6.x;
					    return;
					}"
				}
			}
		}
	}
}