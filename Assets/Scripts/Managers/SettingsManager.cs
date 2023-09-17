using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SettingsManager : MonoBehaviour
{
    private GameObject controlsMenu;
    private GameObject otherMenu;
    private GameObject credits;
    private GameObject settings;
    private Button controlsButton;
    private Button creditsButton;
    private Button settingsButton;

    void Start()
    {
        controlsMenu = GameObject.Find("Controls Menu");
        credits = GameObject.Find("Credits Menu");
        settings = GameObject.Find("Settings Menu");
        controlsButton = GameObject.Find("Controls Button").GetComponent<Button>();
        creditsButton = GameObject.Find("Credits Button").GetComponent<Button>();
        settingsButton = GameObject.Find("Settings Button").GetComponent<Button>();

        credits.SetActive(false);
        settings.SetActive(false);
        controlsButton.interactable = false;
    }

    //Switches to the controls/keybinds menu
    public void ControlsButton()
    {
        controlsMenu.SetActive(true);
        credits.SetActive(false);
        settings.SetActive(false);
        controlsButton.interactable = false;
        creditsButton.interactable = true;
        settingsButton.interactable = true;
    }

    //Switches to the Settings menu
    public void SettingsButton()
    {
        controlsMenu.SetActive(false);
        credits.SetActive(false);
        settings.SetActive(true);
        controlsButton.interactable = true;
        creditsButton.interactable = true;
        settingsButton.interactable = false;
    }

    //Switches to the credits menu
    public void Credits()
    {
        controlsMenu.SetActive(false);
        credits.SetActive(true);
        settings.SetActive(false);
        controlsButton.interactable = true;
        settingsButton.interactable = true;
        creditsButton.interactable = false;
    }

    public void BackButton()
    {
        SceneManager.UnloadSceneAsync("Settings");
        //Time.timeScale = 1;
    }
}
