using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//using System.Math;

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
    private bool isNotCollision;
    private int loopCounter;

    //inspector editable variables
    public int spawnRange = 10000;
    public int spawnCount = 10;

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
            do
            {
                //does the random spawn stuff
                spawnX = Random.Range(-spawnRange, spawnRange);
                spawnY = Random.Range(1, spawnRange); //temporarily Y:1+ so planets don't spawn inside or under the plane
                spawnZ = Random.Range(-spawnRange, spawnRange);
                randScale = Random.Range(50, 101);
                loopCounter++;
                
                if (planets.Count == 0) //if the list is empty

                {
                    isNotCollision = true; //set isnotcollided to true
                }
                else //if the list is not empty
                {
                    
                    for (int j = 0; j < planets.Count; j++)//checks through the list
                    {
                        if (Mathf.Abs(spawnX - planets[j].transform.position.x) > 100
                        || Mathf.Abs(spawnY - planets[j].transform.position.y) > 100
                        || Mathf.Abs(spawnZ - planets[j].transform.position.z) > 100) //and compares the distance
                        {
                            isNotCollision = true;
                        }
                    }
                }

                //prevents infinite loop
                if (loopCounter >= 10)
                {
                    break;
                }

            }while (!isNotCollision); //if its not true then it will try again

            loopCounter = 0;
            planetTemp = Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
            planetTemp.transform.localScale = new Vector3(randScale, randScale, randScale);
            planets.Add(planetTemp);
            isNotCollision = false;

        }
        
    }


}
