//Description: This script is responsible for displaying the information about the planets and the black hole on the HUD
//Author: Chase Bennett
//Last Updated: 5/09/2023
//Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HudBehaviour : MonoBehaviour
{
    // Start is called before the first frame update
    public static HudBehaviour Instance;
    public GameObject planetStatus,
        objectName,
        distFromPlayer,
        blackHolePlanetDist,
        planetLand; //The HUD Text Objects

    void Awake()
    {
        Instance = this;
        HideInfoPanel();
    }

    //Displays the Planet Info Panel with information about the planet
    //PlanetDetection status: the Planet Detection script attached to the planet has info about whether the planet has been rescued and if the player is close enough to land
    //dist: the distance between the player and the planet distBlackHole: distance between planet and blackhole, name: name of the planet

    public void ShowPlanetInfo(PlanetDetection status, float dist, float distBlackHole, string name)
    {
        ShowHudItems(true);
        planetStatus.GetComponent<Text>().color = (
            PlanetStates.Instance.planetInfo[status.planetID].totalAnimals == 0
                ? Color.green
                : Color.red
        );
        if (PlanetStates.Instance.planetInfo[status.planetID].totalAnimals > 0)
        {
            planetStatus.GetComponent<Text>().text =
                "Animals: "
                + PlanetStates.Instance.planetInfo[status.planetID].totalAnimals.ToString();
        }
        else
        {
            planetStatus.GetComponent<Text>().text = "All animals rescued!";
        }
        distFromPlayer.GetComponent<Text>().text = "Distance: " + dist.ToString();
        blackHolePlanetDist.GetComponent<Text>().text = "Black Hole: " + distBlackHole.ToString();
        if (status.inDanger) //If the planet is inside the warning area of the black hole
        {
            if (distBlackHole < 150f) //When the distance is under 150 the text turns red as a severe warning
            {
                blackHolePlanetDist.GetComponent<Text>().color = Color.red;
            }
            else
            {
                blackHolePlanetDist.GetComponent<Text>().color = new Color(1.0f, 0.64f, 0.0f); //otherwise it is orange
            }
        }
        else
        {
            blackHolePlanetDist.GetComponent<Text>().color = objectName.GetComponent<Text>().color; //If the planet is out of danger the distance returns to the standard color
        }
        objectName.GetComponent<Text>().text = name;
        planetLand.GetComponent<Text>().text = (
            status.playerInsideRadius ? "Ready to Land" : "Fly Closer to Land"
        ); //Tooltip about when the player can land
        planetLand.GetComponent<Text>().color = (
            status.playerInsideRadius ? Color.green : objectName.GetComponent<Text>().color
        ); //sets color to green or standard blue
    }

    public void ShowBlackholeInfo(float dist) //Shows the Panel with the distance from the blackhole
    {
        HideInfoPanel();
        gameObject.GetComponent<Image>().enabled = true; //show or hide the panel sprite
        objectName.GetComponent<Text>().enabled = true;
        distFromPlayer.GetComponent<Text>().enabled = true;
        objectName.GetComponent<Text>().text = "Black Hole";
        distFromPlayer.GetComponent<Text>().text = "Distance: " + dist.ToString();
    }

    public void HideInfoPanel()
    {
        ShowHudItems(false);
    }

    public void ShowHudItems(bool visible) //Shows or hides all the hudItems
    {
        gameObject.GetComponent<Image>().enabled = visible; //show or hide the panel sprite
        planetStatus.GetComponent<Text>().enabled = visible;
        objectName.GetComponent<Text>().enabled = visible;
        distFromPlayer.GetComponent<Text>().enabled = visible;
        blackHolePlanetDist.GetComponent<Text>().enabled = visible;
        planetLand.GetComponent<Text>().enabled = visible;
    }
}
