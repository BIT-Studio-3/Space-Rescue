using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MenuManager : MonoBehaviour
{

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    public void PlayButton()
    {
        GameSettings.Tutorial = false;
        SceneManager.LoadScene("Main scene");
    }

    public void SettingsButton()
    {
        SceneManager.LoadScene("Controls");
    }

    public void QuitButton()
    {
        Application.Quit();
    }
    public void BackButton()
    {
        SceneManager.LoadScene("Menu");
        Time.timeScale = 1;
    }
    public void TutorialButton()
    {
        SceneManager.LoadScene("Game Tutorial");
    }

}
