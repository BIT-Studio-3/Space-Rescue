// Description: This script is used to activate the warning when the player or planet is near a black hole.
// Author: Palin Wiseman
// Last Updated: 5/09/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BHWarning : MonoBehaviour
{
    public static BHWarning Instance;
    public GameObject planetWarning;
    public GameObject shipWarning;
    public GameObject warningOverlay;

    void Awake()
    {
        Instance = this;
    }

    //Activates warnings when objects are within the black hole warning area
    private void OnTriggerEnter(Collider other)
    {
        //This checks if the planet has been rescued when it enters the zone
        if (other.CompareTag("Planet") && PlanetStates.Instance.planetInfo[other.gameObject.GetComponent<PlanetDetection>().planetID].totalAnimals > 0)
        {
            GameSettings.PlanetDanger++;
            other.gameObject.GetComponent<PlanetDetection>().inDanger = true;
            PlanetWarning();
        }
        if (other.CompareTag("Player"))
        {
            shipWarning.SetActive(true);
            warningOverlay.GetComponent<WarningOverlay>().SetOverlayVisible(true);
        }
    }

    //Removes warning when player leaves area
    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            shipWarning.SetActive(false);
            warningOverlay.GetComponent<WarningOverlay>().SetOverlayVisible(false);


        }
    }

    public void PlanetWarning()
    {
        if (GameSettings.PlanetDanger > 0)
        {
            planetWarning.SetActive(true);
        } 
        else
        {
            planetWarning.SetActive(false);
        }
    }
}
