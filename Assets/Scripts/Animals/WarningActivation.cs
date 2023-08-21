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

    // Update is called once per frame
    void Update()
    {
        if (Detection.Instance.detected == true)
        {
            warning.SetActive(true);
        }
        else
        {
            warning.SetActive(false);
        }
    }
}
