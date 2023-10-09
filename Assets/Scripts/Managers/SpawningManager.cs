// Description: Script is used for planet object spawning
// Created by: Erika Stuart
// Last Updated: 19/09/2023
// Last Updated By: Chase Bennett-Hill
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawningManager : MonoBehaviour
{
    //The current object being spawned and the parent it is being moved to
    private GameObject currentPrefab;
    private GameObject currentParent;

    //The parents the objects are being moved to. This is assigned in the editor
    [Header("Parents")]
    [SerializeField]
    private GameObject animalParent;

    [SerializeField]
    private GameObject treeParent;

    //The prefabs that are being spawned. This is assigned in the editor
    [Header("Prefabs")]
    private GameObject hostilePrefab; //The prefab that will be used for the hostile animal
    private GameObject neutralPrefab; //The prefab that will be used for the neutral animal
    private GameObject scaredPrefab; //The prefab that will be used for the Scared animal
    private GameObject foliagePrefab; //The prefab that will be used for the foliage

    //The amount of objects that are being spawned. This is gotten from the planet info script for the planet entered
    private int hostileCount;
    private int scaredCount;
    private int neutralCount;
    private int treeCount;

    private float radius;
    private GameObject newSpawn;
    private Vector3 area;
    private Collider[] hitColliders;

    void Start()
    {

        radius = GameObject.Find("Planet").transform.localScale.x / 2 + 5; //This is giving a buffer so that the object wont spawn inside the planet
        //Setting the prefabs to spawn
        //For each prefab it finds the active planet, and sets it to the selected one in the list from PlanetInfo.
        hostilePrefab = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].hostilePrefabs[PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].selectedHostile];
        scaredPrefab = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].scaredPrefabs[PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].selectedScared];
        neutralPrefab = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].neutralPrefabs[PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].selectedNeutral];
        foliagePrefab = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].foliagePrefabs[PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].selectedFoliage];
        //Setting the amount of objects to be spawned
        hostileCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].hostileCount;
        scaredCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].scaredCount;
        neutralCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].neutralCount;
        treeCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].treeCount;


        //Spawning the objects
        Spawn(hostileCount, hostilePrefab, animalParent);
        Spawn(scaredCount, scaredPrefab, animalParent);
        Spawn(neutralCount, neutralPrefab, animalParent);
        Spawn(treeCount, foliagePrefab, treeParent);
    }

    //Spawns objects randomly on the surface of a sphere
    private void Spawn(int amount, GameObject prefab, GameObject parent)
    {
        for (int i = 0; i < amount; i++)
        {
            int reps = 0;
            do
            {
                if (reps > 100) //If it can't find a spot after 100 tries, it will end the spawning
                {
                    return;
                }
                reps++; //Protection against infinite loop
                area = Random.onUnitSphere * radius; //onUnitSphere does the math of the surface of a spherical object multiplied by the radius
                hitColliders = Physics.OverlapSphere(area, 1);
            } while (hitColliders.Length != 0); //If something is already there, it will keep trying to spawn until it finds an empty spot
            newSpawn = Instantiate(prefab, area, Quaternion.identity);
            if (prefab.GetComponent<Animal>() != null)
                newSpawn.name = prefab.GetComponent<Animal>().Species; //Sets the name of the object to the species of the animal
            newSpawn.transform.rotation = Quaternion.FromToRotation(
                Vector3.up,
                newSpawn.transform.position
            );
            //Send a raycast towards the planet and move the object to the point where it hits the planet
            if (
                Physics.Raycast(
                    newSpawn.transform.position,
                    -newSpawn.transform.up,
                    out RaycastHit hit
                )
            )
            {
                newSpawn.transform.position = hit.point;
            }
            newSpawn.transform.parent = parent.transform; //all the instantiated objects are moved to the parent object
        }
    }
}
