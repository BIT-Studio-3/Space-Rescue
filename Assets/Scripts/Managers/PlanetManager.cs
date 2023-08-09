// Description: This script is used to manage the planet scene. It is also used to reset the ships boost when the player leaves the planet scene.
// Author: Palin Wiseman
// Last Updated: 9/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlanetManager : MonoBehaviour
{
    [SerializeField]
    private GameObject animalDisplay;
    private GameObject planetParent;
    public static PlanetManager Instance;
    private int held = 0;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        planetParent = GameObject.Find("PlanetParent");
    }

    void Update()
    {
        if (Input.GetKeyDown(Keybinds.Leave) && planetParent.activeSelf)
        {
            ShipMovement.Instance.ResetBoost(); //This resets the ships boost before it goes back to the main scene
            GameMenuManager.Instance.ReturntoScene("Planet");
        }
    }

    public void UpdateHeldAnimals(string animalName)
    {
        //TODO: Use animal name to keep track of what animals are held
        //The held display is EXTREMELY temporary. It is just to show the number and get it functional for now.
        held++;
        animalDisplay.GetComponent<TMPro.TextMeshPro>().text = held.ToString();
    }
}
