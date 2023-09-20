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
    /*
    The animals and their spaces visual guide
    collected animals =
    {  (col)
  (row) {1, 2, 3, 4, 5},
        {1, 2, 3, 4, 5},
    }
    */


    //public SpawningManager spawningManager;
    public static PlanetAnimalCountTEMP	Instance;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        calmUI = GameObject.Find("Calm Caught").GetComponent<TMPro.TextMeshProUGUI>();
        hostileUI = GameObject.Find("Hostile Caught").GetComponent<TMPro.TextMeshProUGUI>();
        scaredUI = GameObject.Find("Scared Caught").GetComponent<TMPro.TextMeshProUGUI>();

        /*collectedAnimals = new GameObject[2,5];
        for (int row = 0; row < collectedAnimals.GetLength(0); row++) //GetLength(0) is the 2
        {
            for (int col = 0; col < collectedAnimals.GetLength(1); col++)//GetLength(1) is the 5
            {
                //collectedAnimals[GameObject.Find("Row "), GameObject.Find("{col}")];
                
            }
        }*/
        /*for (int i = 0; i < 10; i++)
        {
            panels.Add(GameObject.Find("Panel" + i));
        }*/
    }

    public void AnimalCount(string name) //Sent from AnimalController.cs
    {
        if (name.Contains("Neutral"))
        {
            calmCaught += 1;
            calmUI.text = "Calm Caught: " + calmCaught;
            //add to list

            collectedAnimals.Add(Instantiate(neutral, new Vector3(panels[0].transform.position.x, panels[0].transform.position.y, 24), Quaternion.identity)); //adds it to the latest empty spot
            neutral.transform.localScale = new Vector3(40, 40, 40);
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
