using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetInfo : MonoBehaviour
{
    public int hostileCount;
    private const int HOSTILEMIN = 1;
    private const int HOSTILEMAX = 2;

    public int scaredCount;
    private const int SCAREDMIN = 1;
    private const int SCAREDMAX = 4;
    
    public int neutralCount;
    private const int NEUTRALMIN = 3;
    private const int NEUTRALMAX = 12;

    public int treeCount;
    private const int TREEMIN = 0;
    private const int TREEMAX = 20;

    public int totalAnimals;

    void Awake()
    {
        hostileCount = Random.Range(HOSTILEMIN, HOSTILEMAX);
        scaredCount = Random.Range(SCAREDMIN, SCAREDMAX);
        neutralCount = Random.Range(NEUTRALMIN, NEUTRALMAX);
        treeCount = Random.Range(TREEMIN, TREEMAX);
        totalAnimals = hostileCount + scaredCount + neutralCount;
    }
}
