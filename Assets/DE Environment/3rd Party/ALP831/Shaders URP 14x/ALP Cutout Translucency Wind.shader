// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ALP/Cutout Translucency Wind"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[DE_DrawerCategory(SURFACE OPTIONS,true,_Cull,0,0)]_CATEGORY_SURFACEOPTIONS("CATEGORY_SURFACEOPTIONS", Float) = 1
		[Enum(Front,2,Back,1,Both,0)]_Cull("Render Face", Int) = 0
		[DE_DrawerSpace(10)]_SPACE_SURFACEOPTIONS("SPACE_SURFACEOPTIONS", Float) = 0
		[DE_DrawerCategory(ALPHA CLIPPING,true,_GlancingClipMode,0,0)]_CATEGORY_ALPHACLIPPING("CATEGORY_ALPHACLIPPING", Float) = 0
		[DE_DrawerToggleLeft]_GlancingClipMode("Enable Clip Glancing Angle", Float) = 0
		[DE_DrawerSliderSimple(_AlphaRemapMin, _AlphaRemapMax,0, 1)]_AlphaRemap("Alpha Remapping", Vector) = (0,1,0,0)
		[HideInInspector]_AlphaRemapMin("AlphaRemapMin", Float) = 0
		[HideInInspector]_AlphaRemapMax("AlphaRemapMax", Float) = 1
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.5
		[DE_DrawerSpace(10)]_SPACE_ALPHACLIP("SPACE_ALPHACLIP", Float) = 0
		[DE_DrawerCategory(SHADOW,true,_AlphaCutoffBiasShadow,0,0)]_CATEGORY_SHADOW("CATEGORY_SHADOW", Float) = 0
		_AlphaCutoffBiasShadow("Alpha Cutoff Bias Shadow", Range( 0.01 , 1)) = 0.5
		[DE_DrawerSpace(10)]_SPACE_SHADOW("SPACE_SHADOW", Float) = 0
		[DE_DrawerCategory(SURFACE INPUTS,true,_MainTex,0,0)]_CATEGORY_SURFACEINPUTS("CATEGORY_SURFACE INPUTS", Float) = 1
		_BaseColor("Base Color", Color) = (1,1,1,0)
		_Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerTextureSingleLine]_MainTex("Base Map", 2D) = "white" {}
		[DE_DrawerTextureSingleLine]_MetallicGlossMap("Metallic Map", 2D) = "white" {}
		[DE_DrawerTextureSingleLine]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[DE_DrawerTextureSingleLine]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[DE_DrawerTilingOffset]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Normal][DE_DrawerTextureSingleLine]_BumpMap("Normal Map", 2D) = "bump" {}
		[DE_DrawerFloatEnum(Flip _Mirror _None)]_DoubleSidedNormalMode("Normal Mode", Float) = 2
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_SURFACEINPUTS("SPACE_SURFACE INPUTS", Float) = 0
		[DE_DrawerCategory(METALLIC,true,_MetallicStrength,0,0)]_CATEGORY_METALLIC("CATEGORY_METALLIC", Float) = 0
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerSpace(10)]_SPACE_METALLIC("SPACE_METALLIC", Float) = 0
		[DE_DrawerCategory(OCCLUSION,true,_OcclusionStrengthAORemapMin,0,0)]_CATEGORY_OCCLUSION("CATEGORY_OCCLUSION", Float) = 0
		[DE_DrawerFloatEnum(Map _Baked)]_OcclusionSourceBaked("Occlusion Source", Float) = 0
		[DE_DrawerToggleNoKeyword]_OcclusionSourceInverted("Occlusion Source Inverted", Float) = 0
		[DE_DrawerSliderSimple(_OcclusionStrengthAORemapMin, _OcclusionStrengthAORemapMax,0, 1)]_OcclusionStrengthAO("Occlusion Strength", Vector) = (0,0,0,0)
		[HideInInspector]_OcclusionStrengthAORemapMin("OcclusionStrengthAORemapMin", Float) = 0
		[HideInInspector]_OcclusionStrengthAORemapMax("Occlusion StrengthAORemapMax", Float) = 0
		[DE_DrawerSpace(10)]_SPACE_OCCLUSION("SPACE_OCCLUSION", Float) = 0
		[DE_DrawerCategory(SMOOTHNESS,true,_SmoothnessStrengthRemapMin,0,0)]_CATEGORY_SMOOTHNESS("CATEGORY_SMOOTHNESS", Float) = 0
		[DE_DrawerFloatEnum(Smoothness _Roughness)]_SmoothnessSource("Smoothness Source", Float) = 1
		[DE_DrawerSliderSimple(_SmoothnessStrengthRemapMin, _SmoothnessStrengthRemapMax,0, 1)]_SmoothnessStrength("Smoothness Strength", Vector) = (0,0,0,0)
		[HideInInspector]_SmoothnessStrengthRemapMin("Smoothness StrengthRemapMin", Float) = 0
		[HideInInspector]_SmoothnessStrengthRemapMax("Smoothness StrengthRemapMax", Float) = 0
		[DE_DrawerToggleNoKeyword]_SmoothnessFresnelEnable("Enable Fresnel", Float) = 0
		_SmoothnessFresnelScale("Fresnel Scale", Range( 0 , 3)) = 1.1
		_SmoothnessFresnelPower("Fresnel Power", Range( 0 , 20)) = 10
		[DE_DrawerSpace(10)]_SPACE_SMOOTHNESS("SPACE_SMOOTHNESS", Float) = 0
		[DE_DrawerCategory(COLOR SHIFT,true,_ColorShiftEnable,0,0)]_CATEGORY_COLORSHIFT("CATEGORY_COLOR SHIFT", Float) = 0
		[DE_DrawerToggleLeft]_ColorShiftEnable("ENABLE COLOR SHIFT", Float) = 0
		[DE_DrawerFloatEnum(Object Space _World Space _Vertex Color _Vertex Normal)]_ColorShiftSource("Shift Source", Float) = 0
		_ColorShiftVariation("Shift Variation", Range( 0 , 1)) = 0
		_ColorShiftVariationRGB("Shift Variation RGB", Range( -0.5 , 0.5)) = 0.2
		_ColorShiftInfluence("Shift Influence ", Range( 0 , 1)) = 0.75
		_ColorShiftSaturation("Shift Saturation", Range( 0 , 1)) = 0.85
		_ColorShiftNoiseScale("Shift Noise Scale", Range( 0 , 2)) = 1
		[Header(COLOR SHIFT WORLD SPACE)]_ColorShiftWorldSpaceDistance("World Space Distance", Range( 0.01 , 5)) = 5
		_ColorShiftWorldSpaceOffset("World Space Offset", Range( -1 , 1)) = 1
		_ColorShiftWorldSpaceNoiseShift("World Space Noise Shift", Range( 1 , 5)) = 5
		[DE_DrawerToggleLeft][Space(10)]_ColorShiftEnableMask("ENABLE COLOR SHIFT MASK", Float) = 1
		[DE_DrawerToggleNoKeyword]_ColorShiftMaskInverted("Color Shift Mask Inverted", Float) = 0
		[DE_DrawerTextureSingleLine]_ColorShiftMaskMap("Color Shift Mask Map", 2D) = "black" {}
		_ColorShiftMaskFuzziness("Color Shift Mask Fuzziness", Range( 0 , 1)) = 0.25
		[DE_DrawerSpace(10)]_SPACE_COLORSHIFT("SPACE_COLORSHIFT", Float) = 0
		[DE_DrawerCategory(TRANSMISSION,true,_TransmissionEnable,0,0)]_CATEGORY_TRANSMISSION("CATEGORY_TRANSMISSION", Float) = 0
		[DE_DrawerToggleLeft]_TransmissionEnable("ENABLE TRANSMISSION", Float) = 0
		[DE_DrawerFloatEnum(Color Picker Only_Transmission Mask Map)]_TransmissionSource("Transmission Source", Float) = 1
		[DE_DrawerTextureSingleLine]_TransmissionMaskMap("Transmission Mask Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_TransmissionMaskInverted("Transmission Mask Inverted", Float) = 0
		_TransmissionMaskStrength("Transmission Mask Strength", Range( 0 , 1.5)) = 1.466198
		_TransmissionMaskFeather("Transmission Mask Feather", Range( 0 , 1)) = 1
		[HDR]_TransmissionColor("Transmission Color", Color) = (0.5,0.5,0.5,1)
		_TransmissionStrength("Transmission Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_TRANSMISSION("SPACE_TRANSMISSION", Float) = 0
		[DE_DrawerCategory(TRANSLUCENCY,true,_TranslucencyEnable,0,0)]_CATEGORY_TRANSLUCENCY("CATEGORY_TRANSLUCENCY", Float) = 0
		[DE_DrawerToggleLeft]_TranslucencyEnable("ENABLE TRANSLUCENCY", Float) = 0
		[DE_DrawerFloatEnum(Color Picker Only _Thickness Mask Map)]_TranslucencySource("Translucency Source", Float) = 1
		[DE_DrawerTextureSingleLine]_ThicknessMap("Thickness Mask Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_ThicknessMapInverted("Thickness Mask Inverted", Float) = 0
		_ThicknessStrength("Thickness Mask Strength", Range( 0 , 1.5)) = 1.466198
		_ThicknessFeather("Thickness Mask Feather", Range( 0 , 1)) = 1
		[HDR]_TranslucencyColor("Translucency Color", Color) = (0.5,0.5,0.5,1)
		_TranslucencyStrength("Translucency Strength", Float) = 1
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCY("SPACE_TRANSLUCENCY", Float) = 0
		[DE_DrawerCategory(TRANSLUCENCY ASE,true,_ASETranslucencyStrength,0,0)]_CATEGORY_TRANSLUCENCYASE("CATEGORY_TRANSLUCENCY ASE", Float) = 0
		_ASETransmissionShadow("ASE Transmission Shadow", Range( 0 , 1)) = 0.5
		_ASETranslucencyStrength("ASE Translucency Strength", Range( 1 , 50)) = 1
		_ASETranslucencyNormalDistortion("ASE Translucency Normal Distortion ", Range( 0 , 1)) = 0.2735869
		_ASETranslucencyScattering("ASE Translucency Scattering ", Range( 1 , 50)) = 2
		_ASETranslucencyDirect("ASE Translucency Direct ", Range( 0 , 1)) = 0.9
		_ASETranslucencyAmbient("ASE Translucency Ambient", Range( 0 , 1)) = 0.8339342
		_ASETranslucencyShadow("ASE Translucency Shadow ", Range( 0 , 1)) = 0.5
		[DE_DrawerSpace(10)]_SPACE_TRANSLUCENCYASE("SPACE_TRANSLUCENCYASE", Float) = 0
		[DE_DrawerCategory(WIND,true,_WindEnable,0,0)]_CATEGORY_WIND("CATEGORY_WIND", Float) = 0
		[DE_DrawerToggleLeft]_WindEnable("ENABLE WIND", Float) = 0
		[DE_DrawerFloatEnum(Global _Local)]_WindEnableMode("Enable Wind Mode", Float) = 0
		[DE_DrawerFloatEnum(Leaf _Palm _Grass _Simple _Ivy)]_WindEnableType("Enable Wind Type", Float) = 0
		[Header(WIND GLOBAL)]_WindGlobalIntensity("Wind Intensity", Float) = 1
		_WindGlobalTurbulence("Wind Turbulence", Float) = 0.35
		[Header(WIND LOCAL)]_WindLocalIntensity("Local Wind Intensity", Float) = 1
		_WindLocalTurbulence("Local Wind Turbulence", Float) = 0.35
		_WindLocalPulseFrequency("Local Wind Pulse Frequency", Float) = 0.1
		_WindLocalRandomOffset("Local Random Offset", Float) = 0.2
		_WindLocalDirection("Local Wind Direction", Range( 0 , 360)) = 0
		[ASEEnd][DE_DrawerSpace(10)]_SPACE_WIND("SPACE_WIND", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull [_Cull]
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 3.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_COLOR


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ColorShiftMaskMap);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MetallicGlossMap);
			SAMPLER(sampler_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			SAMPLER(sampler_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			SAMPLER(sampler_OcclusionMap);
			TEXTURE2D(_TransmissionMaskMap);
			TEXTURE2D(_ThicknessMap);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float ColorShift_Modefloatswitch168_g57838( float m_switch, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_ObjectSpace;
				else if(m_switch ==1)
					return m_WorldSpace;
				else if(m_switch ==2)
					return m_VertexColor;
				else if(m_switch ==3)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 _NormalModefloat3switch( float m_switch, float3 m_Flip, float3 m_Mirror, float3 m_None )
			{
				if(m_switch ==0)
					return m_Flip;
				else if(m_switch ==1)
					return m_Mirror;
				else if(m_switch ==2)
					return m_None;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.texcoord.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord8.xy = vertexToFrag70_g57836;
				
				o.ase_texcoord9 = v.vertex;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord8.zw = v.texcoord.xy;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float3 temp_output_1923_0_g57785 = (_BaseColor).rgb;
				float2 vertexToFrag70_g57836 = IN.ase_texcoord8.xy;
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float3 ALBEDO_RGBA1381_g57785 = (tex2DNode2048_g57785).rgb;
				float3 temp_output_3_0_g57785 = ( temp_output_1923_0_g57785 * ALBEDO_RGBA1381_g57785 * _Brightness );
				float3 temp_output_134_0_g57838 = temp_output_3_0_g57785;
				float m_switch168_g57838 = _ColorShiftSource;
				float m_ObjectSpace168_g57838 = ( _ColorShiftNoiseScale / 3 );
				float3 p1_g57839 = ( WorldPosition * _ColorShiftWorldSpaceNoiseShift );
				float localSimpleNoise3D1_g57839 = SimpleNoise3D( p1_g57839 );
				float4 transform374_g57838 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord9);
				float m_WorldSpace168_g57838 = ( ( localSimpleNoise3D1_g57839 / _ColorShiftNoiseScale ) - ( ( (transform374_g57838).w - _ColorShiftWorldSpaceOffset ) / _ColorShiftWorldSpaceDistance ) );
				float m_VertexColor168_g57838 = ( IN.ase_color.g - 0.5 );
				float m_VertexNormal168_g57838 = ( IN.ase_normal.y - 0.5 );
				float localColorShift_Modefloatswitch168_g57838 = ColorShift_Modefloatswitch168_g57838( m_switch168_g57838 , m_ObjectSpace168_g57838 , m_WorldSpace168_g57838 , m_VertexColor168_g57838 , m_VertexNormal168_g57838 );
				float temp_output_112_0_g57838 = sin( ( _ColorShiftNoiseScale * PI ) );
				float3 BaseColor136_g57838 = temp_output_134_0_g57838;
				float2 appendResult120_g57838 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g57838 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * BaseColor136_g57838.x ) , 0.0));
				float2 RGB146_g57838 = appendResult120_g57838;
				float3 hsvTorgb122_g57838 = RGBToHSV( float3( RGB146_g57838 ,  0.0 ) );
				float VALUE219_g57838 = temp_output_112_0_g57838;
				float3 hsvTorgb126_g57838 = HSVToRGB( float3(( ( saturate( localColorShift_Modefloatswitch168_g57838 ) * _ColorShiftVariation ) + _ColorShiftVariationRGB + hsvTorgb122_g57838 ).x,( _ColorShiftSaturation * hsvTorgb122_g57838.y ),( hsvTorgb122_g57838.z + ( VALUE219_g57838 / 40 ) )) );
				float2 uv_ColorShiftMaskMap = IN.ase_texcoord8.zw * _ColorShiftMaskMap_ST.xy + _ColorShiftMaskMap_ST.zw;
				float4 transform376_g57838 = mul(GetObjectToWorldMatrix(),float4( IN.ase_texcoord9.xyz , 0.0 ));
				float3 temp_output_337_0_g57838 = saturate( ( 1.0 - ( (( SAMPLE_TEXTURE2D( _ColorShiftMaskMap, sampler_MainTex, uv_ColorShiftMaskMap ) * transform376_g57838 )).rgb / max( _ColorShiftMaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g57838 = lerp( hsvTorgb126_g57838 , BaseColor136_g57838 , temp_output_337_0_g57838);
				float3 lerpResult311_g57838 = lerp( BaseColor136_g57838 , hsvTorgb126_g57838 , temp_output_337_0_g57838);
				float3 lerpResult389_g57838 = lerp( lerpResult314_g57838 , lerpResult311_g57838 , _ColorShiftMaskInverted);
				float3 lerpResult387_g57838 = lerp( hsvTorgb126_g57838 , lerpResult389_g57838 , _ColorShiftEnableMask);
				float3 lerpResult392_g57838 = lerp( temp_output_134_0_g57838 , lerpResult387_g57838 , _ColorShiftInfluence);
				float temp_output_402_0_g57838 = ( _ColorShiftEnable + ( ( _CATEGORY_COLORSHIFT + _SPACE_COLORSHIFT ) * 0.0 ) );
				float3 lerpResult393_g57838 = lerp( temp_output_134_0_g57838 , lerpResult392_g57838 , temp_output_402_0_g57838);
				
				float4 NORMAL_RGB1382_g57785 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57836 );
				float3 unpack1891_g57785 = UnpackNormalScale( NORMAL_RGB1382_g57785, _NormalStrength );
				unpack1891_g57785.z = lerp( 1, unpack1891_g57785.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57799 = unpack1891_g57785;
				float temp_output_50_0_g57799 = _DoubleSidedNormalMode;
				float m_switch64_g57799 = temp_output_50_0_g57799;
				float3 m_Flip64_g57799 = float3(-1,-1,-1);
				float3 m_Mirror64_g57799 = float3(1,1,-1);
				float3 m_None64_g57799 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57799 = _NormalModefloat3switch( m_switch64_g57799 , m_Flip64_g57799 , m_Mirror64_g57799 , m_None64_g57799 );
				float3 switchResult58_g57799 = (((ase_vface>0)?(temp_output_24_0_g57799):(( temp_output_24_0_g57799 * local_NormalModefloat3switch64_g57799 ))));
				
				float3 MASK_B1377_g57785 = (SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_MetallicGlossMap, vertexToFrag70_g57836 )).rgb;
				
				float3 MASK_G158_g57785 = (SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_SmoothnessMap, vertexToFrag70_g57836 )).rgb;
				float temp_output_269_0_g57789 = MASK_G158_g57785.x;
				float lerpResult347_g57789 = lerp( temp_output_269_0_g57789 , ( 1.0 - temp_output_269_0_g57789 ) , _SmoothnessSource);
				float lerpResult362_g57789 = lerp( ( _SmoothnessStrengthRemapMin + ( _SmoothnessStrength.x * 0.0 ) ) , ( _SmoothnessStrengthRemapMax + ( ( _CATEGORY_SMOOTHNESS + _SPACE_SMOOTHNESS ) * 0.0 ) ) , lerpResult347_g57789);
				float2 appendResult368_g57789 = (float2(WorldViewDirection.xy));
				float3 appendResult367_g57789 = (float3(appendResult368_g57789 , ( WorldViewDirection.z / 1.06 )));
				float3 temp_output_263_0_g57789 = unpack1891_g57785;
				float3 normalizeResult310_g57789 = normalize( ( ( WorldTangent * temp_output_263_0_g57789.x ) + ( WorldBiTangent * temp_output_263_0_g57789.y ) + ( WorldNormal * temp_output_263_0_g57789.z ) ) );
				float fresnelNdotV309_g57789 = dot( normalize( normalizeResult310_g57789 ), appendResult367_g57789 );
				float fresnelNode309_g57789 = ( 0.0 + ( 1.0 - _SmoothnessFresnelScale ) * pow( max( 1.0 - fresnelNdotV309_g57789 , 0.0001 ), _SmoothnessFresnelPower ) );
				float lerpResult335_g57789 = lerp( lerpResult362_g57789 , ( lerpResult362_g57789 - fresnelNode309_g57789 ) , _SmoothnessFresnelEnable);
				
				float temp_output_185_0_g57794 = ( 1.0 - ( _OcclusionStrengthAORemapMin + ( _OcclusionStrengthAO.x * 0.0 ) ) );
				float temp_output_186_0_g57794 = ( 1.0 - ( _OcclusionStrengthAORemapMax + ( ( _CATEGORY_OCCLUSION + _SPACE_OCCLUSION ) * 0.0 ) ) );
				float3 MASK_R1378_g57785 = (SAMPLE_TEXTURE2D( _OcclusionMap, sampler_OcclusionMap, vertexToFrag70_g57836 )).rgb;
				float temp_output_49_0_g57794 = MASK_R1378_g57785.x;
				float lerpResult147_g57794 = lerp( ( 1.0 - temp_output_49_0_g57794 ) , temp_output_49_0_g57794 , _OcclusionSourceInverted);
				float lerpResult143_g57794 = lerp( temp_output_185_0_g57794 , temp_output_186_0_g57794 , lerpResult147_g57794);
				float lerpResult75_g57794 = lerp( temp_output_185_0_g57794 , temp_output_186_0_g57794 , IN.ase_color.a);
				float lerpResult73_g57794 = lerp( lerpResult143_g57794 , lerpResult75_g57794 , _OcclusionSourceBaked);
				
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , WorldViewDirection );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				
				float temp_output_77_0_g57825 = ( _AlphaCutoffBiasShadow + ( ( _CATEGORY_SHADOW + _SPACE_SHADOW ) * 0.0 ) );
				
				float3 temp_output_249_0_g57786 = (_TransmissionColor).rgb;
				float4 color71_g57786 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float3 temp_output_247_0_g57786 = (color71_g57786).rgb;
				float2 temp_output_101_0_g57786 = vertexToFrag70_g57836;
				float3 temp_output_162_0_g57786 = saturate( ( (SAMPLE_TEXTURE2D( _TransmissionMaskMap, sampler_MainTex, temp_output_101_0_g57786 )).rgb / max( _TransmissionMaskFeather , 1E-05 ) ) );
				float3 lerpResult172_g57786 = lerp( temp_output_247_0_g57786 , temp_output_162_0_g57786 , _TransmissionMaskStrength);
				float temp_output_165_0_g57786 = ( 0.0 - 1.0 );
				float temp_output_168_0_g57786 = ( temp_output_162_0_g57786.x - 1.0 );
				float lerpResult173_g57786 = lerp( ( temp_output_165_0_g57786 / temp_output_168_0_g57786 ) , ( temp_output_168_0_g57786 / temp_output_165_0_g57786 ) , ( 0.7 + _TransmissionMaskStrength ));
				float3 lerpResult148_g57786 = lerp( ( temp_output_249_0_g57786 * _TransmissionStrength * lerpResult172_g57786 ) , ( temp_output_249_0_g57786 * _TransmissionStrength * saturate( lerpResult173_g57786 ) ) , _TransmissionMaskInverted);
				float3 lerpResult147_g57786 = lerp( ( temp_output_249_0_g57786 * _TransmissionStrength ) , lerpResult148_g57786 , _TransmissionSource);
				float3 lerpResult122_g57786 = lerp( float3( 0,0,0 ) , lerpResult147_g57786 , ( _TransmissionEnable + ( ( _CATEGORY_TRANSLUCENCY + _SPACE_TRANSMISSION ) * 0.0 ) ));
				
				float3 temp_output_248_0_g57786 = (_TranslucencyColor).rgb;
				float3 temp_output_113_0_g57786 = saturate( ( (SAMPLE_TEXTURE2D( _ThicknessMap, sampler_MainTex, temp_output_101_0_g57786 )).rgb / max( _ThicknessFeather , 1E-05 ) ) );
				float3 lerpResult34_g57786 = lerp( temp_output_247_0_g57786 , temp_output_113_0_g57786 , _ThicknessStrength);
				float temp_output_69_0_g57786 = ( 0.0 - 1.0 );
				float temp_output_22_0_g57786 = ( temp_output_113_0_g57786.x - 1.0 );
				float lerpResult66_g57786 = lerp( ( temp_output_69_0_g57786 / temp_output_22_0_g57786 ) , ( temp_output_22_0_g57786 / temp_output_69_0_g57786 ) , ( 0.7 + _ThicknessStrength ));
				float3 lerpResult153_g57786 = lerp( ( temp_output_248_0_g57786 * lerpResult34_g57786 * _TranslucencyStrength ) , ( temp_output_248_0_g57786 * saturate( lerpResult66_g57786 ) * _TranslucencyStrength ) , _ThicknessMapInverted);
				float3 lerpResult150_g57786 = lerp( ( temp_output_248_0_g57786 * _TranslucencyStrength ) , lerpResult153_g57786 , _TranslucencySource);
				float3 temp_output_90_0_g57786 = saturate( ( _MainLightColor.rgb * _MainLightColor.a ) );
				float3 lerpResult123_g57786 = lerp( float3( 0,0,0 ) , ( lerpResult150_g57786 * saturate( temp_output_90_0_g57786 ) ) , ( _TranslucencyEnable + ( ( _SPACE_TRANSLUCENCY + _CATEGORY_TRANSMISSION ) * 0.0 ) ));
				

				float3 BaseColor = lerpResult393_g57838;
				float3 Normal = switchResult58_g57799;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( MASK_B1377_g57785.x * ( _MetallicStrength + ( ( _CATEGORY_METALLIC + _SPACE_METALLIC ) * 0.0 ) ) );
				float Smoothness = saturate( lerpResult335_g57789 );
				float Occlusion = saturate( lerpResult73_g57794 );
				float Alpha = temp_output_98_0_g57828;
				float AlphaClipThreshold = _AlphaCutoffBias;
				float AlphaClipThresholdShadow = temp_output_77_0_g57825;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = lerpResult122_g57786;
				float3 Translucency = lerpResult123_g57786;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.clipPos, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _ASETransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _ASETranslucencyShadow;
					float normal = _ASETranslucencyNormalDistortion;
					float scattering = _ASETranslucencyScattering;
					float direct = _ASETranslucencyScattering;
					float ambient = _ASETranslucencyAmbient;
					float strength = _ASETranslucencyStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.ase_texcoord.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord3.xy = vertexToFrag70_g57836;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = clipPos;
				o.clipPosV = clipPos;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 vertexToFrag70_g57836 = IN.ase_texcoord3.xy;
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , ase_worldViewDir );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				
				float temp_output_77_0_g57825 = ( _AlphaCutoffBiasShadow + ( ( _CATEGORY_SHADOW + _SPACE_SHADOW ) * 0.0 ) );
				

				float Alpha = temp_output_98_0_g57828;
				float AlphaClipThreshold = _AlphaCutoffBias;
				float AlphaClipThresholdShadow = temp_output_77_0_g57825;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			
			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.ase_texcoord.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord3.xy = vertexToFrag70_g57836;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 vertexToFrag70_g57836 = IN.ase_texcoord3.xy;
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , ase_worldViewDir );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				

				float Alpha = temp_output_98_0_g57828;
				float AlphaClipThreshold = _AlphaCutoffBias;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ColorShiftMaskMap);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float ColorShift_Modefloatswitch168_g57838( float m_switch, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_ObjectSpace;
				else if(m_switch ==1)
					return m_WorldSpace;
				else if(m_switch ==2)
					return m_VertexColor;
				else if(m_switch ==3)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.texcoord0.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord4.xy = vertexToFrag70_g57836;
				
				o.ase_texcoord5 = v.vertex;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord4.zw = v.texcoord0.xy;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.vertex.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 temp_output_1923_0_g57785 = (_BaseColor).rgb;
				float2 vertexToFrag70_g57836 = IN.ase_texcoord4.xy;
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float3 ALBEDO_RGBA1381_g57785 = (tex2DNode2048_g57785).rgb;
				float3 temp_output_3_0_g57785 = ( temp_output_1923_0_g57785 * ALBEDO_RGBA1381_g57785 * _Brightness );
				float3 temp_output_134_0_g57838 = temp_output_3_0_g57785;
				float m_switch168_g57838 = _ColorShiftSource;
				float m_ObjectSpace168_g57838 = ( _ColorShiftNoiseScale / 3 );
				float3 p1_g57839 = ( WorldPosition * _ColorShiftWorldSpaceNoiseShift );
				float localSimpleNoise3D1_g57839 = SimpleNoise3D( p1_g57839 );
				float4 transform374_g57838 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord5);
				float m_WorldSpace168_g57838 = ( ( localSimpleNoise3D1_g57839 / _ColorShiftNoiseScale ) - ( ( (transform374_g57838).w - _ColorShiftWorldSpaceOffset ) / _ColorShiftWorldSpaceDistance ) );
				float m_VertexColor168_g57838 = ( IN.ase_color.g - 0.5 );
				float m_VertexNormal168_g57838 = ( IN.ase_normal.y - 0.5 );
				float localColorShift_Modefloatswitch168_g57838 = ColorShift_Modefloatswitch168_g57838( m_switch168_g57838 , m_ObjectSpace168_g57838 , m_WorldSpace168_g57838 , m_VertexColor168_g57838 , m_VertexNormal168_g57838 );
				float temp_output_112_0_g57838 = sin( ( _ColorShiftNoiseScale * PI ) );
				float3 BaseColor136_g57838 = temp_output_134_0_g57838;
				float2 appendResult120_g57838 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g57838 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * BaseColor136_g57838.x ) , 0.0));
				float2 RGB146_g57838 = appendResult120_g57838;
				float3 hsvTorgb122_g57838 = RGBToHSV( float3( RGB146_g57838 ,  0.0 ) );
				float VALUE219_g57838 = temp_output_112_0_g57838;
				float3 hsvTorgb126_g57838 = HSVToRGB( float3(( ( saturate( localColorShift_Modefloatswitch168_g57838 ) * _ColorShiftVariation ) + _ColorShiftVariationRGB + hsvTorgb122_g57838 ).x,( _ColorShiftSaturation * hsvTorgb122_g57838.y ),( hsvTorgb122_g57838.z + ( VALUE219_g57838 / 40 ) )) );
				float2 uv_ColorShiftMaskMap = IN.ase_texcoord4.zw * _ColorShiftMaskMap_ST.xy + _ColorShiftMaskMap_ST.zw;
				float4 transform376_g57838 = mul(GetObjectToWorldMatrix(),float4( IN.ase_texcoord5.xyz , 0.0 ));
				float3 temp_output_337_0_g57838 = saturate( ( 1.0 - ( (( SAMPLE_TEXTURE2D( _ColorShiftMaskMap, sampler_MainTex, uv_ColorShiftMaskMap ) * transform376_g57838 )).rgb / max( _ColorShiftMaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g57838 = lerp( hsvTorgb126_g57838 , BaseColor136_g57838 , temp_output_337_0_g57838);
				float3 lerpResult311_g57838 = lerp( BaseColor136_g57838 , hsvTorgb126_g57838 , temp_output_337_0_g57838);
				float3 lerpResult389_g57838 = lerp( lerpResult314_g57838 , lerpResult311_g57838 , _ColorShiftMaskInverted);
				float3 lerpResult387_g57838 = lerp( hsvTorgb126_g57838 , lerpResult389_g57838 , _ColorShiftEnableMask);
				float3 lerpResult392_g57838 = lerp( temp_output_134_0_g57838 , lerpResult387_g57838 , _ColorShiftInfluence);
				float temp_output_402_0_g57838 = ( _ColorShiftEnable + ( ( _CATEGORY_COLORSHIFT + _SPACE_COLORSHIFT ) * 0.0 ) );
				float3 lerpResult393_g57838 = lerp( temp_output_134_0_g57838 , lerpResult392_g57838 , temp_output_402_0_g57838);
				
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , ase_worldViewDir );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				

				float3 BaseColor = lerpResult393_g57838;
				float3 Emission = 0;
				float Alpha = temp_output_98_0_g57828;
				float AlphaClipThreshold = _AlphaCutoffBias;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_POSITION


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_ColorShiftMaskMap);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float ColorShift_Modefloatswitch168_g57838( float m_switch, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_ObjectSpace;
				else if(m_switch ==1)
					return m_WorldSpace;
				else if(m_switch ==2)
					return m_VertexColor;
				else if(m_switch ==3)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.ase_texcoord.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord2.xy = vertexToFrag70_g57836;
				
				o.ase_texcoord3 = v.vertex;
				o.ase_color = v.ase_color;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord2.zw = v.ase_texcoord.xy;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float3 temp_output_1923_0_g57785 = (_BaseColor).rgb;
				float2 vertexToFrag70_g57836 = IN.ase_texcoord2.xy;
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float3 ALBEDO_RGBA1381_g57785 = (tex2DNode2048_g57785).rgb;
				float3 temp_output_3_0_g57785 = ( temp_output_1923_0_g57785 * ALBEDO_RGBA1381_g57785 * _Brightness );
				float3 temp_output_134_0_g57838 = temp_output_3_0_g57785;
				float m_switch168_g57838 = _ColorShiftSource;
				float m_ObjectSpace168_g57838 = ( _ColorShiftNoiseScale / 3 );
				float3 p1_g57839 = ( WorldPosition * _ColorShiftWorldSpaceNoiseShift );
				float localSimpleNoise3D1_g57839 = SimpleNoise3D( p1_g57839 );
				float4 transform374_g57838 = mul(GetObjectToWorldMatrix(),IN.ase_texcoord3);
				float m_WorldSpace168_g57838 = ( ( localSimpleNoise3D1_g57839 / _ColorShiftNoiseScale ) - ( ( (transform374_g57838).w - _ColorShiftWorldSpaceOffset ) / _ColorShiftWorldSpaceDistance ) );
				float m_VertexColor168_g57838 = ( IN.ase_color.g - 0.5 );
				float m_VertexNormal168_g57838 = ( IN.ase_normal.y - 0.5 );
				float localColorShift_Modefloatswitch168_g57838 = ColorShift_Modefloatswitch168_g57838( m_switch168_g57838 , m_ObjectSpace168_g57838 , m_WorldSpace168_g57838 , m_VertexColor168_g57838 , m_VertexNormal168_g57838 );
				float temp_output_112_0_g57838 = sin( ( _ColorShiftNoiseScale * PI ) );
				float3 BaseColor136_g57838 = temp_output_134_0_g57838;
				float2 appendResult120_g57838 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g57838 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * BaseColor136_g57838.x ) , 0.0));
				float2 RGB146_g57838 = appendResult120_g57838;
				float3 hsvTorgb122_g57838 = RGBToHSV( float3( RGB146_g57838 ,  0.0 ) );
				float VALUE219_g57838 = temp_output_112_0_g57838;
				float3 hsvTorgb126_g57838 = HSVToRGB( float3(( ( saturate( localColorShift_Modefloatswitch168_g57838 ) * _ColorShiftVariation ) + _ColorShiftVariationRGB + hsvTorgb122_g57838 ).x,( _ColorShiftSaturation * hsvTorgb122_g57838.y ),( hsvTorgb122_g57838.z + ( VALUE219_g57838 / 40 ) )) );
				float2 uv_ColorShiftMaskMap = IN.ase_texcoord2.zw * _ColorShiftMaskMap_ST.xy + _ColorShiftMaskMap_ST.zw;
				float4 transform376_g57838 = mul(GetObjectToWorldMatrix(),float4( IN.ase_texcoord3.xyz , 0.0 ));
				float3 temp_output_337_0_g57838 = saturate( ( 1.0 - ( (( SAMPLE_TEXTURE2D( _ColorShiftMaskMap, sampler_MainTex, uv_ColorShiftMaskMap ) * transform376_g57838 )).rgb / max( _ColorShiftMaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g57838 = lerp( hsvTorgb126_g57838 , BaseColor136_g57838 , temp_output_337_0_g57838);
				float3 lerpResult311_g57838 = lerp( BaseColor136_g57838 , hsvTorgb126_g57838 , temp_output_337_0_g57838);
				float3 lerpResult389_g57838 = lerp( lerpResult314_g57838 , lerpResult311_g57838 , _ColorShiftMaskInverted);
				float3 lerpResult387_g57838 = lerp( hsvTorgb126_g57838 , lerpResult389_g57838 , _ColorShiftEnableMask);
				float3 lerpResult392_g57838 = lerp( temp_output_134_0_g57838 , lerpResult387_g57838 , _ColorShiftInfluence);
				float temp_output_402_0_g57838 = ( _ColorShiftEnable + ( ( _CATEGORY_COLORSHIFT + _SPACE_COLORSHIFT ) * 0.0 ) );
				float3 lerpResult393_g57838 = lerp( temp_output_134_0_g57838 , lerpResult392_g57838 , temp_output_402_0_g57838);
				
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , ase_worldViewDir );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				

				float3 BaseColor = lerpResult393_g57838;
				float Alpha = temp_output_98_0_g57828;
				float AlphaClipThreshold = _AlphaCutoffBias;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			
			float3 _NormalModefloat3switch( float m_switch, float3 m_Flip, float3 m_Mirror, float3 m_None )
			{
				if(m_switch ==0)
					return m_Flip;
				else if(m_switch ==1)
					return m_Mirror;
				else if(m_switch ==2)
					return m_None;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.ase_texcoord.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord5.xy = vertexToFrag70_g57836;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 tangentWS = float4(TransformObjectToWorldDir( v.ase_tangent.xyz), v.ase_tangent.w);
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 vertexToFrag70_g57836 = IN.ase_texcoord5.xy;
				float4 NORMAL_RGB1382_g57785 = SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, vertexToFrag70_g57836 );
				float3 unpack1891_g57785 = UnpackNormalScale( NORMAL_RGB1382_g57785, _NormalStrength );
				unpack1891_g57785.z = lerp( 1, unpack1891_g57785.z, saturate(_NormalStrength) );
				float3 temp_output_24_0_g57799 = unpack1891_g57785;
				float temp_output_50_0_g57799 = _DoubleSidedNormalMode;
				float m_switch64_g57799 = temp_output_50_0_g57799;
				float3 m_Flip64_g57799 = float3(-1,-1,-1);
				float3 m_Mirror64_g57799 = float3(1,1,-1);
				float3 m_None64_g57799 = float3(1,1,1);
				float3 local_NormalModefloat3switch64_g57799 = _NormalModefloat3switch( m_switch64_g57799 , m_Flip64_g57799 , m_Mirror64_g57799 , m_None64_g57799 );
				float3 switchResult58_g57799 = (((ase_vface>0)?(temp_output_24_0_g57799):(( temp_output_24_0_g57799 * local_NormalModefloat3switch64_g57799 ))));
				
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , ase_worldViewDir );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				

				float3 Normal = switchResult58_g57799;
				float Alpha = temp_output_98_0_g57828;
				float AlphaClipThreshold = _AlphaCutoffBias;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.ase_texcoord.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord.xy = vertexToFrag70_g57836;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 vertexToFrag70_g57836 = IN.ase_texcoord.xy;
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , ase_worldViewDir );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57828;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoffBias;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define _ALPHATEST_SHADOW_ON 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _AlphaRemap;
			half4 _BaseColor;
			float4 _MainUVs;
			half4 _SmoothnessStrength;
			half4 _TranslucencyColor;
			float4 _ColorShiftMaskMap_ST;
			half4 _OcclusionStrengthAO;
			half4 _TransmissionColor;
			float _SPACE_OCCLUSION;
			float _CATEGORY_OCCLUSION;
			half _OcclusionStrengthAORemapMax;
			half _OcclusionStrengthAORemapMin;
			half _SmoothnessFresnelEnable;
			half _SmoothnessFresnelScale;
			half _OcclusionSourceInverted;
			half _SmoothnessSource;
			float _SPACE_SMOOTHNESS;
			float _CATEGORY_SMOOTHNESS;
			half _SmoothnessStrengthRemapMax;
			half _SmoothnessStrengthRemapMin;
			float _SPACE_METALLIC;
			float _CATEGORY_METALLIC;
			half _SmoothnessFresnelPower;
			half _OcclusionSourceBaked;
			int _Cull;
			float _MetallicStrength;
			half _ThicknessMapInverted;
			half _ThicknessStrength;
			half _ThicknessFeather;
			half _TranslucencyStrength;
			float _SPACE_TRANSMISSION;
			float _CATEGORY_TRANSLUCENCY;
			half _TransmissionEnable;
			half _TransmissionSource;
			half _TransmissionMaskInverted;
			float _AlphaRemapMin;
			half _TransmissionMaskStrength;
			half _TransmissionStrength;
			float _SPACE_SHADOW;
			float _CATEGORY_SHADOW;
			half _AlphaCutoffBiasShadow;
			half _AlphaCutoffBias;
			float _SPACE_ALPHACLIP;
			float _CATEGORY_ALPHACLIPPING;
			half _GlancingClipMode;
			float _AlphaRemapMax;
			half _TransmissionMaskFeather;
			half _DoubleSidedNormalMode;
			float _SPACE_COLORSHIFT;
			half _TranslucencySource;
			half _WindEnableMode;
			half _WindLocalIntensity;
			half _WindGlobalIntensity;
			half _WindEnableType;
			float _CATEGORY_SURFACEINPUTS;
			float _SPACE_SURFACEINPUTS;
			float _CATEGORY_TRANSMISSION;
			float _SPACE_TRANSLUCENCY;
			float _CATEGORY_TRANSLUCENCYASE;
			float _SPACE_TRANSLUCENCYASE;
			float _ASETranslucencyShadow;
			float _ASETranslucencyAmbient;
			float _ASETranslucencyDirect;
			float _ASETranslucencyScattering;
			float _ASETranslucencyNormalDistortion;
			float _ASETranslucencyStrength;
			float _ASETransmissionShadow;
			float _CATEGORY_SURFACEOPTIONS;
			float _SPACE_SURFACEOPTIONS;
			half _WindLocalRandomOffset;
			half _NormalStrength;
			half _WindLocalPulseFrequency;
			half _WindGlobalTurbulence;
			float _CATEGORY_COLORSHIFT;
			half _ColorShiftEnable;
			half _ColorShiftInfluence;
			half _ColorShiftEnableMask;
			half _ColorShiftMaskInverted;
			half _ColorShiftMaskFuzziness;
			half _ColorShiftSaturation;
			half _ColorShiftVariationRGB;
			half _ColorShiftVariation;
			half _ColorShiftWorldSpaceDistance;
			half _ColorShiftWorldSpaceOffset;
			half _ColorShiftWorldSpaceNoiseShift;
			half _ColorShiftNoiseScale;
			half _ColorShiftSource;
			half _Brightness;
			float _SPACE_WIND;
			float _CATEGORY_WIND;
			half _WindEnable;
			half _WindLocalTurbulence;
			half _WindLocalDirection;
			half _TranslucencyEnable;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float _GlobalWindIntensity;
			float _GlobalWindRandomOffset;
			float _GlobalWindPulse;
			float _GlobalWindDirection;
			float _GlobalWindTurbulence;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Typefloat3switch2439_g57782( float m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float m_switch2439_g57782 = _WindEnableType;
				float3 VERTEX_POSITION_MATRIX2352_g57782 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float GlobalWindIntensity3173_g57782 = _GlobalWindIntensity;
				float WIND_MODE2462_g57782 = _WindEnableMode;
				float lerpResult3147_g57782 = lerp( ( _WindGlobalIntensity * GlobalWindIntensity3173_g57782 ) , _WindLocalIntensity , WIND_MODE2462_g57782);
				float _WIND_STRENGHT2400_g57782 = lerpResult3147_g57782;
				float GlobalWindRandomOffset3174_g57782 = _GlobalWindRandomOffset;
				float lerpResult3149_g57782 = lerp( GlobalWindRandomOffset3174_g57782 , _WindLocalRandomOffset , WIND_MODE2462_g57782);
				float4 transform3073_g57782 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g57782 = (float2(transform3073_g57782.x , transform3073_g57782.z));
				float dotResult2341_g57782 = dot( appendResult2307_g57782 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g57782 = lerp( 0.8 , ( ( lerpResult3149_g57782 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g57782 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g57782 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g57782 );
				float _WIND_TUBULENCE_RANDOM2274_g57782 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 15.0 ) ) ) * 0.5 );
				float GlobalWindPulse3177_g57782 = _GlobalWindPulse;
				float lerpResult3152_g57782 = lerp( GlobalWindPulse3177_g57782 , _WindLocalPulseFrequency , WIND_MODE2462_g57782);
				float _WIND_PULSE2421_g57782 = lerpResult3152_g57782;
				float FUNC_Angle2470_g57782 = ( _WIND_STRENGHT2400_g57782 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 ) - ( VERTEX_POSITION_MATRIX2352_g57782.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * _WIND_PULSE2421_g57782 );
				float FUNC_Angle_SinA2424_g57782 = sin( FUNC_Angle2470_g57782 );
				float FUNC_Angle_CosA2362_g57782 = cos( FUNC_Angle2470_g57782 );
				float GlobalWindDirection3175_g57782 = _GlobalWindDirection;
				float lerpResult3150_g57782 = lerp( GlobalWindDirection3175_g57782 , _WindLocalDirection , WIND_MODE2462_g57782);
				float _WindDirection2249_g57782 = lerpResult3150_g57782;
				float2 localDirectionalEquation2249_g57782 = DirectionalEquation( _WindDirection2249_g57782 );
				float2 break2469_g57782 = localDirectionalEquation2249_g57782;
				float _WIND_DIRECTION_X2418_g57782 = break2469_g57782.x;
				float lerpResult2258_g57782 = lerp( break2265_g57782.x , ( ( break2265_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2265_g57782.x * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_X2418_g57782);
				float3 break2340_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float3 break2233_g57782 = VERTEX_POSITION_MATRIX2352_g57782;
				float _WIND_DIRECTION_Y2416_g57782 = break2469_g57782.y;
				float lerpResult2275_g57782 = lerp( break2233_g57782.z , ( ( break2233_g57782.y * FUNC_Angle_SinA2424_g57782 ) + ( break2233_g57782.z * FUNC_Angle_CosA2362_g57782 ) ) , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2235_g57782 = (float3(lerpResult2258_g57782 , ( ( break2340_g57782.y * FUNC_Angle_CosA2362_g57782 ) - ( break2340_g57782.z * FUNC_Angle_SinA2424_g57782 ) ) , lerpResult2275_g57782));
				float3 VERTEX_POSITION2282_g57782 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g57782 , 0.0 ) ).xyz - v.vertex.xyz );
				float3 break2518_g57782 = VERTEX_POSITION2282_g57782;
				half FUNC_SinFunction2336_g57782 = sin( ( ( _WIND_RANDOM_OFFSET2244_g57782 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g57782 + ( VERTEX_POSITION_MATRIX2352_g57782.z / 2.0 ) ) );
				float GlobalWindTurbulence3176_g57782 = _GlobalWindTurbulence;
				float lerpResult3151_g57782 = lerp( ( _WindGlobalTurbulence * GlobalWindTurbulence3176_g57782 ) , _WindLocalTurbulence , WIND_MODE2462_g57782);
				float _WIND_TUBULENCE2442_g57782 = lerpResult3151_g57782;
				float3 appendResult2480_g57782 = (float3(break2518_g57782.x , ( break2518_g57782.y + ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) ) , break2518_g57782.z));
				float3 VERTEX_LEAF2396_g57782 = appendResult2480_g57782;
				float3 m_Leaf2439_g57782 = VERTEX_LEAF2396_g57782;
				float3 VERTEX_PALM2310_g57782 = ( ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) * _WIND_TUBULENCE2442_g57782 ) + VERTEX_POSITION2282_g57782 );
				float3 m_Palm2439_g57782 = VERTEX_PALM2310_g57782;
				float3 break2486_g57782 = VERTEX_POSITION2282_g57782;
				float temp_output_2514_0_g57782 = ( FUNC_SinFunction2336_g57782 * v.ase_color.b * ( FUNC_Angle2470_g57782 + ( _WIND_STRENGHT2400_g57782 / 200.0 ) ) );
				float lerpResult2482_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_X2418_g57782);
				float lerpResult2484_g57782 = lerp( 0.0 , temp_output_2514_0_g57782 , _WIND_DIRECTION_Y2416_g57782);
				float3 appendResult2489_g57782 = (float3(( break2486_g57782.x + lerpResult2482_g57782 ) , break2486_g57782.y , ( break2486_g57782.z + lerpResult2484_g57782 )));
				float3 VERTEX_GRASS2242_g57782 = appendResult2489_g57782;
				float3 m_Grass2439_g57782 = VERTEX_GRASS2242_g57782;
				float3 m_Simple2439_g57782 = VERTEX_POSITION2282_g57782;
				float clampResult2884_g57782 = clamp( ( _WIND_STRENGHT2400_g57782 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g57782 = VERTEX_POSITION2282_g57782;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 break2718_g57782 = ase_worldPos;
				float temp_output_2690_0_g57782 = ( _WIND_RANDOM_OFFSET2244_g57782 * 25.0 );
				float clampResult2691_g57782 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g57782 = (float2(temp_output_2690_0_g57782 , ( temp_output_2690_0_g57782 / clampResult2691_g57782 )));
				float3 appendResult2706_g57782 = (float3(break2708_g57782.x , ( break2708_g57782.y + cos( ( ( ( break2718_g57782.x + break2718_g57782.y + break2718_g57782.z ) * 2.0 ) + appendResult2694_g57782 + FUNC_Angle2470_g57782 + _WIND_TUBULENCE2442_g57782 ) ) ).x , break2708_g57782.z));
				float3 temp_output_2613_0_g57782 = ( clampResult2884_g57782 * appendResult2706_g57782 );
				float3 VERTEX_IVY997_g57782 = ( ( ( cos( temp_output_2613_0_g57782 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g57782 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g57782 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g57782 = VERTEX_IVY997_g57782;
				float3 localWind_Typefloat3switch2439_g57782 = Wind_Typefloat3switch2439_g57782( m_switch2439_g57782 , m_Leaf2439_g57782 , m_Palm2439_g57782 , m_Grass2439_g57782 , m_Simple2439_g57782 , m_Ivy2439_g57782 );
				float3 lerpResult3142_g57782 = lerp( float3(0,0,0) , localWind_Typefloat3switch2439_g57782 , ( _WindEnable + ( ( _CATEGORY_WIND + _SPACE_WIND ) * 0.0 ) ));
				float3 temp_output_1234_0_g57785 = lerpResult3142_g57782;
				
				float2 temp_output_1955_0_g57785 = (_MainUVs).xy;
				float2 temp_output_1953_0_g57785 = (_MainUVs).zw;
				float2 Offset235_g57836 = temp_output_1953_0_g57785;
				float2 temp_output_41_0_g57836 = ( ( v.ase_texcoord.xy * temp_output_1955_0_g57785 ) + Offset235_g57836 );
				float2 vertexToFrag70_g57836 = temp_output_41_0_g57836;
				o.ase_texcoord.xy = vertexToFrag70_g57836;
				o.ase_texcoord1.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = temp_output_1234_0_g57785;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 vertexToFrag70_g57836 = IN.ase_texcoord.xy;
				float4 tex2DNode2048_g57785 = SAMPLE_TEXTURE2D( _MainTex, sampler_MainTex, vertexToFrag70_g57836 );
				float temp_output_22_0_g57828 = tex2DNode2048_g57785.a;
				float3 ase_worldPos = IN.ase_texcoord1.xyz;
				float3 normalizeResult79_g57833 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult74_g57828 = dot( normalizeResult79_g57833 , ase_worldViewDir );
				float lerpResult80_g57828 = lerp( 1.0 , ( 1.0 - ( ( 1.0 - abs( dotResult74_g57828 ) ) * ( 1.0 - abs( dotResult74_g57828 ) ) ) ) , ( _GlancingClipMode + ( ( _CATEGORY_ALPHACLIPPING + _SPACE_ALPHACLIP ) * 0.0 ) ));
				float temp_output_98_0_g57828 = ( ( (0.0 + (( 1.0 - temp_output_22_0_g57828 ) - 0.0) * (( _AlphaRemapMin + ( _AlphaRemap.x * 0.0 ) ) - 0.0) / (1.0 - 0.0)) + (0.0 + (temp_output_22_0_g57828 - 0.0) * (_AlphaRemapMax - 0.0) / (1.0 - 0.0)) ) * lerpResult80_g57828 );
				

				surfaceDescription.Alpha = temp_output_98_0_g57828;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoffBias;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "ALP8310_DE_ShaderGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.IntNode;2895;-3951.093,-3727.667;Inherit;False;Property;_Cull;Render Face;1;1;[Enum];Create;False;0;0;1;Front,2,Back,1,Both,0;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;2905;-3953.242,-3810.476;Inherit;False;Property;_SPACE_SURFACEOPTIONS;SPACE_SURFACEOPTIONS;2;0;Create;True;0;0;0;True;1;DE_DrawerSpace(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2906;-3954.716,-3884.686;Inherit;False;Property;_CATEGORY_SURFACEOPTIONS;CATEGORY_SURFACEOPTIONS;0;0;Create;True;0;0;0;True;1;DE_DrawerCategory(SURFACE OPTIONS,true,_Cull,0,0);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;2909;-4409.182,-4285.391;Inherit;False;313.6821;574.1448;TRANSLUCENCY ASE;7;2918;2917;2916;2915;2914;2913;2912;;0,0,0,1;0;0
Node;AmplifyShaderEditor.StickyNoteNode;2910;-4768.354,-4280.409;Inherit;False;356.3999;398.0999;;;0,0,0,1;_ASETransmissionShadow$$_ASETranslucencyStrength$_ASETranslucencyNormalDistortion$_ASETranslucencyScattering$_ASETranslucencyDirect$_ASETranslucencyAmbient$_ASETranslucencyShadow;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2912;-4372.001,-4243.19;Inherit;False;Property;_ASETransmissionShadow;ASE Transmission Shadow;186;0;Create;False;1;;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2913;-4368.201,-4170.765;Inherit;False;Property;_ASETranslucencyStrength;ASE Translucency Strength;187;0;Create;False;1;;0;0;True;0;False;1;1;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2914;-4391.682,-4093.548;Inherit;False;Property;_ASETranslucencyNormalDistortion;ASE Translucency Normal Distortion ;188;0;Create;False;1;;0;0;True;0;False;0.2735869;0.2735869;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2915;-4374.25,-4020.646;Inherit;False;Property;_ASETranslucencyScattering;ASE Translucency Scattering ;189;0;Create;False;1;;0;0;True;0;False;2;2;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2916;-4377.085,-3948.846;Inherit;False;Property;_ASETranslucencyDirect;ASE Translucency Direct ;190;0;Create;False;1;;0;0;True;0;False;0.9;0.9;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2917;-4378.186,-3875.246;Inherit;False;Property;_ASETranslucencyAmbient;ASE Translucency Ambient;191;0;Create;False;1;;0;0;True;0;False;0.8339342;0.8339342;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2918;-4376.856,-3801.546;Inherit;False;Property;_ASETranslucencyShadow;ASE Translucency Shadow ;192;0;Create;False;1;;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2911;-4755.631,-4005.483;Inherit;False;Property;_SPACE_TRANSLUCENCYASE;SPACE_TRANSLUCENCYASE;193;0;Create;True;0;0;0;True;1;DE_DrawerSpace(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2919;-4757.105,-4079.691;Inherit;False;Property;_CATEGORY_TRANSLUCENCYASE;CATEGORY_TRANSLUCENCY ASE;185;0;Create;True;0;0;0;True;1;DE_DrawerCategory(TRANSLUCENCY ASE,true,_ASETranslucencyStrength,0,0);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2920;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2921;-3953.374,-3640.745;Float;False;True;-1;2;ALP8310_DE_ShaderGUI;0;12;ALP/Cutout Translucency Wind;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;20;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;True;_Cull;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;41;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;638176265066812660;Transmission;1;638176265074118805;  Transmission Shadow;0.5,True,_ASETransmissionShadow;638176265195258737;Translucency;1;638176265085853908;  Translucency Strength;1,True,_ASETranslucencyStrength;638176265248324945;  Normal Distortion;0.5,True,_ASETranslucencyNormalDistortion;638176265293808092;  Scattering;2,True,_ASETranslucencyScattering;638176265318147341;  Direct;0.9,True,_ASETranslucencyScattering;638176265361412706;  Ambient;0.1,True,_ASETranslucencyAmbient;638176265400314693;  Shadow;0.5,True,_ASETranslucencyShadow;638176265464707402;Cast Shadows;1;0;  Use Shadow Threshold;1;638176265525101667;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,_TessellationPhong;0;  Type;0;0;  Tess;16,True,_TessellationStrength;0;  Min;10,True,_TessellationDistanceMin;0;  Max;25,True,_TessellationDistanceMax;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;False;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2922;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2923;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2924;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2925;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2926;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2927;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2928;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2929;-3953.374,-3640.745;Float;False;False;-1;2;DE_ShaderGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/DE/Utility/Fallback;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;2871;-4667.426,-3646.721;Inherit;False;DESF Weather Wind;194;;57782;b135a554f7e4d0b41bba02c61b34ae74;5,2432,1,3133,1,2371,1,3138,0,3139,0;0;1;FLOAT3;2190
Node;AmplifyShaderEditor.FunctionNode;2879;-4421.943,-3646.505;Inherit;False;DESF Core Cutout;3;;57785;e0cdd7758f4404849b063afff4596424;11,442,2,1556,1,1557,1,1749,1,96,2,1368,0,1896,0,2028,0,1333,0,1415,0,830,0;1;1234;FLOAT3;0,0,0;False;16;FLOAT3;38;FLOAT3;35;FLOAT;37;FLOAT3;1922;FLOAT;33;FLOAT;34;FLOAT;46;FLOAT;814;FLOAT;1660;FLOAT3;656;FLOAT3;657;FLOAT3;655;FLOAT3;1235;SAMPLERSTATE;1819;SAMPLERSTATE;1824;SAMPLERSTATE;1818
WireConnection;2921;0;2879;38
WireConnection;2921;1;2879;35
WireConnection;2921;3;2879;37
WireConnection;2921;4;2879;33
WireConnection;2921;5;2879;34
WireConnection;2921;6;2879;46
WireConnection;2921;7;2879;814
WireConnection;2921;16;2879;1660
WireConnection;2921;14;2879;656
WireConnection;2921;15;2879;657
WireConnection;2921;8;2879;1235
WireConnection;2879;1234;2871;2190
ASEEND*/
//CHKSM=1A4B0EB162EB64B4CECF612F92251162D9C388D4