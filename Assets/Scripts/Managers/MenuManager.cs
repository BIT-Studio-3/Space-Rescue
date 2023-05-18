using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MenuManager : MonoBehaviour
{
    private GameObject menu;
    public static MenuManager Instance;
    
    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        menu = GameObject.Find("Menu Parent");
    }

    public void PlayButton()
    {
        GameSettings.Tutorial = false;
        SceneManager.LoadScene("Main Scene");
    }

    public void SettingsButton()
    {
        menu.SetActive(false);
        SceneManager.LoadScene("Controls", LoadSceneMode.Additive);
    }

    public void QuitButton()
    {
        Application.Quit();
    }
    public void BackButton()
    {
        SceneManager.UnloadSceneAsync("Controls");
        menu.SetActive(true);
        Time.timeScale = 1;
    }
    public void TutorialButton()
    {
        SceneManager.LoadScene("Game Tutorial");
    }

}
