Shader "Shader Forge/LightShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM

		#pragma surface surf Unlit fullforwardshadows

		#pragma target 0.3

		struct Input
		{
			half filler;
	
		};

		fixed4 _Color;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf(Input IN,inout SurfaceOutput o)
		{
			o.Emission = _Color;
		}

		ENDCG
	}
	Fallback "Diffuse"
}