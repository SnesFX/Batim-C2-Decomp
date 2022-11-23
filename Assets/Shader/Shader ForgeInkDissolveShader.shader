Shader "Shader Forge/InkDissolveShader" {
	Properties {
		_Color ("Color", Color) = (0,0,0,1)
		_DissolveAmount ("Dissolve Amount", Range(0, 1)) = 1
		_Noise ("Noise", 2D) = "white" {}
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
		};

		fixed4 _Color;

		sampler2D _Noise;

		half _DissolveAmount;

		void surf(Input IN,inout SurfaceOutputStandard o)
		{
			half dissolve_value = tex2D(_Noise, IN.uv_Noise).r;

			clip(dissolve_value - _DissolveAmount);

			fixed4 mainTex = _Color;

			o.Albedo = _Color;
			o.Smoothness = 0;
			o.Metallic = 0;
		}

		ENDCG
	}
	Fallback "Diffuse"
}