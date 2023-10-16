using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

//bugs:
// . neutral not showing on ui
// . temp drop ship counter goes down but cs110pm obj not set to instance

public class PlanetAnimalCountTEMP : MonoBehaviour
{
    private List<GameObject> panels = new List<GameObject>(); //the grid of panels that the animals will spawn as a child on
    public List<GameObject> collectedAnimals = new List<GameObject>();
    private int lastSpace;

    //prefabs
    private GameObject neutral;
    private GameObject hostile;
    private GameObject scared;


    //public SpawningManager spawningManager;
    public static PlanetAnimalCountTEMP Instance;
    public static AnimalController animalController;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;

        for (int i = 0; i < 25; i++)
        {
            panels.Add(GameObject.Find("Panel " + i));
        }

    }

    public void SpawnUIAnimal(GameObject type)
    {
        GameObject uiAnimal = Instantiate(type, new Vector3(panels[collectedAnimals.Count].transform.position.x + 10, panels[collectedAnimals.Count].transform.position.y - 30, panels[collectedAnimals.Count].transform.position.z + 6), Quaternion.Euler(0, 180, 0), panels[0].transform);
        collectedAnimals.Add(uiAnimal);
        Debug.Log(collectedAnimals.Count);
        uiAnimal.layer = 5;
        GameObject model = uiAnimal.transform.Find("Model").gameObject;
        model.gameObject.layer = 5;

        //every child object of the animal needs to have the layer set, as they don't inherit layers from parent
        foreach (Transform child in model.GetComponent<Transform>()) //0 is collider, 1 is the animal body
        {
            child.gameObject.layer = 5; //UI layer
        }

        uiAnimal.transform.localScale = new Vector3(40, 40, 40);
        Destroy(uiAnimal.GetComponent<Rigidbody>()); //gets rid of the rigidbody
        Destroy(uiAnimal.GetComponent<AnimalController>());
        Destroy(uiAnimal.GetComponent<GravityBody>());
        //animalController.Instance.animator.Play("Idle_A");
        
        //Destroy(uiAnimal.GetComponent<SphereCollider>());
    }

}
