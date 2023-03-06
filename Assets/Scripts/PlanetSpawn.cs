using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/* To Do
 * - When the game starts, spawn planet prefab
 * - Planet position should be random on spawn (In a range)
 * - Random scale
 * - Many planets should exist on spawn
 * - 
 */
public class PlanetSpawn : MonoBehaviour
{
    public GameObject planetPrefab;
    //public Transform planetSpawnPoint;
    // Start is called before the first frame update
    void Start()
    {
        SpawningPlanet();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void SpawningPlanet()
    {
        Instantiate(planetPrefab, new Vector3(0, 1, 0), Quaternion.identity);
    }
}
