using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script is used for global animals / animals before spawn
public class AnimalManager : MonoBehaviour
{
    [SerializeField]
    public GameObject animalPrefab;
    private Vector3 area;

    private const int MIN = 2;
    private const int MAX = 11;

    // Start is called before the first frame update
    void Start()
    {
        AnimalSpawn();
    }

    private void AnimalSpawn()
    {
        for (int i = 0; i < Random.Range(MIN, MAX); i++)
        {
            area = Random.onUnitSphere * 25;
            Instantiate(animalPrefab, area, Quaternion.identity);
        }
    }
}
