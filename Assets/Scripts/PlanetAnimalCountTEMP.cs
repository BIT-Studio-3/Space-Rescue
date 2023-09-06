using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetAnimalCountTEMP : MonoBehaviour
{
    public int calmCaught = 0;
    public int calmSpawned;
    public Text calmUI;

    public int hostileCaught = 0;
    public int hostileSpawned;
    public Text hostileUI;

    public int scaredCaught = 0;
    public int scaredSpawned;
    public Text scaredUI;

    //public SpawningManager spawningManager;
    public static PlanetAnimalCountTEMP	Instance;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        calmUI = GameObject.Find("Calm Caught").GetComponent<Text>();
        hostileUI = GameObject.Find("Hostile Caught").GetComponent<Text>();
        scaredUI = GameObject.Find("Scared Caught").GetComponent<Text>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void AnimalCount(string name)
    {
        if (name.Contains("Calm"))
        {
            calmCaught += 1;
            calmUI.text = "Calm Caught: " + calmCaught;
        }
        else if (name.Contains("Hostile"))
        {
            hostileCaught += 1;
        }
        else if (name.Contains("Scared"))
        {
            scaredCaught += 1;
        }
    }
}
