using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetAnimalCountTEMP : MonoBehaviour
{
    private int calmCaught = 0;
    private int calmSpawned;
    private Text calmUI;

    private int hostileCaught = 0;
    private int hostileSpawned;
    private Text hostileUI;

    private int scaredCaught = 0;
    private int scaredSpawned;
    private Text scaredUI;

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

    public void AnimalCount(string name) //Sent from AnimalController.cs
    {
        if (name.Contains("Calm"))
        {
            calmCaught += 1;
            calmUI.text = "Calm Caught: " + calmCaught;
        }
        else if (name.Contains("Hostile"))
        {
            hostileCaught += 1;
            hostileUI.text = "Hostile Caught: " + hostileCaught;
        }
        else if (name.Contains("Scared"))
        {
            scaredCaught += 1;
            scaredUI.text = "Scared Caught: " + scaredCaught;
        }
    }
}
