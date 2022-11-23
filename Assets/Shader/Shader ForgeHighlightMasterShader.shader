Shader "Shader Forge/HighlightMasterShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Main Texture", 2D) = "white" {}
		_HighlightColor ("HighlightColor", Color) = (1,0.8117648,0.4,1)
		_HighlightStrength ("HighlightStrength", Range(0,1)) = 0
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM

		#pragma surface surf StandardSpecular fullforwardshadows

		#pragma target 0.3

		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
		};

		fixed4 _Color;
		fixed4 _HighlightColor;

		half _HighlightStrength;

		void surf(Input IN,inout SurfaceOutputStandardSpecular o)
		{
			fixed4 mainTex = tex2D(_MainTex,IN.uv_MainTex) * _Color;
			fixed4 emiss = _HighlightColor * _HighlightStrength;

			o.Albedo = mainTex.rgb;
			o.Smoothness = 0;
			o.Specular = 0;

			o.Emission = emiss;


			o.Alpha = mainTex.a;
		}

		ENDCG
	}
	Fallback "Diffuse"
}