using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIAnimals : MonoBehaviour
{
    private List<GameObject> panels = new List<GameObject>(); //the grid of panels that the animals will spawn as a child on
    public List<GameObject> collectedAnimals = new List<GameObject>();
    private int lastSpace;

    //prefabs
    private GameObject neutral;
    private GameObject hostile;
    private GameObject scared;

    //public SpawningManager spawningManager;
    public static UIAnimals Instance;
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
        GameObject uiAnimal = Instantiate(type, new Vector3(panels[collectedAnimals.Count].transform.position.x + 10, panels[collectedAnimals.Count].transform.position.y - 30, panels[collectedAnimals.Count].transform.position.z + 20f), Quaternion.Euler(0, 205, 0), panels[0].transform);
        collectedAnimals.Add(uiAnimal);
        uiAnimal.layer = 5; //the ui layer
        GameObject model = uiAnimal.transform.Find("Model").gameObject;
        model.gameObject.layer = 5;
        Animator animator = uiAnimal.transform.Find("Model").GetComponent<Animator>();

        //every child object of the animal needs to have the layer set, as they don't inherit layers from parent
        foreach (Transform child in model.GetComponent<Transform>())
        {
            child.gameObject.layer = 5; //UI layer
        }

        uiAnimal.transform.localScale = new Vector3(40, 40, 40);
        //Removing scripts and components so they don't conflict with the game and stay static on the panel
        Destroy(uiAnimal.GetComponent<Rigidbody>());
        Destroy(uiAnimal.GetComponent<AnimalController>());
        Destroy(uiAnimal.GetComponent<GravityBody>());
        uiAnimal.tag = "Untagged";
        animator.Play("Idle_A");
    }

}
