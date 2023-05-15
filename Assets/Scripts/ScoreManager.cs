using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ScoreManager : MonoBehaviour
{
    public Text planetsRemaining;
    public Text planetsSaved;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        planetsSaved.text = "Rescued: " + GameSettings.Score.ToString();
        planetsRemaining.text = "Remaining: " + GameObject.Find("arrow").GetComponent<FindingPlanets>().planetsNotRescued.Count.ToString();
    }
}
