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
