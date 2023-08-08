using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script is used for global animals / animals before spawn
public class AnimalManager : MonoBehaviour
{
    [SerializeField]
    public GameObject animalPrefab; //needs to be public to be assigned
    private GameObject animalParent;
    private GameObject animal;
    private Vector3 area;

    private const int MIN = 2;
    private const int MAX = 12;

    // Start is called before the first frame update
    void Start()
    {
        animalParent = GameObject.Find("AnimalParent"); //Finds the gameobject in the scene named "AnimalParent" and is assigned to the variable
        AnimalSpawn();
    }

    //Spawns animals randomly on the surface of a sphere
    private void AnimalSpawn()
    {
        for (int i = 0; i < Random.Range(MIN, MAX); i++)
        {
            area = Random.onUnitSphere * 26; //onUnitSphere does the math of the surface of a spherical object multiplied by the radius
            animal = Instantiate(animalPrefab, area, Quaternion.identity);
            animal.transform.parent = animalParent.transform; //all the instantiated animals are moved to the parent object that stays in the scene all the time so animals don't migrate scenes
        }
    }
}
