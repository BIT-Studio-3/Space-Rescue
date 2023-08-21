// This script is responsible for activating the warning sign when the player is detected by the animal
// Created by: Palin Wiseman
// Created on: 22/08/2023
// Last modified by: Palin Wiseman
// Last modified on: 22/08/2023
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WarningActivation : MonoBehaviour
{

    [SerializeField]
    private GameObject warning;

    // Start is called before the first frame update
    void Start()
    {
        warning.SetActive(false);
    }

        private void OnTriggerStay(Collider other) //When the player enters the trigger turn on the warning
    {
        if (other.gameObject.tag == "Player")
        {
            warning.SetActive(true);
        }
    }

    private void OnTriggerExit(Collider other) //When the player exits the trigger turn off the warning
    {
        if (other.gameObject.tag == "Player")
        {
            warning.SetActive(false);
        }
    }
}
