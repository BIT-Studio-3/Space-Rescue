// Script is used for planet object spawning
// Created by: Erika Stuart
// Last Updated: 8/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawningManager : MonoBehaviour
{
    [SerializeField]
    private GameObject prefab;

    [SerializeField]
    private GameObject parent;

    [SerializeField]
    private int minSpawn;

    [SerializeField]
    private int maxSpawn;
    
    private float radius;
    private GameObject newSpawn;
    private Vector3 area;
    private Collider[] hitColliders;

    void Start()
    {
        radius = GameObject.Find("Planet").transform.localScale.x / 2 + 5; //This is giving a buffer so that the object wont spawn inside the planet
        Spawn();
    }

    //Spawns objects randomly on the surface of a sphere
    private void Spawn()
    {
        int amount = Random.Range(minSpawn, maxSpawn);
        int reps = 0;
        for (int i = 0; i < amount; i++)
        {
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
            if (Physics.Raycast(newSpawn.transform.position, -newSpawn.transform.up, out RaycastHit hit))
            {
                newSpawn.transform.position = hit.point;
            }
            newSpawn.transform.parent = parent.transform; //all the instantiated objects are moved to the parent object
        }
    }
}
