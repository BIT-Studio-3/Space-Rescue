// Description: This script spawns the planets in the game. It spawns them in a random location and then rotates them around the black hole.
// Author: Erika Stuart
// Last Modified By: Palin Wiseman
// Last Modified Date: 06/08/2023

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetSpawn : MonoBehaviour
{
    //variables
    [SerializeField]
    private GameObject planetPrefab; //the planet prefab
    public List<GameObject> planets = new List<GameObject>(); //Needs to be public for detection scripts
    private GameObject planetTemp;
    private GameObject planetParent;
    private int xDistance;
    private int scale;
    private const int SPAWNCOUNT = 8;
    private const int SCALEMIN = 50;
    private const int SCALEMAX = 250;
    private const int YZONE = 30; //Planets can spawn within x degrees from 0 up and down from the black hole
    private const int ORBITAREA = 350; //A planet will spawn every x amount of units away from the black hole
    private const int BUFFER = 800; //Buffer away from the black hole so planets don't spawn too close

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
            xDistance = i * ORBITAREA + BUFFER; //Set xDistance
            scale = Random.Range(SCALEMIN, SCALEMAX); //Random scale
            planetTemp = Instantiate(
                planetPrefab,
                new Vector3(xDistance, 0, 0),
                Quaternion.identity
            ); //Spawn planet
            planetTemp.transform.localScale = new Vector3(scale, scale, scale); //Set scale
            GameObject rotator = new GameObject("Rotator"); //Create a new gameobject to rotate the planet around
            planetTemp.transform.parent = rotator.transform; //Set planet to have parent rotator
            rotator.transform.Rotate(0, Random.Range(0, 360), Random.Range(-YZONE, YZONE)); //Rotate the rotator a random amount of degrees
            rotator.AddComponent<PlanetRotate>(); //Add the planet rotate script to the rotator
            rotator.transform.parent = planetParent.transform; //Set rotator to have overall parent
            planets.Add(planetTemp);
        }
    }
}
