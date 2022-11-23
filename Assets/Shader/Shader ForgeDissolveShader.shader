Shader "Shader Forge/DissolveShader" {
	Properties {
		_Color ("Color", Vector) = (1,1,1,1)
		_MainTex ("Main Texture", 2D) = "white" {}
		_DissolveAmount ("Dissolve Amount", Range(0, 1)) = 0
		_Noise ("Noise", 2D) = "white" {}
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		LOD 200
		Cull Off

		CGPROGRAM

		#pragma surface surf Standard fullforwardshadows

		#pragma target 0.3

		struct Input
		{
			float2 uv_Noise;
			float2 uv_MainTex;
		};

		fixed4 _Color;

		sampler2D _Noise;
		sampler2D _MainTex;

		half _DissolveAmount;

		void surf(Input IN,inout SurfaceOutputStandard o)
		{
			half dissolve_value = tex2D(_Noise, IN.uv_Noise).r;

			clip(dissolve_value - _DissolveAmount);

			fixed4 mainTex = tex2D(_MainTex,IN.uv_MainTex) * _Color;

			o.Albedo = mainTex;
			o.Smoothness = 0;
			o.Metallic = 0;
		}

		ENDCG
	}
	Fallback "Diffuse"
}