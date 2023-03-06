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
    public GameObject Object;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (activated)
            {
                //Does the Task
                TaskComplete = true;
                Object.GetComponent<MeshRenderer> ().material = Complete; //Temp Indicator 
                print("Planet Rescued");

            }
        }

    }
    private void OnTriggerEnter(Collider other)  //When the Player enters the Planet Radius that planet will be "activated"
                                                 //This is indicated by colour change   
    {

        if (other.CompareTag("Player")) 
        {
            
            activated = true;
            Object.GetComponent<MeshRenderer> ().material = WithinRadius; //Temp Indicator 

        }
        

    }

    private void OnTriggerExit(Collider other)
    //When the player leaves the radius the Planet is no longer active.
    {
        if (other.CompareTag("Player")) 
        {
            activated = false;
            Object.GetComponent<MeshRenderer> ().material = Normal; //Temp Indicator 

        }
    }
}
