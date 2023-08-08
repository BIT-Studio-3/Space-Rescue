// Description: This script is used to spawn animals on the planet
// Author: Erika Stuart
// Last Updated: 8/08/2023
// Last Updated by: Palin Wiseman
// To-do: Spawn areas, select what animals spawn
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script is used for global animals / animals before spawn
public class AnimalManager : MonoBehaviour
{
    [SerializeField]
    private GameObject animalPrefab; //needs to be public to be assigned
    private GameObject animalParent;
    private GameObject animal;
    private float sphere;
    private int radius;
    private Vector3 area;

    private const int MIN = 2;
    private const int MAX = 11;

    // Start is called before the first frame update
    void Start()
    {
        animalParent = GameObject.Find("AnimalParent"); //Finds the gameobject in the scene named "AnimalParent" and is assigned to the variable
        sphere = GameObject.Find("Planet").transform.localScale.x; //Finds the gameobject in the scene named "Planet" and gets the scale
        radius = (int)sphere / 2; //Converts sphere to an int and divides by 2 get the radius
        AnimalSpawn();
    }

    //Spawns animals randomly on the surface of a sphere
    private void AnimalSpawn()
    {
        int animals = Random.Range(MIN, MAX);
        for (int i = 0; i < animals; i++)
        {
            area = Random.onUnitSphere * radius; //onUnitSphere does the math of the surface of a spherical object multiplied by the radius
            animal = Instantiate(animalPrefab, area, Quaternion.identity);
            animal.transform.parent = animalParent.transform; //all the instantiated animals are moved to the parent object that stays in the scene all the time so animals don't migrate scenes
        }
    }
}
