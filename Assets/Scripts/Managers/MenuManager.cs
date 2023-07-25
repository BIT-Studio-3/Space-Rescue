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
    public static MenuManager Instance;
    
    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        menu = GameObject.Find("Menu Parent");
        title = GameObject.Find("TitleParent");
        settings = GameObject.Find("SettingsParent");
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

}
