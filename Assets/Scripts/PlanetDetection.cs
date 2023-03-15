using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlanetDetection : MonoBehaviour
{

    public bool playerInsideRadius;
    public bool planetRescued;
    //Temp Materials
    public Material complete; //Color of rescued planet
    public Material withinRadius; //Color of planet when within the radius
    public Material normal; //Color of normal planet 
    public GameObject pressKey; //Text indicator for user interface

    public GameObject planet;

    private void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInsideRadius = true;
            pressKey.SetActive(true);
            if (Input.GetKeyDown(KeyCode.Return)) //The user needs to press the enter key to rescue the planet.
            {
               planetRescued = true;
               planet.GetComponent<MeshRenderer> ().material = complete; //Temp Indicator the planet will be set to white
               GameSettings.Score++;
            }
            else if(!planetRescued)
            {
              planet.GetComponent<MeshRenderer> ().material = withinRadius; //Temp Indicator the planet will be set to white
            }
        }
    }
    

    private void OnTriggerExit(Collider other)
    //When the player leaves the radius the planet is no longer active.
    {
        if (other.CompareTag("Player")) 
        {
            playerInsideRadius = false;
            pressKey.SetActive(false); //hides the text prompt when player not within range,       
            if(!planetRescued) //If the player has not complete the planet it will return to default other wise it will remain completed.
            {
                planet.GetComponent<MeshRenderer> ().material = normal; //Temp Indicator the planet will be set to white
            }
        }
    }
}
