using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetTextureGenerator : MonoBehaviour
{

    public List<Texture2D> planetTextures; // List of texture assets to use for planets

    // Start is called before the first frame update
    void Start()
    {
        GenerateTexture();
    }

    public void GenerateTexture()
    {
        if (planetTextures.Count == 0)
        {
            Debug.LogWarning("No planet textures available.");
            return;
        }

        int randomIndex = Random.Range(0, planetTextures.Count);
        Texture2D selectedTexture = planetTextures[randomIndex];

        GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere); // Create a basic sphere
        sphere.transform.SetParent(gameObject.transform);
        sphere.transform.localPosition = Vector3.zero;
        sphere.transform.localScale = new Vector3(1f, 1f, 1f); // Maintain the original sphere size

        Renderer sphereRenderer = sphere.GetComponent<Renderer>();
        sphereRenderer.material.mainTexture = selectedTexture;

        planetTextures.RemoveAt(randomIndex); // Remove the used texture from the list
    }

}
