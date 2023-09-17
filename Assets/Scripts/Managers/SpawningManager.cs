// Description: Script is used for planet object spawning
// Created by: Erika Stuart
// Last Updated: 17/09/2023
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
    private GameObject AnimalParent;

    [SerializeField]
    private GameObject TreeParent;

    //The prefabs that are being spawned. This is assigned in the editor
    [Header("Prefabs")]
    [SerializeField]
    private List<GameObject> hostilePrefabs; //List of prefabs that can be used for the hostile animal
    [SerializeField]
    private List<GameObject> neutralPrefabs; //List of prefabs that can be used for the neutral animal
    private List<GameObject> scaredPrefabs; //List of prefabs that can be used for the Scared animal
    [SerializeField]
    private List<GameObject> foliagePrefabs; //List of prefabs that can be used for the foliage
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
        // hostilePrefabs = new List<GameObject>();
        // neutralPrefabs = new List<GameObject>();
        // scaredPrefabs = new List<GameObject>();
        // foliagePrefabs = new List<GameObject>();
        radius = GameObject.Find("Planet").transform.localScale.x / 2 + 5; //This is giving a buffer so that the object wont spawn inside the planet

        //Setting the amount of objects to be spawned
        hostileCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].hostileCount;
        scaredCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].scaredCount;
        neutralCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].neutralCount;
        treeCount = PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].treeCount;
        //Spawning the objects
        Spawn(hostileCount, hostilePrefabs[Random.Range(0, hostilePrefabs.Count)], AnimalParent);
        Spawn(scaredCount, scaredPrefabs[Random.Range(0,scaredPrefabs.Count)], AnimalParent);
        Spawn(neutralCount, neutralPrefabs[Random.Range(0,neutralPrefabs.Count)], AnimalParent);
        Spawn(treeCount, foliagePrefabs[Random.Range(0,foliagePrefabs.Count)], TreeParent);
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
