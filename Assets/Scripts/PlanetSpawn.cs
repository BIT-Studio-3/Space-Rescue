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
    public GameObject planetPrefab; //the planet prefab
    //public Transform planetSpawnPoint;
    private int spawnRange;

    // Start is called before the first frame update
    void Start()
    {
        SpawningPlanet();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Mouse0))
        {
            SpawningPlanet();
        }
    }

    public void SpawningPlanet()
    {
        //Destroy(planetPrefab);
        for (int i = 0; i<3; i++)
        {
            spawnRange = Random.Range(-10, 11);
        }
        Instantiate(planetPrefab, new Vector3(spawnRange, spawnRange, spawnRange), Quaternion.identity);
    }
}
