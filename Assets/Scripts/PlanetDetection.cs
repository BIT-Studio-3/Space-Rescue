using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class planetDetection : MonoBehaviour
{

    public bool playerInsideRadius;
    public bool planetRescued;
    //Temp Materials
    public Material complete; //Color of rescued planet
    public Material withinRadius; //Color of planet when within the radius
    public Material normal; //Color of normal planet 
    public GameObject pressKey; //Text indicator for user interface

    public GameObject planet;

    void Update()
    {
        if (playerInsideRadius && !planetRescued) //Test whether the Player is within range of the planet and if the planet is not been rescued
            {
                if (Input.GetKeyDown(KeyCode.Return)) //The user needs to press the enter key to rescue the planet.
                { 
                        //Does the Task
                        planetRescued = true;
                        planet.GetComponent<MeshRenderer> ().material = complete; //Temp Indicator the planet will be set to red
                        GameSettings.RescueCount++;              
                }
            }

    }
    
    private void OnTriggerEnter(Collider other)  //When the Player enters the planet Radius the bool will be set to true and the material will be changed                                                 //This is indicated by colour change   
    {

        if (other.CompareTag("Player")) 
        {       
            pressKey.SetActive(true); //Shows the text prompt when player within range,
            playerInsideRadius = true;
            planet.GetComponent<MeshRenderer> ().material = withinRadius; //Temp Indicator the planet will be set to green
        }       
    }

    private void OnTriggerExit(Collider other)
    //When the player leaves the radius the planet is no longer active.
    {

        if (other.CompareTag("Player")) 
        {
            
            if(!planetRescued) //If the player has not complete the planet it will return to default other wise it will remain completed.
            {
                pressKey.SetActive(false); //Shows the text prompt when player within range,

                playerInsideRadius = false;
                planet.GetComponent<MeshRenderer> ().material = normal; //Temp Indicator the planet will be set to white
            }
        }
    }
}
