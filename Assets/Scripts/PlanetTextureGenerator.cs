using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetTextureGenerator : MonoBehaviour
{
   // public List<GameObject> planetTextures;
  
    // Start is called before the first frame update
    void Start()
    {

     GenerateTexture();
    }

    public void GenerateTexture()
    {
        int r;
        do
        {
            r = Random.Range(0,GameSettings.planetPrefabs.Length);

        }while(GameSettings.planetPrefabs[r] == null);
        int index = GameObject.Find("PlanetManager").GetComponent<PlanetSpawn>().planets.IndexOf(gameObject);
        GameObject[] planetUIobjects = GameObject.FindGameObjectsWithTag("PlanetUI");
        GameObject p = Instantiate(GameSettings.planetPrefabs[r],new Vector3(0,0,0),Quaternion.identity);
        GameObject p_UI = Instantiate(GameSettings.planetPrefabs[r],new Vector3(0,0,0),Quaternion.identity);
        p.transform.SetParent(gameObject.transform);
        p.transform.localPosition = new Vector3(0,0,0);
        p.transform.localScale = new Vector3(0.2f,0.2f,0.2f);
        p_UI.transform.SetParent(planetUIobjects[index].transform);
        p_UI.transform.localPosition = new Vector3(0,0,0);
        p_UI.transform.localScale = new Vector3(0.2f,0.2f,0.2f);
        p_UI.AddComponent<Canvas>();
        p_UI.GetComponent<Canvas>().worldCamera = GameObject.Find("PlanetUI").GetComponent<Canvas>().worldCamera;
        p_UI.AddComponent<CanvasRenderer>();
        p_UI.layer = 7;

        GameObject t = GameSettings.planetPrefabs[r];
        GameSettings.planetPrefabs[r] = null;
        

        
        
    }

}
