// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FORGE3D/Planets HD/Thunderstorm"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_NormalMap("Normal Map", 2D) = "white" {}
		_NormalUVTiling("Normal UV Tiling", Float) = 0
		_NormalUVSpeed("Normal UV Speed", Float) = 0
		_NormalTiling("Normal Tiling", Float) = 0
		_NormalSpeed("Normal Speed", Float) = 0
		_NormlalDistortionFactor("Normlal Distortion Factor", Range( -1 , 1)) = 0
		_NormalScale("Normal Scale", Float) = 0
		_DistortionMap("Distortion Map", 2D) = "white" {}
		_DistortionUVMap("Distortion UV Map", 2D) = "white" {}
		_DistortionUVTiling("Distortion UV Tiling", Float) = 0
		_DistortionUVSpeed("Distortion UV Speed", Float) = 0
		_DistortionTiling("Distortion Tiling", Float) = 0
		_DistortionSpeed("Distortion Speed", Float) = 0
		_DistortionFactor("Distortion Factor", Range( -1 , 1)) = 0
		_TintHigh("Tint High", Color) = (0,0,0,0)
		_TintLow("Tint Low", Color) = (0,0,0,0)
		_DetailPow("Detail Pow", Float) = 0
		_DetailBoost("Detail Boost", Float) = 0
		_SpecularColor("Specular Color", Color) = (0,0,0,0)
		_Specular("Specular", Range( 0.03 , 1)) = 1
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.5
		_ScatterMap("Scatter Map", 2D) = "white" {}
		_ScatterColor("Scatter Color", Color) = (0,0,0,0)
		_ScatterBoost("Scatter Boost", Range( 0 , 5)) = 1
		_ScatterIndirect("Scatter Indirect", Range( 0 , 1)) = 0
		_ScatterStretch("Scatter Stretch", Range( -2 , 2)) = 0
		_ScatterCenterShift("Scatter Center Shift", Range( -2 , 2)) = 0
		_FrenselMult("Frensel Mult", Range( 0 , 10)) = 0
		_FresnelPower("Fresnel Power", Range( 0 , 10)) = 0
		_FresnelColor("Fresnel Color", Color) = (0.4558824,0.4558824,0.4558824,1)
		_LightingMaskMap("Lighting Mask Map", 2D) = "white" {}
		_LightingMap("Lighting Map", 2D) = "white" {}
		_LightingMaskATiling("Lighting Mask A Tiling", Float) = 0
		_LightingMaskBTiling("Lighting Mask B Tiling", Float) = 0
		_LightingMaskAUVSpeed("Lighting Mask A UV Speed", Float) = 0
		_LightingMaskBUVSpeed("Lighting Mask B UV Speed", Float) = 0
		_LightingATiling("Lighting A Tiling", Float) = 0
		_LightingBTiling("Lighting B Tiling", Float) = 0
		_LightingAFrequency("Lighting A Frequency", Float) = 0
		_LightingBFrequency("Lighting B Frequency", Float) = 0
		_LightningSineMult("Lightning Sine Mult", Float) = 0
		_LigntingMaskPow("Lignting Mask Pow", Float) = 0
		_LightningBoost("Lightning Boost", Float) = 5
		_LightningColor("Lightning Color", Color) = (0,0,0,0)


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
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
			sampler2D _NormalMap;
			sampler2D _DistortionMap;
			sampler2D _DistortionUVMap;
			sampler2D _LightingMaskMap;
			sampler2D _LightingMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

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

				float4 transform4_g213 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g213 = normalize( transform4_g213 );
				float3 temp_output_1_0_g214 = normalizeResult6_g213.xyz;
				float3 normalizeResult7_g213 = normalize( _MainLightPosition.xyz );
				float dotResult4_g214 = dot( temp_output_1_0_g214 , normalizeResult7_g213 );
				float3 normalizeResult8_g213 = normalize( WorldViewDirection );
				float dotResult7_g214 = dot( temp_output_1_0_g214 , normalizeResult8_g213 );
				float2 appendResult10_g214 = (float2(( ( dotResult4_g214 / 2.0 ) + 0.5 ) , dotResult7_g214));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 tanNormal51_g217 = float3(0,0,1);
				float3 worldNormal51_g217 = float3(dot(tanToWorld0,tanNormal51_g217), dot(tanToWorld1,tanNormal51_g217), dot(tanToWorld2,tanNormal51_g217));
				float4 appendResult63_g217 = (float4(worldNormal51_g217 , 0.0));
				float4 temp_output_57_0_g217 = mul( GetWorldToObjectMatrix(), appendResult63_g217 );
				float4 temp_cast_2 = (5.0).xxxx;
				float4 temp_output_4_0_g217 = pow( abs( temp_output_57_0_g217 ) , temp_cast_2 );
				float4 break6_g217 = temp_output_4_0_g217;
				float4 projNormal10_g217 = ( temp_output_4_0_g217 / ( break6_g217.x + break6_g217.y + break6_g217.z ) );
				float4 appendResult62_g217 = (float4(WorldPosition , 1.0));
				float4 break26_g217 = mul( GetWorldToObjectMatrix(), appendResult62_g217 );
				float2 appendResult27_g217 = (float2(break26_g217.z , break26_g217.y));
				float4 nSign18_g217 = sign( temp_output_57_0_g217 );
				float4 break20_g217 = nSign18_g217;
				float2 appendResult21_g217 = (float2(break20_g217.x , 1.0));
				float temp_output_29_0_g217 = _NormalTiling;
				float temp_output_10_0_g215 = ( _TimeParameters.x * _NormalSpeed );
				float2 appendResult12_g215 = (float2(temp_output_10_0_g215 , temp_output_10_0_g215));
				float3 tanNormal51_g216 = float3(0,0,1);
				float3 worldNormal51_g216 = float3(dot(tanToWorld0,tanNormal51_g216), dot(tanToWorld1,tanNormal51_g216), dot(tanToWorld2,tanNormal51_g216));
				float4 appendResult63_g216 = (float4(worldNormal51_g216 , 0.0));
				float4 temp_output_57_0_g216 = mul( GetWorldToObjectMatrix(), appendResult63_g216 );
				float4 temp_cast_3 = (5.0).xxxx;
				float4 temp_output_4_0_g216 = pow( abs( temp_output_57_0_g216 ) , temp_cast_3 );
				float4 break6_g216 = temp_output_4_0_g216;
				float4 projNormal10_g216 = ( temp_output_4_0_g216 / ( break6_g216.x + break6_g216.y + break6_g216.z ) );
				float4 appendResult62_g216 = (float4(WorldPosition , 1.0));
				float4 break26_g216 = mul( GetWorldToObjectMatrix(), appendResult62_g216 );
				float2 appendResult27_g216 = (float2(break26_g216.z , break26_g216.y));
				float4 nSign18_g216 = sign( temp_output_57_0_g216 );
				float4 break20_g216 = nSign18_g216;
				float2 appendResult21_g216 = (float2(break20_g216.x , 1.0));
				float temp_output_29_0_g216 = _NormalUVTiling;
				float temp_output_2_0_g215 = ( _TimeParameters.x * _NormalUVSpeed );
				float2 appendResult5_g215 = (float2(temp_output_2_0_g215 , temp_output_2_0_g215));
				float2 temp_output_65_0_g216 = appendResult5_g215;
				float2 appendResult32_g216 = (float2(break26_g216.x , break26_g216.z));
				float2 appendResult22_g216 = (float2(break20_g216.y , 1.0));
				float2 appendResult34_g216 = (float2(break26_g216.x , break26_g216.y));
				float2 appendResult25_g216 = (float2(-break20_g216.z , 1.0));
				float4 break11_g215 = ( saturate( ( ( projNormal10_g216.x * tex2D( _NormalMap, ( ( appendResult27_g216 * appendResult21_g216 * temp_output_29_0_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.y * tex2D( _NormalMap, ( ( temp_output_29_0_g216 * appendResult32_g216 * appendResult22_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.z * tex2D( _NormalMap, ( temp_output_65_0_g216 + ( temp_output_29_0_g216 * appendResult34_g216 * appendResult25_g216 ) ) ) ) ) ) * _NormlalDistortionFactor );
				float2 appendResult13_g215 = (float2(break11_g215.r , break11_g215.g));
				float2 temp_output_65_0_g217 = ( appendResult12_g215 + appendResult13_g215 );
				float2 appendResult32_g217 = (float2(break26_g217.x , break26_g217.z));
				float2 appendResult22_g217 = (float2(break20_g217.y , 1.0));
				float2 appendResult34_g217 = (float2(break26_g217.x , break26_g217.y));
				float2 appendResult25_g217 = (float2(-break20_g217.z , 1.0));
				float3 unpack18_g215 = UnpackNormalScale( saturate( ( ( projNormal10_g217.x * tex2D( _NormalMap, ( ( appendResult27_g217 * appendResult21_g217 * temp_output_29_0_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.y * tex2D( _NormalMap, ( ( temp_output_29_0_g217 * appendResult32_g217 * appendResult22_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.z * tex2D( _NormalMap, ( temp_output_65_0_g217 + ( temp_output_29_0_g217 * appendResult34_g217 * appendResult25_g217 ) ) ) ) ) ), _NormalScale );
				unpack18_g215.z = lerp( 1, unpack18_g215.z, saturate(_NormalScale) );
				float3 normalUnpacked24 = unpack18_g215;
				float3 normalizeResult5_g212 = normalize( normalUnpacked24 );
				float dotResult14_g212 = dot( ase_tanViewDir , normalizeResult5_g212 );
				float3 tanNormal51_g174 = float3(0,0,1);
				float3 worldNormal51_g174 = float3(dot(tanToWorld0,tanNormal51_g174), dot(tanToWorld1,tanNormal51_g174), dot(tanToWorld2,tanNormal51_g174));
				float4 appendResult63_g174 = (float4(worldNormal51_g174 , 0.0));
				float4 temp_output_57_0_g174 = mul( GetWorldToObjectMatrix(), appendResult63_g174 );
				float4 temp_cast_5 = (5.0).xxxx;
				float4 temp_output_4_0_g174 = pow( abs( temp_output_57_0_g174 ) , temp_cast_5 );
				float4 break6_g174 = temp_output_4_0_g174;
				float4 projNormal10_g174 = ( temp_output_4_0_g174 / ( break6_g174.x + break6_g174.y + break6_g174.z ) );
				float4 appendResult62_g174 = (float4(WorldPosition , 1.0));
				float4 break26_g174 = mul( GetWorldToObjectMatrix(), appendResult62_g174 );
				float2 appendResult27_g174 = (float2(break26_g174.z , break26_g174.y));
				float4 nSign18_g174 = sign( temp_output_57_0_g174 );
				float4 break20_g174 = nSign18_g174;
				float2 appendResult21_g174 = (float2(break20_g174.x , 1.0));
				float temp_output_29_0_g174 = _DistortionTiling;
				float temp_output_10_0_g173 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g173 = (float2(temp_output_10_0_g173 , temp_output_10_0_g173));
				float3 tanNormal51_g175 = float3(0,0,1);
				float3 worldNormal51_g175 = float3(dot(tanToWorld0,tanNormal51_g175), dot(tanToWorld1,tanNormal51_g175), dot(tanToWorld2,tanNormal51_g175));
				float4 appendResult63_g175 = (float4(worldNormal51_g175 , 0.0));
				float4 temp_output_57_0_g175 = mul( GetWorldToObjectMatrix(), appendResult63_g175 );
				float4 temp_cast_6 = (5.0).xxxx;
				float4 temp_output_4_0_g175 = pow( abs( temp_output_57_0_g175 ) , temp_cast_6 );
				float4 break6_g175 = temp_output_4_0_g175;
				float4 projNormal10_g175 = ( temp_output_4_0_g175 / ( break6_g175.x + break6_g175.y + break6_g175.z ) );
				float4 appendResult62_g175 = (float4(WorldPosition , 1.0));
				float4 break26_g175 = mul( GetWorldToObjectMatrix(), appendResult62_g175 );
				float2 appendResult27_g175 = (float2(break26_g175.z , break26_g175.y));
				float4 nSign18_g175 = sign( temp_output_57_0_g175 );
				float4 break20_g175 = nSign18_g175;
				float2 appendResult21_g175 = (float2(break20_g175.x , 1.0));
				float temp_output_29_0_g175 = _DistortionUVTiling;
				float temp_output_2_0_g173 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g173 = (float2(temp_output_2_0_g173 , temp_output_2_0_g173));
				float2 temp_output_65_0_g175 = appendResult5_g173;
				float2 appendResult32_g175 = (float2(break26_g175.x , break26_g175.z));
				float2 appendResult22_g175 = (float2(break20_g175.y , 1.0));
				float2 appendResult34_g175 = (float2(break26_g175.x , break26_g175.y));
				float2 appendResult25_g175 = (float2(-break20_g175.z , 1.0));
				float4 break11_g173 = ( saturate( ( ( projNormal10_g175.x * tex2D( _DistortionUVMap, ( ( appendResult27_g175 * appendResult21_g175 * temp_output_29_0_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.y * tex2D( _DistortionUVMap, ( ( temp_output_29_0_g175 * appendResult32_g175 * appendResult22_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.z * tex2D( _DistortionUVMap, ( temp_output_65_0_g175 + ( temp_output_29_0_g175 * appendResult34_g175 * appendResult25_g175 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g173 = (float2(break11_g173.r , break11_g173.g));
				float2 temp_output_65_0_g174 = ( appendResult12_g173 + appendResult13_g173 );
				float2 appendResult32_g174 = (float2(break26_g174.x , break26_g174.z));
				float2 appendResult22_g174 = (float2(break20_g174.y , 1.0));
				float2 appendResult34_g174 = (float2(break26_g174.x , break26_g174.y));
				float2 appendResult25_g174 = (float2(-break20_g174.z , 1.0));
				float4 temp_cast_7 = (_DetailPow).xxxx;
				float4 temp_output_9_0 = saturate( ( pow( max( float4( 0,0,0,0 ) , saturate( ( ( projNormal10_g174.x * tex2D( _DistortionMap, ( ( appendResult27_g174 * appendResult21_g174 * temp_output_29_0_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g174 * appendResult32_g174 * appendResult22_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.z * tex2D( _DistortionMap, ( temp_output_65_0_g174 + ( temp_output_29_0_g174 * appendResult34_g174 * appendResult25_g174 ) ) ) ) ) ) ) , temp_cast_7 ) * _DetailBoost ) );
				float4 lerpResult5 = lerp( _TintLow , _TintHigh , temp_output_9_0.r);
				
				float4 temp_cast_9 = (0.0).xxxx;
				float clampResult20_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 2.0 * PI ) ) ) , 0.3 , 1.0 );
				float clampResult29_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 5.0 * PI ) ) ) , 0.5 , 1.0 );
				float clampResult30_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 10.0 * PI ) ) ) , 0.7 , 1.0 );
				float sine32_g207 = ( clampResult20_g207 * clampResult29_g207 * clampResult30_g207 );
				float3 tanNormal51_g211 = float3(0,0,1);
				float3 worldNormal51_g211 = float3(dot(tanToWorld0,tanNormal51_g211), dot(tanToWorld1,tanNormal51_g211), dot(tanToWorld2,tanNormal51_g211));
				float4 appendResult63_g211 = (float4(worldNormal51_g211 , 0.0));
				float4 temp_output_57_0_g211 = mul( GetWorldToObjectMatrix(), appendResult63_g211 );
				float4 temp_cast_10 = (3.0).xxxx;
				float4 temp_output_4_0_g211 = pow( abs( temp_output_57_0_g211 ) , temp_cast_10 );
				float4 break6_g211 = temp_output_4_0_g211;
				float4 projNormal10_g211 = ( temp_output_4_0_g211 / ( break6_g211.x + break6_g211.y + break6_g211.z ) );
				float4 appendResult62_g211 = (float4(WorldPosition , 1.0));
				float4 break26_g211 = mul( GetWorldToObjectMatrix(), appendResult62_g211 );
				float2 appendResult27_g211 = (float2(break26_g211.z , break26_g211.y));
				float4 nSign18_g211 = sign( temp_output_57_0_g211 );
				float4 break20_g211 = nSign18_g211;
				float2 appendResult21_g211 = (float2(break20_g211.x , 1.0));
				float temp_output_29_0_g211 = _LightingMaskATiling;
				float mulTime7_g207 = _TimeParameters.x * _LightingMaskAUVSpeed;
				float2 temp_cast_11 = (mulTime7_g207).xx;
				float2 temp_output_65_0_g211 = temp_cast_11;
				float2 appendResult32_g211 = (float2(break26_g211.x , break26_g211.z));
				float2 appendResult22_g211 = (float2(break20_g211.y , 1.0));
				float2 appendResult34_g211 = (float2(break26_g211.x , break26_g211.y));
				float2 appendResult25_g211 = (float2(-break20_g211.z , 1.0));
				float3 tanNormal51_g208 = float3(0,0,1);
				float3 worldNormal51_g208 = float3(dot(tanToWorld0,tanNormal51_g208), dot(tanToWorld1,tanNormal51_g208), dot(tanToWorld2,tanNormal51_g208));
				float4 appendResult63_g208 = (float4(worldNormal51_g208 , 0.0));
				float4 temp_output_57_0_g208 = mul( GetWorldToObjectMatrix(), appendResult63_g208 );
				float4 temp_cast_12 = (3.0).xxxx;
				float4 temp_output_4_0_g208 = pow( abs( temp_output_57_0_g208 ) , temp_cast_12 );
				float4 break6_g208 = temp_output_4_0_g208;
				float4 projNormal10_g208 = ( temp_output_4_0_g208 / ( break6_g208.x + break6_g208.y + break6_g208.z ) );
				float4 appendResult62_g208 = (float4(WorldPosition , 1.0));
				float4 break26_g208 = mul( GetWorldToObjectMatrix(), appendResult62_g208 );
				float2 appendResult27_g208 = (float2(break26_g208.z , break26_g208.y));
				float4 nSign18_g208 = sign( temp_output_57_0_g208 );
				float4 break20_g208 = nSign18_g208;
				float2 appendResult21_g208 = (float2(break20_g208.x , 1.0));
				float temp_output_29_0_g208 = _LightingMaskBTiling;
				float mulTime10_g207 = _TimeParameters.x * _LightingMaskBUVSpeed;
				float2 temp_cast_13 = (mulTime10_g207).xx;
				float2 temp_output_65_0_g208 = temp_cast_13;
				float2 appendResult32_g208 = (float2(break26_g208.x , break26_g208.z));
				float2 appendResult22_g208 = (float2(break20_g208.y , 1.0));
				float2 appendResult34_g208 = (float2(break26_g208.x , break26_g208.y));
				float2 appendResult25_g208 = (float2(-break20_g208.z , 1.0));
				float4 lightningMask14_g207 = ( saturate( ( ( projNormal10_g211.x * tex2D( _LightingMaskMap, ( ( appendResult27_g211 * appendResult21_g211 * temp_output_29_0_g211 ) + temp_output_65_0_g211 ) ) ) + ( projNormal10_g211.y * tex2D( _LightingMaskMap, ( ( temp_output_29_0_g211 * appendResult32_g211 * appendResult22_g211 ) + temp_output_65_0_g211 ) ) ) + ( projNormal10_g211.z * tex2D( _LightingMaskMap, ( temp_output_65_0_g211 + ( temp_output_29_0_g211 * appendResult34_g211 * appendResult25_g211 ) ) ) ) ) ) * saturate( ( ( projNormal10_g208.x * tex2D( _LightingMaskMap, ( ( appendResult27_g208 * appendResult21_g208 * temp_output_29_0_g208 ) + temp_output_65_0_g208 ) ) ) + ( projNormal10_g208.y * tex2D( _LightingMaskMap, ( ( temp_output_29_0_g208 * appendResult32_g208 * appendResult22_g208 ) + temp_output_65_0_g208 ) ) ) + ( projNormal10_g208.z * tex2D( _LightingMaskMap, ( temp_output_65_0_g208 + ( temp_output_29_0_g208 * appendResult34_g208 * appendResult25_g208 ) ) ) ) ) ) );
				float4 temp_cast_14 = (_LigntingMaskPow).xxxx;
				float4 lightningMaskSine39_g207 = saturate( pow( max( float4( 0,0,0,0 ) , ( _LightningSineMult * sine32_g207 * lightningMask14_g207 ) ) , temp_cast_14 ) );
				float3 tanNormal51_g210 = float3(0,0,1);
				float3 worldNormal51_g210 = float3(dot(tanToWorld0,tanNormal51_g210), dot(tanToWorld1,tanNormal51_g210), dot(tanToWorld2,tanNormal51_g210));
				float4 appendResult63_g210 = (float4(worldNormal51_g210 , 0.0));
				float4 temp_output_57_0_g210 = mul( GetWorldToObjectMatrix(), appendResult63_g210 );
				float4 temp_cast_15 = (3.0).xxxx;
				float4 temp_output_4_0_g210 = pow( abs( temp_output_57_0_g210 ) , temp_cast_15 );
				float4 break6_g210 = temp_output_4_0_g210;
				float4 projNormal10_g210 = ( temp_output_4_0_g210 / ( break6_g210.x + break6_g210.y + break6_g210.z ) );
				float4 appendResult62_g210 = (float4(WorldPosition , 1.0));
				float4 break26_g210 = mul( GetWorldToObjectMatrix(), appendResult62_g210 );
				float2 appendResult27_g210 = (float2(break26_g210.z , break26_g210.y));
				float4 nSign18_g210 = sign( temp_output_57_0_g210 );
				float4 break20_g210 = nSign18_g210;
				float2 appendResult21_g210 = (float2(break20_g210.x , 1.0));
				float temp_output_29_0_g210 = _LightingATiling;
				float mulTime45_g207 = _TimeParameters.x * _LightingAFrequency;
				float2 temp_cast_16 = (( floor( mulTime45_g207 ) * 1.0 )).xx;
				float2 temp_output_65_0_g210 = temp_cast_16;
				float2 appendResult32_g210 = (float2(break26_g210.x , break26_g210.z));
				float2 appendResult22_g210 = (float2(break20_g210.y , 1.0));
				float2 appendResult34_g210 = (float2(break26_g210.x , break26_g210.y));
				float2 appendResult25_g210 = (float2(-break20_g210.z , 1.0));
				float3 tanNormal51_g209 = float3(0,0,1);
				float3 worldNormal51_g209 = float3(dot(tanToWorld0,tanNormal51_g209), dot(tanToWorld1,tanNormal51_g209), dot(tanToWorld2,tanNormal51_g209));
				float4 appendResult63_g209 = (float4(worldNormal51_g209 , 0.0));
				float4 temp_output_57_0_g209 = mul( GetWorldToObjectMatrix(), appendResult63_g209 );
				float4 temp_cast_17 = (3.0).xxxx;
				float4 temp_output_4_0_g209 = pow( abs( temp_output_57_0_g209 ) , temp_cast_17 );
				float4 break6_g209 = temp_output_4_0_g209;
				float4 projNormal10_g209 = ( temp_output_4_0_g209 / ( break6_g209.x + break6_g209.y + break6_g209.z ) );
				float4 appendResult62_g209 = (float4(WorldPosition , 1.0));
				float4 break26_g209 = mul( GetWorldToObjectMatrix(), appendResult62_g209 );
				float2 appendResult27_g209 = (float2(break26_g209.z , break26_g209.y));
				float4 nSign18_g209 = sign( temp_output_57_0_g209 );
				float4 break20_g209 = nSign18_g209;
				float2 appendResult21_g209 = (float2(break20_g209.x , 1.0));
				float temp_output_29_0_g209 = _LightingBTiling;
				float mulTime46_g207 = _TimeParameters.x * _LightingBFrequency;
				float2 temp_cast_18 = (( 1.0 * floor( mulTime46_g207 ) )).xx;
				float2 temp_output_65_0_g209 = temp_cast_18;
				float2 appendResult32_g209 = (float2(break26_g209.x , break26_g209.z));
				float2 appendResult22_g209 = (float2(break20_g209.y , 1.0));
				float2 appendResult34_g209 = (float2(break26_g209.x , break26_g209.y));
				float2 appendResult25_g209 = (float2(-break20_g209.z , 1.0));
				float lightning50_g207 = ( saturate( ( ( projNormal10_g210.x * tex2D( _LightingMap, ( ( appendResult27_g210 * appendResult21_g210 * temp_output_29_0_g210 ) + temp_output_65_0_g210 ) ) ) + ( projNormal10_g210.y * tex2D( _LightingMap, ( ( temp_output_29_0_g210 * appendResult32_g210 * appendResult22_g210 ) + temp_output_65_0_g210 ) ) ) + ( projNormal10_g210.z * tex2D( _LightingMap, ( temp_output_65_0_g210 + ( temp_output_29_0_g210 * appendResult34_g210 * appendResult25_g210 ) ) ) ) ) ) * saturate( ( ( projNormal10_g209.x * tex2D( _LightingMap, ( ( appendResult27_g209 * appendResult21_g209 * temp_output_29_0_g209 ) + temp_output_65_0_g209 ) ) ) + ( projNormal10_g209.y * tex2D( _LightingMap, ( ( temp_output_29_0_g209 * appendResult32_g209 * appendResult22_g209 ) + temp_output_65_0_g209 ) ) ) + ( projNormal10_g209.z * tex2D( _LightingMap, ( temp_output_65_0_g209 + ( temp_output_29_0_g209 * appendResult34_g209 * appendResult25_g209 ) ) ) ) ) ) * _LightningBoost ).r;
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g214 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g212 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) + saturate( lerpResult5 ) ) ).rgb;
				float3 Normal = normalUnpacked24;
				float3 Emission = max( temp_cast_9 , ( lightningMaskSine39_g207 * lightning50_g207 * _LightningColor ) ).rgb;
				float3 Specular = ( _SpecularColor * temp_output_9_0 * _Specular ).rgb;
				float Metallic = 0;
				float Smoothness = _Smoothness;
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
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140008


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
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				

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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

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

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
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
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
			sampler2D _NormalMap;
			sampler2D _DistortionMap;
			sampler2D _DistortionUVMap;
			sampler2D _LightingMaskMap;
			sampler2D _LightingMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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
				
				o.ase_normal = v.ase_normal;
				
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

				float4 transform4_g213 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g213 = normalize( transform4_g213 );
				float3 temp_output_1_0_g214 = normalizeResult6_g213.xyz;
				float3 normalizeResult7_g213 = normalize( _MainLightPosition.xyz );
				float dotResult4_g214 = dot( temp_output_1_0_g214 , normalizeResult7_g213 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult8_g213 = normalize( ase_worldViewDir );
				float dotResult7_g214 = dot( temp_output_1_0_g214 , normalizeResult8_g213 );
				float2 appendResult10_g214 = (float2(( ( dotResult4_g214 / 2.0 ) + 0.5 ) , dotResult7_g214));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 tanNormal51_g217 = float3(0,0,1);
				float3 worldNormal51_g217 = float3(dot(tanToWorld0,tanNormal51_g217), dot(tanToWorld1,tanNormal51_g217), dot(tanToWorld2,tanNormal51_g217));
				float4 appendResult63_g217 = (float4(worldNormal51_g217 , 0.0));
				float4 temp_output_57_0_g217 = mul( GetWorldToObjectMatrix(), appendResult63_g217 );
				float4 temp_cast_2 = (5.0).xxxx;
				float4 temp_output_4_0_g217 = pow( abs( temp_output_57_0_g217 ) , temp_cast_2 );
				float4 break6_g217 = temp_output_4_0_g217;
				float4 projNormal10_g217 = ( temp_output_4_0_g217 / ( break6_g217.x + break6_g217.y + break6_g217.z ) );
				float4 appendResult62_g217 = (float4(WorldPosition , 1.0));
				float4 break26_g217 = mul( GetWorldToObjectMatrix(), appendResult62_g217 );
				float2 appendResult27_g217 = (float2(break26_g217.z , break26_g217.y));
				float4 nSign18_g217 = sign( temp_output_57_0_g217 );
				float4 break20_g217 = nSign18_g217;
				float2 appendResult21_g217 = (float2(break20_g217.x , 1.0));
				float temp_output_29_0_g217 = _NormalTiling;
				float temp_output_10_0_g215 = ( _TimeParameters.x * _NormalSpeed );
				float2 appendResult12_g215 = (float2(temp_output_10_0_g215 , temp_output_10_0_g215));
				float3 tanNormal51_g216 = float3(0,0,1);
				float3 worldNormal51_g216 = float3(dot(tanToWorld0,tanNormal51_g216), dot(tanToWorld1,tanNormal51_g216), dot(tanToWorld2,tanNormal51_g216));
				float4 appendResult63_g216 = (float4(worldNormal51_g216 , 0.0));
				float4 temp_output_57_0_g216 = mul( GetWorldToObjectMatrix(), appendResult63_g216 );
				float4 temp_cast_3 = (5.0).xxxx;
				float4 temp_output_4_0_g216 = pow( abs( temp_output_57_0_g216 ) , temp_cast_3 );
				float4 break6_g216 = temp_output_4_0_g216;
				float4 projNormal10_g216 = ( temp_output_4_0_g216 / ( break6_g216.x + break6_g216.y + break6_g216.z ) );
				float4 appendResult62_g216 = (float4(WorldPosition , 1.0));
				float4 break26_g216 = mul( GetWorldToObjectMatrix(), appendResult62_g216 );
				float2 appendResult27_g216 = (float2(break26_g216.z , break26_g216.y));
				float4 nSign18_g216 = sign( temp_output_57_0_g216 );
				float4 break20_g216 = nSign18_g216;
				float2 appendResult21_g216 = (float2(break20_g216.x , 1.0));
				float temp_output_29_0_g216 = _NormalUVTiling;
				float temp_output_2_0_g215 = ( _TimeParameters.x * _NormalUVSpeed );
				float2 appendResult5_g215 = (float2(temp_output_2_0_g215 , temp_output_2_0_g215));
				float2 temp_output_65_0_g216 = appendResult5_g215;
				float2 appendResult32_g216 = (float2(break26_g216.x , break26_g216.z));
				float2 appendResult22_g216 = (float2(break20_g216.y , 1.0));
				float2 appendResult34_g216 = (float2(break26_g216.x , break26_g216.y));
				float2 appendResult25_g216 = (float2(-break20_g216.z , 1.0));
				float4 break11_g215 = ( saturate( ( ( projNormal10_g216.x * tex2D( _NormalMap, ( ( appendResult27_g216 * appendResult21_g216 * temp_output_29_0_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.y * tex2D( _NormalMap, ( ( temp_output_29_0_g216 * appendResult32_g216 * appendResult22_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.z * tex2D( _NormalMap, ( temp_output_65_0_g216 + ( temp_output_29_0_g216 * appendResult34_g216 * appendResult25_g216 ) ) ) ) ) ) * _NormlalDistortionFactor );
				float2 appendResult13_g215 = (float2(break11_g215.r , break11_g215.g));
				float2 temp_output_65_0_g217 = ( appendResult12_g215 + appendResult13_g215 );
				float2 appendResult32_g217 = (float2(break26_g217.x , break26_g217.z));
				float2 appendResult22_g217 = (float2(break20_g217.y , 1.0));
				float2 appendResult34_g217 = (float2(break26_g217.x , break26_g217.y));
				float2 appendResult25_g217 = (float2(-break20_g217.z , 1.0));
				float3 unpack18_g215 = UnpackNormalScale( saturate( ( ( projNormal10_g217.x * tex2D( _NormalMap, ( ( appendResult27_g217 * appendResult21_g217 * temp_output_29_0_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.y * tex2D( _NormalMap, ( ( temp_output_29_0_g217 * appendResult32_g217 * appendResult22_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.z * tex2D( _NormalMap, ( temp_output_65_0_g217 + ( temp_output_29_0_g217 * appendResult34_g217 * appendResult25_g217 ) ) ) ) ) ), _NormalScale );
				unpack18_g215.z = lerp( 1, unpack18_g215.z, saturate(_NormalScale) );
				float3 normalUnpacked24 = unpack18_g215;
				float3 normalizeResult5_g212 = normalize( normalUnpacked24 );
				float dotResult14_g212 = dot( ase_tanViewDir , normalizeResult5_g212 );
				float3 tanNormal51_g174 = float3(0,0,1);
				float3 worldNormal51_g174 = float3(dot(tanToWorld0,tanNormal51_g174), dot(tanToWorld1,tanNormal51_g174), dot(tanToWorld2,tanNormal51_g174));
				float4 appendResult63_g174 = (float4(worldNormal51_g174 , 0.0));
				float4 temp_output_57_0_g174 = mul( GetWorldToObjectMatrix(), appendResult63_g174 );
				float4 temp_cast_5 = (5.0).xxxx;
				float4 temp_output_4_0_g174 = pow( abs( temp_output_57_0_g174 ) , temp_cast_5 );
				float4 break6_g174 = temp_output_4_0_g174;
				float4 projNormal10_g174 = ( temp_output_4_0_g174 / ( break6_g174.x + break6_g174.y + break6_g174.z ) );
				float4 appendResult62_g174 = (float4(WorldPosition , 1.0));
				float4 break26_g174 = mul( GetWorldToObjectMatrix(), appendResult62_g174 );
				float2 appendResult27_g174 = (float2(break26_g174.z , break26_g174.y));
				float4 nSign18_g174 = sign( temp_output_57_0_g174 );
				float4 break20_g174 = nSign18_g174;
				float2 appendResult21_g174 = (float2(break20_g174.x , 1.0));
				float temp_output_29_0_g174 = _DistortionTiling;
				float temp_output_10_0_g173 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g173 = (float2(temp_output_10_0_g173 , temp_output_10_0_g173));
				float3 tanNormal51_g175 = float3(0,0,1);
				float3 worldNormal51_g175 = float3(dot(tanToWorld0,tanNormal51_g175), dot(tanToWorld1,tanNormal51_g175), dot(tanToWorld2,tanNormal51_g175));
				float4 appendResult63_g175 = (float4(worldNormal51_g175 , 0.0));
				float4 temp_output_57_0_g175 = mul( GetWorldToObjectMatrix(), appendResult63_g175 );
				float4 temp_cast_6 = (5.0).xxxx;
				float4 temp_output_4_0_g175 = pow( abs( temp_output_57_0_g175 ) , temp_cast_6 );
				float4 break6_g175 = temp_output_4_0_g175;
				float4 projNormal10_g175 = ( temp_output_4_0_g175 / ( break6_g175.x + break6_g175.y + break6_g175.z ) );
				float4 appendResult62_g175 = (float4(WorldPosition , 1.0));
				float4 break26_g175 = mul( GetWorldToObjectMatrix(), appendResult62_g175 );
				float2 appendResult27_g175 = (float2(break26_g175.z , break26_g175.y));
				float4 nSign18_g175 = sign( temp_output_57_0_g175 );
				float4 break20_g175 = nSign18_g175;
				float2 appendResult21_g175 = (float2(break20_g175.x , 1.0));
				float temp_output_29_0_g175 = _DistortionUVTiling;
				float temp_output_2_0_g173 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g173 = (float2(temp_output_2_0_g173 , temp_output_2_0_g173));
				float2 temp_output_65_0_g175 = appendResult5_g173;
				float2 appendResult32_g175 = (float2(break26_g175.x , break26_g175.z));
				float2 appendResult22_g175 = (float2(break20_g175.y , 1.0));
				float2 appendResult34_g175 = (float2(break26_g175.x , break26_g175.y));
				float2 appendResult25_g175 = (float2(-break20_g175.z , 1.0));
				float4 break11_g173 = ( saturate( ( ( projNormal10_g175.x * tex2D( _DistortionUVMap, ( ( appendResult27_g175 * appendResult21_g175 * temp_output_29_0_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.y * tex2D( _DistortionUVMap, ( ( temp_output_29_0_g175 * appendResult32_g175 * appendResult22_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.z * tex2D( _DistortionUVMap, ( temp_output_65_0_g175 + ( temp_output_29_0_g175 * appendResult34_g175 * appendResult25_g175 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g173 = (float2(break11_g173.r , break11_g173.g));
				float2 temp_output_65_0_g174 = ( appendResult12_g173 + appendResult13_g173 );
				float2 appendResult32_g174 = (float2(break26_g174.x , break26_g174.z));
				float2 appendResult22_g174 = (float2(break20_g174.y , 1.0));
				float2 appendResult34_g174 = (float2(break26_g174.x , break26_g174.y));
				float2 appendResult25_g174 = (float2(-break20_g174.z , 1.0));
				float4 temp_cast_7 = (_DetailPow).xxxx;
				float4 temp_output_9_0 = saturate( ( pow( max( float4( 0,0,0,0 ) , saturate( ( ( projNormal10_g174.x * tex2D( _DistortionMap, ( ( appendResult27_g174 * appendResult21_g174 * temp_output_29_0_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g174 * appendResult32_g174 * appendResult22_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.z * tex2D( _DistortionMap, ( temp_output_65_0_g174 + ( temp_output_29_0_g174 * appendResult34_g174 * appendResult25_g174 ) ) ) ) ) ) ) , temp_cast_7 ) * _DetailBoost ) );
				float4 lerpResult5 = lerp( _TintLow , _TintHigh , temp_output_9_0.r);
				
				float4 temp_cast_9 = (0.0).xxxx;
				float clampResult20_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 2.0 * PI ) ) ) , 0.3 , 1.0 );
				float clampResult29_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 5.0 * PI ) ) ) , 0.5 , 1.0 );
				float clampResult30_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 10.0 * PI ) ) ) , 0.7 , 1.0 );
				float sine32_g207 = ( clampResult20_g207 * clampResult29_g207 * clampResult30_g207 );
				float3 tanNormal51_g211 = float3(0,0,1);
				float3 worldNormal51_g211 = float3(dot(tanToWorld0,tanNormal51_g211), dot(tanToWorld1,tanNormal51_g211), dot(tanToWorld2,tanNormal51_g211));
				float4 appendResult63_g211 = (float4(worldNormal51_g211 , 0.0));
				float4 temp_output_57_0_g211 = mul( GetWorldToObjectMatrix(), appendResult63_g211 );
				float4 temp_cast_10 = (3.0).xxxx;
				float4 temp_output_4_0_g211 = pow( abs( temp_output_57_0_g211 ) , temp_cast_10 );
				float4 break6_g211 = temp_output_4_0_g211;
				float4 projNormal10_g211 = ( temp_output_4_0_g211 / ( break6_g211.x + break6_g211.y + break6_g211.z ) );
				float4 appendResult62_g211 = (float4(WorldPosition , 1.0));
				float4 break26_g211 = mul( GetWorldToObjectMatrix(), appendResult62_g211 );
				float2 appendResult27_g211 = (float2(break26_g211.z , break26_g211.y));
				float4 nSign18_g211 = sign( temp_output_57_0_g211 );
				float4 break20_g211 = nSign18_g211;
				float2 appendResult21_g211 = (float2(break20_g211.x , 1.0));
				float temp_output_29_0_g211 = _LightingMaskATiling;
				float mulTime7_g207 = _TimeParameters.x * _LightingMaskAUVSpeed;
				float2 temp_cast_11 = (mulTime7_g207).xx;
				float2 temp_output_65_0_g211 = temp_cast_11;
				float2 appendResult32_g211 = (float2(break26_g211.x , break26_g211.z));
				float2 appendResult22_g211 = (float2(break20_g211.y , 1.0));
				float2 appendResult34_g211 = (float2(break26_g211.x , break26_g211.y));
				float2 appendResult25_g211 = (float2(-break20_g211.z , 1.0));
				float3 tanNormal51_g208 = float3(0,0,1);
				float3 worldNormal51_g208 = float3(dot(tanToWorld0,tanNormal51_g208), dot(tanToWorld1,tanNormal51_g208), dot(tanToWorld2,tanNormal51_g208));
				float4 appendResult63_g208 = (float4(worldNormal51_g208 , 0.0));
				float4 temp_output_57_0_g208 = mul( GetWorldToObjectMatrix(), appendResult63_g208 );
				float4 temp_cast_12 = (3.0).xxxx;
				float4 temp_output_4_0_g208 = pow( abs( temp_output_57_0_g208 ) , temp_cast_12 );
				float4 break6_g208 = temp_output_4_0_g208;
				float4 projNormal10_g208 = ( temp_output_4_0_g208 / ( break6_g208.x + break6_g208.y + break6_g208.z ) );
				float4 appendResult62_g208 = (float4(WorldPosition , 1.0));
				float4 break26_g208 = mul( GetWorldToObjectMatrix(), appendResult62_g208 );
				float2 appendResult27_g208 = (float2(break26_g208.z , break26_g208.y));
				float4 nSign18_g208 = sign( temp_output_57_0_g208 );
				float4 break20_g208 = nSign18_g208;
				float2 appendResult21_g208 = (float2(break20_g208.x , 1.0));
				float temp_output_29_0_g208 = _LightingMaskBTiling;
				float mulTime10_g207 = _TimeParameters.x * _LightingMaskBUVSpeed;
				float2 temp_cast_13 = (mulTime10_g207).xx;
				float2 temp_output_65_0_g208 = temp_cast_13;
				float2 appendResult32_g208 = (float2(break26_g208.x , break26_g208.z));
				float2 appendResult22_g208 = (float2(break20_g208.y , 1.0));
				float2 appendResult34_g208 = (float2(break26_g208.x , break26_g208.y));
				float2 appendResult25_g208 = (float2(-break20_g208.z , 1.0));
				float4 lightningMask14_g207 = ( saturate( ( ( projNormal10_g211.x * tex2D( _LightingMaskMap, ( ( appendResult27_g211 * appendResult21_g211 * temp_output_29_0_g211 ) + temp_output_65_0_g211 ) ) ) + ( projNormal10_g211.y * tex2D( _LightingMaskMap, ( ( temp_output_29_0_g211 * appendResult32_g211 * appendResult22_g211 ) + temp_output_65_0_g211 ) ) ) + ( projNormal10_g211.z * tex2D( _LightingMaskMap, ( temp_output_65_0_g211 + ( temp_output_29_0_g211 * appendResult34_g211 * appendResult25_g211 ) ) ) ) ) ) * saturate( ( ( projNormal10_g208.x * tex2D( _LightingMaskMap, ( ( appendResult27_g208 * appendResult21_g208 * temp_output_29_0_g208 ) + temp_output_65_0_g208 ) ) ) + ( projNormal10_g208.y * tex2D( _LightingMaskMap, ( ( temp_output_29_0_g208 * appendResult32_g208 * appendResult22_g208 ) + temp_output_65_0_g208 ) ) ) + ( projNormal10_g208.z * tex2D( _LightingMaskMap, ( temp_output_65_0_g208 + ( temp_output_29_0_g208 * appendResult34_g208 * appendResult25_g208 ) ) ) ) ) ) );
				float4 temp_cast_14 = (_LigntingMaskPow).xxxx;
				float4 lightningMaskSine39_g207 = saturate( pow( max( float4( 0,0,0,0 ) , ( _LightningSineMult * sine32_g207 * lightningMask14_g207 ) ) , temp_cast_14 ) );
				float3 tanNormal51_g210 = float3(0,0,1);
				float3 worldNormal51_g210 = float3(dot(tanToWorld0,tanNormal51_g210), dot(tanToWorld1,tanNormal51_g210), dot(tanToWorld2,tanNormal51_g210));
				float4 appendResult63_g210 = (float4(worldNormal51_g210 , 0.0));
				float4 temp_output_57_0_g210 = mul( GetWorldToObjectMatrix(), appendResult63_g210 );
				float4 temp_cast_15 = (3.0).xxxx;
				float4 temp_output_4_0_g210 = pow( abs( temp_output_57_0_g210 ) , temp_cast_15 );
				float4 break6_g210 = temp_output_4_0_g210;
				float4 projNormal10_g210 = ( temp_output_4_0_g210 / ( break6_g210.x + break6_g210.y + break6_g210.z ) );
				float4 appendResult62_g210 = (float4(WorldPosition , 1.0));
				float4 break26_g210 = mul( GetWorldToObjectMatrix(), appendResult62_g210 );
				float2 appendResult27_g210 = (float2(break26_g210.z , break26_g210.y));
				float4 nSign18_g210 = sign( temp_output_57_0_g210 );
				float4 break20_g210 = nSign18_g210;
				float2 appendResult21_g210 = (float2(break20_g210.x , 1.0));
				float temp_output_29_0_g210 = _LightingATiling;
				float mulTime45_g207 = _TimeParameters.x * _LightingAFrequency;
				float2 temp_cast_16 = (( floor( mulTime45_g207 ) * 1.0 )).xx;
				float2 temp_output_65_0_g210 = temp_cast_16;
				float2 appendResult32_g210 = (float2(break26_g210.x , break26_g210.z));
				float2 appendResult22_g210 = (float2(break20_g210.y , 1.0));
				float2 appendResult34_g210 = (float2(break26_g210.x , break26_g210.y));
				float2 appendResult25_g210 = (float2(-break20_g210.z , 1.0));
				float3 tanNormal51_g209 = float3(0,0,1);
				float3 worldNormal51_g209 = float3(dot(tanToWorld0,tanNormal51_g209), dot(tanToWorld1,tanNormal51_g209), dot(tanToWorld2,tanNormal51_g209));
				float4 appendResult63_g209 = (float4(worldNormal51_g209 , 0.0));
				float4 temp_output_57_0_g209 = mul( GetWorldToObjectMatrix(), appendResult63_g209 );
				float4 temp_cast_17 = (3.0).xxxx;
				float4 temp_output_4_0_g209 = pow( abs( temp_output_57_0_g209 ) , temp_cast_17 );
				float4 break6_g209 = temp_output_4_0_g209;
				float4 projNormal10_g209 = ( temp_output_4_0_g209 / ( break6_g209.x + break6_g209.y + break6_g209.z ) );
				float4 appendResult62_g209 = (float4(WorldPosition , 1.0));
				float4 break26_g209 = mul( GetWorldToObjectMatrix(), appendResult62_g209 );
				float2 appendResult27_g209 = (float2(break26_g209.z , break26_g209.y));
				float4 nSign18_g209 = sign( temp_output_57_0_g209 );
				float4 break20_g209 = nSign18_g209;
				float2 appendResult21_g209 = (float2(break20_g209.x , 1.0));
				float temp_output_29_0_g209 = _LightingBTiling;
				float mulTime46_g207 = _TimeParameters.x * _LightingBFrequency;
				float2 temp_cast_18 = (( 1.0 * floor( mulTime46_g207 ) )).xx;
				float2 temp_output_65_0_g209 = temp_cast_18;
				float2 appendResult32_g209 = (float2(break26_g209.x , break26_g209.z));
				float2 appendResult22_g209 = (float2(break20_g209.y , 1.0));
				float2 appendResult34_g209 = (float2(break26_g209.x , break26_g209.y));
				float2 appendResult25_g209 = (float2(-break20_g209.z , 1.0));
				float lightning50_g207 = ( saturate( ( ( projNormal10_g210.x * tex2D( _LightingMap, ( ( appendResult27_g210 * appendResult21_g210 * temp_output_29_0_g210 ) + temp_output_65_0_g210 ) ) ) + ( projNormal10_g210.y * tex2D( _LightingMap, ( ( temp_output_29_0_g210 * appendResult32_g210 * appendResult22_g210 ) + temp_output_65_0_g210 ) ) ) + ( projNormal10_g210.z * tex2D( _LightingMap, ( temp_output_65_0_g210 + ( temp_output_29_0_g210 * appendResult34_g210 * appendResult25_g210 ) ) ) ) ) ) * saturate( ( ( projNormal10_g209.x * tex2D( _LightingMap, ( ( appendResult27_g209 * appendResult21_g209 * temp_output_29_0_g209 ) + temp_output_65_0_g209 ) ) ) + ( projNormal10_g209.y * tex2D( _LightingMap, ( ( temp_output_29_0_g209 * appendResult32_g209 * appendResult22_g209 ) + temp_output_65_0_g209 ) ) ) + ( projNormal10_g209.z * tex2D( _LightingMap, ( temp_output_65_0_g209 + ( temp_output_29_0_g209 * appendResult34_g209 * appendResult25_g209 ) ) ) ) ) ) * _LightningBoost ).r;
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g214 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g212 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) + saturate( lerpResult5 ) ) ).rgb;
				float3 Emission = max( temp_cast_9 , ( lightningMaskSine39_g207 * lightning50_g207 * _LightningColor ) ).rgb;
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


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
			sampler2D _NormalMap;
			sampler2D _DistortionMap;
			sampler2D _DistortionUVMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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
				
				o.ase_normal = v.ase_normal;
				
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

				float4 transform4_g213 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g213 = normalize( transform4_g213 );
				float3 temp_output_1_0_g214 = normalizeResult6_g213.xyz;
				float3 normalizeResult7_g213 = normalize( _MainLightPosition.xyz );
				float dotResult4_g214 = dot( temp_output_1_0_g214 , normalizeResult7_g213 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult8_g213 = normalize( ase_worldViewDir );
				float dotResult7_g214 = dot( temp_output_1_0_g214 , normalizeResult8_g213 );
				float2 appendResult10_g214 = (float2(( ( dotResult4_g214 / 2.0 ) + 0.5 ) , dotResult7_g214));
				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 tanNormal51_g217 = float3(0,0,1);
				float3 worldNormal51_g217 = float3(dot(tanToWorld0,tanNormal51_g217), dot(tanToWorld1,tanNormal51_g217), dot(tanToWorld2,tanNormal51_g217));
				float4 appendResult63_g217 = (float4(worldNormal51_g217 , 0.0));
				float4 temp_output_57_0_g217 = mul( GetWorldToObjectMatrix(), appendResult63_g217 );
				float4 temp_cast_2 = (5.0).xxxx;
				float4 temp_output_4_0_g217 = pow( abs( temp_output_57_0_g217 ) , temp_cast_2 );
				float4 break6_g217 = temp_output_4_0_g217;
				float4 projNormal10_g217 = ( temp_output_4_0_g217 / ( break6_g217.x + break6_g217.y + break6_g217.z ) );
				float4 appendResult62_g217 = (float4(WorldPosition , 1.0));
				float4 break26_g217 = mul( GetWorldToObjectMatrix(), appendResult62_g217 );
				float2 appendResult27_g217 = (float2(break26_g217.z , break26_g217.y));
				float4 nSign18_g217 = sign( temp_output_57_0_g217 );
				float4 break20_g217 = nSign18_g217;
				float2 appendResult21_g217 = (float2(break20_g217.x , 1.0));
				float temp_output_29_0_g217 = _NormalTiling;
				float temp_output_10_0_g215 = ( _TimeParameters.x * _NormalSpeed );
				float2 appendResult12_g215 = (float2(temp_output_10_0_g215 , temp_output_10_0_g215));
				float3 tanNormal51_g216 = float3(0,0,1);
				float3 worldNormal51_g216 = float3(dot(tanToWorld0,tanNormal51_g216), dot(tanToWorld1,tanNormal51_g216), dot(tanToWorld2,tanNormal51_g216));
				float4 appendResult63_g216 = (float4(worldNormal51_g216 , 0.0));
				float4 temp_output_57_0_g216 = mul( GetWorldToObjectMatrix(), appendResult63_g216 );
				float4 temp_cast_3 = (5.0).xxxx;
				float4 temp_output_4_0_g216 = pow( abs( temp_output_57_0_g216 ) , temp_cast_3 );
				float4 break6_g216 = temp_output_4_0_g216;
				float4 projNormal10_g216 = ( temp_output_4_0_g216 / ( break6_g216.x + break6_g216.y + break6_g216.z ) );
				float4 appendResult62_g216 = (float4(WorldPosition , 1.0));
				float4 break26_g216 = mul( GetWorldToObjectMatrix(), appendResult62_g216 );
				float2 appendResult27_g216 = (float2(break26_g216.z , break26_g216.y));
				float4 nSign18_g216 = sign( temp_output_57_0_g216 );
				float4 break20_g216 = nSign18_g216;
				float2 appendResult21_g216 = (float2(break20_g216.x , 1.0));
				float temp_output_29_0_g216 = _NormalUVTiling;
				float temp_output_2_0_g215 = ( _TimeParameters.x * _NormalUVSpeed );
				float2 appendResult5_g215 = (float2(temp_output_2_0_g215 , temp_output_2_0_g215));
				float2 temp_output_65_0_g216 = appendResult5_g215;
				float2 appendResult32_g216 = (float2(break26_g216.x , break26_g216.z));
				float2 appendResult22_g216 = (float2(break20_g216.y , 1.0));
				float2 appendResult34_g216 = (float2(break26_g216.x , break26_g216.y));
				float2 appendResult25_g216 = (float2(-break20_g216.z , 1.0));
				float4 break11_g215 = ( saturate( ( ( projNormal10_g216.x * tex2D( _NormalMap, ( ( appendResult27_g216 * appendResult21_g216 * temp_output_29_0_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.y * tex2D( _NormalMap, ( ( temp_output_29_0_g216 * appendResult32_g216 * appendResult22_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.z * tex2D( _NormalMap, ( temp_output_65_0_g216 + ( temp_output_29_0_g216 * appendResult34_g216 * appendResult25_g216 ) ) ) ) ) ) * _NormlalDistortionFactor );
				float2 appendResult13_g215 = (float2(break11_g215.r , break11_g215.g));
				float2 temp_output_65_0_g217 = ( appendResult12_g215 + appendResult13_g215 );
				float2 appendResult32_g217 = (float2(break26_g217.x , break26_g217.z));
				float2 appendResult22_g217 = (float2(break20_g217.y , 1.0));
				float2 appendResult34_g217 = (float2(break26_g217.x , break26_g217.y));
				float2 appendResult25_g217 = (float2(-break20_g217.z , 1.0));
				float3 unpack18_g215 = UnpackNormalScale( saturate( ( ( projNormal10_g217.x * tex2D( _NormalMap, ( ( appendResult27_g217 * appendResult21_g217 * temp_output_29_0_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.y * tex2D( _NormalMap, ( ( temp_output_29_0_g217 * appendResult32_g217 * appendResult22_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.z * tex2D( _NormalMap, ( temp_output_65_0_g217 + ( temp_output_29_0_g217 * appendResult34_g217 * appendResult25_g217 ) ) ) ) ) ), _NormalScale );
				unpack18_g215.z = lerp( 1, unpack18_g215.z, saturate(_NormalScale) );
				float3 normalUnpacked24 = unpack18_g215;
				float3 normalizeResult5_g212 = normalize( normalUnpacked24 );
				float dotResult14_g212 = dot( ase_tanViewDir , normalizeResult5_g212 );
				float3 tanNormal51_g174 = float3(0,0,1);
				float3 worldNormal51_g174 = float3(dot(tanToWorld0,tanNormal51_g174), dot(tanToWorld1,tanNormal51_g174), dot(tanToWorld2,tanNormal51_g174));
				float4 appendResult63_g174 = (float4(worldNormal51_g174 , 0.0));
				float4 temp_output_57_0_g174 = mul( GetWorldToObjectMatrix(), appendResult63_g174 );
				float4 temp_cast_5 = (5.0).xxxx;
				float4 temp_output_4_0_g174 = pow( abs( temp_output_57_0_g174 ) , temp_cast_5 );
				float4 break6_g174 = temp_output_4_0_g174;
				float4 projNormal10_g174 = ( temp_output_4_0_g174 / ( break6_g174.x + break6_g174.y + break6_g174.z ) );
				float4 appendResult62_g174 = (float4(WorldPosition , 1.0));
				float4 break26_g174 = mul( GetWorldToObjectMatrix(), appendResult62_g174 );
				float2 appendResult27_g174 = (float2(break26_g174.z , break26_g174.y));
				float4 nSign18_g174 = sign( temp_output_57_0_g174 );
				float4 break20_g174 = nSign18_g174;
				float2 appendResult21_g174 = (float2(break20_g174.x , 1.0));
				float temp_output_29_0_g174 = _DistortionTiling;
				float temp_output_10_0_g173 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g173 = (float2(temp_output_10_0_g173 , temp_output_10_0_g173));
				float3 tanNormal51_g175 = float3(0,0,1);
				float3 worldNormal51_g175 = float3(dot(tanToWorld0,tanNormal51_g175), dot(tanToWorld1,tanNormal51_g175), dot(tanToWorld2,tanNormal51_g175));
				float4 appendResult63_g175 = (float4(worldNormal51_g175 , 0.0));
				float4 temp_output_57_0_g175 = mul( GetWorldToObjectMatrix(), appendResult63_g175 );
				float4 temp_cast_6 = (5.0).xxxx;
				float4 temp_output_4_0_g175 = pow( abs( temp_output_57_0_g175 ) , temp_cast_6 );
				float4 break6_g175 = temp_output_4_0_g175;
				float4 projNormal10_g175 = ( temp_output_4_0_g175 / ( break6_g175.x + break6_g175.y + break6_g175.z ) );
				float4 appendResult62_g175 = (float4(WorldPosition , 1.0));
				float4 break26_g175 = mul( GetWorldToObjectMatrix(), appendResult62_g175 );
				float2 appendResult27_g175 = (float2(break26_g175.z , break26_g175.y));
				float4 nSign18_g175 = sign( temp_output_57_0_g175 );
				float4 break20_g175 = nSign18_g175;
				float2 appendResult21_g175 = (float2(break20_g175.x , 1.0));
				float temp_output_29_0_g175 = _DistortionUVTiling;
				float temp_output_2_0_g173 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g173 = (float2(temp_output_2_0_g173 , temp_output_2_0_g173));
				float2 temp_output_65_0_g175 = appendResult5_g173;
				float2 appendResult32_g175 = (float2(break26_g175.x , break26_g175.z));
				float2 appendResult22_g175 = (float2(break20_g175.y , 1.0));
				float2 appendResult34_g175 = (float2(break26_g175.x , break26_g175.y));
				float2 appendResult25_g175 = (float2(-break20_g175.z , 1.0));
				float4 break11_g173 = ( saturate( ( ( projNormal10_g175.x * tex2D( _DistortionUVMap, ( ( appendResult27_g175 * appendResult21_g175 * temp_output_29_0_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.y * tex2D( _DistortionUVMap, ( ( temp_output_29_0_g175 * appendResult32_g175 * appendResult22_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.z * tex2D( _DistortionUVMap, ( temp_output_65_0_g175 + ( temp_output_29_0_g175 * appendResult34_g175 * appendResult25_g175 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g173 = (float2(break11_g173.r , break11_g173.g));
				float2 temp_output_65_0_g174 = ( appendResult12_g173 + appendResult13_g173 );
				float2 appendResult32_g174 = (float2(break26_g174.x , break26_g174.z));
				float2 appendResult22_g174 = (float2(break20_g174.y , 1.0));
				float2 appendResult34_g174 = (float2(break26_g174.x , break26_g174.y));
				float2 appendResult25_g174 = (float2(-break20_g174.z , 1.0));
				float4 temp_cast_7 = (_DetailPow).xxxx;
				float4 temp_output_9_0 = saturate( ( pow( max( float4( 0,0,0,0 ) , saturate( ( ( projNormal10_g174.x * tex2D( _DistortionMap, ( ( appendResult27_g174 * appendResult21_g174 * temp_output_29_0_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g174 * appendResult32_g174 * appendResult22_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.z * tex2D( _DistortionMap, ( temp_output_65_0_g174 + ( temp_output_29_0_g174 * appendResult34_g174 * appendResult25_g174 ) ) ) ) ) ) ) , temp_cast_7 ) * _DetailBoost ) );
				float4 lerpResult5 = lerp( _TintLow , _TintHigh , temp_output_9_0.r);
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g214 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g212 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) + saturate( lerpResult5 ) ) ).rgb;
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
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
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

			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
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
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
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

				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( WorldTangent.xyz.x, ase_worldBitangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.xyz.y, ase_worldBitangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.xyz.z, ase_worldBitangent.z, WorldNormal.z );
				float3 tanNormal51_g217 = float3(0,0,1);
				float3 worldNormal51_g217 = float3(dot(tanToWorld0,tanNormal51_g217), dot(tanToWorld1,tanNormal51_g217), dot(tanToWorld2,tanNormal51_g217));
				float4 appendResult63_g217 = (float4(worldNormal51_g217 , 0.0));
				float4 temp_output_57_0_g217 = mul( GetWorldToObjectMatrix(), appendResult63_g217 );
				float4 temp_cast_0 = (5.0).xxxx;
				float4 temp_output_4_0_g217 = pow( abs( temp_output_57_0_g217 ) , temp_cast_0 );
				float4 break6_g217 = temp_output_4_0_g217;
				float4 projNormal10_g217 = ( temp_output_4_0_g217 / ( break6_g217.x + break6_g217.y + break6_g217.z ) );
				float4 appendResult62_g217 = (float4(WorldPosition , 1.0));
				float4 break26_g217 = mul( GetWorldToObjectMatrix(), appendResult62_g217 );
				float2 appendResult27_g217 = (float2(break26_g217.z , break26_g217.y));
				float4 nSign18_g217 = sign( temp_output_57_0_g217 );
				float4 break20_g217 = nSign18_g217;
				float2 appendResult21_g217 = (float2(break20_g217.x , 1.0));
				float temp_output_29_0_g217 = _NormalTiling;
				float temp_output_10_0_g215 = ( _TimeParameters.x * _NormalSpeed );
				float2 appendResult12_g215 = (float2(temp_output_10_0_g215 , temp_output_10_0_g215));
				float3 tanNormal51_g216 = float3(0,0,1);
				float3 worldNormal51_g216 = float3(dot(tanToWorld0,tanNormal51_g216), dot(tanToWorld1,tanNormal51_g216), dot(tanToWorld2,tanNormal51_g216));
				float4 appendResult63_g216 = (float4(worldNormal51_g216 , 0.0));
				float4 temp_output_57_0_g216 = mul( GetWorldToObjectMatrix(), appendResult63_g216 );
				float4 temp_cast_1 = (5.0).xxxx;
				float4 temp_output_4_0_g216 = pow( abs( temp_output_57_0_g216 ) , temp_cast_1 );
				float4 break6_g216 = temp_output_4_0_g216;
				float4 projNormal10_g216 = ( temp_output_4_0_g216 / ( break6_g216.x + break6_g216.y + break6_g216.z ) );
				float4 appendResult62_g216 = (float4(WorldPosition , 1.0));
				float4 break26_g216 = mul( GetWorldToObjectMatrix(), appendResult62_g216 );
				float2 appendResult27_g216 = (float2(break26_g216.z , break26_g216.y));
				float4 nSign18_g216 = sign( temp_output_57_0_g216 );
				float4 break20_g216 = nSign18_g216;
				float2 appendResult21_g216 = (float2(break20_g216.x , 1.0));
				float temp_output_29_0_g216 = _NormalUVTiling;
				float temp_output_2_0_g215 = ( _TimeParameters.x * _NormalUVSpeed );
				float2 appendResult5_g215 = (float2(temp_output_2_0_g215 , temp_output_2_0_g215));
				float2 temp_output_65_0_g216 = appendResult5_g215;
				float2 appendResult32_g216 = (float2(break26_g216.x , break26_g216.z));
				float2 appendResult22_g216 = (float2(break20_g216.y , 1.0));
				float2 appendResult34_g216 = (float2(break26_g216.x , break26_g216.y));
				float2 appendResult25_g216 = (float2(-break20_g216.z , 1.0));
				float4 break11_g215 = ( saturate( ( ( projNormal10_g216.x * tex2D( _NormalMap, ( ( appendResult27_g216 * appendResult21_g216 * temp_output_29_0_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.y * tex2D( _NormalMap, ( ( temp_output_29_0_g216 * appendResult32_g216 * appendResult22_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.z * tex2D( _NormalMap, ( temp_output_65_0_g216 + ( temp_output_29_0_g216 * appendResult34_g216 * appendResult25_g216 ) ) ) ) ) ) * _NormlalDistortionFactor );
				float2 appendResult13_g215 = (float2(break11_g215.r , break11_g215.g));
				float2 temp_output_65_0_g217 = ( appendResult12_g215 + appendResult13_g215 );
				float2 appendResult32_g217 = (float2(break26_g217.x , break26_g217.z));
				float2 appendResult22_g217 = (float2(break20_g217.y , 1.0));
				float2 appendResult34_g217 = (float2(break26_g217.x , break26_g217.y));
				float2 appendResult25_g217 = (float2(-break20_g217.z , 1.0));
				float3 unpack18_g215 = UnpackNormalScale( saturate( ( ( projNormal10_g217.x * tex2D( _NormalMap, ( ( appendResult27_g217 * appendResult21_g217 * temp_output_29_0_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.y * tex2D( _NormalMap, ( ( temp_output_29_0_g217 * appendResult32_g217 * appendResult22_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.z * tex2D( _NormalMap, ( temp_output_65_0_g217 + ( temp_output_29_0_g217 * appendResult34_g217 * appendResult25_g217 ) ) ) ) ) ), _NormalScale );
				unpack18_g215.z = lerp( 1, unpack18_g215.z, saturate(_NormalScale) );
				float3 normalUnpacked24 = unpack18_g215;
				

				float3 Normal = normalUnpacked24;
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
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
			sampler2D _NormalMap;
			sampler2D _DistortionMap;
			sampler2D _DistortionUVMap;
			sampler2D _LightingMaskMap;
			sampler2D _LightingMap;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

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

				float4 transform4_g213 = mul(GetObjectToWorldMatrix(),float4( IN.ase_normal , 0.0 ));
				float4 normalizeResult6_g213 = normalize( transform4_g213 );
				float3 temp_output_1_0_g214 = normalizeResult6_g213.xyz;
				float3 normalizeResult7_g213 = normalize( _MainLightPosition.xyz );
				float dotResult4_g214 = dot( temp_output_1_0_g214 , normalizeResult7_g213 );
				float3 normalizeResult8_g213 = normalize( WorldViewDirection );
				float dotResult7_g214 = dot( temp_output_1_0_g214 , normalizeResult8_g213 );
				float2 appendResult10_g214 = (float2(( ( dotResult4_g214 / 2.0 ) + 0.5 ) , dotResult7_g214));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 tanNormal51_g217 = float3(0,0,1);
				float3 worldNormal51_g217 = float3(dot(tanToWorld0,tanNormal51_g217), dot(tanToWorld1,tanNormal51_g217), dot(tanToWorld2,tanNormal51_g217));
				float4 appendResult63_g217 = (float4(worldNormal51_g217 , 0.0));
				float4 temp_output_57_0_g217 = mul( GetWorldToObjectMatrix(), appendResult63_g217 );
				float4 temp_cast_2 = (5.0).xxxx;
				float4 temp_output_4_0_g217 = pow( abs( temp_output_57_0_g217 ) , temp_cast_2 );
				float4 break6_g217 = temp_output_4_0_g217;
				float4 projNormal10_g217 = ( temp_output_4_0_g217 / ( break6_g217.x + break6_g217.y + break6_g217.z ) );
				float4 appendResult62_g217 = (float4(WorldPosition , 1.0));
				float4 break26_g217 = mul( GetWorldToObjectMatrix(), appendResult62_g217 );
				float2 appendResult27_g217 = (float2(break26_g217.z , break26_g217.y));
				float4 nSign18_g217 = sign( temp_output_57_0_g217 );
				float4 break20_g217 = nSign18_g217;
				float2 appendResult21_g217 = (float2(break20_g217.x , 1.0));
				float temp_output_29_0_g217 = _NormalTiling;
				float temp_output_10_0_g215 = ( _TimeParameters.x * _NormalSpeed );
				float2 appendResult12_g215 = (float2(temp_output_10_0_g215 , temp_output_10_0_g215));
				float3 tanNormal51_g216 = float3(0,0,1);
				float3 worldNormal51_g216 = float3(dot(tanToWorld0,tanNormal51_g216), dot(tanToWorld1,tanNormal51_g216), dot(tanToWorld2,tanNormal51_g216));
				float4 appendResult63_g216 = (float4(worldNormal51_g216 , 0.0));
				float4 temp_output_57_0_g216 = mul( GetWorldToObjectMatrix(), appendResult63_g216 );
				float4 temp_cast_3 = (5.0).xxxx;
				float4 temp_output_4_0_g216 = pow( abs( temp_output_57_0_g216 ) , temp_cast_3 );
				float4 break6_g216 = temp_output_4_0_g216;
				float4 projNormal10_g216 = ( temp_output_4_0_g216 / ( break6_g216.x + break6_g216.y + break6_g216.z ) );
				float4 appendResult62_g216 = (float4(WorldPosition , 1.0));
				float4 break26_g216 = mul( GetWorldToObjectMatrix(), appendResult62_g216 );
				float2 appendResult27_g216 = (float2(break26_g216.z , break26_g216.y));
				float4 nSign18_g216 = sign( temp_output_57_0_g216 );
				float4 break20_g216 = nSign18_g216;
				float2 appendResult21_g216 = (float2(break20_g216.x , 1.0));
				float temp_output_29_0_g216 = _NormalUVTiling;
				float temp_output_2_0_g215 = ( _TimeParameters.x * _NormalUVSpeed );
				float2 appendResult5_g215 = (float2(temp_output_2_0_g215 , temp_output_2_0_g215));
				float2 temp_output_65_0_g216 = appendResult5_g215;
				float2 appendResult32_g216 = (float2(break26_g216.x , break26_g216.z));
				float2 appendResult22_g216 = (float2(break20_g216.y , 1.0));
				float2 appendResult34_g216 = (float2(break26_g216.x , break26_g216.y));
				float2 appendResult25_g216 = (float2(-break20_g216.z , 1.0));
				float4 break11_g215 = ( saturate( ( ( projNormal10_g216.x * tex2D( _NormalMap, ( ( appendResult27_g216 * appendResult21_g216 * temp_output_29_0_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.y * tex2D( _NormalMap, ( ( temp_output_29_0_g216 * appendResult32_g216 * appendResult22_g216 ) + temp_output_65_0_g216 ) ) ) + ( projNormal10_g216.z * tex2D( _NormalMap, ( temp_output_65_0_g216 + ( temp_output_29_0_g216 * appendResult34_g216 * appendResult25_g216 ) ) ) ) ) ) * _NormlalDistortionFactor );
				float2 appendResult13_g215 = (float2(break11_g215.r , break11_g215.g));
				float2 temp_output_65_0_g217 = ( appendResult12_g215 + appendResult13_g215 );
				float2 appendResult32_g217 = (float2(break26_g217.x , break26_g217.z));
				float2 appendResult22_g217 = (float2(break20_g217.y , 1.0));
				float2 appendResult34_g217 = (float2(break26_g217.x , break26_g217.y));
				float2 appendResult25_g217 = (float2(-break20_g217.z , 1.0));
				float3 unpack18_g215 = UnpackNormalScale( saturate( ( ( projNormal10_g217.x * tex2D( _NormalMap, ( ( appendResult27_g217 * appendResult21_g217 * temp_output_29_0_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.y * tex2D( _NormalMap, ( ( temp_output_29_0_g217 * appendResult32_g217 * appendResult22_g217 ) + temp_output_65_0_g217 ) ) ) + ( projNormal10_g217.z * tex2D( _NormalMap, ( temp_output_65_0_g217 + ( temp_output_29_0_g217 * appendResult34_g217 * appendResult25_g217 ) ) ) ) ) ), _NormalScale );
				unpack18_g215.z = lerp( 1, unpack18_g215.z, saturate(_NormalScale) );
				float3 normalUnpacked24 = unpack18_g215;
				float3 normalizeResult5_g212 = normalize( normalUnpacked24 );
				float dotResult14_g212 = dot( ase_tanViewDir , normalizeResult5_g212 );
				float3 tanNormal51_g174 = float3(0,0,1);
				float3 worldNormal51_g174 = float3(dot(tanToWorld0,tanNormal51_g174), dot(tanToWorld1,tanNormal51_g174), dot(tanToWorld2,tanNormal51_g174));
				float4 appendResult63_g174 = (float4(worldNormal51_g174 , 0.0));
				float4 temp_output_57_0_g174 = mul( GetWorldToObjectMatrix(), appendResult63_g174 );
				float4 temp_cast_5 = (5.0).xxxx;
				float4 temp_output_4_0_g174 = pow( abs( temp_output_57_0_g174 ) , temp_cast_5 );
				float4 break6_g174 = temp_output_4_0_g174;
				float4 projNormal10_g174 = ( temp_output_4_0_g174 / ( break6_g174.x + break6_g174.y + break6_g174.z ) );
				float4 appendResult62_g174 = (float4(WorldPosition , 1.0));
				float4 break26_g174 = mul( GetWorldToObjectMatrix(), appendResult62_g174 );
				float2 appendResult27_g174 = (float2(break26_g174.z , break26_g174.y));
				float4 nSign18_g174 = sign( temp_output_57_0_g174 );
				float4 break20_g174 = nSign18_g174;
				float2 appendResult21_g174 = (float2(break20_g174.x , 1.0));
				float temp_output_29_0_g174 = _DistortionTiling;
				float temp_output_10_0_g173 = ( _TimeParameters.x * _DistortionSpeed );
				float2 appendResult12_g173 = (float2(temp_output_10_0_g173 , temp_output_10_0_g173));
				float3 tanNormal51_g175 = float3(0,0,1);
				float3 worldNormal51_g175 = float3(dot(tanToWorld0,tanNormal51_g175), dot(tanToWorld1,tanNormal51_g175), dot(tanToWorld2,tanNormal51_g175));
				float4 appendResult63_g175 = (float4(worldNormal51_g175 , 0.0));
				float4 temp_output_57_0_g175 = mul( GetWorldToObjectMatrix(), appendResult63_g175 );
				float4 temp_cast_6 = (5.0).xxxx;
				float4 temp_output_4_0_g175 = pow( abs( temp_output_57_0_g175 ) , temp_cast_6 );
				float4 break6_g175 = temp_output_4_0_g175;
				float4 projNormal10_g175 = ( temp_output_4_0_g175 / ( break6_g175.x + break6_g175.y + break6_g175.z ) );
				float4 appendResult62_g175 = (float4(WorldPosition , 1.0));
				float4 break26_g175 = mul( GetWorldToObjectMatrix(), appendResult62_g175 );
				float2 appendResult27_g175 = (float2(break26_g175.z , break26_g175.y));
				float4 nSign18_g175 = sign( temp_output_57_0_g175 );
				float4 break20_g175 = nSign18_g175;
				float2 appendResult21_g175 = (float2(break20_g175.x , 1.0));
				float temp_output_29_0_g175 = _DistortionUVTiling;
				float temp_output_2_0_g173 = ( _TimeParameters.x * _DistortionUVSpeed );
				float2 appendResult5_g173 = (float2(temp_output_2_0_g173 , temp_output_2_0_g173));
				float2 temp_output_65_0_g175 = appendResult5_g173;
				float2 appendResult32_g175 = (float2(break26_g175.x , break26_g175.z));
				float2 appendResult22_g175 = (float2(break20_g175.y , 1.0));
				float2 appendResult34_g175 = (float2(break26_g175.x , break26_g175.y));
				float2 appendResult25_g175 = (float2(-break20_g175.z , 1.0));
				float4 break11_g173 = ( saturate( ( ( projNormal10_g175.x * tex2D( _DistortionUVMap, ( ( appendResult27_g175 * appendResult21_g175 * temp_output_29_0_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.y * tex2D( _DistortionUVMap, ( ( temp_output_29_0_g175 * appendResult32_g175 * appendResult22_g175 ) + temp_output_65_0_g175 ) ) ) + ( projNormal10_g175.z * tex2D( _DistortionUVMap, ( temp_output_65_0_g175 + ( temp_output_29_0_g175 * appendResult34_g175 * appendResult25_g175 ) ) ) ) ) ) * _DistortionFactor );
				float2 appendResult13_g173 = (float2(break11_g173.r , break11_g173.g));
				float2 temp_output_65_0_g174 = ( appendResult12_g173 + appendResult13_g173 );
				float2 appendResult32_g174 = (float2(break26_g174.x , break26_g174.z));
				float2 appendResult22_g174 = (float2(break20_g174.y , 1.0));
				float2 appendResult34_g174 = (float2(break26_g174.x , break26_g174.y));
				float2 appendResult25_g174 = (float2(-break20_g174.z , 1.0));
				float4 temp_cast_7 = (_DetailPow).xxxx;
				float4 temp_output_9_0 = saturate( ( pow( max( float4( 0,0,0,0 ) , saturate( ( ( projNormal10_g174.x * tex2D( _DistortionMap, ( ( appendResult27_g174 * appendResult21_g174 * temp_output_29_0_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.y * tex2D( _DistortionMap, ( ( temp_output_29_0_g174 * appendResult32_g174 * appendResult22_g174 ) + temp_output_65_0_g174 ) ) ) + ( projNormal10_g174.z * tex2D( _DistortionMap, ( temp_output_65_0_g174 + ( temp_output_29_0_g174 * appendResult34_g174 * appendResult25_g174 ) ) ) ) ) ) ) , temp_cast_7 ) * _DetailBoost ) );
				float4 lerpResult5 = lerp( _TintLow , _TintHigh , temp_output_9_0.r);
				
				float4 temp_cast_9 = (0.0).xxxx;
				float clampResult20_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 2.0 * PI ) ) ) , 0.3 , 1.0 );
				float clampResult29_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 5.0 * PI ) ) ) , 0.5 , 1.0 );
				float clampResult30_g207 = clamp( sin( ( ( _TimeParameters.x ) * ( 10.0 * PI ) ) ) , 0.7 , 1.0 );
				float sine32_g207 = ( clampResult20_g207 * clampResult29_g207 * clampResult30_g207 );
				float3 tanNormal51_g211 = float3(0,0,1);
				float3 worldNormal51_g211 = float3(dot(tanToWorld0,tanNormal51_g211), dot(tanToWorld1,tanNormal51_g211), dot(tanToWorld2,tanNormal51_g211));
				float4 appendResult63_g211 = (float4(worldNormal51_g211 , 0.0));
				float4 temp_output_57_0_g211 = mul( GetWorldToObjectMatrix(), appendResult63_g211 );
				float4 temp_cast_10 = (3.0).xxxx;
				float4 temp_output_4_0_g211 = pow( abs( temp_output_57_0_g211 ) , temp_cast_10 );
				float4 break6_g211 = temp_output_4_0_g211;
				float4 projNormal10_g211 = ( temp_output_4_0_g211 / ( break6_g211.x + break6_g211.y + break6_g211.z ) );
				float4 appendResult62_g211 = (float4(WorldPosition , 1.0));
				float4 break26_g211 = mul( GetWorldToObjectMatrix(), appendResult62_g211 );
				float2 appendResult27_g211 = (float2(break26_g211.z , break26_g211.y));
				float4 nSign18_g211 = sign( temp_output_57_0_g211 );
				float4 break20_g211 = nSign18_g211;
				float2 appendResult21_g211 = (float2(break20_g211.x , 1.0));
				float temp_output_29_0_g211 = _LightingMaskATiling;
				float mulTime7_g207 = _TimeParameters.x * _LightingMaskAUVSpeed;
				float2 temp_cast_11 = (mulTime7_g207).xx;
				float2 temp_output_65_0_g211 = temp_cast_11;
				float2 appendResult32_g211 = (float2(break26_g211.x , break26_g211.z));
				float2 appendResult22_g211 = (float2(break20_g211.y , 1.0));
				float2 appendResult34_g211 = (float2(break26_g211.x , break26_g211.y));
				float2 appendResult25_g211 = (float2(-break20_g211.z , 1.0));
				float3 tanNormal51_g208 = float3(0,0,1);
				float3 worldNormal51_g208 = float3(dot(tanToWorld0,tanNormal51_g208), dot(tanToWorld1,tanNormal51_g208), dot(tanToWorld2,tanNormal51_g208));
				float4 appendResult63_g208 = (float4(worldNormal51_g208 , 0.0));
				float4 temp_output_57_0_g208 = mul( GetWorldToObjectMatrix(), appendResult63_g208 );
				float4 temp_cast_12 = (3.0).xxxx;
				float4 temp_output_4_0_g208 = pow( abs( temp_output_57_0_g208 ) , temp_cast_12 );
				float4 break6_g208 = temp_output_4_0_g208;
				float4 projNormal10_g208 = ( temp_output_4_0_g208 / ( break6_g208.x + break6_g208.y + break6_g208.z ) );
				float4 appendResult62_g208 = (float4(WorldPosition , 1.0));
				float4 break26_g208 = mul( GetWorldToObjectMatrix(), appendResult62_g208 );
				float2 appendResult27_g208 = (float2(break26_g208.z , break26_g208.y));
				float4 nSign18_g208 = sign( temp_output_57_0_g208 );
				float4 break20_g208 = nSign18_g208;
				float2 appendResult21_g208 = (float2(break20_g208.x , 1.0));
				float temp_output_29_0_g208 = _LightingMaskBTiling;
				float mulTime10_g207 = _TimeParameters.x * _LightingMaskBUVSpeed;
				float2 temp_cast_13 = (mulTime10_g207).xx;
				float2 temp_output_65_0_g208 = temp_cast_13;
				float2 appendResult32_g208 = (float2(break26_g208.x , break26_g208.z));
				float2 appendResult22_g208 = (float2(break20_g208.y , 1.0));
				float2 appendResult34_g208 = (float2(break26_g208.x , break26_g208.y));
				float2 appendResult25_g208 = (float2(-break20_g208.z , 1.0));
				float4 lightningMask14_g207 = ( saturate( ( ( projNormal10_g211.x * tex2D( _LightingMaskMap, ( ( appendResult27_g211 * appendResult21_g211 * temp_output_29_0_g211 ) + temp_output_65_0_g211 ) ) ) + ( projNormal10_g211.y * tex2D( _LightingMaskMap, ( ( temp_output_29_0_g211 * appendResult32_g211 * appendResult22_g211 ) + temp_output_65_0_g211 ) ) ) + ( projNormal10_g211.z * tex2D( _LightingMaskMap, ( temp_output_65_0_g211 + ( temp_output_29_0_g211 * appendResult34_g211 * appendResult25_g211 ) ) ) ) ) ) * saturate( ( ( projNormal10_g208.x * tex2D( _LightingMaskMap, ( ( appendResult27_g208 * appendResult21_g208 * temp_output_29_0_g208 ) + temp_output_65_0_g208 ) ) ) + ( projNormal10_g208.y * tex2D( _LightingMaskMap, ( ( temp_output_29_0_g208 * appendResult32_g208 * appendResult22_g208 ) + temp_output_65_0_g208 ) ) ) + ( projNormal10_g208.z * tex2D( _LightingMaskMap, ( temp_output_65_0_g208 + ( temp_output_29_0_g208 * appendResult34_g208 * appendResult25_g208 ) ) ) ) ) ) );
				float4 temp_cast_14 = (_LigntingMaskPow).xxxx;
				float4 lightningMaskSine39_g207 = saturate( pow( max( float4( 0,0,0,0 ) , ( _LightningSineMult * sine32_g207 * lightningMask14_g207 ) ) , temp_cast_14 ) );
				float3 tanNormal51_g210 = float3(0,0,1);
				float3 worldNormal51_g210 = float3(dot(tanToWorld0,tanNormal51_g210), dot(tanToWorld1,tanNormal51_g210), dot(tanToWorld2,tanNormal51_g210));
				float4 appendResult63_g210 = (float4(worldNormal51_g210 , 0.0));
				float4 temp_output_57_0_g210 = mul( GetWorldToObjectMatrix(), appendResult63_g210 );
				float4 temp_cast_15 = (3.0).xxxx;
				float4 temp_output_4_0_g210 = pow( abs( temp_output_57_0_g210 ) , temp_cast_15 );
				float4 break6_g210 = temp_output_4_0_g210;
				float4 projNormal10_g210 = ( temp_output_4_0_g210 / ( break6_g210.x + break6_g210.y + break6_g210.z ) );
				float4 appendResult62_g210 = (float4(WorldPosition , 1.0));
				float4 break26_g210 = mul( GetWorldToObjectMatrix(), appendResult62_g210 );
				float2 appendResult27_g210 = (float2(break26_g210.z , break26_g210.y));
				float4 nSign18_g210 = sign( temp_output_57_0_g210 );
				float4 break20_g210 = nSign18_g210;
				float2 appendResult21_g210 = (float2(break20_g210.x , 1.0));
				float temp_output_29_0_g210 = _LightingATiling;
				float mulTime45_g207 = _TimeParameters.x * _LightingAFrequency;
				float2 temp_cast_16 = (( floor( mulTime45_g207 ) * 1.0 )).xx;
				float2 temp_output_65_0_g210 = temp_cast_16;
				float2 appendResult32_g210 = (float2(break26_g210.x , break26_g210.z));
				float2 appendResult22_g210 = (float2(break20_g210.y , 1.0));
				float2 appendResult34_g210 = (float2(break26_g210.x , break26_g210.y));
				float2 appendResult25_g210 = (float2(-break20_g210.z , 1.0));
				float3 tanNormal51_g209 = float3(0,0,1);
				float3 worldNormal51_g209 = float3(dot(tanToWorld0,tanNormal51_g209), dot(tanToWorld1,tanNormal51_g209), dot(tanToWorld2,tanNormal51_g209));
				float4 appendResult63_g209 = (float4(worldNormal51_g209 , 0.0));
				float4 temp_output_57_0_g209 = mul( GetWorldToObjectMatrix(), appendResult63_g209 );
				float4 temp_cast_17 = (3.0).xxxx;
				float4 temp_output_4_0_g209 = pow( abs( temp_output_57_0_g209 ) , temp_cast_17 );
				float4 break6_g209 = temp_output_4_0_g209;
				float4 projNormal10_g209 = ( temp_output_4_0_g209 / ( break6_g209.x + break6_g209.y + break6_g209.z ) );
				float4 appendResult62_g209 = (float4(WorldPosition , 1.0));
				float4 break26_g209 = mul( GetWorldToObjectMatrix(), appendResult62_g209 );
				float2 appendResult27_g209 = (float2(break26_g209.z , break26_g209.y));
				float4 nSign18_g209 = sign( temp_output_57_0_g209 );
				float4 break20_g209 = nSign18_g209;
				float2 appendResult21_g209 = (float2(break20_g209.x , 1.0));
				float temp_output_29_0_g209 = _LightingBTiling;
				float mulTime46_g207 = _TimeParameters.x * _LightingBFrequency;
				float2 temp_cast_18 = (( 1.0 * floor( mulTime46_g207 ) )).xx;
				float2 temp_output_65_0_g209 = temp_cast_18;
				float2 appendResult32_g209 = (float2(break26_g209.x , break26_g209.z));
				float2 appendResult22_g209 = (float2(break20_g209.y , 1.0));
				float2 appendResult34_g209 = (float2(break26_g209.x , break26_g209.y));
				float2 appendResult25_g209 = (float2(-break20_g209.z , 1.0));
				float lightning50_g207 = ( saturate( ( ( projNormal10_g210.x * tex2D( _LightingMap, ( ( appendResult27_g210 * appendResult21_g210 * temp_output_29_0_g210 ) + temp_output_65_0_g210 ) ) ) + ( projNormal10_g210.y * tex2D( _LightingMap, ( ( temp_output_29_0_g210 * appendResult32_g210 * appendResult22_g210 ) + temp_output_65_0_g210 ) ) ) + ( projNormal10_g210.z * tex2D( _LightingMap, ( temp_output_65_0_g210 + ( temp_output_29_0_g210 * appendResult34_g210 * appendResult25_g210 ) ) ) ) ) ) * saturate( ( ( projNormal10_g209.x * tex2D( _LightingMap, ( ( appendResult27_g209 * appendResult21_g209 * temp_output_29_0_g209 ) + temp_output_65_0_g209 ) ) ) + ( projNormal10_g209.y * tex2D( _LightingMap, ( ( temp_output_29_0_g209 * appendResult32_g209 * appendResult22_g209 ) + temp_output_65_0_g209 ) ) ) + ( projNormal10_g209.z * tex2D( _LightingMap, ( temp_output_65_0_g209 + ( temp_output_29_0_g209 * appendResult34_g209 * appendResult25_g209 ) ) ) ) ) ) * _LightningBoost ).r;
				

				float3 BaseColor = ( saturate( ( saturate( ( saturate( ( tex2D( _ScatterMap, ( ( _ScatterCenterShift + appendResult10_g214 ) * _ScatterStretch ) ) * _ScatterColor * _MainLightColor ) ) * _ScatterBoost ) ) + _ScatterIndirect ) ) * ( ( ( saturate( pow( max( 0.0 , saturate( ( 1.0 - dotResult14_g212 ) ) ) , _FresnelPower ) ) * _FrenselMult ) * _FresnelColor ) + saturate( lerpResult5 ) ) ).rgb;
				float3 Normal = normalUnpacked24;
				float3 Emission = max( temp_cast_9 , ( lightningMaskSine39_g207 * lightning50_g207 * _LightningColor ) ).rgb;
				float3 Specular = ( _SpecularColor * temp_output_9_0 * _Specular ).rgb;
				float Metallic = 0;
				float Smoothness = _Smoothness;
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
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
			float4 _SpecularColor;
			float4 _ScatterColor;
			float4 _LightningColor;
			float4 _TintHigh;
			float4 _TintLow;
			float4 _FresnelColor;
			float _ScatterCenterShift;
			float _LightningSineMult;
			float _LightingMaskATiling;
			float _LightingMaskAUVSpeed;
			float _LightingMaskBTiling;
			float _LigntingMaskPow;
			float _DetailBoost;
			float _LightingATiling;
			float _LightingAFrequency;
			float _LightingBTiling;
			float _LightingBFrequency;
			float _LightningBoost;
			float _LightingMaskBUVSpeed;
			float _DetailPow;
			float _DistortionUVTiling;
			float _DistortionUVSpeed;
			float _ScatterStretch;
			float _ScatterBoost;
			float _ScatterIndirect;
			float _NormalTiling;
			float _NormalSpeed;
			float _NormalUVTiling;
			float _DistortionFactor;
			float _NormalUVSpeed;
			float _NormalScale;
			float _FresnelPower;
			float _FrenselMult;
			float _DistortionTiling;
			float _DistortionSpeed;
			float _Specular;
			float _NormlalDistortionFactor;
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
Node;AmplifyShaderEditor.FunctionNode;78;-1998.366,299.4671;Inherit;False;TriplanarDoubleUVDist;8;;173;9e960dc58a88b2d4496ab2f61061459e;0;0;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;85;1351.366,301.2752;Inherit;False;Lightning;34;;207;1ce3b38b84803624a906f5fc443424fd;0;0;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;14;1102.28,117.06;Float;False;Property;_Specular;Specular;21;0;Create;True;0;0;0;False;0;False;1;1;0.03;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;1101.38,203.36;Float;False;Property;_Smoothness;Smoothness;22;0;Create;True;0;0;0;False;0;False;0.5;0.458;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;16;-453.8198,203.46;Float;False;Property;_SpecularColor;Specular Color;20;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.4485293,0.8402634,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;25;1365.433,-0.458782;Inherit;False;24;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;1411.18,76.36008;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;75;1421.954,-98.18412;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;35;161.2449,40.63271;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;12;-216.3682,93.43896;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;31;-125.4292,-34.81888;Inherit;False;Fresnel;30;;212;f8c497a0c2d6d334f8e7138f24a77d5f;0;1;22;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;32;-422.4291,-37.81881;Inherit;False;24;normalUnpacked;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;36;1173.145,-95.66732;Inherit;False;ScatterColor;23;;213;5984f944e2b849e44aad6ac4d7027dc1;0;0;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;3;-792.2358,-134.4913;Float;False;Property;_TintLow;Tint Low;17;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.008001738,0.06445526,0.2720588,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;7;-1862.668,431.739;Float;False;Property;_DetailPow;Detail Pow;18;0;Create;True;0;0;0;False;0;False;0;0.36;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5;-440.6682,89.73895;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;6;-1599.668,343.739;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1656.668,544.739;Float;False;Property;_DetailBoost;Detail Boost;19;0;Create;True;0;0;0;False;0;False;0;0.71;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1381.668,362.739;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;84;-1731.85,251.8977;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;79;-1856.686,690.6788;Inherit;False;TriplanarNormalUVDist;0;;215;1a5fcd4739bcd5240a12b19949e4bb06;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;4;-797.436,41.00867;Float;False;Property;_TintHigh;Tint High;16;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.5955881,0.8995942,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;24;-1549.028,678.8254;Float;False;normalUnpacked;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;28;-832.4755,227.1503;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SaturateNode;9;-1225.668,360.739;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;88;1632.305,40.10595;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;71;1632.305,-19.89405;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;69;1632.305,-19.89405;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;68;1632.305,-19.89405;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;FORGE3D/Planets HD/Thunderstorm;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;20;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;41;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;70;1632.305,-19.89405;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;72;1632.305,-19.89405;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;67;1632.305,-19.89405;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;86;1632.305,40.10595;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;87;1632.305,40.10595;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;89;1632.305,40.10595;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;17;0;16;0
WireConnection;17;1;9;0
WireConnection;17;2;14;0
WireConnection;75;0;36;0
WireConnection;75;1;35;0
WireConnection;35;0;31;0
WireConnection;35;1;12;0
WireConnection;12;0;5;0
WireConnection;31;22;32;0
WireConnection;5;0;3;0
WireConnection;5;1;4;0
WireConnection;5;2;28;0
WireConnection;6;0;84;0
WireConnection;6;1;7;0
WireConnection;8;0;6;0
WireConnection;8;1;10;0
WireConnection;84;1;78;0
WireConnection;24;0;79;0
WireConnection;28;0;9;0
WireConnection;9;0;8;0
WireConnection;68;0;75;0
WireConnection;68;1;25;0
WireConnection;68;2;85;0
WireConnection;68;9;17;0
WireConnection;68;4;15;0
ASEEND*/
//CHKSM=F253EFB91E17AB07EA95C93F59028DA23B2EACF4