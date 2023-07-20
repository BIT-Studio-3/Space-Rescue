using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HudBehaviour : MonoBehaviour
{
    // Start is called before the first frame update
    public static HudBehaviour instance;
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
        GameObject status = GameObject.Find("Status");
        status.GetComponent<Text>().text = "Status: " + planet.planetRescued;
        gameObject.SetActive(true);

    }
}
