//Planet spawning script.
//Note from Palin: I am reworking this as the current version has several bugs. I am making it all spawn in the same Z axis and then each planet has a parent that is rotated a random amount of degrees around.
// This way there can only be one planet in each "orbit"
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetSpawn : MonoBehaviour
{
    //variables
    [SerializeField]
    private GameObject planetPrefab; //the planet prefab
    public List<GameObject> planets = new List<GameObject>();
    private GameObject planetTemp;
    private GameObject planetParent;
    private int spawnY;
    private int spawnZ;
    private int scale;
    private const int SPAWNCOUNT = 10;
    private const int SCALEMIN = 100;
    private const int SCALEMAX = 300;
    private const int YZONE = 30; //Planets can spawn within x degrees from 0 up and down from the black hole
    private const int ORBITAREA = 300; //A planet will spawn every x amount of units away from the black hole

    void Awake()
    {
        GameSettings.planetPrefabs = Resources.LoadAll<GameObject>("Planets");
        planetParent = GameObject.Find("Planet Parent");
        SpawningPlanet();
    }

    private void SpawningPlanet()
    {
        //SpawnCount is the desired number of planets
        for (int i = 0; i < SPAWNCOUNT; i++)
        {
            scale = Random.Range(SCALEMIN, SCALEMAX); //Random scale
            planetTemp = Instantiate(
                planetPrefab,
                new Vector3(i * ORBITAREA + 800, 0, 0),
                Quaternion.identity
            ); //Spawn planet
            planetTemp.transform.localScale = new Vector3(scale, scale, scale); //Set scale
            GameObject rotator = new GameObject("Rotator"); //Create a new gameobject to rotate the planet around
            planetTemp.transform.parent = rotator.transform; //Set planet to have parent rotator
            rotator.transform.Rotate(0, Random.Range(0, 360), Random.Range(-YZONE, YZONE)); //Rotate the rotator a random amount of degrees
            rotator.transform.parent = planetParent.transform; //Set rotator to have overall parent
            planets.Add(planetTemp);
        }
    }
}
