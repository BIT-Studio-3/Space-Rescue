// Description: This script is used to manage the planet scene. It is also used to reset the ships boost when the player leaves the planet scene and deposit the animals into the score.
// Author: Palin Wiseman
// Last Updated: 10/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlanetManager : MonoBehaviour
{
    [SerializeField]
    private GameObject animalDisplay;

    [SerializeField]
    private GameObject scoreDisplay;

    private GameObject planetParent;
    private GameObject dropShip;
    public static PlanetManager Instance;
    private int held;
    public bool dropShipRange;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        planetParent = GameObject.Find("PlanetParent");
        held = 0;
        scoreDisplay.GetComponent<TMPro.TextMeshProUGUI>().text = "Temp Score Display: " + GameSettings.Score.ToString();
        //This is very temporary. Will have a better system in the next increment.
    }

    void Update()
    {
        if (Input.GetKeyDown(Keybinds.Leave) && dropShipRange)
        {
            ShipMovement.Instance.ResetBoost(); //This resets the ships boost before it goes back to the main scene
            GameMenuManager.Instance.ReturntoScene("Planet");
        }
        if (Input.GetKeyDown(Keybinds.Interact) && held > 0 && dropShipRange)
        {
            DepositHeldAnimals();
        }
    }

    public void UpdateHeldAnimals(string animalName)
    {
        //TODO: Use animal name to keep track of what animals are held
        //The held display is EXTREMELY temporary. It is just to show the number and get it functional for now.
        held++;
        animalDisplay.GetComponent<TMPro.TextMeshPro>().text = held.ToString();
    }

    private void DepositHeldAnimals()
    {
        GameSettings.Score += held;
        held = 0;
        animalDisplay.GetComponent<TMPro.TextMeshPro>().text = held.ToString();
        scoreDisplay.GetComponent<TMPro.TextMeshProUGUI>().text = "Temp Score Display: " + GameSettings.Score.ToString();
        //This is very temporary. Will have a better system in the next increment.

    }
}
