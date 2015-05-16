Shader "Custom/0Basic" {
    SubShader {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            // RETURNS A VERTEX'S POSITION ON THE SCREEN
            float4 vert(float4 v:POSITION) : SV_POSITION {
                return mul (UNITY_MATRIX_MVP, v);
            }

            // RETURNS A PIXEL'S (FRAGMENT'S) COLOR
            fixed4 frag() : COLOR {
                return fixed4(1.0,0.0,0.0,1.0);
            }

            ENDCG
        }
    }
}