// This script is responsible for activating the warning and the movement when a scared animal detects the player
// Created by: Palin Wiseman
// Created on: 23/08/2023
// Last modified by: Palin Wiseman
// Last modified on: 28/08/2023

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Scared : MonoBehaviour
{
    [SerializeField]
    private GameObject warningSymbol;

    private AnimalController animalController;
    private GameObject player;

    private bool alerted;
    private float timeStart;
    private const float WAITTIME = 10;

    // Start is called before the first frame update
    void Start()
    {
        warningSymbol.SetActive(false);
        alerted = false;
        animalController = GetComponentInParent<AnimalController>();
        player = GameObject.FindWithTag("Player");
    }

    void Update()
    {
        if (alerted) //If the animal is alerted to the player then turn on the warning symbol and activate the movement
        {
            animalController.Scared(player.transform.position);
            warningSymbol.SetActive(true);
            timeStart = Time.time; //Sets the time that the animal was alerted to the current time
        }
        else if (warningSymbol.activeSelf && timeStart + WAITTIME <= Time.time) //If they are not alerted but the warning symbol is on and it has been wait time seconds since alerted then turn it off
        {
            warningSymbol.SetActive(false);
        } //If the animal is not alerted and the symbol isn't on then do nothing
    }

    private void OnTriggerStay(Collider other) //When the player enters the trigger turn on the warning
    {
        if (other.gameObject.tag == "Player")
        {
            alerted = true;
        }
    }

    private void OnTriggerExit(Collider other) //When the player exits the trigger turn off the warning
    {
        if (other.gameObject.tag == "Player")
        {
            alerted = false;
        }
    }
}
