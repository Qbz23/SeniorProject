/***************************************************************************
# Copyright (c) 2015, NVIDIA CORPORATION. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#  * Neither the name of NVIDIA CORPORATION nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
# OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
***************************************************************************/
//__import ShaderCommon;
//__import Shading;
//__import DefaultVS;

struct PS_INPUT
{
	float4 Position : SV_POSITION;
	float4 color : COLOR;
};

cbuffer PerFrameCB : register(b1)
{
    //LightData gDirLight;
    //LightData gPointLight;
    bool gConstColor;
    //float3 gAmbient;
};

float4 main(PS_INPUT input) : SV_TARGET
{
    if(gConstColor)
    {
        return float4(0, 1, 0, 1);
    }
    else
    {
        //ShadingAttribs shAttr;
        //prepareShadingAttribs(gMaterial, vOut.posW, gCam.position, vOut.normalW, vOut.bitangentW, vOut.texC, shAttr);

        //ShadingOutput result;

        // Directional light
        //evalMaterial(shAttr, gDirLight, result, true);

        // Point light
        //evalMaterial(shAttr, gPointLight, result, false);

        //float4 finalColor = float4(result.finalValue + gAmbient * result.diffuseAlbedo, 1.f);
		float4 finalColor = input.color;
        return finalColor;
    }
}
