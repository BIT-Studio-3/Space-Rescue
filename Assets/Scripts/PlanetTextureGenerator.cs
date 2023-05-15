using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetTextureGenerator : MonoBehaviour
{
    public List<GameObject> planetTextures;
  
    // Start is called before the first frame update
    void Start()
    {
    foreach (GameObject i in GameSettings.planetPrefabs)
     {
         planetTextures.Add(i);
         
     }
     GenerateTexture();
    }

    public void GenerateTexture()
    {
        int r = Random.Range(0,planetTextures.Count);
        GameObject p = Instantiate(planetTextures[r],new Vector3(0,0,0),Quaternion.identity);
        p.transform.SetParent(gameObject.transform);
        p.transform.localPosition = new Vector3(0,0,0);
        p.transform.localScale = new Vector3(1,1,1);
        GameObject t = planetTextures[r];
        
    }

}
