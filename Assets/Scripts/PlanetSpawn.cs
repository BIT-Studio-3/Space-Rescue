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
    private Collider planetCollider, a, b;
    private bool isNotCollision;

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
                spawnX = Random.Range(-spawnRange, spawnRange);
                spawnY = Random.Range(1, spawnRange); //temporarily Y:1+ so planets don't spawn inside or under the plane
                spawnZ = Random.Range(-spawnRange, spawnRange);
                randScale = Random.Range(50, 101);
                
                //does the random spawn stuff
                
                //if the list isn't empty
                if (planets.Count == 0)
                {
                    isNotCollision = true;
                }
                else
                {
                    for (int j = 0; j < planets.Count; j++)
                    {
                        if (Mathf.Abs(spawnX - planets[j].transform.position.x) > 100
                        || Mathf.Abs(spawnY - planets[j].transform.position.y) > 100
                        || Mathf.Abs(spawnZ - planets[j].transform.position.z) > 100)
                        {
                            isNotCollision = true;
                        }
                    }
                }

            }while (!isNotCollision);

            planetTemp = Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
            planetTemp.transform.localScale = new Vector3(randScale, randScale, randScale);
            planets.Add(planetTemp);
            isNotCollision = false;

        }
        
    }


}
