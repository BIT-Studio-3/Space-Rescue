using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetAnimalCountTEMP : MonoBehaviour
{
    private int calmCaught = 0;
    private int calmSpawned;
    private TMPro.TextMeshProUGUI calmUI;

    private int hostileCaught = 0;
    private int hostileSpawned;
    private TMPro.TextMeshProUGUI hostileUI;

    private int scaredCaught = 0;
    private int scaredSpawned;
    private TMPro.TextMeshProUGUI scaredUI;

    //private GameObject[,] collectedAnimals; //= new GameObject[2,5]; //[row, col]
    private List<GameObject> panels = new List<GameObject>(); //the grid of panels that the animals will spawn as a child on
    public List<GameObject> collectedAnimals = new List<GameObject>();
    private int lastSpace;

    //prefabs
    public GameObject neutral;
    public GameObject hostile;
    public GameObject scared;


    //public SpawningManager spawningManager;
    public static PlanetAnimalCountTEMP	Instance;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        calmUI = GameObject.Find("Calm Caught").GetComponent<TMPro.TextMeshProUGUI>();
        hostileUI = GameObject.Find("Hostile Caught").GetComponent<TMPro.TextMeshProUGUI>();
        scaredUI = GameObject.Find("Scared Caught").GetComponent<TMPro.TextMeshProUGUI>();

        for (int i = 0; i < 25; i++)
        {
            panels.Add(GameObject.Find("Panel " + i));
        }

    }

    public void AnimalCount(string name) //Sent from AnimalController.cs
    {
        if (name.Contains("Neutral"))
        {
            calmCaught += 1;
            calmUI.text = "Calm Caught: " + calmCaught;
            SpawnUIAnimal(neutral);
        

            Debug.Log("Spawned");
        }
        else if (name.Contains("Hostile"))
        {
            hostileCaught += 1;
            hostileUI.text = "Hostile Caught: " + hostileCaught;
            SpawnUIAnimal(hostile);

        }
        else if (name.Contains("Scared"))
        {
            scaredCaught += 1;
            scaredUI.text = "Scared Caught: " + scaredCaught;
            SpawnUIAnimal(scared);
        }
    }

    public void SpawnUIAnimal(GameObject type)
    {
        GameObject uiAnimal = Instantiate(type, new Vector3(panels[collectedAnimals.Count].transform.position.x + 10, panels[collectedAnimals.Count].transform.position.y - 30, panels[collectedAnimals.Count].transform.position.z + 6), Quaternion.Euler(0,180,0), panels[0].transform);
        collectedAnimals.Add(uiAnimal);
        uiAnimal.layer = 5;

        //every child object of the animal needs to have the layer set, as they don't inherit layers from parent
        foreach(Transform child in uiAnimal.transform.GetChild(1)) //0 is collider, 1 is the animal body
        {
            child.gameObject.layer = 5; //UI layer
        }

        uiAnimal.transform.localScale = new Vector3(40, 40, 40);
        Destroy(uiAnimal.GetComponent<Rigidbody>()); //gets rid of the rigidbody
        Destroy(uiAnimal.GetComponent<AnimalController>());
        Destroy(uiAnimal.GetComponent<GravityBody>());
    }

}
