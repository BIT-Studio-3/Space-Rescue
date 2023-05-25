using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameMenuManager : MonoBehaviour
{
    private GameObject MainScene;
    public static GameMenuManager Instance;
    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        MainScene = GameObject.Find("MainParent");
    }

    public void MenuButton()
    {
        SceneManager.LoadScene("Menu");
        Time.timeScale = 1;
    }

    public void QuitButton()
    {
        Application.Quit();
    }

    public void KeybindsButton()
    {
        MainScene.SetActive(false);
        SceneManager.LoadScene("Controls", LoadSceneMode.Additive);
    }

    public void ReturnButton()
    {
        SceneManager.UnloadSceneAsync("Controls");
        MainScene.SetActive(true);
    }
    
    public void Planet()
    {
        MainScene.SetActive(false);
        SceneManager.LoadScene("Spherical Planet", LoadSceneMode.Additive);
    }
}
