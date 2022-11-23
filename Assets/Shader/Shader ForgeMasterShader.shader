Shader "Shader Forge/MasterShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Main Texture", 2D) = "white" {}
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

		void surf(Input IN,inout SurfaceOutputStandardSpecular o)
		{
			fixed4 mainTex = tex2D(_MainTex,IN.uv_MainTex) * _Color;

			o.Albedo = mainTex.rgb;
			o.Smoothness = 0;
			o.Specular = 0;

			o.Alpha = mainTex.a;
		}

		ENDCG
	}
	Fallback "Diffuse"
}