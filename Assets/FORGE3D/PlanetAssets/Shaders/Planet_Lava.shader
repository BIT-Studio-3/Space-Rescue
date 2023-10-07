// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FORGE3D/Planets HD/Lava"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_SpecularColor("Specular Color", Color) = (0.3921569,0.3921569,0.3921569,1)
		_Shininess("Shininess", Range( 0.01 , 1)) = 0.1
		_HeightMap("Height Map", 2D) = "white" {}
		_ScatterMap("Scatter Map", 2D) = "white" {}
		_ScatterColor("Scatter Color", Color) = (0,0,0,0)
		_ScatterBoost("Scatter Boost", Range( 0 , 5)) = 1
		_ScatterIndirect("Scatter Indirect", Range( 0 , 1)) = 0
		_ScatterStretch("Scatter Stretch", Range( -2 , 2)) = 0
		_ScatterCenterShift("Scatter Center Shift", Range( -2 , 2)) = 0
		_DetailMap("Detail Map", 2D) = "white" {}
		_MagmaMap("Magma Map", 2D) = "white" {}
		_NormalMap("Normal Map", 2D) = "white" {}
		_NormalScale("Normal Scale", Float) = 0
		_NormalTiling("Normal Tiling", Float) = 0
		_HeightTiling("Height Tiling", Float) = 2
		_DetailTiling("Detail Tiling", Float) = 2
		_MagmaTiling("Magma Tiling", Float) = 2
		_LavaMaskTiling("Lava Mask Tiling", Float) = 2
		_SpecularColor("Specular Color", Color) = (0,0,0,0)
		_Specular("Specular", Range( 0.03 , 1)) = 0.03
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_SpecularBoost("Specular Boost", Float) = 0.03
		_LavaLow("Lava Low", Color) = (0,0,0,0)
		_LavaMid("Lava Mid", Color) = (0,0,0,0)
		_LavaHigh("Lava High", Color) = (0,0,0,0)
		_LavaFactorsX("Lava Factors X", Range( 0 , 1)) = 0
		_LavaFactorsY("Lava Factors Y", Range( 0 , 1)) = 0
		_LavaFactorsZ("Lava Factors Z", Range( 0 , 1)) = 0
		_LavaDetail("Lava Detail", Range( 0 , 1)) = 0
		_DetailExp("Detail Exp", Float) = 0
		_HeightDetail("Height Detail", Float) = 0
		_LavaMaskFactorsX("Lava Mask Factors X", Float) = 0
		_LavaMaskFactorsY("Lava Mask Factors Y", Float) = 0
		_LavaMaskPower("Lava Mask Power", Float) = 0
		_LavaMaskBoost("Lava Mask Boost", Float) = 0
		_DarkSideLavaStepMax("Dark Side Lava Step Max", Float) = 1
		_DarkSideLavaStepMin("Dark Side Lava Step Min", Float) = 1
		_DarkSideLava("Dark Side Lava", Range( 0 , 1)) = 0
		_LavaPasstrough("Lava Passtrough", Range( 0 , 0.1)) = 0.02
		_MagmaColorMin("Magma Color Min", Color) = (0,0,0,0)
		_MagmaColorMax("Magma Color Max", Color) = (0,0,0,0)
		_MagmaPower("Magma Power", Float) = 0
		_MagmaBoost("Magma Boost", Float) = 0
		_MagmaGlow("Magma Glow", Float) = 0
		_FrenselMult("Frensel Mult", Range( 0 , 10)) = 0
		_FresnelPower("Fresnel Power", Range( 0 , 10)) = 0
		_FresnelColor("Fresnel Color", Color) = (0.4558824,0.4558824,0.4558824,1)
		_DistortionMap("Distortion Map", 2D) = "white" {}
		_DistortionUVTiling("Distortion UV Tiling", Float) = 0
		_DistortionUVSpeed("Distortion UV Speed", Float) = 0
		_DistortionTiling("Distortion Tiling", Float) = 0
		_DistortionSpeed("Distortion Speed", Float) = 0
		_DistortionFactor("Distortion Factor", Range( -1 , 1)) = 0


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
			#define _RECEIVE_SHADOWS_OFF 1
			#pragma multi_compile_fog
			#define ASE_FOG 1
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
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FresnelColor;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _SpecularColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _DistortionFactor;
			float _MagmaTiling;
			float _MagmaPower;
			float _MagmaBoost;
			float _LavaMaskTiling;
			float _LavaMaskFactorsX;
			float _LavaMaskFactorsY;
			float _LavaMaskPower;
			float _LavaMaskBoost;
			float _MagmaGlow;
			float _LavaPasstrough;
			float _DarkSideLavaStepMin;
			float _DarkSideLavaStepMax;
			float _DistortionSpeed;
			float _ScatterCenterShift;
			float _FresnelPower;
			float _FrenselMult;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _NormalTiling;
			float _NormalScale;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _LavaFactorsY;
			float _LavaFactorsZ;
			float _DarkSideLava;
			float _DistortionTiling;
			float _Smoothness;
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
			sampler2D _DetailMap;
			sampler2D _NormalMap;
			sampler2D _HeightMap;
			sampler2D _DistortionMap;
			sampler2D _MagmaMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			inline float4 TriplanarSampling193( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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
			
			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_normal = v.ase_normal;
				o.ase_texcoord8 = v.vertex;

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

				float4 transform4_g120 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g120 = normalize( transform4_g120 );
				float3 temp_output_1_0_g121 = normalizeResult6_g120.xyz;
				float3 normalizeResult7_g120 = normalize( _MainLightPosition.xyz );
				float dotResult4_g121 = dot( temp_output_1_0_g121 , normalizeResult7_g120 );
				float3 normalizeResult8_g120 = normalize( WorldViewDirection );
				float dotResult7_g121 = dot( temp_output_1_0_g121 , normalizeResult8_g120 );
				float2 appendResult10_g121 = (float2(( ( dotResult4_g121 / 2.0 ) + 0.5 ) , dotResult7_g121));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal51_g135 = float3(0,0,1);
				float3 worldNormal51_g135 = float3(dot(tanToWorld0,tanNormal51_g135), dot(tanToWorld1,tanNormal51_g135), dot(tanToWorld2,tanNormal51_g135));
				float4 appendResult63_g135 = (float4(worldNormal51_g135 , 0.0));
				float4 temp_output_57_0_g135 = mul( GetWorldToObjectMatrix(), appendResult63_g135 );
				float4 temp_cast_2 = (5.0).xxxx;
				float4 temp_output_4_0_g135 = pow( abs( temp_output_57_0_g135 ) , temp_cast_2 );
				float4 break6_g135 = temp_output_4_0_g135;
				float4 projNormal10_g135 = ( temp_output_4_0_g135 / ( break6_g135.x + break6_g135.y + break6_g135.z ) );
				float4 appendResult62_g135 = (float4(WorldPosition , 1.0));
				float4 break26_g135 = mul( GetWorldToObjectMatrix(), appendResult62_g135 );
				float2 appendResult27_g135 = (float2(break26_g135.z , break26_g135.y));
				float4 nSign18_g135 = sign( temp_output_57_0_g135 );
				float4 break20_g135 = nSign18_g135;
				float2 appendResult21_g135 = (float2(break20_g135.x , 1.0));
				float temp_output_29_0_g135 = _DetailTiling;
				float2 temp_output_65_0_g135 = float2( 0,0 );
				float2 appendResult32_g135 = (float2(break26_g135.x , break26_g135.z));
				float2 appendResult22_g135 = (float2(break20_g135.y , 1.0));
				float2 appendResult34_g135 = (float2(break26_g135.x , break26_g135.y));
				float2 appendResult25_g135 = (float2(-break20_g135.z , 1.0));
				float4 break138 = saturate( ( ( projNormal10_g135.x * tex2D( _DetailMap, ( ( appendResult27_g135 * appendResult21_g135 * temp_output_29_0_g135 ) + temp_output_65_0_g135 ) ) ) + ( projNormal10_g135.y * tex2D( _DetailMap, ( ( temp_output_29_0_g135 * appendResult32_g135 * appendResult22_g135 ) + temp_output_65_0_g135 ) ) ) + ( projNormal10_g135.z * tex2D( _DetailMap, ( temp_output_65_0_g135 + ( temp_output_29_0_g135 * appendResult34_g135 * appendResult25_g135 ) ) ) ) ) );
				float detailTex146 = saturate( ( _DetailExp * pow( max( 0.0 , ( break138.r * break138.g ) ) , _DetailExp ) * 5000.0 ) );
				float4 temp_output_204_0 = saturate( ( detailTex146 * _Specular * _SpecularColor * _SpecularBoost ) );
				float4 temp_output_43_0_g131 = temp_output_204_0;
				float3 normalizeResult4_g132 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float4 triplanar193 = TriplanarSampling193( _NormalMap, IN.ase_texcoord8.xyz, IN.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				float3 tanNormal12_g131 = normalUnpacked196;
				float3 worldNormal12_g131 = float3(dot(tanToWorld0,tanNormal12_g131), dot(tanToWorld1,tanNormal12_g131), dot(tanToWorld2,tanNormal12_g131));
				float3 normalizeResult64_g131 = normalize( worldNormal12_g131 );
				float dotResult19_g131 = dot( normalizeResult4_g132 , normalizeResult64_g131 );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g131 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g131 = dot( normalizeResult64_g131 , _MainLightPosition.xyz );
				float3 bakedGI34_g131 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g131);
				MixRealtimeAndBakedGI(ase_mainLight, normalizeResult64_g131, bakedGI34_g131, half4(0,0,0,0));
				float3 tanNormal51_g118 = float3(0,0,1);
				float3 worldNormal51_g118 = float3(dot(tanToWorld0,tanNormal51_g118), dot(tanToWorld1,tanNormal51_g118), dot(tanToWorld2,tanNormal51_g118));
				float4 appendResult63_g118 = (float4(worldNormal51_g118 , 0.0));
				float4 temp_output_57_0_g118 = mul( GetWorldToObjectMatrix(), appendResult63_g118 );
				float4 temp_cast_7 = (5.0).xxxx;
				float4 temp_output_4_0_g118 = pow( abs( temp_output_57_0_g118 ) , temp_cast_7 );
				float4 break6_g118 = temp_output_4_0_g118;
				float4 projNormal10_g118 = ( temp_output_4_0_g118 / ( break6_g118.x + break6_g118.y + break6_g118.z ) );
				float4 appendResult62_g118 = (float4(WorldPosition , 1.0));
				float4 break26_g118 = mul( GetWorldToObjectMatrix(), appendResult62_g118 );
				float2 appendResult27_g118 = (float2(break26_g118.z , break26_g118.y));
				float4 nSign18_g118 = sign( temp_output_57_0_g118 );
				float4 break20_g118 = nSign18_g118;
				float2 appendResult21_g118 = (float2(break20_g118.x , 1.0));
				float temp_output_29_0_g118 = _HeightTiling;
				float2 temp_output_65_0_g118 = float2( 0,0 );
				float2 appendResult32_g118 = (float2(break26_g118.x , break26_g118.z));
				float2 appendResult22_g118 = (float2(break20_g118.y , 1.0));
				float2 appendResult34_g118 = (float2(break26_g118.x , break26_g118.y));
				float2 appendResult25_g118 = (float2(-break20_g118.z , 1.0));
				float detaledHeight167 = saturate( ( detailTex146 * saturate( ( saturate( ( ( projNormal10_g118.x * tex2D( _HeightMap, ( ( appendResult27_g118 * appendResult21_g118 * temp_output_29_0_g118 ) + temp_output_65_0_g118 ) ) ) + ( projNormal10_g118.y * tex2D( _HeightMap, ( ( temp_output_29_0_g118 * appendResult32_g118 * appendResult22_g118 ) + temp_output_65_0_g118 ) ) ) + ( projNormal10_g118.z * tex2D( _HeightMap, ( temp_output_65_0_g118 + ( temp_output_29_0_g118 * appendResult34_g118 * appendResult25_g118 ) ) ) ) ) ).r * _HeightDetail ) ) ) );
				float temp_output_2_0_g119 = saturate( ( _LavaFactorsX - _LavaDetail ) );
				float detaledHeight01178 = saturate( saturate( ( ( detaledHeight167 - temp_output_2_0_g119 ) / ( saturate( ( _LavaFactorsY - _LavaDetail ) ) - temp_output_2_0_g119 ) ) ) );
				float temp_output_6_0_g133 = ( detaledHeight01178 / _LavaFactorsZ );
				float3 lerpResult8_g133 = lerp( _LavaLow.rgb , _LavaMid.rgb , saturate( temp_output_6_0_g133 ));
				float3 lerpResult12_g133 = lerp( lerpResult8_g133 , _LavaHigh.rgb , saturate( ( temp_output_6_0_g133 - 1.0 ) ));
				float3 temp_output_179_0 = lerpResult12_g133;
				float4 temp_output_42_0_g131 = float4( temp_output_179_0 , 0.0 );
				float4 baseColor213 = ( ( float4( (temp_output_43_0_g131).rgb , 0.0 ) * (temp_output_43_0_g131).a * pow( max( dotResult19_g131 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g131 ) + ( ( ( temp_output_40_0_g131 * max( dotResult14_g131 , 0.0 ) ) + float4( bakedGI34_g131 , 0.0 ) ) * float4( (temp_output_42_0_g131).rgb , 0.0 ) ) );
				float4 temp_output_43_0_g137 = _SpecularColor;
				float3 normalizeResult4_g138 = normalize( ( WorldViewDirection + _MainLightPosition.xyz ) );
				float3 tanNormal12_g137 = normalUnpacked196;
				float3 worldNormal12_g137 = float3(dot(tanToWorld0,tanNormal12_g137), dot(tanToWorld1,tanNormal12_g137), dot(tanToWorld2,tanNormal12_g137));
				float3 normalizeResult64_g137 = normalize( worldNormal12_g137 );
				float dotResult19_g137 = dot( normalizeResult4_g138 , normalizeResult64_g137 );
				float4 temp_output_40_0_g137 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g137 = dot( normalizeResult64_g137 , _MainLightPosition.xyz );
				float3 bakedGI34_g137 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g137);
				MixRealtimeAndBakedGI(ase_mainLight, normalizeResult64_g137, bakedGI34_g137, half4(0,0,0,0));
				float4 temp_cast_13 = (1.0).xxxx;
				float4 temp_output_42_0_g137 = temp_cast_13;
				float4 temp_output_306_0 = ( ( float4( (temp_output_43_0_g137).rgb , 0.0 ) * (temp_output_43_0_g137).a * pow( max( dotResult19_g137 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g137 ) + ( ( ( temp_output_40_0_g137 * max( dotResult14_g137 , 0.0 ) ) + float4( bakedGI34_g137 , 0.0 ) ) * float4( (temp_output_42_0_g137).rgb , 0.0 ) ) );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 normalizeResult5_g127 = normalize( normalUnpacked196 );
				float dotResult14_g127 = dot( ase_tanViewDir , normalizeResult5_g127 );
				float detailX235 = break138.r;
				float4 fresnel268 = saturate( ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g127 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) * detailX235 ) );
				float4 temp_output_298_0 = saturate( ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g121 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( baseColor213 + ( temp_output_306_0 * fresnel268 ) ) ) );
				
				float3 tanNormal51_g129 = float3(0,0,1);
				float3 worldNormal51_g129 = float3(dot(tanToWorld0,tanNormal51_g129), dot(tanToWorld1,tanNormal51_g129), dot(tanToWorld2,tanNormal51_g129));
				float4 appendResult63_g129 = (float4(worldNormal51_g129 , 0.0));
				float4 temp_output_57_0_g129 = mul( GetWorldToObjectMatrix(), appendResult63_g129 );
				float4 temp_cast_16 = (5.0).xxxx;
				float4 temp_output_4_0_g129 = pow( abs( temp_output_57_0_g129 ) , temp_cast_16 );
				float4 break6_g129 = temp_output_4_0_g129;
				float4 projNormal10_g129 = ( temp_output_4_0_g129 / ( break6_g129.x + break6_g129.y + break6_g129.z ) );
				float4 appendResult62_g129 = (float4(WorldPosition , 1.0));
				float4 break26_g129 = mul( GetWorldToObjectMatrix(), appendResult62_g129 );
				float2 appendResult27_g129 = (float2(break26_g129.z , break26_g129.y));
				float4 nSign18_g129 = sign( temp_output_57_0_g129 );
				float4 break20_g129 = nSign18_g129;
				float2 appendResult21_g129 = (float2(break20_g129.x , 1.0));
				float temp_output_29_0_g129 = _DistortionTiling;
				float temp_output_10_0_g128 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g128 = (float2(temp_output_10_0_g128 , temp_output_10_0_g128));
				float3 tanNormal51_g130 = float3(0,0,1);
				float3 worldNormal51_g130 = float3(dot(tanToWorld0,tanNormal51_g130), dot(tanToWorld1,tanNormal51_g130), dot(tanToWorld2,tanNormal51_g130));
				float4 appendResult63_g130 = (float4(worldNormal51_g130 , 0.0));
				float4 temp_output_57_0_g130 = mul( GetWorldToObjectMatrix(), appendResult63_g130 );
				float4 temp_cast_17 = (5.0).xxxx;
				float4 temp_output_4_0_g130 = pow( abs( temp_output_57_0_g130 ) , temp_cast_17 );
				float4 break6_g130 = temp_output_4_0_g130;
				float4 projNormal10_g130 = ( temp_output_4_0_g130 / ( break6_g130.x + break6_g130.y + break6_g130.z ) );
				float4 appendResult62_g130 = (float4(WorldPosition , 1.0));
				float4 break26_g130 = mul( GetWorldToObjectMatrix(), appendResult62_g130 );
				float2 appendResult27_g130 = (float2(break26_g130.z , break26_g130.y));
				float4 nSign18_g130 = sign( temp_output_57_0_g130 );
				float4 break20_g130 = nSign18_g130;
				float2 appendResult21_g130 = (float2(break20_g130.x , 1.0));
				float temp_output_29_0_g130 = _DistortionUVTiling;
				float temp_output_2_0_g128 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g128 = (float2(temp_output_2_0_g128 , temp_output_2_0_g128));
				float2 temp_output_65_0_g130 = appendResult5_g128;
				float2 appendResult32_g130 = (float2(break26_g130.x , break26_g130.z));
				float2 appendResult22_g130 = (float2(break20_g130.y , 1.0));
				float2 appendResult34_g130 = (float2(break26_g130.x , break26_g130.y));
				float2 appendResult25_g130 = (float2(-break20_g130.z , 1.0));
				float4 break11_g128 = ( saturate( ( ( projNormal10_g130.x * tex2D( _DistortionMap, ( ( appendResult27_g130 * appendResult21_g130 * temp_output_29_0_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g130 * appendResult32_g130 * appendResult22_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.z * tex2D( _DistortionMap, ( temp_output_65_0_g130 + ( temp_output_29_0_g130 * appendResult34_g130 * appendResult25_g130 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g128 = (float2(break11_g128.r , break11_g128.g));
				float2 temp_output_65_0_g129 = ( appendResult12_g128 + appendResult13_g128 );
				float2 appendResult32_g129 = (float2(break26_g129.x , break26_g129.z));
				float2 appendResult22_g129 = (float2(break20_g129.y , 1.0));
				float2 appendResult34_g129 = (float2(break26_g129.x , break26_g129.y));
				float2 appendResult25_g129 = (float2(-break20_g129.z , 1.0));
				float3 tanNormal51_g136 = float3(0,0,1);
				float3 worldNormal51_g136 = float3(dot(tanToWorld0,tanNormal51_g136), dot(tanToWorld1,tanNormal51_g136), dot(tanToWorld2,tanNormal51_g136));
				float4 appendResult63_g136 = (float4(worldNormal51_g136 , 0.0));
				float4 temp_output_57_0_g136 = mul( GetWorldToObjectMatrix(), appendResult63_g136 );
				float4 temp_cast_18 = (5.0).xxxx;
				float4 temp_output_4_0_g136 = pow( abs( temp_output_57_0_g136 ) , temp_cast_18 );
				float4 break6_g136 = temp_output_4_0_g136;
				float4 projNormal10_g136 = ( temp_output_4_0_g136 / ( break6_g136.x + break6_g136.y + break6_g136.z ) );
				float4 appendResult62_g136 = (float4(WorldPosition , 1.0));
				float4 break26_g136 = mul( GetWorldToObjectMatrix(), appendResult62_g136 );
				float2 appendResult27_g136 = (float2(break26_g136.z , break26_g136.y));
				float4 nSign18_g136 = sign( temp_output_57_0_g136 );
				float4 break20_g136 = nSign18_g136;
				float2 appendResult21_g136 = (float2(break20_g136.x , 1.0));
				float temp_output_29_0_g136 = _MagmaTiling;
				float2 temp_output_65_0_g136 = float2( 0,0 );
				float2 appendResult32_g136 = (float2(break26_g136.x , break26_g136.z));
				float2 appendResult22_g136 = (float2(break20_g136.y , 1.0));
				float2 appendResult34_g136 = (float2(break26_g136.x , break26_g136.y));
				float2 appendResult25_g136 = (float2(-break20_g136.z , 1.0));
				float4 temp_output_214_0 = saturate( ( ( projNormal10_g136.x * tex2D( _MagmaMap, ( ( appendResult27_g136 * appendResult21_g136 * temp_output_29_0_g136 ) + temp_output_65_0_g136 ) ) ) + ( projNormal10_g136.y * tex2D( _MagmaMap, ( ( temp_output_29_0_g136 * appendResult32_g136 * appendResult22_g136 ) + temp_output_65_0_g136 ) ) ) + ( projNormal10_g136.z * tex2D( _MagmaMap, ( temp_output_65_0_g136 + ( temp_output_29_0_g136 * appendResult34_g136 * appendResult25_g136 ) ) ) ) ) );
				float4 temp_cast_19 = (_MagmaPower).xxxx;
				float4 magmaDetial234 = saturate( ( saturate( pow( max( float4( 0,0,0,0 ) , temp_output_214_0 ) , temp_cast_19 ) ) * _MagmaBoost * temp_output_214_0 ) );
				float3 tanNormal51_g134 = float3(0,0,1);
				float3 worldNormal51_g134 = float3(dot(tanToWorld0,tanNormal51_g134), dot(tanToWorld1,tanNormal51_g134), dot(tanToWorld2,tanNormal51_g134));
				float4 appendResult63_g134 = (float4(worldNormal51_g134 , 0.0));
				float4 temp_output_57_0_g134 = mul( GetWorldToObjectMatrix(), appendResult63_g134 );
				float4 temp_cast_20 = (2.0).xxxx;
				float4 temp_output_4_0_g134 = pow( abs( temp_output_57_0_g134 ) , temp_cast_20 );
				float4 break6_g134 = temp_output_4_0_g134;
				float4 projNormal10_g134 = ( temp_output_4_0_g134 / ( break6_g134.x + break6_g134.y + break6_g134.z ) );
				float4 appendResult62_g134 = (float4(WorldPosition , 1.0));
				float4 break26_g134 = mul( GetWorldToObjectMatrix(), appendResult62_g134 );
				float2 appendResult27_g134 = (float2(break26_g134.z , break26_g134.y));
				float4 nSign18_g134 = sign( temp_output_57_0_g134 );
				float4 break20_g134 = nSign18_g134;
				float2 appendResult21_g134 = (float2(break20_g134.x , 1.0));
				float temp_output_29_0_g134 = _LavaMaskTiling;
				float2 temp_output_65_0_g134 = float2( 0,0 );
				float2 appendResult32_g134 = (float2(break26_g134.x , break26_g134.z));
				float2 appendResult22_g134 = (float2(break20_g134.y , 1.0));
				float2 appendResult34_g134 = (float2(break26_g134.x , break26_g134.y));
				float2 appendResult25_g134 = (float2(-break20_g134.z , 1.0));
				float lavaMaskMap229 = saturate( ( ( projNormal10_g134.x * tex2D( _HeightMap, ( ( appendResult27_g134 * appendResult21_g134 * temp_output_29_0_g134 ) + temp_output_65_0_g134 ) ) ) + ( projNormal10_g134.y * tex2D( _HeightMap, ( ( temp_output_29_0_g134 * appendResult32_g134 * appendResult22_g134 ) + temp_output_65_0_g134 ) ) ) + ( projNormal10_g134.z * tex2D( _HeightMap, ( temp_output_65_0_g134 + ( temp_output_29_0_g134 * appendResult34_g134 * appendResult25_g134 ) ) ) ) ) ).r;
				float dotResult254 = dot( ase_tanViewDir , normalUnpacked196 );
				float lavaMask272 = saturate( ( magmaDetial234.r + ( saturate( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - lavaMaskMap229 ) ) ) , _LavaMaskFactorsX ) ) * _LavaMaskFactorsY ) ) * saturate( ( saturate( pow( max( 0.0 , dotResult254 ) , _LavaMaskPower ) ) * _LavaMaskBoost ) ) ) ) );
				float4 lerpResult274 = lerp( _MagmaColorMin , _MagmaColorMax , lavaMask272);
				float4 lavaColor277 = ( saturate( ( ( projNormal10_g129.x * tex2D( _DistortionMap, ( ( appendResult27_g129 * appendResult21_g129 * temp_output_29_0_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g129 * appendResult32_g129 * appendResult22_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.z * tex2D( _DistortionMap, ( temp_output_65_0_g129 + ( temp_output_29_0_g129 * appendResult34_g129 * appendResult25_g129 ) ) ) ) ) ) * lerpResult274 * _MagmaGlow );
				float3 lerpResult5_g139 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - WorldPosition ) , _MainLightPosition.w);
				float3 normalizeResult6_g139 = normalize( lerpResult5_g139 );
				float dotResult1_g139 = dot( normalizeResult6_g139 , WorldNormal );
				float smoothstepResult336 = smoothstep( _DarkSideLavaStepMin , _DarkSideLavaStepMax , saturate( ( dotResult1_g139 * ase_lightAtten ) ));
				float lerpResult355 = lerp( 1.0 , saturate( smoothstepResult336 ) , _DarkSideLava);
				
				float temp_output_206_0 = ( ( 1.0 - detailTex146 ) * _Smoothness );
				

				float3 BaseColor = temp_output_298_0.rgb;
				float3 Normal = normalUnpacked196;
				float3 Emission = ( ( temp_output_298_0 + ( ( lavaColor277 * lavaMask272 ) * saturate( ( _LavaPasstrough + temp_output_306_0 ) ) ) ) * lerpResult355 ).rgb;
				float3 Specular = temp_output_204_0.rgb;
				float Metallic = 0;
				float Smoothness = temp_output_206_0;
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
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_FOG 1
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
			float4 _FresnelColor;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _SpecularColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _DistortionFactor;
			float _MagmaTiling;
			float _MagmaPower;
			float _MagmaBoost;
			float _LavaMaskTiling;
			float _LavaMaskFactorsX;
			float _LavaMaskFactorsY;
			float _LavaMaskPower;
			float _LavaMaskBoost;
			float _MagmaGlow;
			float _LavaPasstrough;
			float _DarkSideLavaStepMin;
			float _DarkSideLavaStepMax;
			float _DistortionSpeed;
			float _ScatterCenterShift;
			float _FresnelPower;
			float _FrenselMult;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _NormalTiling;
			float _NormalScale;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _LavaFactorsY;
			float _LavaFactorsZ;
			float _DarkSideLava;
			float _DistortionTiling;
			float _Smoothness;
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
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_FOG 1
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
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT


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
				float4 lightmapUVOrVertexSH : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FresnelColor;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _SpecularColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _DistortionFactor;
			float _MagmaTiling;
			float _MagmaPower;
			float _MagmaBoost;
			float _LavaMaskTiling;
			float _LavaMaskFactorsX;
			float _LavaMaskFactorsY;
			float _LavaMaskPower;
			float _LavaMaskBoost;
			float _MagmaGlow;
			float _LavaPasstrough;
			float _DarkSideLavaStepMin;
			float _DarkSideLavaStepMax;
			float _DistortionSpeed;
			float _ScatterCenterShift;
			float _FresnelPower;
			float _FrenselMult;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _NormalTiling;
			float _NormalScale;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _LavaFactorsY;
			float _LavaFactorsZ;
			float _DarkSideLava;
			float _DistortionTiling;
			float _Smoothness;
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
			sampler2D _DetailMap;
			sampler2D _NormalMap;
			sampler2D _HeightMap;
			sampler2D _DistortionMap;
			sampler2D _MagmaMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			inline float4 TriplanarSampling193( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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
			
			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				o.ase_normal = v.ase_normal;
				o.ase_texcoord7 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;

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

				float4 transform4_g120 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g120 = normalize( transform4_g120 );
				float3 temp_output_1_0_g121 = normalizeResult6_g120.xyz;
				float3 normalizeResult7_g120 = normalize( _MainLightPosition.xyz );
				float dotResult4_g121 = dot( temp_output_1_0_g121 , normalizeResult7_g120 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult8_g120 = normalize( ase_worldViewDir );
				float dotResult7_g121 = dot( temp_output_1_0_g121 , normalizeResult8_g120 );
				float2 appendResult10_g121 = (float2(( ( dotResult4_g121 / 2.0 ) + 0.5 ) , dotResult7_g121));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal51_g135 = float3(0,0,1);
				float3 worldNormal51_g135 = float3(dot(tanToWorld0,tanNormal51_g135), dot(tanToWorld1,tanNormal51_g135), dot(tanToWorld2,tanNormal51_g135));
				float4 appendResult63_g135 = (float4(worldNormal51_g135 , 0.0));
				float4 temp_output_57_0_g135 = mul( GetWorldToObjectMatrix(), appendResult63_g135 );
				float4 temp_cast_2 = (5.0).xxxx;
				float4 temp_output_4_0_g135 = pow( abs( temp_output_57_0_g135 ) , temp_cast_2 );
				float4 break6_g135 = temp_output_4_0_g135;
				float4 projNormal10_g135 = ( temp_output_4_0_g135 / ( break6_g135.x + break6_g135.y + break6_g135.z ) );
				float4 appendResult62_g135 = (float4(WorldPosition , 1.0));
				float4 break26_g135 = mul( GetWorldToObjectMatrix(), appendResult62_g135 );
				float2 appendResult27_g135 = (float2(break26_g135.z , break26_g135.y));
				float4 nSign18_g135 = sign( temp_output_57_0_g135 );
				float4 break20_g135 = nSign18_g135;
				float2 appendResult21_g135 = (float2(break20_g135.x , 1.0));
				float temp_output_29_0_g135 = _DetailTiling;
				float2 temp_output_65_0_g135 = float2( 0,0 );
				float2 appendResult32_g135 = (float2(break26_g135.x , break26_g135.z));
				float2 appendResult22_g135 = (float2(break20_g135.y , 1.0));
				float2 appendResult34_g135 = (float2(break26_g135.x , break26_g135.y));
				float2 appendResult25_g135 = (float2(-break20_g135.z , 1.0));
				float4 break138 = saturate( ( ( projNormal10_g135.x * tex2D( _DetailMap, ( ( appendResult27_g135 * appendResult21_g135 * temp_output_29_0_g135 ) + temp_output_65_0_g135 ) ) ) + ( projNormal10_g135.y * tex2D( _DetailMap, ( ( temp_output_29_0_g135 * appendResult32_g135 * appendResult22_g135 ) + temp_output_65_0_g135 ) ) ) + ( projNormal10_g135.z * tex2D( _DetailMap, ( temp_output_65_0_g135 + ( temp_output_29_0_g135 * appendResult34_g135 * appendResult25_g135 ) ) ) ) ) );
				float detailTex146 = saturate( ( _DetailExp * pow( max( 0.0 , ( break138.r * break138.g ) ) , _DetailExp ) * 5000.0 ) );
				float4 temp_output_204_0 = saturate( ( detailTex146 * _Specular * _SpecularColor * _SpecularBoost ) );
				float4 temp_output_43_0_g131 = temp_output_204_0;
				float3 normalizeResult4_g132 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float4 triplanar193 = TriplanarSampling193( _NormalMap, IN.ase_texcoord7.xyz, IN.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				float3 tanNormal12_g131 = normalUnpacked196;
				float3 worldNormal12_g131 = float3(dot(tanToWorld0,tanNormal12_g131), dot(tanToWorld1,tanNormal12_g131), dot(tanToWorld2,tanNormal12_g131));
				float3 normalizeResult64_g131 = normalize( worldNormal12_g131 );
				float dotResult19_g131 = dot( normalizeResult4_g132 , normalizeResult64_g131 );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g131 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g131 = dot( normalizeResult64_g131 , _MainLightPosition.xyz );
				float3 bakedGI34_g131 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g131);
				MixRealtimeAndBakedGI(ase_mainLight, normalizeResult64_g131, bakedGI34_g131, half4(0,0,0,0));
				float3 tanNormal51_g118 = float3(0,0,1);
				float3 worldNormal51_g118 = float3(dot(tanToWorld0,tanNormal51_g118), dot(tanToWorld1,tanNormal51_g118), dot(tanToWorld2,tanNormal51_g118));
				float4 appendResult63_g118 = (float4(worldNormal51_g118 , 0.0));
				float4 temp_output_57_0_g118 = mul( GetWorldToObjectMatrix(), appendResult63_g118 );
				float4 temp_cast_7 = (5.0).xxxx;
				float4 temp_output_4_0_g118 = pow( abs( temp_output_57_0_g118 ) , temp_cast_7 );
				float4 break6_g118 = temp_output_4_0_g118;
				float4 projNormal10_g118 = ( temp_output_4_0_g118 / ( break6_g118.x + break6_g118.y + break6_g118.z ) );
				float4 appendResult62_g118 = (float4(WorldPosition , 1.0));
				float4 break26_g118 = mul( GetWorldToObjectMatrix(), appendResult62_g118 );
				float2 appendResult27_g118 = (float2(break26_g118.z , break26_g118.y));
				float4 nSign18_g118 = sign( temp_output_57_0_g118 );
				float4 break20_g118 = nSign18_g118;
				float2 appendResult21_g118 = (float2(break20_g118.x , 1.0));
				float temp_output_29_0_g118 = _HeightTiling;
				float2 temp_output_65_0_g118 = float2( 0,0 );
				float2 appendResult32_g118 = (float2(break26_g118.x , break26_g118.z));
				float2 appendResult22_g118 = (float2(break20_g118.y , 1.0));
				float2 appendResult34_g118 = (float2(break26_g118.x , break26_g118.y));
				float2 appendResult25_g118 = (float2(-break20_g118.z , 1.0));
				float detaledHeight167 = saturate( ( detailTex146 * saturate( ( saturate( ( ( projNormal10_g118.x * tex2D( _HeightMap, ( ( appendResult27_g118 * appendResult21_g118 * temp_output_29_0_g118 ) + temp_output_65_0_g118 ) ) ) + ( projNormal10_g118.y * tex2D( _HeightMap, ( ( temp_output_29_0_g118 * appendResult32_g118 * appendResult22_g118 ) + temp_output_65_0_g118 ) ) ) + ( projNormal10_g118.z * tex2D( _HeightMap, ( temp_output_65_0_g118 + ( temp_output_29_0_g118 * appendResult34_g118 * appendResult25_g118 ) ) ) ) ) ).r * _HeightDetail ) ) ) );
				float temp_output_2_0_g119 = saturate( ( _LavaFactorsX - _LavaDetail ) );
				float detaledHeight01178 = saturate( saturate( ( ( detaledHeight167 - temp_output_2_0_g119 ) / ( saturate( ( _LavaFactorsY - _LavaDetail ) ) - temp_output_2_0_g119 ) ) ) );
				float temp_output_6_0_g133 = ( detaledHeight01178 / _LavaFactorsZ );
				float3 lerpResult8_g133 = lerp( _LavaLow.rgb , _LavaMid.rgb , saturate( temp_output_6_0_g133 ));
				float3 lerpResult12_g133 = lerp( lerpResult8_g133 , _LavaHigh.rgb , saturate( ( temp_output_6_0_g133 - 1.0 ) ));
				float3 temp_output_179_0 = lerpResult12_g133;
				float4 temp_output_42_0_g131 = float4( temp_output_179_0 , 0.0 );
				float4 baseColor213 = ( ( float4( (temp_output_43_0_g131).rgb , 0.0 ) * (temp_output_43_0_g131).a * pow( max( dotResult19_g131 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g131 ) + ( ( ( temp_output_40_0_g131 * max( dotResult14_g131 , 0.0 ) ) + float4( bakedGI34_g131 , 0.0 ) ) * float4( (temp_output_42_0_g131).rgb , 0.0 ) ) );
				float4 temp_output_43_0_g137 = _SpecularColor;
				float3 normalizeResult4_g138 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float3 tanNormal12_g137 = normalUnpacked196;
				float3 worldNormal12_g137 = float3(dot(tanToWorld0,tanNormal12_g137), dot(tanToWorld1,tanNormal12_g137), dot(tanToWorld2,tanNormal12_g137));
				float3 normalizeResult64_g137 = normalize( worldNormal12_g137 );
				float dotResult19_g137 = dot( normalizeResult4_g138 , normalizeResult64_g137 );
				float4 temp_output_40_0_g137 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g137 = dot( normalizeResult64_g137 , _MainLightPosition.xyz );
				float3 bakedGI34_g137 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g137);
				MixRealtimeAndBakedGI(ase_mainLight, normalizeResult64_g137, bakedGI34_g137, half4(0,0,0,0));
				float4 temp_cast_13 = (1.0).xxxx;
				float4 temp_output_42_0_g137 = temp_cast_13;
				float4 temp_output_306_0 = ( ( float4( (temp_output_43_0_g137).rgb , 0.0 ) * (temp_output_43_0_g137).a * pow( max( dotResult19_g137 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g137 ) + ( ( ( temp_output_40_0_g137 * max( dotResult14_g137 , 0.0 ) ) + float4( bakedGI34_g137 , 0.0 ) ) * float4( (temp_output_42_0_g137).rgb , 0.0 ) ) );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 normalizeResult5_g127 = normalize( normalUnpacked196 );
				float dotResult14_g127 = dot( ase_tanViewDir , normalizeResult5_g127 );
				float detailX235 = break138.r;
				float4 fresnel268 = saturate( ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g127 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) * detailX235 ) );
				float4 temp_output_298_0 = saturate( ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g121 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( baseColor213 + ( temp_output_306_0 * fresnel268 ) ) ) );
				
				float3 tanNormal51_g129 = float3(0,0,1);
				float3 worldNormal51_g129 = float3(dot(tanToWorld0,tanNormal51_g129), dot(tanToWorld1,tanNormal51_g129), dot(tanToWorld2,tanNormal51_g129));
				float4 appendResult63_g129 = (float4(worldNormal51_g129 , 0.0));
				float4 temp_output_57_0_g129 = mul( GetWorldToObjectMatrix(), appendResult63_g129 );
				float4 temp_cast_16 = (5.0).xxxx;
				float4 temp_output_4_0_g129 = pow( abs( temp_output_57_0_g129 ) , temp_cast_16 );
				float4 break6_g129 = temp_output_4_0_g129;
				float4 projNormal10_g129 = ( temp_output_4_0_g129 / ( break6_g129.x + break6_g129.y + break6_g129.z ) );
				float4 appendResult62_g129 = (float4(WorldPosition , 1.0));
				float4 break26_g129 = mul( GetWorldToObjectMatrix(), appendResult62_g129 );
				float2 appendResult27_g129 = (float2(break26_g129.z , break26_g129.y));
				float4 nSign18_g129 = sign( temp_output_57_0_g129 );
				float4 break20_g129 = nSign18_g129;
				float2 appendResult21_g129 = (float2(break20_g129.x , 1.0));
				float temp_output_29_0_g129 = _DistortionTiling;
				float temp_output_10_0_g128 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g128 = (float2(temp_output_10_0_g128 , temp_output_10_0_g128));
				float3 tanNormal51_g130 = float3(0,0,1);
				float3 worldNormal51_g130 = float3(dot(tanToWorld0,tanNormal51_g130), dot(tanToWorld1,tanNormal51_g130), dot(tanToWorld2,tanNormal51_g130));
				float4 appendResult63_g130 = (float4(worldNormal51_g130 , 0.0));
				float4 temp_output_57_0_g130 = mul( GetWorldToObjectMatrix(), appendResult63_g130 );
				float4 temp_cast_17 = (5.0).xxxx;
				float4 temp_output_4_0_g130 = pow( abs( temp_output_57_0_g130 ) , temp_cast_17 );
				float4 break6_g130 = temp_output_4_0_g130;
				float4 projNormal10_g130 = ( temp_output_4_0_g130 / ( break6_g130.x + break6_g130.y + break6_g130.z ) );
				float4 appendResult62_g130 = (float4(WorldPosition , 1.0));
				float4 break26_g130 = mul( GetWorldToObjectMatrix(), appendResult62_g130 );
				float2 appendResult27_g130 = (float2(break26_g130.z , break26_g130.y));
				float4 nSign18_g130 = sign( temp_output_57_0_g130 );
				float4 break20_g130 = nSign18_g130;
				float2 appendResult21_g130 = (float2(break20_g130.x , 1.0));
				float temp_output_29_0_g130 = _DistortionUVTiling;
				float temp_output_2_0_g128 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g128 = (float2(temp_output_2_0_g128 , temp_output_2_0_g128));
				float2 temp_output_65_0_g130 = appendResult5_g128;
				float2 appendResult32_g130 = (float2(break26_g130.x , break26_g130.z));
				float2 appendResult22_g130 = (float2(break20_g130.y , 1.0));
				float2 appendResult34_g130 = (float2(break26_g130.x , break26_g130.y));
				float2 appendResult25_g130 = (float2(-break20_g130.z , 1.0));
				float4 break11_g128 = ( saturate( ( ( projNormal10_g130.x * tex2D( _DistortionMap, ( ( appendResult27_g130 * appendResult21_g130 * temp_output_29_0_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g130 * appendResult32_g130 * appendResult22_g130 ) + temp_output_65_0_g130 ) ) ) + ( projNormal10_g130.z * tex2D( _DistortionMap, ( temp_output_65_0_g130 + ( temp_output_29_0_g130 * appendResult34_g130 * appendResult25_g130 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g128 = (float2(break11_g128.r , break11_g128.g));
				float2 temp_output_65_0_g129 = ( appendResult12_g128 + appendResult13_g128 );
				float2 appendResult32_g129 = (float2(break26_g129.x , break26_g129.z));
				float2 appendResult22_g129 = (float2(break20_g129.y , 1.0));
				float2 appendResult34_g129 = (float2(break26_g129.x , break26_g129.y));
				float2 appendResult25_g129 = (float2(-break20_g129.z , 1.0));
				float3 tanNormal51_g136 = float3(0,0,1);
				float3 worldNormal51_g136 = float3(dot(tanToWorld0,tanNormal51_g136), dot(tanToWorld1,tanNormal51_g136), dot(tanToWorld2,tanNormal51_g136));
				float4 appendResult63_g136 = (float4(worldNormal51_g136 , 0.0));
				float4 temp_output_57_0_g136 = mul( GetWorldToObjectMatrix(), appendResult63_g136 );
				float4 temp_cast_18 = (5.0).xxxx;
				float4 temp_output_4_0_g136 = pow( abs( temp_output_57_0_g136 ) , temp_cast_18 );
				float4 break6_g136 = temp_output_4_0_g136;
				float4 projNormal10_g136 = ( temp_output_4_0_g136 / ( break6_g136.x + break6_g136.y + break6_g136.z ) );
				float4 appendResult62_g136 = (float4(WorldPosition , 1.0));
				float4 break26_g136 = mul( GetWorldToObjectMatrix(), appendResult62_g136 );
				float2 appendResult27_g136 = (float2(break26_g136.z , break26_g136.y));
				float4 nSign18_g136 = sign( temp_output_57_0_g136 );
				float4 break20_g136 = nSign18_g136;
				float2 appendResult21_g136 = (float2(break20_g136.x , 1.0));
				float temp_output_29_0_g136 = _MagmaTiling;
				float2 temp_output_65_0_g136 = float2( 0,0 );
				float2 appendResult32_g136 = (float2(break26_g136.x , break26_g136.z));
				float2 appendResult22_g136 = (float2(break20_g136.y , 1.0));
				float2 appendResult34_g136 = (float2(break26_g136.x , break26_g136.y));
				float2 appendResult25_g136 = (float2(-break20_g136.z , 1.0));
				float4 temp_output_214_0 = saturate( ( ( projNormal10_g136.x * tex2D( _MagmaMap, ( ( appendResult27_g136 * appendResult21_g136 * temp_output_29_0_g136 ) + temp_output_65_0_g136 ) ) ) + ( projNormal10_g136.y * tex2D( _MagmaMap, ( ( temp_output_29_0_g136 * appendResult32_g136 * appendResult22_g136 ) + temp_output_65_0_g136 ) ) ) + ( projNormal10_g136.z * tex2D( _MagmaMap, ( temp_output_65_0_g136 + ( temp_output_29_0_g136 * appendResult34_g136 * appendResult25_g136 ) ) ) ) ) );
				float4 temp_cast_19 = (_MagmaPower).xxxx;
				float4 magmaDetial234 = saturate( ( saturate( pow( max( float4( 0,0,0,0 ) , temp_output_214_0 ) , temp_cast_19 ) ) * _MagmaBoost * temp_output_214_0 ) );
				float3 tanNormal51_g134 = float3(0,0,1);
				float3 worldNormal51_g134 = float3(dot(tanToWorld0,tanNormal51_g134), dot(tanToWorld1,tanNormal51_g134), dot(tanToWorld2,tanNormal51_g134));
				float4 appendResult63_g134 = (float4(worldNormal51_g134 , 0.0));
				float4 temp_output_57_0_g134 = mul( GetWorldToObjectMatrix(), appendResult63_g134 );
				float4 temp_cast_20 = (2.0).xxxx;
				float4 temp_output_4_0_g134 = pow( abs( temp_output_57_0_g134 ) , temp_cast_20 );
				float4 break6_g134 = temp_output_4_0_g134;
				float4 projNormal10_g134 = ( temp_output_4_0_g134 / ( break6_g134.x + break6_g134.y + break6_g134.z ) );
				float4 appendResult62_g134 = (float4(WorldPosition , 1.0));
				float4 break26_g134 = mul( GetWorldToObjectMatrix(), appendResult62_g134 );
				float2 appendResult27_g134 = (float2(break26_g134.z , break26_g134.y));
				float4 nSign18_g134 = sign( temp_output_57_0_g134 );
				float4 break20_g134 = nSign18_g134;
				float2 appendResult21_g134 = (float2(break20_g134.x , 1.0));
				float temp_output_29_0_g134 = _LavaMaskTiling;
				float2 temp_output_65_0_g134 = float2( 0,0 );
				float2 appendResult32_g134 = (float2(break26_g134.x , break26_g134.z));
				float2 appendResult22_g134 = (float2(break20_g134.y , 1.0));
				float2 appendResult34_g134 = (float2(break26_g134.x , break26_g134.y));
				float2 appendResult25_g134 = (float2(-break20_g134.z , 1.0));
				float lavaMaskMap229 = saturate( ( ( projNormal10_g134.x * tex2D( _HeightMap, ( ( appendResult27_g134 * appendResult21_g134 * temp_output_29_0_g134 ) + temp_output_65_0_g134 ) ) ) + ( projNormal10_g134.y * tex2D( _HeightMap, ( ( temp_output_29_0_g134 * appendResult32_g134 * appendResult22_g134 ) + temp_output_65_0_g134 ) ) ) + ( projNormal10_g134.z * tex2D( _HeightMap, ( temp_output_65_0_g134 + ( temp_output_29_0_g134 * appendResult34_g134 * appendResult25_g134 ) ) ) ) ) ).r;
				float dotResult254 = dot( ase_tanViewDir , normalUnpacked196 );
				float lavaMask272 = saturate( ( magmaDetial234.r + ( saturate( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - lavaMaskMap229 ) ) ) , _LavaMaskFactorsX ) ) * _LavaMaskFactorsY ) ) * saturate( ( saturate( pow( max( 0.0 , dotResult254 ) , _LavaMaskPower ) ) * _LavaMaskBoost ) ) ) ) );
				float4 lerpResult274 = lerp( _MagmaColorMin , _MagmaColorMax , lavaMask272);
				float4 lavaColor277 = ( saturate( ( ( projNormal10_g129.x * tex2D( _DistortionMap, ( ( appendResult27_g129 * appendResult21_g129 * temp_output_29_0_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g129 * appendResult32_g129 * appendResult22_g129 ) + temp_output_65_0_g129 ) ) ) + ( projNormal10_g129.z * tex2D( _DistortionMap, ( temp_output_65_0_g129 + ( temp_output_29_0_g129 * appendResult34_g129 * appendResult25_g129 ) ) ) ) ) ) * lerpResult274 * _MagmaGlow );
				float3 lerpResult5_g139 = lerp( _MainLightPosition.xyz , ( _MainLightPosition.xyz - WorldPosition ) , _MainLightPosition.w);
				float3 normalizeResult6_g139 = normalize( lerpResult5_g139 );
				float dotResult1_g139 = dot( normalizeResult6_g139 , ase_worldNormal );
				float smoothstepResult336 = smoothstep( _DarkSideLavaStepMin , _DarkSideLavaStepMax , saturate( ( dotResult1_g139 * ase_lightAtten ) ));
				float lerpResult355 = lerp( 1.0 , saturate( smoothstepResult336 ) , _DarkSideLava);
				

				float3 BaseColor = temp_output_298_0.rgb;
				float3 Emission = ( ( temp_output_298_0 + ( ( lavaColor277 * lavaMask272 ) * saturate( ( _LavaPasstrough + temp_output_306_0 ) ) ) ) * lerpResult355 ).rgb;
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
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_FOG 1
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
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
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
				float4 lightmapUVOrVertexSH : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FresnelColor;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _SpecularColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _DistortionFactor;
			float _MagmaTiling;
			float _MagmaPower;
			float _MagmaBoost;
			float _LavaMaskTiling;
			float _LavaMaskFactorsX;
			float _LavaMaskFactorsY;
			float _LavaMaskPower;
			float _LavaMaskBoost;
			float _MagmaGlow;
			float _LavaPasstrough;
			float _DarkSideLavaStepMin;
			float _DarkSideLavaStepMax;
			float _DistortionSpeed;
			float _ScatterCenterShift;
			float _FresnelPower;
			float _FrenselMult;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _NormalTiling;
			float _NormalScale;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _LavaFactorsY;
			float _LavaFactorsZ;
			float _DarkSideLava;
			float _DistortionTiling;
			float _Smoothness;
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
			sampler2D _DetailMap;
			sampler2D _NormalMap;
			sampler2D _HeightMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			inline float4 TriplanarSampling193( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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
			
			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				o.ase_normal = v.ase_normal;
				o.ase_texcoord5 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;

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
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;

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
				o.texcoord1 = v.texcoord1;
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
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
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

				float4 transform4_g120 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g120 = normalize( transform4_g120 );
				float3 temp_output_1_0_g121 = normalizeResult6_g120.xyz;
				float3 normalizeResult7_g120 = normalize( _MainLightPosition.xyz );
				float dotResult4_g121 = dot( temp_output_1_0_g121 , normalizeResult7_g120 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult8_g120 = normalize( ase_worldViewDir );
				float dotResult7_g121 = dot( temp_output_1_0_g121 , normalizeResult8_g120 );
				float2 appendResult10_g121 = (float2(( ( dotResult4_g121 / 2.0 ) + 0.5 ) , dotResult7_g121));
				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal51_g135 = float3(0,0,1);
				float3 worldNormal51_g135 = float3(dot(tanToWorld0,tanNormal51_g135), dot(tanToWorld1,tanNormal51_g135), dot(tanToWorld2,tanNormal51_g135));
				float4 appendResult63_g135 = (float4(worldNormal51_g135 , 0.0));
				float4 temp_output_57_0_g135 = mul( GetWorldToObjectMatrix(), appendResult63_g135 );
				float4 temp_cast_2 = (5.0).xxxx;
				float4 temp_output_4_0_g135 = pow( abs( temp_output_57_0_g135 ) , temp_cast_2 );
				float4 break6_g135 = temp_output_4_0_g135;
				float4 projNormal10_g135 = ( temp_output_4_0_g135 / ( break6_g135.x + break6_g135.y + break6_g135.z ) );
				float4 appendResult62_g135 = (float4(WorldPosition , 1.0));
				float4 break26_g135 = mul( GetWorldToObjectMatrix(), appendResult62_g135 );
				float2 appendResult27_g135 = (float2(break26_g135.z , break26_g135.y));
				float4 nSign18_g135 = sign( temp_output_57_0_g135 );
				float4 break20_g135 = nSign18_g135;
				float2 appendResult21_g135 = (float2(break20_g135.x , 1.0));
				float temp_output_29_0_g135 = _DetailTiling;
				float2 temp_output_65_0_g135 = float2( 0,0 );
				float2 appendResult32_g135 = (float2(break26_g135.x , break26_g135.z));
				float2 appendResult22_g135 = (float2(break20_g135.y , 1.0));
				float2 appendResult34_g135 = (float2(break26_g135.x , break26_g135.y));
				float2 appendResult25_g135 = (float2(-break20_g135.z , 1.0));
				float4 break138 = saturate( ( ( projNormal10_g135.x * tex2D( _DetailMap, ( ( appendResult27_g135 * appendResult21_g135 * temp_output_29_0_g135 ) + temp_output_65_0_g135 ) ) ) + ( projNormal10_g135.y * tex2D( _DetailMap, ( ( temp_output_29_0_g135 * appendResult32_g135 * appendResult22_g135 ) + temp_output_65_0_g135 ) ) ) + ( projNormal10_g135.z * tex2D( _DetailMap, ( temp_output_65_0_g135 + ( temp_output_29_0_g135 * appendResult34_g135 * appendResult25_g135 ) ) ) ) ) );
				float detailTex146 = saturate( ( _DetailExp * pow( max( 0.0 , ( break138.r * break138.g ) ) , _DetailExp ) * 5000.0 ) );
				float4 temp_output_204_0 = saturate( ( detailTex146 * _Specular * _SpecularColor * _SpecularBoost ) );
				float4 temp_output_43_0_g131 = temp_output_204_0;
				float3 normalizeResult4_g132 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float4 triplanar193 = TriplanarSampling193( _NormalMap, IN.ase_texcoord5.xyz, IN.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				float3 tanNormal12_g131 = normalUnpacked196;
				float3 worldNormal12_g131 = float3(dot(tanToWorld0,tanNormal12_g131), dot(tanToWorld1,tanNormal12_g131), dot(tanToWorld2,tanNormal12_g131));
				float3 normalizeResult64_g131 = normalize( worldNormal12_g131 );
				float dotResult19_g131 = dot( normalizeResult4_g132 , normalizeResult64_g131 );
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float4 temp_output_40_0_g131 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g131 = dot( normalizeResult64_g131 , _MainLightPosition.xyz );
				float3 bakedGI34_g131 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g131);
				MixRealtimeAndBakedGI(ase_mainLight, normalizeResult64_g131, bakedGI34_g131, half4(0,0,0,0));
				float3 tanNormal51_g118 = float3(0,0,1);
				float3 worldNormal51_g118 = float3(dot(tanToWorld0,tanNormal51_g118), dot(tanToWorld1,tanNormal51_g118), dot(tanToWorld2,tanNormal51_g118));
				float4 appendResult63_g118 = (float4(worldNormal51_g118 , 0.0));
				float4 temp_output_57_0_g118 = mul( GetWorldToObjectMatrix(), appendResult63_g118 );
				float4 temp_cast_7 = (5.0).xxxx;
				float4 temp_output_4_0_g118 = pow( abs( temp_output_57_0_g118 ) , temp_cast_7 );
				float4 break6_g118 = temp_output_4_0_g118;
				float4 projNormal10_g118 = ( temp_output_4_0_g118 / ( break6_g118.x + break6_g118.y + break6_g118.z ) );
				float4 appendResult62_g118 = (float4(WorldPosition , 1.0));
				float4 break26_g118 = mul( GetWorldToObjectMatrix(), appendResult62_g118 );
				float2 appendResult27_g118 = (float2(break26_g118.z , break26_g118.y));
				float4 nSign18_g118 = sign( temp_output_57_0_g118 );
				float4 break20_g118 = nSign18_g118;
				float2 appendResult21_g118 = (float2(break20_g118.x , 1.0));
				float temp_output_29_0_g118 = _HeightTiling;
				float2 temp_output_65_0_g118 = float2( 0,0 );
				float2 appendResult32_g118 = (float2(break26_g118.x , break26_g118.z));
				float2 appendResult22_g118 = (float2(break20_g118.y , 1.0));
				float2 appendResult34_g118 = (float2(break26_g118.x , break26_g118.y));
				float2 appendResult25_g118 = (float2(-break20_g118.z , 1.0));
				float detaledHeight167 = saturate( ( detailTex146 * saturate( ( saturate( ( ( projNormal10_g118.x * tex2D( _HeightMap, ( ( appendResult27_g118 * appendResult21_g118 * temp_output_29_0_g118 ) + temp_output_65_0_g118 ) ) ) + ( projNormal10_g118.y * tex2D( _HeightMap, ( ( temp_output_29_0_g118 * appendResult32_g118 * appendResult22_g118 ) + temp_output_65_0_g118 ) ) ) + ( projNormal10_g118.z * tex2D( _HeightMap, ( temp_output_65_0_g118 + ( temp_output_29_0_g118 * appendResult34_g118 * appendResult25_g118 ) ) ) ) ) ).r * _HeightDetail ) ) ) );
				float temp_output_2_0_g119 = saturate( ( _LavaFactorsX - _LavaDetail ) );
				float detaledHeight01178 = saturate( saturate( ( ( detaledHeight167 - temp_output_2_0_g119 ) / ( saturate( ( _LavaFactorsY - _LavaDetail ) ) - temp_output_2_0_g119 ) ) ) );
				float temp_output_6_0_g133 = ( detaledHeight01178 / _LavaFactorsZ );
				float3 lerpResult8_g133 = lerp( _LavaLow.rgb , _LavaMid.rgb , saturate( temp_output_6_0_g133 ));
				float3 lerpResult12_g133 = lerp( lerpResult8_g133 , _LavaHigh.rgb , saturate( ( temp_output_6_0_g133 - 1.0 ) ));
				float3 temp_output_179_0 = lerpResult12_g133;
				float4 temp_output_42_0_g131 = float4( temp_output_179_0 , 0.0 );
				float4 baseColor213 = ( ( float4( (temp_output_43_0_g131).rgb , 0.0 ) * (temp_output_43_0_g131).a * pow( max( dotResult19_g131 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g131 ) + ( ( ( temp_output_40_0_g131 * max( dotResult14_g131 , 0.0 ) ) + float4( bakedGI34_g131 , 0.0 ) ) * float4( (temp_output_42_0_g131).rgb , 0.0 ) ) );
				float4 temp_output_43_0_g137 = _SpecularColor;
				float3 normalizeResult4_g138 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float3 tanNormal12_g137 = normalUnpacked196;
				float3 worldNormal12_g137 = float3(dot(tanToWorld0,tanNormal12_g137), dot(tanToWorld1,tanNormal12_g137), dot(tanToWorld2,tanNormal12_g137));
				float3 normalizeResult64_g137 = normalize( worldNormal12_g137 );
				float dotResult19_g137 = dot( normalizeResult4_g138 , normalizeResult64_g137 );
				float4 temp_output_40_0_g137 = ( _MainLightColor * ase_lightAtten );
				float dotResult14_g137 = dot( normalizeResult64_g137 , _MainLightPosition.xyz );
				float3 bakedGI34_g137 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, normalizeResult64_g137);
				MixRealtimeAndBakedGI(ase_mainLight, normalizeResult64_g137, bakedGI34_g137, half4(0,0,0,0));
				float4 temp_cast_13 = (1.0).xxxx;
				float4 temp_output_42_0_g137 = temp_cast_13;
				float4 temp_output_306_0 = ( ( float4( (temp_output_43_0_g137).rgb , 0.0 ) * (temp_output_43_0_g137).a * pow( max( dotResult19_g137 , 0.0 ) , ( _Shininess * 128.0 ) ) * temp_output_40_0_g137 ) + ( ( ( temp_output_40_0_g137 * max( dotResult14_g137 , 0.0 ) ) + float4( bakedGI34_g137 , 0.0 ) ) * float4( (temp_output_42_0_g137).rgb , 0.0 ) ) );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 normalizeResult5_g127 = normalize( normalUnpacked196 );
				float dotResult14_g127 = dot( ase_tanViewDir , normalizeResult5_g127 );
				float detailX235 = break138.r;
				float4 fresnel268 = saturate( ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g127 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) * detailX235 ) );
				float4 temp_output_298_0 = saturate( ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g121 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( baseColor213 + ( temp_output_306_0 * fresnel268 ) ) ) );
				

				float3 BaseColor = temp_output_298_0.rgb;
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
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_FOG 1
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _FresnelColor;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _SpecularColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _DistortionFactor;
			float _MagmaTiling;
			float _MagmaPower;
			float _MagmaBoost;
			float _LavaMaskTiling;
			float _LavaMaskFactorsX;
			float _LavaMaskFactorsY;
			float _LavaMaskPower;
			float _LavaMaskBoost;
			float _MagmaGlow;
			float _LavaPasstrough;
			float _DarkSideLavaStepMin;
			float _DarkSideLavaStepMax;
			float _DistortionSpeed;
			float _ScatterCenterShift;
			float _FresnelPower;
			float _FrenselMult;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _NormalTiling;
			float _NormalScale;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _LavaFactorsY;
			float _LavaFactorsZ;
			float _DarkSideLava;
			float _DistortionTiling;
			float _Smoothness;
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


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			inline float4 TriplanarSampling193( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
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

				o.ase_texcoord5 = v.vertex;
				o.ase_normal = v.ase_normal;
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

				float4 triplanar193 = TriplanarSampling193( _NormalMap, IN.ase_texcoord5.xyz, IN.ase_normal, 1.0, _NormalTiling, 1.0, 0 );
				float3 unpack195 = UnpackNormalScale( triplanar193, _NormalScale );
				unpack195.z = lerp( 1, unpack195.z, saturate(_NormalScale) );
				float3 normalUnpacked196 = unpack195;
				

				float3 Normal = normalUnpacked196;
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
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_FOG 1
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
			float4 _FresnelColor;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _SpecularColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _DistortionFactor;
			float _MagmaTiling;
			float _MagmaPower;
			float _MagmaBoost;
			float _LavaMaskTiling;
			float _LavaMaskFactorsX;
			float _LavaMaskFactorsY;
			float _LavaMaskPower;
			float _LavaMaskBoost;
			float _MagmaGlow;
			float _LavaPasstrough;
			float _DarkSideLavaStepMin;
			float _DarkSideLavaStepMax;
			float _DistortionSpeed;
			float _ScatterCenterShift;
			float _FresnelPower;
			float _FrenselMult;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _NormalTiling;
			float _NormalScale;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _LavaFactorsY;
			float _LavaFactorsZ;
			float _DarkSideLava;
			float _DistortionTiling;
			float _Smoothness;
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
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_FOG 1
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
			float4 _FresnelColor;
			float4 _ScatterColor;
			float4 _LavaHigh;
			float4 _MagmaColorMin;
			float4 _MagmaColorMax;
			float4 _SpecularColor;
			float4 _LavaMid;
			float4 _LavaLow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _DistortionFactor;
			float _MagmaTiling;
			float _MagmaPower;
			float _MagmaBoost;
			float _LavaMaskTiling;
			float _LavaMaskFactorsX;
			float _LavaMaskFactorsY;
			float _LavaMaskPower;
			float _LavaMaskBoost;
			float _MagmaGlow;
			float _LavaPasstrough;
			float _DarkSideLavaStepMin;
			float _DarkSideLavaStepMax;
			float _DistortionSpeed;
			float _ScatterCenterShift;
			float _FresnelPower;
			float _FrenselMult;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _DetailExp;
			float _DetailTiling;
			float _Specular;
			float _SpecularBoost;
			float _NormalTiling;
			float _NormalScale;
			float _Shininess;
			float _HeightTiling;
			float _HeightDetail;
			float _LavaFactorsX;
			float _LavaDetail;
			float _LavaFactorsY;
			float _LavaFactorsZ;
			float _DarkSideLava;
			float _DistortionTiling;
			float _Smoothness;
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
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.RangedFloatNode;133;-492.5569,-703.8184;Float;False;Property;_DetailTiling;Detail Tiling;18;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;2454.349,89.99643;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;271;5848.078,544.6608;Float;False;Property;_MagmaColorMax;Magma Color Max;43;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.4779411,0.278815,0.1124567,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;263;5347.742,71.1476;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;265;5342.673,-101.9409;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RegisterLocalVarNode;213;3317.469,34.21539;Float;False;baseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;253;5151.091,67.45267;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;200;2082.349,-97.0036;Float;False;Property;_SpecularColor;Specular Color;21;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.6397059,0.4562608,0.4562608,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;197;2434.336,9.572575;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;272;5944.078,34.66083;Float;False;lavaMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;205;2040.56,271.9925;Float;False;Property;_SpecularBoost;Specular Boost;24;0;Create;True;0;0;0;False;0;False;0.03;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;206;2627.449,233.7819;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;204;2693.349,107.9964;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;267;5777.186,39.53471;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;180;1751.91,-286.7233;Float;False;Property;_LavaLow;Lava Low;25;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.3088233,0.1362455,0.1362455,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;141;-232.3993,-512.8726;Inherit;False;Triplanar;-1;;118;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;5;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;176;1144.376,-310.1707;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;169;1323.91,-410.7233;Inherit;False;Linstep;-1;;119;aade3b0317e32b148b41ee41b85032e6;0;3;4;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;181;1755.91,-112.7233;Float;False;Property;_LavaMid;Lava Mid;26;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.2573528,0.003784606,0.003784606,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;178;1690.91,-427.7233;Float;False;detaledHeight01;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;199;2039.984,353.0802;Float;False;Property;_Smoothness;Smoothness;23;0;Create;True;0;0;0;False;0;False;0;0.921;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;236;3702.81,1125.339;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;256;4152.658,470.5074;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;144;48.60071,-512.8726;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SaturateNode;175;1144.631,-382.3737;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;269;3886.583,1125.671;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;2088.854,96.48244;Inherit;False;146;detailTex;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;177;1532.91,-414.7233;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;266;5626.074,47.6591;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;212;2445.988,236.0645;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;184;1728.922,247.0016;Float;False;Property;_LavaFactorsZ;Lava Factors Z;30;0;Create;True;0;0;0;False;0;False;0;0.79;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;296;7251.182,20.07087;Inherit;False;ScatterColor;5;;120;5984f944e2b849e44aad6ac4d7027dc1;0;0;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;237;3459.81,1213.339;Inherit;False;235;detailX;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;280;6849.969,209.5274;Inherit;False;213;baseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;319;4551.637,246.6962;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;277;6605.116,345.3349;Float;False;lavaColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;243;3429.75,1124.092;Inherit;False;Fresnel;47;;127;f8c497a0c2d6d334f8e7138f24a77d5f;0;1;22;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;292;6436.51,592.8249;Float;False;Property;_LavaPasstrough;Lava Passtrough;41;0;Create;True;0;0;0;False;0;False;0.02;0.1;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;281;7302.269,212.0158;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;274;6193.078,431.6608;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;282;6269.269,680.0158;Float;False;Constant;_Float1;Float 1;35;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;291;6760.51,597.8249;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;279;6638.116,433.3349;Inherit;False;272;lavaMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;299;6142.52,346.9752;Inherit;False;TriplanarUVDist;51;;128;01791187aaf871246af28f7438b407d3;0;0;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;233;3172.133,1119.562;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;275;6401.116,346.3349;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;215;3184.727,719.5782;Float;True;Property;_MagmaMap;Magma Map;13;0;Create;True;0;0;0;False;0;False;None;7bfa2038811711f43b9b2a102f5b9ef7;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode;182;1759.91,63.27673;Float;False;Property;_LavaHigh;Lava High;27;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.2499998,0.1992899,0.1764704,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;217;3536.454,882.8323;Float;False;Property;_MagmaPower;Magma Power;44;0;Create;True;0;0;0;False;0;False;0;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;273;5872.078,720.6608;Inherit;False;272;lavaMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;260;4841.317,301.4274;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;179;2100.91,-260.7233;Inherit;False;Ramp3;-1;;133;d38b6eed89401a040a9f914ae79b3d2f;0;5;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;5;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;288;6547.596,888.4902;Inherit;False;268;fresnel;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;276;6194.116,557.3349;Float;False;Property;_MagmaGlow;Magma Glow;46;0;Create;True;0;0;0;False;0;False;0;613;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;268;4061.583,1119.671;Float;False;fresnel;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;270;5843.078,363.6608;Float;False;Property;_MagmaColorMin;Magma Color Min;42;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.4485294,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;290;6187.482,753.0476;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;278;6858.116,342.3349;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;298;7664.51,189.8249;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;315;7690.349,-35.71765;Inherit;False;196;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;216;3189.567,922.8467;Float;False;Property;_MagmaTiling;Magma Tiling;19;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;235;405.3693,-730.9871;Float;False;detailX;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;234;4620.982,740.1832;Float;False;magmaDetial;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;142;-489.3993,-518.8726;Float;True;Property;_HeightMap;Height Map;4;0;Create;True;0;0;0;False;0;False;None;05b697d04446b8845a75c99bfa391492;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;166;459.7019,-1127.488;Float;False;Constant;_Float0;Float 0;8;0;Create;True;0;0;0;False;0;False;5000;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;2037.349,193.9965;Float;False;Property;_Specular;Specular;22;0;Create;True;0;0;0;False;0;False;0.03;0.326;0.03;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;195;597.0527,25.46639;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;264;5073.974,-102.2409;Inherit;False;234;magmaDetial;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;155;104.1018,-359.1874;Float;False;Property;_HeightDetail;Height Detail;33;0;Create;True;0;0;0;False;0;False;0;0.88;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;164;680.7016,-1063.788;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;1000;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;262;5153.317,302.4274;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;228;52.67383,-229.3097;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;194;346.3918,228.5305;Float;False;Property;_NormalScale;Normal Scale;15;0;Create;True;0;0;0;False;0;False;0;1.28;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;226;-212.4865,-231.9746;Inherit;False;Triplanar;-1;;134;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;2;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;196;872.2377,18.50697;Float;False;normalUnpacked;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;191;-91.8899,221.7792;Float;False;Property;_NormalTiling;Normal Tiling;16;0;Create;True;0;0;0;False;0;False;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;192;-92.37891,20.9383;Float;True;Property;_NormalMap;Normal Map;14;0;Create;True;0;0;0;False;0;False;None;4610b58d5667c8b488023068867fe203;True;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;171;675.631,-375.3737;Float;False;Property;_LavaFactorsX;Lava Factors X;28;0;Create;True;0;0;0;False;0;False;0;0.728;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;134;518.6178,-903.6335;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.6;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;227;-474.9816,-180.0085;Float;False;Property;_LavaMaskTiling;Lava Mask Tiling;20;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;136;-212.9422,-903.2474;Inherit;False;Triplanar;-1;;135;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;5;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;132;-497.3967,-907.0871;Float;True;Property;_DetailMap;Detail Map;12;0;Create;True;0;0;0;False;0;False;None;7bfa2038811711f43b9b2a102f5b9ef7;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;143;-471.3993,-325.8726;Float;False;Property;_HeightTiling;Height Tiling;17;0;Create;True;0;0;0;False;0;False;2;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;163;184.1019,-1057.288;Float;False;Property;_DetailExp;Detail Exp;32;0;Create;True;0;0;0;False;0;False;0;0.87;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;146;898.4141,-916.097;Float;False;detailTex;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;172;672.3959,-207.8755;Float;False;Property;_LavaFactorsY;Lava Factors Y;29;0;Create;True;0;0;0;False;0;False;0;0.91;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;162;655.302,-585.3875;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;167;1008.302,-539.8874;Float;False;detaledHeight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;261;5000.317,301.4274;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;4029.651,61.21515;Inherit;False;229;lavaMaskMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;138;59.69622,-901.6342;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;314;7687.078,-206.6565;Inherit;False;Constant;_Float2;Float 2;38;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode;193;167.8278,24.54628;Inherit;True;Spherical;Object;False;Top Texture 2;_TopTexture2;white;0;None;Mid Texture 2;_MidTexture2;white;0;None;Bot Texture 2;_BotTexture2;white;1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;249;4341.859,162.3618;Float;False;Property;_LavaMaskFactorsX;Lava Mask Factors X;34;0;Create;True;0;0;0;False;0;False;0;6.89;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;284;7111.569,345.1158;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;318;4551.637,-54.3038;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;246;4255.617,66.51323;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;170;671.1091,-296.3696;Float;False;Property;_LavaDetail;Lava Detail;31;0;Create;True;0;0;0;False;0;False;0;0.593;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;250;4739.862,170.3618;Float;False;Property;_LavaMaskFactorsY;Lava Mask Factors Y;35;0;Create;True;0;0;0;False;0;False;0;4.12;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;160;819.102,-587.9873;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;174;969.6312,-244.3735;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;229;345.8156,-233.3071;Float;False;lavaMaskMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;173;966.6312,-357.3737;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;252;4828.862,75.3618;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;255;4187.158,300.0071;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;147;405.3009,-591.5728;Inherit;False;146;detailTex;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;317;3705.856,530.9779;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;221;3948.454,723.8323;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;225;4370.931,745.8948;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;297;7489.897,177.2944;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;254;4422.158,305.0071;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;4992.862,80.3618;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;214;3469.181,723.4182;Inherit;False;Triplanar;-1;;136;61abc9e6202a1a94ab1548c8ccbc2e48;0;4;36;SAMPLER2D;0.0;False;29;FLOAT;0;False;2;FLOAT;5;False;65;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;259;4731.317,419.4274;Float;False;Property;_LavaMaskBoost;Lava Mask Boost;37;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;258;4432.314,424.4274;Float;False;Property;_LavaMaskPower;Lava Mask Power;36;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;247;4429.86,70.3618;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;3885.454,825.8323;Float;False;Property;_MagmaBoost;Magma Boost;45;0;Create;True;0;0;0;False;0;False;0;888;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;157;461.6021,-476.1873;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;222;4126.454,720.8323;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;257;4685.317,301.4274;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;156;312.1019,-472.2874;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;248;4641.862,74.3618;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;220.4893,-901.5146;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;316;373.4872,-966.9308;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;220;3790.454,657.8323;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;153;715.0361,-916.0713;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;312;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;311;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;322;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;308;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;320;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;321;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;313;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;310;8113.301,-18.8024;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;323;8113.301,41.1976;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.SaturateNode;293;6923.776,517.592;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;289;6923.547,711.4542;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;295;7847.783,261.128;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;344;7354.531,672.4224;Inherit;False;Property;_DarkSideLavaStepMin;Dark Side Lava Step Min;39;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;345;7375.531,777.4224;Inherit;False;Property;_DarkSideLavaStepMax;Dark Side Lava Step Max;38;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;309;8411.301,39.1976;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;FORGE3D/Planets HD/Lava;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;20;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;41;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;638305706535866154;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;0;638305468337332915;  Use Shadow Threshold;0;0;Receive Shadows;0;638305468347317902;GPU Instancing;0;638305468756155380;LOD CrossFade;0;638305468760653598;Built-in Fog;1;638305468771882751;_FinalColorxAlpha;0;0;Meta Pass;1;638305706494506156;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;False;True;True;True;True;False;True;True;False;;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;341;8066.133,271.8983;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;306;6500.714,710.3367;Inherit;False;Blinn-Phong Light;0;;137;cf814dba44d007a4e958d2ddd5813da6;0;3;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;43;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT;57
Node;AmplifyShaderEditor.FunctionNode;353;7249.531,443.4224;Inherit;False;ShadeLights;-1;;139;169e3621c8ce12945b289d4a0d32327b;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;336;7617.133,447.8983;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;338;7844.133,451.8983;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;355;8139.531,460.4224;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;327;7679.341,635.8182;Inherit;False;Property;_DarkSideLava;Dark Side Lava;40;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomStandardSurface;185;2978.896,48.45012;Inherit;False;Specular;Tangent;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;307;2956.723,-123.3205;Inherit;False;Blinn-Phong Light;0;;131;cf814dba44d007a4e958d2ddd5813da6;0;3;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;43;COLOR;0,0,0,0;False;2;COLOR;0;FLOAT;57
WireConnection;203;0;198;0
WireConnection;203;1;202;0
WireConnection;203;2;200;0
WireConnection;203;3;205;0
WireConnection;263;0;253;0
WireConnection;263;1;262;0
WireConnection;265;0;264;0
WireConnection;213;0;307;0
WireConnection;253;0;251;0
WireConnection;272;0;267;0
WireConnection;206;0;212;0
WireConnection;206;1;199;0
WireConnection;204;0;203;0
WireConnection;267;0;266;0
WireConnection;141;36;142;0
WireConnection;141;29;143;0
WireConnection;176;0;174;0
WireConnection;169;4;167;0
WireConnection;169;2;175;0
WireConnection;169;3;176;0
WireConnection;178;0;177;0
WireConnection;236;0;243;0
WireConnection;236;1;237;0
WireConnection;144;0;141;0
WireConnection;175;0;173;0
WireConnection;269;0;236;0
WireConnection;177;0;169;0
WireConnection;266;0;265;0
WireConnection;266;1;263;0
WireConnection;212;0;198;0
WireConnection;319;1;254;0
WireConnection;277;0;275;0
WireConnection;243;22;233;0
WireConnection;281;0;280;0
WireConnection;281;1;289;0
WireConnection;274;0;270;0
WireConnection;274;1;271;0
WireConnection;274;2;273;0
WireConnection;291;0;292;0
WireConnection;291;1;306;0
WireConnection;275;0;299;0
WireConnection;275;1;274;0
WireConnection;275;2;276;0
WireConnection;260;0;257;0
WireConnection;179;1;180;0
WireConnection;179;2;181;0
WireConnection;179;3;182;0
WireConnection;179;5;184;0
WireConnection;179;4;178;0
WireConnection;268;0;269;0
WireConnection;278;0;277;0
WireConnection;278;1;279;0
WireConnection;298;0;297;0
WireConnection;235;0;138;0
WireConnection;234;0;225;0
WireConnection;195;0;193;0
WireConnection;195;1;194;0
WireConnection;164;0;163;0
WireConnection;164;1;134;0
WireConnection;164;2;166;0
WireConnection;262;0;261;0
WireConnection;228;0;226;0
WireConnection;226;36;142;0
WireConnection;226;29;227;0
WireConnection;196;0;195;0
WireConnection;134;0;316;0
WireConnection;134;1;163;0
WireConnection;136;36;132;0
WireConnection;136;29;133;0
WireConnection;146;0;153;0
WireConnection;162;0;147;0
WireConnection;162;1;157;0
WireConnection;167;0;160;0
WireConnection;261;0;260;0
WireConnection;261;1;259;0
WireConnection;138;0;136;0
WireConnection;193;0;192;0
WireConnection;193;3;191;0
WireConnection;284;0;278;0
WireConnection;284;1;293;0
WireConnection;318;1;247;0
WireConnection;246;0;244;0
WireConnection;160;0;162;0
WireConnection;174;0;172;0
WireConnection;174;1;170;0
WireConnection;229;0;228;0
WireConnection;173;0;171;0
WireConnection;173;1;170;0
WireConnection;252;0;248;0
WireConnection;317;1;214;0
WireConnection;221;0;220;0
WireConnection;225;0;222;0
WireConnection;297;0;296;0
WireConnection;297;1;281;0
WireConnection;254;0;255;0
WireConnection;254;1;256;0
WireConnection;251;0;252;0
WireConnection;251;1;250;0
WireConnection;214;36;215;0
WireConnection;214;29;216;0
WireConnection;247;0;246;0
WireConnection;157;0;156;0
WireConnection;222;0;221;0
WireConnection;222;1;218;0
WireConnection;222;2;214;0
WireConnection;257;0;319;0
WireConnection;257;1;258;0
WireConnection;156;0;144;0
WireConnection;156;1;155;0
WireConnection;248;0;318;0
WireConnection;248;1;249;0
WireConnection;139;0;138;0
WireConnection;139;1;138;1
WireConnection;316;1;139;0
WireConnection;220;0;317;0
WireConnection;220;1;217;0
WireConnection;153;0;164;0
WireConnection;293;0;291;0
WireConnection;289;0;306;0
WireConnection;289;1;288;0
WireConnection;295;0;298;0
WireConnection;295;1;284;0
WireConnection;309;0;298;0
WireConnection;309;1;315;0
WireConnection;309;2;341;0
WireConnection;309;9;204;0
WireConnection;309;4;206;0
WireConnection;341;0;295;0
WireConnection;341;1;355;0
WireConnection;306;42;282;0
WireConnection;306;52;290;0
WireConnection;336;0;353;0
WireConnection;336;1;344;0
WireConnection;336;2;345;0
WireConnection;338;0;336;0
WireConnection;355;1;338;0
WireConnection;355;2;327;0
WireConnection;185;0;179;0
WireConnection;185;1;197;0
WireConnection;185;3;204;0
WireConnection;185;4;206;0
WireConnection;307;42;179;0
WireConnection;307;52;197;0
WireConnection;307;43;204;0
ASEEND*/
//CHKSM=6E935AFE2E423AB5342D6DDF8DA79E9A4D5EB468