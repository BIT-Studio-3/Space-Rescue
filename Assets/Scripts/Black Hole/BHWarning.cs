using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BHWarning : MonoBehaviour
{
    public GameObject planetWarning;
    public GameObject shipWarning;


    //Activates warnings when objects are within the black hole warning area
    private void OnTriggerEnter (Collider other)
    {
        if (other.CompareTag("Planet")) //Will add something to check if it is saved and to remove warning if no planets are still in area
        {
            planetWarning.SetActive(true);
        }
        if (other.CompareTag("Player"))
        {
            shipWarning.SetActive(true);
        }
    }

    //Removes warning when player leaves area
    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            shipWarning.SetActive(false);
        }
    }
}
