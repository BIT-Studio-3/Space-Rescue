using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PauseMenuManager : MonoBehaviour
{
    private GameObject pauseMenu;

    // Start is called before the first frame update
    void Start()
    {
        pauseMenu = GameObject.Find("Pause Menu");
    }

    public void Continue()
    {
        PlanetManager.Instance.Play(); //Uses KeypressManager.Play() same as pressing esc
    }

    public void Options()
    {
        SceneManager.LoadScene("Settings", LoadSceneMode.Additive);
    }

    public void MainMenu()
    {
        Time.timeScale = 1;
        SceneManager.LoadScene("Title Screen");
    }
}
