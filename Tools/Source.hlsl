int SampleCount;
#define SAMPLE_COUNT 10

float4 MainPS(float4 Position : SV_POSITION) : SV_TARGET
{
	int result = 0.1;

	// FOR 循环 -- 常量作为循环条件
	for(int i = 0; i < SAMPLE_COUNT; i ++)
	{
		result += Position.x;
	}

	// FOR 循环 -- uniform变量作为循环条件
	// for(int i = 0; i < SampleCount; i ++)
	// {
	// 	result += Position.x;
	// }


	return float4(result, 0.0, 0.0, 0.0);
}
