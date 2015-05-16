Shader "Custom/1Fragment" {
    SubShader {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            uniform sampler2D _MainTex;
            float4 _MainTex_ST;

            struct v2f {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert(appdata_base v) {
                v2f o;
                o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
                o.uv = MultiplyUV( UNITY_MATRIX_TEXTURE0, v.texcoord );
                return o;
            }

            float4 frag(v2f i) : COLOR {
                bool p = fmod(i.uv.x*8.0,2.0) < 1.0;
                bool q = fmod(i.uv.y*8.0,2.0) > 1.0;
                
                return float4(float3((p && q) || !(p || q)),1.0);
            }

            ENDCG
        }
    }
}