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
    public List<GameObject> planets = new List<GameObject>();
    private bool isNotCollision;
    private int loopCounter;
    private int spawnRange = 2000;
    private int spawnCount = 10;

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
            do //one iteration of a potential planet spawn
            {
                //does the random spawn stuff
                spawnX = Random.Range(-spawnRange, spawnRange);
                spawnY = Random.Range(-spawnRange, spawnRange);
                spawnZ = Random.Range(-spawnRange, spawnRange);
                randScale = Random.Range(100, 300);
                loopCounter++;
                
                if (planets.Count == 0) //if the list is empty

                {
                    isNotCollision = true; //set isnotcollided to true
                }
                else //if the list is not empty
                {
                    for (int j = 0; j < planets.Count; j++)//checks through the list
                    {
                        // This will check through the entire list of currently spawned planets
                        // If any of them are in range then the loop will continue without setting it to true
                        if (Mathf.Abs(spawnX - planets[j].transform.position.x) > 100
                        && Mathf.Abs(spawnY - planets[j].transform.position.y) > 100
                        && Mathf.Abs(spawnZ - planets[j].transform.position.z) > 100) //and compares the distance
                        {
                            isNotCollision = true;
                        }
                        else
                        {
                            isNotCollision = false; //ensures that even if it's set to true, it gets reset back to false when the for loop breaks
                            j = planets.Count; //forces it to end the loop
                        }
                    }
                }

                //prevents infinite loop
                if (loopCounter >= 10)
                {
                    break;
                }

            }while (!isNotCollision); //if its not true then it will try again
            //TODO add loop counter to while loop
            loopCounter = 0;
            planetTemp = Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
            planetTemp.transform.localScale = new Vector3(randScale, randScale, randScale);
            planets.Add(planetTemp);
            isNotCollision = false;
        }
        
    }


}
