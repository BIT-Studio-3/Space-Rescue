using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetTextureGenerator : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        if (GameSettings.planetPrefabs.Length == 0)
            GameSettings.planetPrefabs = Resources.LoadAll<GameObject>("Planets"); //Loading all planets into the global array

        GenerateTexture();
    }

    public void GenerateTexture() //Reads in the global array in planetsettings and picks a random prefab, 
                                  //instantiates the chosen prefab in game and on the UI
    {
        int r;
        do
        {
            r = Random.Range(0, GameSettings.planetPrefabs.Length);
        } while (GameSettings.planetPrefabs[r] == null);

        int index = GameObject.Find("SpacePlanetManager").GetComponent<PlanetSpawn>().planets.IndexOf(gameObject);
        GameObject[] planetUIobjects = GameObject.FindGameObjectsWithTag("PlanetUI");
        GameObject p = Instantiate(GameSettings.planetPrefabs[r], new Vector3(0, 0, 0), Quaternion.identity);
        p.transform.SetParent(gameObject.transform);
        p.transform.localPosition = new Vector3(0, 0, 0);
        p.transform.localScale = new Vector3(1.3f, 1.3f, 1.3f);
        gameObject.GetComponent<PlanetInfo>().planetMaterial = GameSettings.planetPrefabs[r].GetComponent<MeshRenderer>().sharedMaterial; //Assigns the material of the prefab to the planetinfo script
        //If the planet prefab contains a gameobject named Planet_Ring then assign it to the rings variable in planetinfo
        if (GameSettings.planetPrefabs[r].transform.Find("Planet_Ring") != null)
        {
            gameObject.GetComponent<PlanetInfo>().rings = true;
        }
        GameSettings.planetPrefabs[r] = null; //setting the chosen index in the array to null so it cant be chosen again
    }

}
