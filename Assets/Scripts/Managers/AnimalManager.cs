using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script is used for global animals / animals before spawn
public class AnimalManager : MonoBehaviour
{
    [SerializeField]
    public GameObject animalPrefab;
    public GameObject animalParent;
    private GameObject animal;
    private Vector3 area;

    private const int MIN = 2;
    private const int MAX = 11;

    // Start is called before the first frame update
    void Start()
    {
        animalParent = GameObject.Find("AnimalParent");
        AnimalSpawn();
    }

    private void AnimalSpawn()
    {
        for (int i = 0; i < Random.Range(MIN, MAX); i++)
        {
            area = Random.onUnitSphere * 25;
            animal = Instantiate(animalPrefab, area, Quaternion.identity);
            animal.transform.parent = animalParent.transform;
        }
    }
}
