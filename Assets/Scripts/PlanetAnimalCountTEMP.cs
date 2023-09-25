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
    public List<GameObject> panels = new List<GameObject>(); //the grid of panels that the animals will spawn as a child on
    public List<GameObject> collectedAnimals = new List<GameObject>();

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

    }

    public void AnimalCount(string name) //Sent from AnimalController.cs
    {
        if (name.Contains("Neutral"))
        {
            calmCaught += 1;
            calmUI.text = "Calm Caught: " + calmCaught;
            //add to list

            GameObject uiAnimal = Instantiate(neutral, new Vector3(panels[0].transform.position.x + 10, panels[0].transform.position.y - 30, panels[0].transform.position.z + 6), Quaternion.identity, panels[0].transform);
            collectedAnimals.Add(uiAnimal);
            uiAnimal.layer = 5;
            //uiAnimal.transform.GetChild(1).gameObject.layer = 5;
            foreach(Transform child in uiAnimal.transform.GetChild(1))
            {
                child.gameObject.layer = 5;
            }

            //collectedAnimals.Add(Instantiate(neutral, new Vector3(panels[0].transform.position.x, panels[0].transform.position.y, 24), Quaternion.identity)); //adds it to the latest empty spot
            uiAnimal.transform.localScale = new Vector3(40, 40, 40);
    	    Destroy(uiAnimal.GetComponent<Rigidbody>()); //gets rid of the rigidbody
            Destroy(uiAnimal.GetComponent<AnimalController>());
            Destroy(uiAnimal.GetComponent<GravityBody>());

            Debug.Log("Spawned");
        }
        else if (name.Contains("Hostile"))
        {
            hostileCaught += 1;
            hostileUI.text = "Hostile Caught: " + hostileCaught;
            collectedAnimals.Add(Instantiate(hostile));

        }
        else if (name.Contains("Scared"))
        {
            scaredCaught += 1;
            scaredUI.text = "Scared Caught: " + scaredCaught;
            collectedAnimals.Add(Instantiate(scared));

        }
    }

}
