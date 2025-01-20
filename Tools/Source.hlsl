int SampleCount;
#define SAMPLE_COUNT 10

Texture2D BaseTexture;
SamplerState BaseSampler
{
    Filter = MIN_MAG_MIP_LINEAR ;
    AddressU = Wrap;
    AddressV = Wrap;
};

float4 MainPS(float4 Position : SV_POSITION) : SV_TARGET
{
	float result = 0.1;
	float4 color = 0.0;

	// FOR 循环 -- 常量作为循环条件
	// [unroll]
	// for(int i = 0; i < SAMPLE_COUNT; i ++)
	// {
	// 	float2 UV = Position.xy / (i + 1.0);
	// 	color += BaseTexture.SampleLevel(BaseSampler, UV, 0);
	// }

	// FOR 循环 -- uniform变量作为循环条件
	
	for(int i = 0; i < SampleCount; i ++)
	{
		float2 UV = Position.xy / (i + 1.0);
		color += BaseTexture.Sample(BaseSampler, UV);
	}

	// float Random = Position.y;

	// [flatten]
	// if(Position.x < Random)
	// {
	// 	result += 0.1;
	// }

	// return float4(result, 0.0, 0.0, 0.0);
	return color;
}
