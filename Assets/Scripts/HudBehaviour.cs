using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HudBehaviour : MonoBehaviour
{
    // Start is called before the first frame update
    public static HudBehaviour instance;
    public GameObject planetStatus,planetName,playerPlanetDistance,blackHolePlanetDist,planetLand; //The HUD Text Objects
    private List<GameObject> hudItems; //Holds the list of hudItems to quickly show and hide them
    void Awake()
    {
        instance = this;
        hudItems = new List<GameObject> {planetStatus,planetName,playerPlanetDistance,blackHolePlanetDist,planetLand};
    }


    public void ShowPlanetInfo(PlanetDetection status,float dist,float distBlackHole, string name)
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = true;

        foreach(GameObject hudItem in hudItems)
        {
            hudItem.GetComponent<Text>().enabled = true;
        }
        planetStatus.GetComponent<Text>().color = (status.planetRescued ? Color.green : Color.red);
        planetStatus.GetComponent<Text>().text = "Status: " + (status.planetRescued ? "Rescued" : "Not Rescued");
        playerPlanetDistance.GetComponent<Text>().text = "Distance: " + dist.ToString();
        blackHolePlanetDist.GetComponent<Text>().text = "Black Hole: " + distBlackHole.ToString();
        if(status.inDanger)
        {
            if(distBlackHole < 150f)
            {
                blackHolePlanetDist.GetComponent<Text>().color = Color.red;

            }
            else
            {
            blackHolePlanetDist.GetComponent<Text>().color = new Color(1.0f, 0.64f, 0.0f);

            }

        }
        else
        {
            blackHolePlanetDist.GetComponent<Text>().color =  planetName.GetComponent<Text>().color;
        }
        
        planetName.GetComponent<Text>().text = name;
        
        planetLand.GetComponent<Text>().text = (status.playerInsideRadius ? "Ready to Land" : "Fly Closer to Land");
        planetLand.GetComponent<Text>().color = (status.playerInsideRadius ? Color.green : planetName.GetComponent<Text>().color);



    }


    public void HidePlanetInfo()
    {
        gameObject.GetComponent<SpriteRenderer>().enabled = false;

        foreach(GameObject hudItem in hudItems)
        {
            hudItem.GetComponent<Text>().enabled = false;
        }


    }
}
