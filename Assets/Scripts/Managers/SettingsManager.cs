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
    private Button controlsButton;
    private Button creditsButton;

    void Start()
    {
        controlsMenu = GameObject.Find("Controls Menu");
        credits = GameObject.Find("Credits Menu");
        controlsButton = GameObject.Find("Controls Button").GetComponent<Button>();
        creditsButton = GameObject.Find("Credits Button").GetComponent<Button>();

        credits.SetActive(false);
        controlsButton.interactable = false;

    }

    //Switches to the controls/keybinds menu
    public void ControlsButton()
    {
        controlsMenu.SetActive(true);
        credits.SetActive(false);
        controlsButton.interactable = false;
        creditsButton.interactable = true;
    }

    //Placeholder button
    public void Credits()
    {
        controlsMenu.SetActive(false);
        credits.SetActive(true);
        controlsButton.interactable = true;
        creditsButton.interactable = false;
    }

    public void BackButton()
    {
        SceneManager.UnloadSceneAsync("Settings");
        //Time.timeScale = 1;
    }
}
