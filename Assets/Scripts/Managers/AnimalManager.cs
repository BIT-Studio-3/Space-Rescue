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

    // Start is called before the first frame update
    void Start()
    {
        AnimalSpawn();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void AnimalSpawn()
    {
        for (int i = 0; i < Random.Range(2, 11); i++)
        {
            range = new Vector3(Random.Range(-area, area), 0f, Random.Range(-area, area));
            Instantiate(animalPrefab, range, Quaternion.identity);
        }
    }
}
