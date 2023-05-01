using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script is used for global animals / animals before spawn
public class AnimalManager : MonoBehaviour
{
    public List<int> saved = new List<int>();
    public GameObject animalPrefab;
    private Vector3	range;

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
        for (int i = 0; i < 5; i++)
        {
            range = new Vector3(Random.Range(-50f, 50f), 0f, Random.Range(-50f, 50f));
            Instantiate(animalPrefab, range, Quaternion.identity);
        }
    }
}
