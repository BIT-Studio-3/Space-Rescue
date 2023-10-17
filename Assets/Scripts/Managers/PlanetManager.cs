﻿// Description: This script is used to manage the planet scene. It is also used to reset the ships boost when the player leaves the planet scene and deposit the animals into the score.
// Author: Palin Wiseman
// Last Updated: 08/10/2023
// Last Updated By: Chase Bennett-Hill
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

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
    private GameObject pauseMenu;

    public static PlanetAnimalCountTEMP AnimalCountTEMP;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        pauseMenu = GameObject.Find("Pause Menu");
        pauseMenu.SetActive(false);
        planetParent = GameObject.Find("PlanetParent");
        held = 0;
        //scoreDisplay.GetComponent<TMPro.TextMeshProUGUI>().text = "Temp Score Display: " + GameSettings.Score.ToString();
        //This is very temporary. Will have a better system in the next increment.
        AnimalCountTEMP = GameObject.Find("TempAnimalCountManager").GetComponent<PlanetAnimalCountTEMP>();
    }

    void Update()
    {
        if (Input.GetKeyDown(Keybinds.Leave) && dropShipRange)
        {
            DepositHeldAnimals();
            LeavePlanet();
        }
        if (Input.GetKeyDown(Keybinds.Interact) && held > 0 && dropShipRange)
        {
            DepositHeldAnimals();
        }

        if (Input.GetKeyDown(Keybinds.Pause))
        {
            //Checks if it is currently paused or playing
            if (Time.timeScale == 0)
            {
                pauseMenu.SetActive(false);

                if (SceneManager.GetSceneByName("Settings").isLoaded)
                { //gets the settings scene and checks if its loaded
                    SceneManager.UnloadSceneAsync("Settings"); //then unloads it if the player presses escape in the settings menu
                }

                Play();
            }
            else
            {
                pauseMenu.SetActive(true);
                Pause();
            }
        }
    }

    public void Play()
    {
        Time.timeScale = 1;
        Cursor.visible = false; //Disable cursor

        Cursor.lockState = CursorLockMode.Locked;
        pauseMenu.SetActive(false);
    }

    private void Pause()
    {
        Time.timeScale = 0;

        Cursor.visible = true; //Enable cursor
        Cursor.lockState = CursorLockMode.None;
    }

    public void UpdateHeldAnimals(string animalName)
    {
        //TODO: Use animal name to keep track of what animals are held
        //The held display is EXTREMELY temporary. It is just to show the number and get it functional for now.
        held++;
    }

    private void DepositHeldAnimals()
    {
        GameSettings.Score += held;
        held = 0;//was 0
        //animalDisplay.GetComponent<TMPro.TextMeshPro>().text = held.ToString();
        //scoreDisplay.GetComponent<TMPro.TextMeshProUGUI>().text =
            "Temp Score Display: " + GameSettings.Score.ToString();
        //This is very temporary. Will have a better system in the next increment.

        //delete from list in planetanimalcount
        foreach (GameObject animal in AnimalCountTEMP.collectedAnimals)
        {
            Destroy(animal);
        }
        AnimalCountTEMP.collectedAnimals.Clear();
    }

    public void LeavePlanet()
    {
        //Gets all game objects with the name MenuClickSound, iterates through them, and deletes any ones with sfx manager script isSettings = true.
        GameObject[] menuClickSounds = GameObject.FindGameObjectsWithTag("MenuClickSound");
        foreach (GameObject menuClickSound in menuClickSounds)
        {
            if (menuClickSound.GetComponent<SFXManager>().isPlanet)
            {
                Destroy(menuClickSound);
            }
        }
        ShipMovement.Instance.ResetBoost(); //This resets the ships boost before it goes back to the main scene

        GameMenuManager.Instance.ReturntoScene("Planet Animal Info");

    }

    private IEnumerator PlayerDeath()
    {

        GameObject player = null;
        GameObject[] objs = GameObject.FindGameObjectsWithTag("Player");
        foreach (GameObject obj in objs)
        {
            if (obj.GetComponent<PlayerMovement>() != null)
            {
                player = obj;
            }
        }
        if (player == null)
        {
            Debug.Log("Player not found");
        }
        else
        {
            player.GetComponent<PlayerMovement>().Death();
            yield return new WaitForSeconds(1.5f);
            LeavePlanet();
        }

    }
    public void Death()
    {
        StartCoroutine(PlayerDeath());
    }
}
