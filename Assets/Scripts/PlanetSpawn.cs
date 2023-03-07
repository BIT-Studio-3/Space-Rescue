using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/* To Do
 * + When the game starts, spawn planet prefab 
 * - Planet position should be random on spawn (In a range)
 * - Random scale
 * - Many planets should exist on spawn
 * - 
 */
public class PlanetSpawn : MonoBehaviour
{
    //variables
    public GameObject planetPrefab; //the planet prefab - used for manager gameobject
    //public Transform planetSpawnPoint;
    private int spawnX;
    private int spawnY;
    private int spawnZ;

    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < 5; i++)
        {
            SpawningPlanet();
        }
    }

    // Update is called once per frame
    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.Mouse0))
        //{
        //    SpawningPlanet();
        //}
    }

    public void SpawningPlanet()
    {
        //Destroy(planetPrefab);
        //for (int i = 0; i<3; i++)
        //{
        spawnX = Random.Range(-10, 11);
        spawnY = Random.Range(1, 11); //temporarily Y:1+ so planets don't spawn inside or  
        spawnZ = Random.Range(-10, 11);
        //}
        Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
    }
}
