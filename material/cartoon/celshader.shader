<?xml version = "1.0" encoding = "utf-8"?>
<Shader>
	<VS>#version 100

		attribute vec3 a_Position;
		attribute vec2 a_UV;
		attribute vec3 a_Normal;

		uniform mat4  u_WorldMatrix;
		uniform mat4  u_WorldViewProjMatrix;

		varying vec2 v_TexCoord;
		varying vec3 v_Normal;

		void main(void)
		{
			gl_Position = u_WorldViewProjMatrix * vec4(a_Position, 1.0);

			v_TexCoord = a_UV;
			v_Normal = mat3(u_WorldMatrix) * a_Normal;
		}
	</VS>
	<PS>#version 100

		precision mediump float;

		#define saturate(x) clamp( x, 0.0, 1.0)

		float smoothStep( float edge0, float edge1, float x)
		{
			float t = saturate( (x-edge0) / (edge1-edge0));
			return t * t * ( 3.0 - 2.0 * t);
		}

		uniform vec4 	u_DarkColor;
		uniform vec4 	u_BrightColor;
		uniform float 	u_DarkFence;
		uniform float	u_DarkFenceWidth;

		// varying
		varying vec2 	  v_TexCoord;
		varying vec3      v_Normal;

		void main(void)
		{
			vec4 baseColor = vec4(1.0);

			// N - normal direction from surface to out
			// L - light direction from surface to light
			vec3 N = normalize(v_Normal);
			vec3 L = normalize(vec3(1.0, 1.0, 1.0));

			// df - diffuse factor
			float df     = saturate( dot(N, L));
			vec3 dfColor = mix( u_DarkColor.xyz, u_BrightColor.xyz, smoothStep( u_DarkFence, u_DarkFence + u_DarkFenceWidth, df));
			vec3 finalColor = dfColor * baseColor.xyz;
			
			gl_FragColor = vec4( finalColor, baseColor.a);
		}
		
	</PS>
	<BlendState>
	</BlendState>
	<RasterizerState>
		<CullMode value = "CULL_FRONT" />
	</RasterizerState>
	<DepthStencilState>
		<DepthEnable value="true" />
		<WriteDepth value = "true" />
	</DepthStencilState>
	<Macros>
	</Macros>
</Shader>
