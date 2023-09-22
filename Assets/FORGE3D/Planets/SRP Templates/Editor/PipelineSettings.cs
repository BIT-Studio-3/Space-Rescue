using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.Rendering;

public class PipelineSettings : ScriptableObject
{
    private static PipelineSettings instance;

    public enum RenderingPipeline
    {
        Standard,
        LWRP,
        Universal,
        HDRP
    }

    private const string AssetPath = "Assets/FORGE3D/Planets/SRP Templates/Editor/PipelineSettingsData.asset";

    private static readonly bool DebugLog = false;
    private static readonly bool AutoInstall = true;

    public bool PlanetsRenderingPipelineDialog;
    public RenderingPipeline Pipeline;

#if UNITY_EDITOR
    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterAssembliesLoaded)]
    [InitializeOnLoadMethod]
    private static void Initialize()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode) return;

        LoadInstance();

        if (instance != null && instance.PlanetsRenderingPipelineDialog)
        {
            if (DebugLog)
                Debug.Log("PipelineSettings dialog is true. Aborting... ");
            return;
        }

        instance.Pipeline = DetectPipeline();
        if (DebugLog)
            Debug.Log("Detected " + instance.Pipeline + " rendering pipeline");
        ImportRenderingPackage(instance.Pipeline);
    }
#endif

    private static void LoadInstance()
    {
        instance = AssetDatabase.LoadAssetAtPath<PipelineSettings>(AssetPath);

        if (instance == null)
        {
            if (DebugLog)
                Debug.Log("Failed to load PipelineSettings instance. Creating new scriptable object...");

            instance = CreateInstance<PipelineSettings>();
            AssetDatabase.CreateAsset(instance, AssetPath);
            AssetDatabase.SaveAssets();
        }

        if (DebugLog)
            Debug.Log("PipelineSettings instance loaded");
    }

    private static RenderingPipeline DetectPipeline()
    {
        if (GraphicsSettings.currentRenderPipeline)
            return GraphicsSettings.currentRenderPipeline.GetType().ToString().Contains("HighDefinition")
                ? RenderingPipeline.HDRP
                : RenderingPipeline.Universal;

        return RenderingPipeline.Standard;
    }

    private static void ImportRenderingPackage(RenderingPipeline pipeline)
    {
        var path = "Assets/FORGE3D/Planets/SRP Templates/";
        var fullPath = path;
        switch (pipeline)
        {
            case RenderingPipeline.Standard:
                fullPath += "Planets Standard.unitypackage";
                break;
            case RenderingPipeline.Universal:
                fullPath += "Planets URP.unitypackage";
                break;
            case RenderingPipeline.HDRP:
            case RenderingPipeline.LWRP:
            default:
                Debug.LogWarning(
                    "Planets: Current rendering pipeline is not supported!");
                return;
        }

        if (AutoInstall)
        {
            AssetDatabase.ImportPackage(fullPath, false);
            Debug.Log("Planets " + pipeline + " rendering pipeline installed.");
        }
        else
        {
            if (EditorUtility.DisplayDialog("Planets: Rendering Pipeline ",
                "Detected " + pipeline + " Rendering Pipeline.\n\nUpdate Planets to " + pipeline + "?", "Update",
                "Cancel"))
            {
                AssetDatabase.ImportPackage(fullPath, false);
                Debug.Log("Planets " + pipeline + " rendering pipeline installed.");
            }
            else
            {
                Debug.LogWarning(
                    "Planets: Warning! No rendering template selected. Please import .unitypackage manually from " +
                    path);
            }
        }

        instance.PlanetsRenderingPipelineDialog = true;

        EditorUtility.SetDirty(instance);
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
    }
}