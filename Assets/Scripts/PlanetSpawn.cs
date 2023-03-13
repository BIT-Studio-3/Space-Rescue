using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/* To Do
 * + When the game starts, spawn planet prefab 
 * + Planet position should be random on spawn (In a range)
 * + Random scale
 * + Many planets should exist on spawn 
 */
public class PlanetSpawn : MonoBehaviour
{
    //variables
    public GameObject planetPrefab; //the planet prefab - used for manager gameobject
    private GameObject planetTemp;
    private int spawnX;
    private int spawnY;
    private int spawnZ;
    private int randScale;
    private string[] planetNames = {"1","2","3","4","5" }; //placeholder names
    /*
    I use names here for comparing different planets from each other (I was going to use this for scale but I didn't)
    I could have created a tag and added it to each prefab but we might need the tag space later on
    and they work essentially the same
    */


    // Start is called before the first frame update
    void Start()
    {

        for (int i = 0; i < 5; i++)
        {
            SpawningPlanet();
            planetTemp.name = planetNames[i];
        }
    }

    //is called each iteration of that for loop so this describes ONE planet
    public void SpawningPlanet()
    {
        spawnX = Random.Range(-50, 151);
        spawnY = Random.Range(1, 50); //temporarily Y:1+ so planets don't spawn inside or under the plane
        spawnZ = Random.Range(-50, 151);
        randScale = Random.Range(5, 51);
        planetTemp = Instantiate(planetPrefab, new Vector3(spawnX, spawnY, spawnZ), Quaternion.identity);
        planetTemp.transform.localScale = new Vector3(randScale, randScale, randScale);
    }
}
