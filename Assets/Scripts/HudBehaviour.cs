using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HudBehaviour : MonoBehaviour
{
    // Start is called before the first frame update
    public static HudBehaviour instance;
    public GameObject Status,Name,Distance;
    void Awake()
    {
        instance = this;
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void ShowPlanetInfo(PlanetDetection planetStatus,float planetDistance, string planetName)
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = true;
        Status.GetComponent<Text>().enabled = true;
        Status.GetComponent<Text>().color = (planetStatus.planetRescued ? Color.green : Color.red);
        Status.GetComponent<Text>().text = "Status: " + (planetStatus.planetRescued ? "Rescued" : "Not Rescued");
        Distance.GetComponent<Text>().enabled = true;
        Distance.GetComponent<Text>().text = "Distance: " + planetDistance.ToString();
        Name.GetComponent<Text>().enabled = true;
        Name.GetComponent<Text>().text = planetName;


    }


    public void HidePlanetInfo()
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = false;
        Status.GetComponent<Text>().enabled = false;
        Name.GetComponent<Text>().enabled = false;
        Distance.GetComponent<Text>().enabled = false;

    }
}
