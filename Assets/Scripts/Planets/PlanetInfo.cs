// Description: This script is used to store the information of the planet.
// Author: Palin Wiseman
// Last Updated: 5/09/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
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

    void Awake()
    {
        hostileCount = Random.Range(HOSTILEMIN, HOSTILEMAX);
        scaredCount = Random.Range(SCAREDMIN, SCAREDMAX);
        neutralCount = Random.Range(NEUTRALMIN, NEUTRALMAX);
        treeCount = Random.Range(TREEMIN, TREEMAX);
        totalAnimals = hostileCount + scaredCount + neutralCount;
    }
}
