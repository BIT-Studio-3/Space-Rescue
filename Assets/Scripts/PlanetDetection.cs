using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetDetection : MonoBehaviour
{

    public bool playerInsideRadius;
    public bool planetRescued;
    public bool inDanger;
    //Temp Materials
    public Material complete; //Color of rescued planet
    public Material withinRadius; //Color of planet when within the radius
    public Material normal; //Color of normal planet 
   // public GameObject pressKey; //Text indicator for user interface

    public GameObject planet; //the planet prefab







    void Update()
    {
        if(GameSettings.Tutorial && GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips.Count != 0)
        {

            if(playerInsideRadius && GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Approaching" &&  GameObject.Find("Approaching") != null && GameObject.Find("Approaching").GetComponent<ToolTip>().isActive)
            {
                GameObject.Find("Approaching").GetComponent<ToolTip>().completed = true;
            }
        }
        if(Input.GetKeyDown(KeyCode.R))
        {
            if(playerInsideRadius && !planetRescued)
            {
                if(GameSettings.Tutorial)
                {
                    if(playerInsideRadius && GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Rescue" &&  GameObject.Find("Rescue") != null && GameObject.Find("Rescue").GetComponent<ToolTip>().isActive)
                    {
                        GameObject.Find("Rescue").GetComponent<ToolTip>().completed = true;
                    } 
                }
                planetRescued = true;
                GameSettings.Score++;
                if(inDanger)
                {
                    GameSettings.PlanetDanger--;
                    BHWarning.Instance.PlanetWarning();
                }
            }
        }

    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInsideRadius = true;
            if(!planetRescued)
            {
            }
        }
        if (other.CompareTag("Black Hole Warning"))
        {
            inDanger = true;
        }

    }
    

    private void OnTriggerExit(Collider other)
    //When the player leaves the radius the planet is no longer active.
    {
        if (other.CompareTag("Player")) 
        {
            playerInsideRadius = false;
            if(!planetRescued) //If the player has not rescued the planet it will return to default other wise it will remain completed.
            {
            }
        }
    }
}
