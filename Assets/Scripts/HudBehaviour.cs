using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HudBehaviour : MonoBehaviour
{
    // Start is called before the first frame update
    public static HudBehaviour instance;
    public GameObject status;
    void Awake()
    {
        instance = this;
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void ShowPlanetInfo(PlanetDetection planet)
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = true;
        status.GetComponent<Text>().enabled = true;
        status.GetComponent<Text>().text = "Status: " + planet.planetRescued;

    }


    public void HidePlanetInfo()
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = false;
        status.GetComponent<Text>().enabled = false;
    }
}
