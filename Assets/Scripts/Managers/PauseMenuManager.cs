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

    // Update is called once per frame
    void Update()
    {

    }

    public void Continue()
    {
        pauseMenu.SetActive(false);
        Time.timeScale = 1;
    }

    public void Options()
    {
        SceneManager.LoadScene("Settings", LoadSceneMode.Additive);
    }

    public void MainMenu()
    {
        SceneManager.LoadScene("Title Screen");
    }
}
