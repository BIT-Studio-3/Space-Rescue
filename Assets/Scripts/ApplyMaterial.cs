using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ApplyMaterial : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        // Apply the selected material from the main scene to the planet in this scene
        Material selectedMaterial = PlanetMaterialManager.SelectedMaterial;
        if (selectedMaterial != null)
        {
            GetComponent<Renderer>().material = selectedMaterial;
        }
    }
}
