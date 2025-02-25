cbuffer HSPerFrame : register(b0)
{
  float4 edgeFactors;
	float2 insideFactors;
};

struct VS_OUT
{
	float4 position : Position;
};

struct HS_OUT
{
	float4 position : Position;
};

struct HS_CONST_OUT
{
	float edges[4]  : SV_TessFactor;
	float inside[2] : SV_InsideTessFactor;
};

[domain("quad")]
[partitioning("integer")]
[outputtopology("triangle_cw")]
[outputcontrolpoints(4)]
[patchconstantfunc("HSConstant")]
HS_OUT main(InputPatch<VS_OUT, 4> ip, uint cpid : SV_OutputControlPointID, uint pid : SV_PrimitiveID)
{
	HS_OUT output;
	output.position = ip[cpid].position;
	return output;
}

HS_CONST_OUT HSConstant(InputPatch<VS_OUT, 4> ip, uint pid : SV_PrimitiveID)
{
	HS_CONST_OUT output;

	[unroll(4)]
	for (int i = 0; i < 4; ++i)
		output.edges[i] = edgeFactors[i];

	[unroll(2)]
	for (int j = 0; j < 2; ++j)
		output.inside[j] = insideFactors[j];

	return output;
}
