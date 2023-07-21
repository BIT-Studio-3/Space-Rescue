using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HudBehaviour : MonoBehaviour
{
    // Start is called before the first frame update
    public static HudBehaviour instance;
    public GameObject planetStatus,planetName,playerPlanetDistance,blackHolePlanetDist,planetLand;
    private List<GameObject> hudItems;
    void Awake()
    {
        instance = this;
        hudItems = new List<GameObject> {planetStatus,planetName,playerPlanetDistance,blackHolePlanetDist,planetLand};
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void ShowPlanetInfo(PlanetDetection status,float dist, string name)
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = true;
        planetStatus.GetComponent<Text>().enabled = true;
        planetStatus.GetComponent<Text>().color = (status.planetRescued ? Color.green : Color.red);
        planetStatus.GetComponent<Text>().text = "Status: " + (status.planetRescued ? "Rescued" : "Not Rescued");
        playerPlanetDistance.GetComponent<Text>().enabled = true;
        playerPlanetDistance.GetComponent<Text>().text = "Distance: " + dist.ToString();
        planetName.GetComponent<Text>().enabled = true;
        planetName.GetComponent<Text>().text = name;
        planetLand.GetComponent<Text>().enabled = true;
        planetLand.GetComponent<Text>().text = (status.playerInsideRadius ? "Ready to Land" : "Fly Closer to Land");
        planetLand.GetComponent<Text>().color = (status.playerInsideRadius ? Color.green : planetName.GetComponent<Text>().color);



    }


    public void HidePlanetInfo()
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = false;
        // planetStatus.GetComponent<Text>().enabled = false;
        // planetName.GetComponent<Text>().enabled = false;
        // playerPlanetDistance.GetComponent<Text>().enabled = false;
        // planetLand.GetComponent<Text>().enabled = false;
        // blackHolePlanetDist.GetComponent<Text>().enabled = false;

        foreach(GameObject hudItem in hudItems)
        {
            hudItem.GetComponent<Text>().enabled = false;
        }


    }
}
