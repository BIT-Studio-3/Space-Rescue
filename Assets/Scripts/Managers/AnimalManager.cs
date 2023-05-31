using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script is used for global animals / animals before spawn
public class AnimalManager : MonoBehaviour
{
    [SerializeField]
    public GameObject animalPrefab;
    private Vector3	range; 

    private const float AREA = 50;
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
            range = new Vector3(Random.Range(-AREA, AREA), Random.Range(-AREA, AREA), Random.Range(-AREA, AREA));
            Instantiate(animalPrefab, range, Quaternion.identity);
        }
    }
}
