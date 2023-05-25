using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetDetection : MonoBehaviour
{

    public bool playerInsideRadius;
    public bool planetRescued;
    public bool inDanger;


    public GameObject planet; //the planet prefab





    private void OnDestroy() 
    {
        GameObject o = GameObject.Find("arrow");
        if (o != null)
        {
            o.GetComponent<FindingPlanets>().planetsNotRescued.Remove(gameObject);
        }
    }

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

    private void OnDestroy() 
    {
        GameObject o = GameObject.Find("arrow");
        if (o != null)
        {
            o.GetComponent<FindingPlanets>().planetsNotRescued.Remove(gameObject);
        }
        GameObject a = GameObject.Find("PlanetManager");
        if(a != null)
        {
            int i = a.GetComponent<PlanetSpawn>().planets.IndexOf(gameObject);
            a.GetComponent<PlanetSpawn>().planets[i] = null;
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInsideRadius = true;
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
        }
    }
}
