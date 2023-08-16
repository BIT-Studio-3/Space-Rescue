using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetTextureGenerator : MonoBehaviour
{
  
    // Start is called before the first frame update
    void Start()
    {
     GenerateTexture();
    }

    public void GenerateTexture() //Reads in the global array in planetsettings and picks a random prefab, 
                                  //instantiates the chosen prefab in game and on the UI
    {
        int r;
        do
        {
            r = Random.Range(0,GameSettings.planetPrefabs.Length);
        }   while(GameSettings.planetPrefabs[r] == null);

        int index = GameObject.Find("PlanetManager").GetComponent<PlanetSpawn>().planets.IndexOf(gameObject);
        GameObject[] planetUIobjects = GameObject.FindGameObjectsWithTag("PlanetUI");
        GameObject p = Instantiate(GameSettings.planetPrefabs[r],new Vector3(0,0,0),Quaternion.identity);
        p.transform.SetParent(gameObject.transform);
        p.transform.localPosition = new Vector3(0,0,0);
        p.transform.localScale = new Vector3(0.2f,0.2f,0.2f);


        GameSettings.planetPrefabs[r] = null; //setting the chosen index in the array to null so it cant be chosen again
    }

}
