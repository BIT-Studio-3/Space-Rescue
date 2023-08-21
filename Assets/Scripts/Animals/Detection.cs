// Description: This script is used to detect if something is in front of the enemy. It is used for both the hostile and scared animals
// Author: Palin Wiseman
// Last Updated: 21/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Detection : MonoBehaviour
{
    public bool detected;
    public static Detection Instance;

    // Start is called before the first frame update
    void Start() 
    { 
        Instance = this;
        detected = false;
    }

    private void OnTriggerEnter(Collider other) //When the player enters the trigger turn on the warning
    {
        detected = true;
    }

    private void OnTriggerExit(Collider other) //When the player exits the trigger turn off the warning
    {
        detected = false;
    }
}
