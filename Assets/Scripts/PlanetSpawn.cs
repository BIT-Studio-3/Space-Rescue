using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetSpawn : MonoBehaviour
{
    //variables
    public GameObject planetPrefab; //the planet prefab - used for manager gameobject
    private GameObject planetTemp;
    private int spawnX;
    private int spawnY;
    private int spawnZ;
    private int randScale;
    //private string[] planetNames = {"1","2","3","4","5" }; //placeholder names
    public List<GameObject> planets = new List<GameObject>();

    //inspector editable variables
    public int spawnRange = 100;
    public int spawnCount = 10;
    /*
    I use names here for comparing different planets from each other (I was going to use this for scale but I didn't)
    I could have created a tag and added it to each prefab but we might need the tag space later on
    and they work essentially the same
    */

    // Start is called before the first frame update
    void Start()
    {
        SpawningPlanet();
    }

    private void SpawningPlanet()
    {
        //however many x number of planets
        for (int i = 0; i < spawnCount; i++)
        {
            //does the random spawn stuff
            spawnX = Random.Range(-spawnRange, spawnRange);
            spawnY = Random.Range(1, spawnRange); //temporarily Y:1+ so planets don't spawn inside or under the plane
            spawnZ = Random.Range(-spawnRange, spawnRange);
            randScale = Random.Range(10, 51);

            //if the list isn't empty
            if (planets.Count != 0)
            {
                //Debug.Log("Spawning else"); works
                //then it checks through whatever IS in the list
                for (int j = 0; j < planets.Count; j++)
                {
                    Debug.Log("j for loop"); //works w/o planets.count -1
                    //if the current spawning planet is intersecting any planet in the list (+50 for some room)
                    //if (planets[i].transform.position.x <= planets[j].transform.position.x)
                    //{
                    //    Debug.Log("extends range");
                    //    //then extend it out a bit
                    //    spawnX += 100;
                    //}
                    //else
                    //{
                        Debug.Log("Spawning List");
                        planetTemp = Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
                        planetTemp.transform.localScale = new Vector3(randScale, randScale, randScale);
                        planets.Add(planetTemp);
                    //}
                    
                }
            }
            //if the list is empty
            else
            {
                Debug.Log("Intitial List Spawn");
                spawnX = Random.Range(-spawnRange, spawnRange);
                spawnY = Random.Range(1, spawnRange); //temporarily Y:1+ so planets don't spawn inside or under the plane
                spawnZ = Random.Range(-spawnRange, spawnRange);
                randScale = Random.Range(10, 51);
                planetTemp = Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
                planetTemp.transform.localScale = new Vector3(randScale, randScale, randScale);
                planets.Add(planetTemp);
            }

        }

        /*
        //spawns x number of planets
        for (int i = 0; i < spawnCount; i++)
        {
            //randomised spawn
            spawnX = Random.Range(-spawnRange, spawnRange);
            spawnY = Random.Range(1, spawnRange); //temporarily Y:1+ so planets don't spawn inside or under the plane
            spawnZ = Random.Range(-spawnRange, spawnRange);
            randScale = Random.Range(5, 51);

            //runs through the list of spawned planets
            for (int j = 0; j < planets.Count - 1; j++)
            {
                if (planets[i].transform.position.x <= planets[j].transform.position.x + 50)
                {
                    spawnX += 100;
                }
                else
                {
                    planets.Add(Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity));
                    planetTemp.transform.localScale = new Vector3(randScale, randScale, randScale);
                }

            }
            //planetTemp = Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
            
        }
        */
        
    }
}
