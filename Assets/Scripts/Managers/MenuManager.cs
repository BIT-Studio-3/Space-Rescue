using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MenuManager : MonoBehaviour
{
    private GameObject menu;
    private GameObject title;
    private GameObject settings;
    private GameObject controlsMenu;
    private GameObject otherMenu;
    private GameObject credits;
    private Button controlsButton;
    private Button creditsButton;
    public static MenuManager Instance;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        menu = GameObject.Find("Menu Parent");
        title = GameObject.Find("TitleParent");
        settings = GameObject.Find("SettingsParent");
        controlsMenu = GameObject.Find("Controls Menu");
        credits = GameObject.Find("Credits Menu");
        controlsButton = GameObject.Find("Controls Button").GetComponent<Button>();
        creditsButton = GameObject.Find("Credits Button").GetComponent<Button>();

        settings.SetActive(false);
    }

    public void PlayButton()
    {
        GameSettings.Tutorial = false;
        SceneManager.LoadScene("Main Scene");
    }

    public void SettingsButton()
    {
        title.SetActive(false);
        settings.SetActive(true);
        credits.SetActive(false);
        controlsButton.interactable = false; //makes controls tab automatically "selected"
        //SceneManager.LoadScene("Controls", LoadSceneMode.Additive);
    }

    public void QuitButton()
    {
        Application.Quit();
    }

    public void BackButton()
    {
        //SceneManager.UnloadSceneAsync("Controls");
        title.SetActive(true);
        settings.SetActive(false);
        //Time.timeScale = 1;
    }
    public void TutorialButton()
    {
        SceneManager.LoadScene("Game Tutorial");
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

}
