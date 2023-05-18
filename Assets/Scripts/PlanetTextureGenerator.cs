using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetTextureGenerator : MonoBehaviour
{
   // public List<GameObject> planetTextures;
  
    // Start is called before the first frame update
    void Start()
    {
    // foreach (GameObject i in GameSettings.planetPrefabs)
    //  {
    //      planetTextures.Add(i);
         
    //  }
     GenerateTexture();
    }

    public void GenerateTexture()
    {
        int r;
        do
        {
            r = Random.Range(0,GameSettings.planetPrefabs.Length);

        }while(GameSettings.planetPrefabs[r] == null);
    
        GameObject p = Instantiate(GameSettings.planetPrefabs[r],new Vector3(0,0,0),Quaternion.identity);
        p.transform.SetParent(gameObject.transform);
        p.transform.localPosition = new Vector3(0,0,0);
        p.transform.localScale = new Vector3(0.2f,0.2f,0.2f);
        GameObject t = GameSettings.planetPrefabs[r];
        GameSettings.planetPrefabs[r] = null;
        

        
        
    }

}
