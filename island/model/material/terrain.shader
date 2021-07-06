<?xml version="1.0" encoding="utf-8"?>
<res class="ShaderProgram" path="Res://model/material/terrain.shader" Type="glsl" VertexShader="#version 450&#10;&#10;layout(binding = 0, std140) uniform UBO&#10;{&#10;    mat4 u_WorldMatrix;&#10;    mat4 u_ViewProjMatrix;&#10;} vs_ubo;&#10;&#10;layout(location = 0) in vec3 a_Position;&#10;&#10;void main()&#10;{&#10;    vec4 worldPosition = vs_ubo.u_WorldMatrix * vec4(a_Position, 1.0);&#10;    vec4 clipPosition = vs_ubo.u_ViewProjMatrix * worldPosition;&#10;    gl_Position = clipPosition;&#10;}&#10;&#10;" FragmentShader="#version 450&#10;&#10;layout(location = 0) out vec4 o_FragColor;&#10;&#10;vec3 LinearToSRgb(vec3 linear)&#10;{&#10;    return pow(linear, vec3(0.4545454680919647216796875));&#10;}&#10;&#10;void main()&#10;{&#10;    vec4 Color_312_Value = vec4(0.18354900181293487548828125, 0.1479980051517486572265625, 0.00143299996852874755859375, 1.0);&#10;    vec3 param = Color_312_Value.xyz;&#10;    vec3 LinearToSRgb_268 = LinearToSRgb(param);&#10;    vec3 _BaseColor = LinearToSRgb_268;&#10;    float _Opacity = 1.0;&#10;    float _Metalic = 0.20000000298023223876953125;&#10;    float _PerceptualRoughness = 0.5;&#10;    o_FragColor = vec4(_BaseColor, _Opacity);&#10;}&#10;&#10;" Graph="{&#10;    &quot;connections&quot;: [&#10;        {&#10;            &quot;in_id&quot;: &quot;{38072873-5f70-4bf7-a3f1-c281dc5ac8ac}&quot;,&#10;            &quot;in_index&quot;: 0,&#10;            &quot;out_id&quot;: &quot;{4bac5072-0eb0-4df6-a3db-e39f3e91a667}&quot;,&#10;            &quot;out_index&quot;: 0&#10;        },&#10;        {&#10;            &quot;in_id&quot;: &quot;{4bac5072-0eb0-4df6-a3db-e39f3e91a667}&quot;,&#10;            &quot;in_index&quot;: 0,&#10;            &quot;out_id&quot;: &quot;{8ba1ef8e-171b-4ec1-aa5a-532a452245c0}&quot;,&#10;            &quot;out_index&quot;: 0&#10;        }&#10;    ],&#10;    &quot;nodes&quot;: [&#10;        {&#10;            &quot;id&quot;: &quot;{38072873-5f70-4bf7-a3f1-c281dc5ac8ac}&quot;,&#10;            &quot;model&quot;: {&#10;                &quot;Variable&quot;: &quot;ShaderTemplate_311&quot;,&#10;                &quot;name&quot;: &quot;ShaderTemplate&quot;&#10;            },&#10;            &quot;position&quot;: {&#10;                &quot;x&quot;: 0,&#10;                &quot;y&quot;: 304&#10;            }&#10;        },&#10;        {&#10;            &quot;id&quot;: &quot;{8ba1ef8e-171b-4ec1-aa5a-532a452245c0}&quot;,&#10;            &quot;model&quot;: {&#10;                &quot;Color&quot;: &quot;0.462745 0.419608 0.0509804 1 &quot;,&#10;                &quot;Variable&quot;: &quot;Color_312&quot;,&#10;                &quot;name&quot;: &quot;Color&quot;&#10;            },&#10;            &quot;position&quot;: {&#10;                &quot;x&quot;: -506,&#10;                &quot;y&quot;: 316&#10;            }&#10;        },&#10;        {&#10;            &quot;id&quot;: &quot;{4bac5072-0eb0-4df6-a3db-e39f3e91a667}&quot;,&#10;            &quot;model&quot;: {&#10;                &quot;Code&quot;: &quot;vec3 LinearToSRgb(vec3 linear)\n{\n\treturn pow(linear, vec3(1.0/2.2));\n}&quot;,&#10;                &quot;FunctionName&quot;: &quot;LinearToSRgb&quot;,&#10;                &quot;Parameters&quot;: &quot;vec3 linear&quot;,&#10;                &quot;ReturnType&quot;: &quot;vec3&quot;,&#10;                &quot;Variable&quot;: &quot;LinearToSRgb_268&quot;,&#10;                &quot;name&quot;: &quot;LinearToSRgb&quot;&#10;            },&#10;            &quot;position&quot;: {&#10;                &quot;x&quot;: -329,&#10;                &quot;y&quot;: 305&#10;            }&#10;        }&#10;    ]&#10;}&#10;" CullMode="CULL_BACK" BlendMode="Opaque">
	<property name="DepthStencilState">
		<obj class="DepthStencilState" DepthEnable="true" WriteDepth="true" />
	</property>
</res>
