// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FORGE3D/Planets HD/Terrestrial"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_GlobalBoost("Global Boost", Float) = 1
		_FresnelLandColor("Fresnel Land Color", Color) = (0.4558824,0.4558824,0.4558824,1)
		_FresnelLandPower("Fresnel Land Power", Range( 0.003 , 25)) = 0.003
		_FrenselLandMult("Frensel Land Mult", Range( 0 , 10)) = 0
		_FresnelWaterColor("Fresnel Water Color", Color) = (0.4558824,0.4558824,0.4558824,1)
		_FresnelWaterPower("Fresnel Water Power", Range( 0.003 , 25)) = 0.003
		_FresnelWaterMult("Fresnel Water Mult", Range( 0 , 10)) = 0
		_CityLightMap("City Light Map", 2D) = "white" {}
		_CityLightUVMap("CityLight UV Map", 2D) = "white" {}
		_CityLightMaskMap("CityLight Mask Map", 2D) = "white" {}
		_CityLightColor("CityLight Color", Color) = (0,0,0,0)
		_CityLightPopulation("CityLight Population", Float) = 0
		_ScatterMap("Scatter Map", 2D) = "white" {}
		_ScatterColor("Scatter Color", Color) = (0,0,0,0)
		_ScatterBoost("Scatter Boost", Range( 0 , 5)) = 1
		_ScatterIndirect("Scatter Indirect", Range( 0 , 1)) = 0
		_ScatterStretch("Scatter Stretch", Range( -2 , 2)) = 0
		_ScatterCenterShift("Scatter Center Shift", Range( -2 , 2)) = 0
		_WaterShoreFactor("Water Shore Factor", Float) = 0
		_WaterDetailFactor("Water Detail Factor", Float) = 0
		_WaterDetailBoost("Water Detail Boost", Float) = 0
		_WaterShallowColor("Water Shallow Color", Color) = (0,0,0,0)
		_WaterShoreColor("Water Shore Color", Color) = (0,0,0,0)
		_WaterDeepColor("Water Deep Color", Color) = (0,0,0,0)
		_WaterSpecularColor("Water Specular Color", Color) = (1,1,1,1)
		_WaterSpecular("Water Specular", Range( 0.003 , 1)) = 0.003
		_WaterSmoothness("Water Smoothness", Range( 0 , 1)) = 0
		_LandSpecular("Land Specular", Range( 0.03 , 1)) = 0.03
		_LandSmoothness("Land Smoothness", Range( 0 , 1)) = 0.03
		_NormalMap("Normal Map", 2D) = "white" {}
		_NormalTiling("Normal Tiling", Float) = 0
		_NormalFresnelScale("Normal Fresnel Scale", Float) = 0
		_NormalScale("Normal Scale", Float) = 0
		_HeightMap("Height Map", 2D) = "white" {}
		_HeightTiling("Height Tiling", Float) = 0
		_LandMask("Land Mask", 2D) = "white" {}
		_BaseColor("Base Color", Color) = (0.5220588,0.5220588,0.5220588,0)
		_DesertColor("Desert Color", Color) = (0.4779412,0.4779412,0.4779412,1)
		_DesertCoverage("Desert Coverage", Range( 0 , 1)) = 1
		_DesertFactors("Desert Factors", Range( 0 , 50)) = 0.5
		_VegetationColor("Vegetation Color", Color) = (0.4779412,0.4779412,0.4779412,1)
		_VegetationCoverage("Vegetation Coverage", Range( 0 , 1)) = 1
		_VegetationFactors("Vegetation Factors", Range( 0 , 20)) = 0.5
		_MountainColor("Mountain Color", Color) = (0.4779412,0.4779412,0.4779412,1)
		_MountainCoverage("Mountain Coverage", Range( 0 , 1)) = 1
		_MountainFactors("Mountain Factors", Range( 0 , 50)) = 0.5
		_Gradient("Gradient", 2D) = "white" {}
		_CloudsTop("Clouds Top", 2D) = "white" {}
		_CloudsMiddle("Clouds Middle", 2D) = "white" {}
		_CloudsBlendWeight("Clouds Blend Weight", Range( -1000 , 1000)) = 0
		_CloudsTopSpeed("Clouds Top Speed", Range( -0.02 , 0.02)) = 0
		_CloudsMiddleSpeed("Clouds Middle Speed", Range( -0.02 , 0.02)) = 0
		_CloudsHeight("Clouds Height", Float) = 0.005
		_CloudsTint("Clouds Tint", Color) = (0,0,0,0)
		_CloudShadows("Cloud Shadows", Range( 0 , 1)) = 0.03
		_CloudsOutput("Clouds Output", Range( 0 , 1)) = 1
		_CloudsSpecularLerp("Clouds Specular Lerp", Float) = 9
		_CloudsSmoothnessLerp("Clouds Smoothness  Lerp", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
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

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
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

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULAR_SETUP
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			sampler2D _ScatterMap;
			sampler2D _CloudsTop;
			sampler2D _CloudsMiddle;
			sampler2D _Gradient;
			sampler2D _HeightMap;
			sampler2D _LandMask;
			sampler2D _NormalMap;
			sampler2D _CityLightMaskMap;
			sampler2D _CityLightMap;
			sampler2D _CityLightUVMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_normal = v.ase_normal;
				o.ase_texcoord8.xy = v.texcoord1.xy;
				o.ase_texcoord8.zw = v.texcoord.xy;
				o.ase_texcoord9 = v.vertex;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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
						 ) : SV_Target
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

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 normalizeResult8_g384 = normalize( WorldViewDirection );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = IN.ase_texcoord8.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = tex2D( _CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = IN.ase_texcoord8.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = tex2D( _CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = IN.ase_texcoord8.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( tex2D( _Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = tex2D( _CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = tex2D( _CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, IN.ase_texcoord9.xyz, IN.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = IN.ase_texcoord8.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = tex2D( _LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float4 triplanar51 = TriplanarSampling51( _NormalMap, IN.ase_texcoord9.xyz, IN.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_tanViewDir , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				
				float4 normalizeResult60 = normalize( float4(0,0,1,0) );
				float4 lerpResult66 = lerp( float4( normalUnpacked54 , 0.0 ) , normalizeResult60 , tex2DNode2.r);
				float4 lerpResult192 = lerp( lerpResult66 , float4(0,0,1,0) , ( 1.0 - temp_output_298_122 ));
				float4 normalizeResult220 = normalize( lerpResult192 );
				
				float2 uv_CityLightMaskMap = IN.ase_texcoord8.zw * _CityLightMaskMap_ST.xy + _CityLightMaskMap_ST.zw;
				float mask19_g382 = tex2D( _CityLightMaskMap, uv_CityLightMaskMap ).r;
				float2 uv_CityLightUVMap = IN.ase_texcoord8.zw * _CityLightUVMap_ST.xy + _CityLightUVMap_ST.zw;
				float4 tex2DNode12_g382 = tex2D( _CityLightUVMap, uv_CityLightUVMap );
				float2 appendResult20_g382 = (float2(tex2DNode12_g382.r , tex2DNode12_g382.g));
				float2 detailUV21_g382 = appendResult20_g382;
				float cityLightMap24_g382 = ( mask19_g382 * tex2D( _CityLightMap, detailUV21_g382 ).r );
				float3 lerpResult5_g383 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - WorldPosition ) , _MainLightPosition.w);
				float3 normalizeResult6_g383 = normalize( lerpResult5_g383 );
				float dotResult1_g383 = dot( normalizeResult6_g383 , WorldNormal );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_30_0_g382 = ( 1.0 - saturate( ( dotResult1_g383 * ase_lightAtten ) ) );
				
				float4 lerpResult47 = lerp( ( temp_output_15_0 * _LandSpecular ) , saturate( ( _WaterSpecular * ( depth11_g393 + 0.1 ) * _WaterSpecularColor ) ) , tex2DNode2.r);
				float4 temp_cast_16 = (_CloudsSpecularLerp).xxxx;
				float temp_output_187_0 = (temp_output_298_0).r;
				float4 lerpResult185 = lerp( lerpResult47 , temp_cast_16 , temp_output_187_0);
				
				float lerpResult48 = lerp( ( _LandSmoothness * ( break16.x + break16.y + break16.z ) ) , _WaterSmoothness , tex2DNode2.r);
				float temp_output_95_0 = saturate( lerpResult48 );
				float lerpResult189 = lerp( temp_output_95_0 , _CloudsSmoothnessLerp , ( temp_output_95_0 * temp_output_187_0 ));
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( _MainLightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
				float3 Normal = normalizeResult220.xyz;
				float3 Emission = max( ( temp_output_298_122 * ( _CityLightColor * pow( max( 0.0 , cityLightMap24_g382 ) , ( 1.0 / _CityLightPopulation ) ) * ( 1.0 - tex2DNode2.r ) * saturate( ( temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 ) ) ) ) , float4( 0,0,0,0 ) ).rgb;
				float3 Specular = ( temp_output_298_122 * lerpResult185 ).rgb;
				float Metallic = 0;
				float Smoothness = ( temp_output_298_122 * lerpResult189 );
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

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
					float shadow = _TransmissionShadow;

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
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

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
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULAR_SETUP
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile _ _FORWARD_PLUS


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			sampler2D _ScatterMap;
			sampler2D _CloudsTop;
			sampler2D _CloudsMiddle;
			sampler2D _Gradient;
			sampler2D _HeightMap;
			sampler2D _LandMask;
			sampler2D _NormalMap;
			sampler2D _CityLightMaskMap;
			sampler2D _CityLightMap;
			sampler2D _CityLightUVMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_normal = v.ase_normal;
				o.ase_texcoord4.xy = v.texcoord1.xy;
				o.ase_texcoord4.zw = v.texcoord0.xy;
				o.ase_texcoord8 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult8_g384 = normalize( ase_worldViewDir );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = IN.ase_texcoord4.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = tex2D( _CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = IN.ase_texcoord4.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = tex2D( _CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = IN.ase_texcoord4.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( tex2D( _Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = tex2D( _CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = tex2D( _CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, IN.ase_texcoord8.xyz, IN.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = IN.ase_texcoord4.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = tex2D( _LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float4 triplanar51 = TriplanarSampling51( _NormalMap, IN.ase_texcoord8.xyz, IN.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_tanViewDir , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				
				float2 uv_CityLightMaskMap = IN.ase_texcoord4.zw * _CityLightMaskMap_ST.xy + _CityLightMaskMap_ST.zw;
				float mask19_g382 = tex2D( _CityLightMaskMap, uv_CityLightMaskMap ).r;
				float2 uv_CityLightUVMap = IN.ase_texcoord4.zw * _CityLightUVMap_ST.xy + _CityLightUVMap_ST.zw;
				float4 tex2DNode12_g382 = tex2D( _CityLightUVMap, uv_CityLightUVMap );
				float2 appendResult20_g382 = (float2(tex2DNode12_g382.r , tex2DNode12_g382.g));
				float2 detailUV21_g382 = appendResult20_g382;
				float cityLightMap24_g382 = ( mask19_g382 * tex2D( _CityLightMap, detailUV21_g382 ).r );
				float3 lerpResult5_g383 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - WorldPosition ) , _MainLightPosition.w);
				float3 normalizeResult6_g383 = normalize( lerpResult5_g383 );
				float dotResult1_g383 = dot( normalizeResult6_g383 , ase_worldNormal );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_30_0_g382 = ( 1.0 - saturate( ( dotResult1_g383 * ase_lightAtten ) ) );
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( _MainLightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
				float3 Emission = max( ( temp_output_298_122 * ( _CityLightColor * pow( max( 0.0 , cityLightMap24_g382 ) , ( 1.0 / _CityLightPopulation ) ) * ( 1.0 - tex2DNode2.r ) * saturate( ( temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 ) ) ) ) , float4( 0,0,0,0 ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			sampler2D _ScatterMap;
			sampler2D _CloudsTop;
			sampler2D _CloudsMiddle;
			sampler2D _Gradient;
			sampler2D _HeightMap;
			sampler2D _LandMask;
			sampler2D _NormalMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_normal = v.ase_normal;
				o.ase_texcoord2.xy = v.ase_texcoord1.xy;
				o.ase_texcoord2.zw = v.ase_texcoord.xy;
				o.ase_texcoord6 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
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
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord = v.ase_texcoord;
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
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult8_g384 = normalize( ase_worldViewDir );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = IN.ase_texcoord2.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = tex2D( _CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = IN.ase_texcoord2.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = tex2D( _CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = IN.ase_texcoord2.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( tex2D( _Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = tex2D( _CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = tex2D( _CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, IN.ase_texcoord6.xyz, IN.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = IN.ase_texcoord2.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = tex2D( _LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float4 triplanar51 = TriplanarSampling51( _NormalMap, IN.ase_texcoord6.xyz, IN.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_tanViewDir , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( _MainLightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT


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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			sampler2D _NormalMap;
			sampler2D _LandMask;
			sampler2D _CloudsTop;
			sampler2D _CloudsMiddle;
			sampler2D _Gradient;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			inline float4 TriplanarSampling51( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord5 = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord6.xy = v.ase_texcoord.xy;
				o.ase_texcoord6.zw = v.ase_texcoord1.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
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
						 )
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

				float4 triplanar51 = TriplanarSampling51( _NormalMap, IN.ase_texcoord5.xyz, IN.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float4 normalizeResult60 = normalize( float4(0,0,1,0) );
				float2 uv_LandMask = IN.ase_texcoord6.xy * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = tex2D( _LandMask, uv_LandMask );
				float4 lerpResult66 = lerp( float4( normalUnpacked54 , 0.0 ) , normalizeResult60 , tex2DNode2.r);
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = IN.ase_texcoord6.zw * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = tex2D( _CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3x3 ase_worldToTangent = float3x3(WorldTangent.xyz,ase_worldBitangent,WorldNormal);
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float2 uv_CloudsMiddle = IN.ase_texcoord6.xy * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBellyShadow85_g389 = tex2D( _CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float2 uv_Gradient = IN.ase_texcoord6.xy * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( tex2D( _Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 lerpResult192 = lerp( lerpResult66 , float4(0,0,1,0) , ( 1.0 - temp_output_298_122 ));
				float4 normalizeResult220 = normalize( lerpResult192 );
				

				float3 Normal = normalizeResult220.xyz;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#pragma shader_feature_local_fragment _SPECULAR_SETUP
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _FORWARD_PLUS


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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			sampler2D _ScatterMap;
			sampler2D _CloudsTop;
			sampler2D _CloudsMiddle;
			sampler2D _Gradient;
			sampler2D _HeightMap;
			sampler2D _LandMask;
			sampler2D _NormalMap;
			sampler2D _CityLightMaskMap;
			sampler2D _CityLightMap;
			sampler2D _CityLightUVMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"

			float2 rotateUV1_g390( float time, float2 uv, float speed )
			{
					
					uv -= 0.5;
					float s = sin ( speed * time );
					float c = cos ( speed * time );
					float2x2 rotationMatrix = float2x2( c, -s, s, c);
					rotationMatrix *= 0.5;
					rotationMatrix += 0.5;
					rotationMatrix = rotationMatrix * 2 - 1;
					uv = mul ( uv, rotationMatrix );
					return uv + 0.5;
			}
			
			inline float4 TriplanarSampling5( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			inline float4 TriplanarSampling51( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_normal = v.ase_normal;
				o.ase_texcoord8.xy = v.texcoord1.xy;
				o.ase_texcoord8.zw = v.texcoord.xy;
				o.ase_texcoord9 = v.vertex;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

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

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
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
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float4 transform4_g384 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g384 = normalize( transform4_g384 );
				float3 temp_output_1_0_g385 = normalizeResult6_g384.xyz;
				float3 normalizeResult7_g384 = normalize( _MainLightPosition.xyz );
				float dotResult4_g385 = dot( temp_output_1_0_g385 , normalizeResult7_g384 );
				float3 normalizeResult8_g384 = normalize( WorldViewDirection );
				float dotResult7_g385 = dot( temp_output_1_0_g385 , normalizeResult8_g384 );
				float2 appendResult10_g385 = (float2(( ( dotResult4_g385 / 2.0 ) + 0.5 ) , dotResult7_g385));
				float time1_g390 = _TimeParameters.x;
				float2 uv2_CloudsTop = IN.ase_texcoord8.xy * _CloudsTop_ST.xy + _CloudsTop_ST.zw;
				float2 uv1_g390 = uv2_CloudsTop;
				float speed1_g390 = _CloudsTopSpeed;
				float2 localrotateUV1_g390 = rotateUV1_g390( time1_g390 , uv1_g390 , speed1_g390 );
				float2 poleUV63_g389 = localrotateUV1_g390;
				float cloudPole76_g389 = tex2D( _CloudsTop, poleUV63_g389 ).r;
				float2 uv_CloudsMiddle = IN.ase_texcoord8.zw * _CloudsMiddle_ST.xy + _CloudsMiddle_ST.zw;
				float2 break53_g389 = uv_CloudsMiddle;
				float2 appendResult55_g389 = (float2(( break53_g389.x + ( _CloudsMiddleSpeed * _TimeParameters.x ) ) , break53_g389.y));
				float2 bellyUV56_g389 = appendResult55_g389;
				float cloudBelly73_g389 = tex2D( _CloudsMiddle, bellyUV56_g389 ).r;
				float2 uv_Gradient = IN.ase_texcoord8.zw * _Gradient_ST.xy + _Gradient_ST.zw;
				float gradientMap93_g389 = pow( max( tex2D( _Gradient, uv_Gradient ).r , 0.0 ) , _CloudsBlendWeight );
				float lerpResult25_g389 = lerp( cloudPole76_g389 , cloudBelly73_g389 , gradientMap93_g389);
				float cloudMix80_g389 = lerpResult25_g389;
				float4 temp_output_298_0 = saturate( ( cloudMix80_g389 * _CloudsTint * _CloudsOutput ) );
				float3 normalizeResult126_g389 = normalize( _MainLightPosition.xyz );
				float2 shadowUVPole47_g389 = (( _CloudsHeight * normalizeResult126_g389 )).xx;
				float cloudPoleShadow94_g389 = tex2D( _CloudsTop, ( poleUV63_g389 + shadowUVPole47_g389 ) ).r;
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 normalizeResult36_g389 = normalize( mul( ase_worldToTangent, _MainLightPosition.xyz ) );
				float2 shadowUVBelly46_g389 = (( normalizeResult36_g389 * _CloudsHeight )).xx;
				float cloudBellyShadow85_g389 = tex2D( _CloudsMiddle, ( shadowUVBelly46_g389 + bellyUV56_g389 ) ).r;
				float lerpResult95_g389 = lerp( cloudPoleShadow94_g389 , cloudBellyShadow85_g389 , ( gradientMap93_g389 + 0.1 ));
				float cloudMixShadow99_g389 = saturate( pow( max( 0.0 , ( 1.0 - lerpResult95_g389 ) ) , ( _CloudShadows * 50.0 ) ) );
				float temp_output_298_122 = cloudMixShadow99_g389;
				float4 triplanar5 = TriplanarSampling5( _HeightMap, IN.ase_texcoord9.xyz, IN.ase_normal, 5.0, _HeightTiling, 1.0, 0 );
				float4 height6 = triplanar5;
				float4 break16 = height6;
				float temp_output_10_0_g386 = break16.z;
				float lerpResult16_g386 = lerp( 0.0 , 1.0 , ( ( _DesertCoverage - ( break16.x * temp_output_10_0_g386 ) ) * _DesertFactors ));
				float4 lerpResult19_g386 = lerp( float4( ( _BaseColor * height6.x ).rgb , 0.0 ) , ( _DesertColor * temp_output_10_0_g386 ) , saturate( lerpResult16_g386 ));
				float lerpResult16_g387 = lerp( 0.0 , 1.0 , ( ( _VegetationCoverage - ( break16.x * break16.z ) ) * _VegetationFactors ));
				float4 lerpResult19_g387 = lerp( float4( saturate( lerpResult19_g386 ).rgb , 0.0 ) , ( _VegetationColor * break16.y ) , saturate( lerpResult16_g387 ));
				float lerpResult16_g391 = lerp( 0.0 , 1.0 , ( ( _MountainCoverage - break16.z ) * _MountainFactors ));
				float4 lerpResult19_g391 = lerp( float4( saturate( lerpResult19_g387 ).rgb , 0.0 ) , ( break16.x * _MountainColor ) , saturate( lerpResult16_g391 ));
				float4 temp_output_15_0 = saturate( lerpResult19_g391 );
				float4 break22 = height6;
				float depth11_g393 = saturate( ( pow( max( 0.0 , ( break22.x * break22.z ) ) , _WaterDetailFactor ) * _WaterDetailBoost ) );
				float4 lerpResult19_g393 = lerp( _WaterDeepColor , _WaterShallowColor , depth11_g393);
				float2 uv_LandMask = IN.ase_texcoord8.zw * _LandMask_ST.xy + _LandMask_ST.zw;
				float4 tex2DNode2 = tex2D( _LandMask, uv_LandMask );
				float shoreMask16_g393 = saturate( pow( max( 0.0 , tex2DNode2.g ) , _WaterShoreFactor ) );
				float4 lerpResult23_g393 = lerp( ( _WaterShoreColor + lerpResult19_g393 ) , lerpResult19_g393 , shoreMask16_g393);
				float4 waterColor25_g393 = lerpResult23_g393;
				float4 lerpResult27_g393 = lerp( float4( temp_output_15_0.rgb , 0.0 ) , waterColor25_g393 , tex2DNode2.r);
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float4 triplanar51 = TriplanarSampling51( _NormalMap, IN.ase_texcoord9.xyz, IN.ase_normal, 5.0, _NormalTiling, 1.0, 0 );
				float3 unpack71 = UnpackNormalScale( triplanar51, _NormalFresnelScale );
				unpack71.z = lerp( 1, unpack71.z, saturate(_NormalFresnelScale) );
				float3 fresnelNormalUnpacked73 = unpack71;
				float3 unpack52 = UnpackNormalScale( triplanar51, _NormalScale );
				unpack52.z = lerp( 1, unpack52.z, saturate(_NormalScale) );
				float3 normalUnpacked54 = unpack52;
				float3 lerpResult80 = lerp( fresnelNormalUnpacked73 , normalUnpacked54 , tex2DNode2.r);
				float3 normalizeResult5_g392 = normalize( lerpResult80 );
				float dotResult14_g392 = dot( ase_tanViewDir , normalizeResult5_g392 );
				float temp_output_37_0_g392 = max( 0.0 , saturate( ( 1.0 - dotResult14_g392 ) ) );
				float4 lerpResult32_g392 = lerp( ( ( saturate( pow( temp_output_37_0_g392 , _FresnelLandPower ) ) * _FrenselLandMult ) * _FresnelLandColor ) , ( ( saturate( pow( temp_output_37_0_g392 , _FresnelWaterPower ) ) * _FresnelWaterMult ) * _FresnelWaterColor ) , tex2DNode2.r);
				
				float4 normalizeResult60 = normalize( float4(0,0,1,0) );
				float4 lerpResult66 = lerp( float4( normalUnpacked54 , 0.0 ) , normalizeResult60 , tex2DNode2.r);
				float4 lerpResult192 = lerp( lerpResult66 , float4(0,0,1,0) , ( 1.0 - temp_output_298_122 ));
				float4 normalizeResult220 = normalize( lerpResult192 );
				
				float2 uv_CityLightMaskMap = IN.ase_texcoord8.zw * _CityLightMaskMap_ST.xy + _CityLightMaskMap_ST.zw;
				float mask19_g382 = tex2D( _CityLightMaskMap, uv_CityLightMaskMap ).r;
				float2 uv_CityLightUVMap = IN.ase_texcoord8.zw * _CityLightUVMap_ST.xy + _CityLightUVMap_ST.zw;
				float4 tex2DNode12_g382 = tex2D( _CityLightUVMap, uv_CityLightUVMap );
				float2 appendResult20_g382 = (float2(tex2DNode12_g382.r , tex2DNode12_g382.g));
				float2 detailUV21_g382 = appendResult20_g382;
				float cityLightMap24_g382 = ( mask19_g382 * tex2D( _CityLightMap, detailUV21_g382 ).r );
				float3 lerpResult5_g383 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - WorldPosition ) , _MainLightPosition.w);
				float3 normalizeResult6_g383 = normalize( lerpResult5_g383 );
				float dotResult1_g383 = dot( normalizeResult6_g383 , WorldNormal );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float temp_output_30_0_g382 = ( 1.0 - saturate( ( dotResult1_g383 * ase_lightAtten ) ) );
				
				float4 lerpResult47 = lerp( ( temp_output_15_0 * _LandSpecular ) , saturate( ( _WaterSpecular * ( depth11_g393 + 0.1 ) * _WaterSpecularColor ) ) , tex2DNode2.r);
				float4 temp_cast_16 = (_CloudsSpecularLerp).xxxx;
				float temp_output_187_0 = (temp_output_298_0).r;
				float4 lerpResult185 = lerp( lerpResult47 , temp_cast_16 , temp_output_187_0);
				
				float lerpResult48 = lerp( ( _LandSmoothness * ( break16.x + break16.y + break16.z ) ) , _WaterSmoothness , tex2DNode2.r);
				float temp_output_95_0 = saturate( lerpResult48 );
				float lerpResult189 = lerp( temp_output_95_0 , _CloudsSmoothnessLerp , ( temp_output_95_0 * temp_output_187_0 ));
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g385 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( temp_output_298_0 + ( temp_output_298_122 * saturate( ( saturate( ( _GlobalBoost * lerpResult27_g393 ) ) + saturate( ( float4( _MainLightColor.rgb , 0.0 ) * lerpResult32_g392 ) ) ) ) ) ) ).rgb;
				float3 Normal = normalizeResult220.xyz;
				float3 Emission = max( ( temp_output_298_122 * ( _CityLightColor * pow( max( 0.0 , cityLightMap24_g382 ) , ( 1.0 / _CityLightPopulation ) ) * ( 1.0 - tex2DNode2.r ) * saturate( ( temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 * temp_output_30_0_g382 ) ) ) ) , float4( 0,0,0,0 ) ).rgb;
				float3 Specular = ( temp_output_298_122 * lerpResult185 ).rgb;
				float Metallic = 0;
				float Smoothness = ( temp_output_298_122 * lerpResult189 );
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.clipPos;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
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

				#ifdef _DBUFFER
					ApplyDecal(IN.clipPos,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

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

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColor;
			float4 _WaterShallowColor;
			float4 _WaterDeepColor;
			float4 _WaterShoreColor;
			float4 _MountainColor;
			float4 _VegetationColor;
			float4 _FresnelLandColor;
			float4 _DesertColor;
			float4 _FresnelWaterColor;
			float4 _CityLightColor;
			float4 _CityLightMaskMap_ST;
			float4 _CityLightUVMap_ST;
			float4 _LandMask_ST;
			float4 _Gradient_ST;
			float4 _ScatterColor;
			float4 _CloudsMiddle_ST;
			float4 _CloudsTop_ST;
			float4 _CloudsTint;
			float4 _WaterSpecularColor;
			float _CityLightPopulation;
			float _NormalTiling;
			float _LandSmoothness;
			float _CloudsSpecularLerp;
			float _NormalFresnelScale;
			float _NormalScale;
			float _FrenselLandMult;
			float _WaterSpecular;
			float _FresnelWaterPower;
			float _FresnelWaterMult;
			float _WaterShoreFactor;
			float _LandSpecular;
			float _FresnelLandPower;
			float _ScatterCenterShift;
			float _MountainFactors;
			float _WaterDetailFactor;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _CloudsTopSpeed;
			float _CloudsMiddleSpeed;
			float _CloudsBlendWeight;
			float _CloudsOutput;
			float _CloudsHeight;
			float _CloudShadows;
			float _GlobalBoost;
			float _HeightTiling;
			float _DesertCoverage;
			float _DesertFactors;
			float _VegetationCoverage;
			float _VegetationFactors;
			float _MountainCoverage;
			float _WaterSmoothness;
			float _WaterDetailBoost;
			float _CloudsSmoothnessLerp;
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

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
	
	CustomEditor "ASEMaterialInspector"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.RangedFloatNode;4;-1576.536,-178.1983;Float;False;Property;_HeightTiling;Height Tiling;38;0;Create;True;0;0;0;False;0;False;0;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;227.1252,48.10492;Float;False;Property;_LandSpecular;Land Specular;31;0;Create;True;0;0;0;False;0;False;0.03;1;0.03;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;185;2805.667,-280.4904;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;191;3219.537,-215.0565;Float;False;Constant;_Vector2;Vector 2;19;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;131;745.1375,330.9167;Float;False;Constant;_Vector0;Vector 0;19;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;300;2057.312,-476.0628;Inherit;False;CityLights;8;;382;4cc89f4a87600d74dbfda0723672d233;0;1;17;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;67;500.7089,169.5665;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;230;3218.21,-421.8409;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;286;3620.391,-606.6197;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;189;2928.923,62.78754;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;3271.188,-802.3339;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;285;4027.84,-356.6715;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;594.1252,-54.89508;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;231;3204.719,49.78511;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;187;2485.439,-173.1112;Inherit;False;FLOAT;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;75;635.043,-208.7202;Inherit;False;73;fresnelNormalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;95;1222.357,46.49732;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;291;3997.026,38.79366;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;283;3370.444,322.6773;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;284;3108.512,-238.5454;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;60;946.5662,333.408;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;68;44.43475,188.9308;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;47;966.3252,-102.6951;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;188;2528.164,-347.4603;Inherit;False;Property;_CloudsSpecularLerp;Clouds Specular Lerp;65;0;Create;True;0;0;0;False;0;False;9;1.53;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;215;2724.415,177.2647;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;220;3700.905,-411.5891;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;48;959.219,59.8451;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;192;3495.477,-402.1153;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;196;3085.296,-543.5886;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;227.1252,145.1049;Float;False;Property;_LandSmoothness;Land Smoothness;32;0;Create;True;0;0;0;False;0;False;0.03;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;66;1196.843,341.7189;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;190;2613.219,88.75598;Inherit;False;Property;_CloudsSmoothnessLerp;Clouds Smoothness  Lerp;66;0;Create;True;0;0;0;False;0;False;0;0.62;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;288;3974.769,-476.5096;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;289;1925.538,-414.879;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;140;3045.611,-847.1066;Inherit;False;ScatterColor;14;;384;5984f944e2b849e44aad6ac4d7027dc1;0;0;1;COLOR;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;52;-921.5544,168.696;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;292;2724.727,-842.2635;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;71;-915.9163,331.573;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;53;-1237.554,391.696;Float;False;Property;_NormalScale;Normal Scale;36;0;Create;True;0;0;0;False;0;False;0;0.81;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;17;-375.2998,-241.896;Inherit;False;DesertColor;42;;386;1b595ba52fc886e48b4be4810312f928;0;3;3;FLOAT;0;False;10;FLOAT;0;False;6;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TriplanarNode;51;-1323.452,168.0363;Inherit;True;Spherical;Object;False;Top Texture 1;_TopTexture1;white;0;None;Mid Texture 1;_MidTexture1;white;0;None;Bot Texture 1;_BotTexture1;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;5;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;13;-51.60282,-171.6952;Inherit;False;VegetationColor;46;;387;7b054f74514e3c545b05ee9d3cc768b8;0;4;23;FLOAT;0;False;10;FLOAT;0;False;3;FLOAT;0;False;6;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-1233.957,479.2798;Float;False;Property;_NormalFresnelScale;Normal Fresnel Scale;35;0;Create;True;0;0;0;False;0;False;0;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-1577.052,283.4705;Float;False;Property;_NormalTiling;Normal Tiling;34;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;16;-710.702,-106.6947;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TexturePropertyNode;49;-1585.307,65.96893;Float;True;Property;_NormalMap;Normal Map;33;0;Create;True;0;0;0;False;0;False;None;3c13bc84830f236458594e2f6cc9c04a;True;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;6;-945.5557,-295.0933;Float;False;height;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TriplanarNode;5;-1322.935,-290.9525;Inherit;True;Spherical;Object;False;Top Texture 0;_TopTexture0;white;0;None;Mid Texture 0;_MidTexture0;white;0;None;Bot Texture 0;_BotTexture0;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;5;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;3;-1584.791,-395.6999;Float;True;Property;_HeightMap;Height Map;37;0;Create;True;0;0;0;False;0;False;None;a01e51192e20ad542bf77849171a65d9;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;1;-677.4996,-290.1661;Inherit;False;BaseColor;40;;388;436e5fd3b4e5f564d91908d8a8c53f20;0;1;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;22;282.4919,-484.8134;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;23;70.30082,-489.5881;Inherit;False;6;height;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;2;233.8507,-327.3218;Inherit;True;Property;_LandMask;Land Mask;39;0;Create;True;0;0;0;False;0;False;-1;None;1744fab73973e9347836cd337c5a59d6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;293;2510.973,-923.6171;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;298;1607.697,-912.4413;Inherit;False;Clouds;54;;389;b41fa152b94c44b4e9f91f67316d221d;0;1;127;FLOAT4;0,0,0,0;False;2;FLOAT;122;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;15;240.8973,-79.39526;Inherit;False;MountainColor;50;;391;4181dbe52ccd82c468b472a633e7f96c;0;3;3;FLOAT;0;False;10;FLOAT;0;False;6;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;70;1370.123,-319.8434;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;297;1049.029,-256.8683;Inherit;False;FresnelLandWater;1;;392;3e95808d42a13c34980842be780f16a4;0;2;24;FLOAT;0;False;22;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;127;1127.366,-474.9382;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;924.366,-489.9382;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;76;1522.043,-315.7202;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;301;587.622,-403.2938;Inherit;False;Water;21;;393;e187dfe8b39989f44abd5e4c0deac419;0;5;4;FLOAT;0;False;3;FLOAT;0;False;26;FLOAT;0;False;12;FLOAT;0;False;1;FLOAT3;0,0,0;False;3;COLOR;0;COLOR;28;FLOAT;35
Node;AmplifyShaderEditor.GetLocalVarNode;55;862.8409,259.8816;Inherit;False;54;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;857.3555,583.1948;Inherit;False;73;fresnelNormalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;126;740.366,-503.9382;Float;False;Property;_GlobalBoost;Global Boost;0;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;73;-634.9438,326.6002;Float;False;fresnelNormalUnpacked;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;54;-649.0061,163.0985;Float;False;normalUnpacked;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;80;1198.739,499.9872;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;303;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;302;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;211;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;209;4112.003,-762.4219;Float;False;True;-1;2;ASEMaterialInspector;0;12;FORGE3D/Planets HD/Terrestrial;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;20;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;41;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;0;638305467121494492;  Use Shadow Threshold;0;0;Receive Shadows;0;638305388830121488;GPU Instancing;1;0;LOD CrossFade;0;638305467952734097;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;False;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;234;4018.578,-762.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;210;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;213;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;304;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;212;4018.578,-843.326;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;305;4112.003,-702.4219;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;232;3462.591,-711.5063;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;306;3667.633,-682.4333;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
WireConnection;185;0;47;0
WireConnection;185;1;188;0
WireConnection;185;2;187;0
WireConnection;300;17;2;1
WireConnection;67;0;45;0
WireConnection;67;1;68;0
WireConnection;230;0;298;122
WireConnection;230;1;185;0
WireConnection;286;0;230;0
WireConnection;189;0;95;0
WireConnection;189;1;190;0
WireConnection;189;2;215;0
WireConnection;139;0;140;0
WireConnection;139;1;292;0
WireConnection;285;0;291;0
WireConnection;46;0;15;0
WireConnection;46;1;44;0
WireConnection;231;0;284;0
WireConnection;231;1;189;0
WireConnection;187;0;289;0
WireConnection;95;0;48;0
WireConnection;291;0;231;0
WireConnection;283;0;66;0
WireConnection;284;0;298;122
WireConnection;60;0;131;0
WireConnection;68;0;16;0
WireConnection;68;1;16;1
WireConnection;68;2;16;2
WireConnection;47;0;46;0
WireConnection;47;1;301;28
WireConnection;47;2;2;1
WireConnection;215;0;95;0
WireConnection;215;1;187;0
WireConnection;220;0;192;0
WireConnection;48;0;67;0
WireConnection;48;1;301;35
WireConnection;48;2;2;1
WireConnection;192;0;283;0
WireConnection;192;1;191;0
WireConnection;192;2;196;0
WireConnection;196;0;298;122
WireConnection;66;0;55;0
WireConnection;66;1;60;0
WireConnection;66;2;2;1
WireConnection;288;0;220;0
WireConnection;289;0;298;0
WireConnection;52;0;51;0
WireConnection;52;1;53;0
WireConnection;292;0;298;0
WireConnection;292;1;293;0
WireConnection;71;0;51;0
WireConnection;71;1;74;0
WireConnection;17;3;16;0
WireConnection;17;10;16;2
WireConnection;17;6;1;0
WireConnection;51;0;49;0
WireConnection;51;3;50;0
WireConnection;13;23;16;0
WireConnection;13;10;16;1
WireConnection;13;3;16;2
WireConnection;13;6;17;0
WireConnection;16;0;6;0
WireConnection;6;0;5;0
WireConnection;5;0;3;0
WireConnection;5;3;4;0
WireConnection;1;1;6;0
WireConnection;22;0;23;0
WireConnection;293;0;298;122
WireConnection;293;1;76;0
WireConnection;15;3;16;0
WireConnection;15;10;16;2
WireConnection;15;6;13;0
WireConnection;70;0;127;0
WireConnection;70;1;297;0
WireConnection;297;24;2;1
WireConnection;297;22;80;0
WireConnection;127;0;128;0
WireConnection;128;0;126;0
WireConnection;128;1;301;0
WireConnection;76;0;70;0
WireConnection;301;4;22;0
WireConnection;301;3;22;2
WireConnection;301;26;2;1
WireConnection;301;12;2;2
WireConnection;301;1;15;0
WireConnection;73;0;71;0
WireConnection;54;0;52;0
WireConnection;80;0;81;0
WireConnection;80;1;55;0
WireConnection;80;2;2;1
WireConnection;209;0;139;0
WireConnection;209;1;288;0
WireConnection;209;2;306;0
WireConnection;209;9;286;0
WireConnection;209;4;285;0
WireConnection;232;0;298;122
WireConnection;232;1;300;0
WireConnection;306;0;232;0
ASEEND*/
//CHKSM=04F21BA365E624CC56C018434C8B6EEBBD2126FA