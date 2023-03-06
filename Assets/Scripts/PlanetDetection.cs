using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetDetection : MonoBehaviour
{

    public bool activated;
    public bool TaskComplete;
    public Material Complete;
    public Material WithinRadius;
    public Material Normal;
    public GameObject Planet;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Return))
        {
            

            print($"P:{GameSettings.RescueCount}");

            if (activated && !TaskComplete) //Test whether the Player is within range of the Planet and if the planet is not been completed
            {

                //Does the Task
                TaskComplete = true;
                Planet.GetComponent<MeshRenderer> ().material = Complete; //Temp Indicator 
                GameSettings.RescueCount++;

            }
        }

    }
    
    private void OnTriggerEnter(Collider other)  //When the Player enters the Planet Radius that planet will be "activated"
                                                 //This is indicated by colour change   
    {

        if (other.CompareTag("Player")) 
        {
            
            activated = true;
            Planet.GetComponent<MeshRenderer> ().material = WithinRadius; //Temp Indicator 

        }
        

    }

    private void OnTriggerExit(Collider other)
    //When the player leaves the radius the Planet is no longer active.
    {
        if (other.CompareTag("Player")) 
        {
            if(!TaskComplete) //If the player has not complete the planet it will return to default other wise it will remain Completed.
            {
                activated = false;
                Planet.GetComponent<MeshRenderer> ().material = Normal; //Temp Indicator 
            }
            

        }
    }
}
