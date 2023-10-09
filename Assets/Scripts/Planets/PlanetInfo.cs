// Description: This script is used to store the information of the planet.
// Author: Palin Wiseman
// Last Updated: 19/09/2023
// Last Updated By: Chase Bennett-Hill
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using Unity.Collections;
using UnityEngine;

public class PlanetInfo : MonoBehaviour
{
    //The count of each animal type on the planet with the range it can spawn in
    [HideInInspector]
    public int hostileCount;
    private const int HOSTILEMIN = 1;
    private const int HOSTILEMAX = 2;

    [HideInInspector]
    public int scaredCount;
    private const int SCAREDMIN = 1;
    private const int SCAREDMAX = 4;

    [HideInInspector]
    public int neutralCount;
    private const int NEUTRALMIN = 3;
    private const int NEUTRALMAX = 12;

    [HideInInspector]
    public int treeCount;
    private const int TREEMIN = 0;
    private const int TREEMAX = 20;

    [HideInInspector]
    public int totalAnimals;

    [HideInInspector]
    public Material planetMaterial; //The material of the texture of the planet

    [HideInInspector]
    public bool rings; //As there is only one ring this simply is true if they exist

    [Tooltip("The list of available prefabs that can be used for the hostile animal")]
    public List<GameObject> hostilePrefabs; //List of prefabs that can be used for the hostile animal

    [HideInInspector]
    public int selectedHostile;

    [Tooltip("The list of available prefabs that can be used for the neutral animal")]
    public List<GameObject> neutralPrefabs; //List of prefabs that can be used for the neutral animal

    [HideInInspector]
    public int selectedNeutral;

    [Tooltip("The list of available prefabs that can be used for the scared animal")]
    public List<GameObject> scaredPrefabs; //List of prefabs that can be used for the Scared animal

    [HideInInspector]
    public int selectedScared;

    [Tooltip("The list of available prefabs that can be used for the foliage")]
    public List<GameObject> foliagePrefabs; //List of prefabs that can be used for the foliage

    [HideInInspector]
    public int selectedFoliage;
    [Tooltip("The name of the hostile animal that was selected")]
    public string hostileName;
    [Tooltip("The name of the scared animal that was selected")]
    public string scaredName;
    [Tooltip("The name of the neutral animal that was selected")]
    public string neutralName;

    void Awake()
    {
        hostileCount = Random.Range(HOSTILEMIN, HOSTILEMAX);
        scaredCount = Random.Range(SCAREDMIN, SCAREDMAX);
        neutralCount = Random.Range(NEUTRALMIN, NEUTRALMAX);
        treeCount = Random.Range(TREEMIN, TREEMAX);

        totalAnimals = hostileCount + scaredCount + neutralCount;

        //Selects an index from each list of prefabs
        selectedFoliage = Random.Range(0, foliagePrefabs.Count);

        selectedHostile = hostilePrefabs.IndexOf(SelectAnimal(hostilePrefabs));
        hostileName = hostilePrefabs[selectedHostile].GetComponent<Animal>().Species;
        selectedScared = scaredPrefabs.IndexOf(SelectAnimal(scaredPrefabs));
        scaredName = scaredPrefabs[selectedScared].GetComponent<Animal>().Species;
        selectedNeutral = neutralPrefabs.IndexOf(SelectAnimal(neutralPrefabs));
        neutralName = neutralPrefabs[selectedNeutral].GetComponent<Animal>().Species;
    }

    private GameObject SelectAnimal(List<GameObject> animals) //Selects an animal from the list of prefabs based on their probability
    {
        int p = animals.Sum(x => x.GetComponent<Animal>().Probability); //Gets the sum of all the probabilities of the animals
        int random = Random.Range(0, p); //Gets a random number between 0 and the sum of the probabilities
        int cumulative = 0;
        foreach (GameObject animal in animals)
        {
            cumulative += animal.GetComponent<Animal>().Probability; //Adds all the probabilities together, so that when the random number is less than the cumulative, it will return that animal
            if (random < cumulative)
            {
                return animal;
            }
        }
        return null;
    }
}
