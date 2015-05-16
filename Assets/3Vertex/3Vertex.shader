Shader "Custom/3Vertex" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _Displacement ("Displacement", Range (-1, 1)) = 0
    }
    SubShader {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            
            uniform sampler2D _MainTex;
            uniform float _Displacement;
            float4 _MainTex_ST;

            struct v2f {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert(appdata_base v) {
                v2f o;
                o.uv = MultiplyUV( UNITY_MATRIX_TEXTURE0, v.texcoord.xy );

                float dX = sin(v.vertex.y + _Time.y) * _Displacement;
                float dY = cos(v.vertex.x + _Time.y) * _Displacement;
                v.vertex.x = v.vertex.x + v.normal.x + dX;
                v.vertex.y = v.vertex.y + v.normal.y + dY;

                o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
                return o;
            }

            float4 frag(v2f i) : COLOR {
                return tex2D(_MainTex, i.uv);
            }

            ENDCG
        }
    }
}