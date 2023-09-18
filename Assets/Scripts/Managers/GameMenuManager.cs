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
        GameSettings.Score = 0;
        MainScene = GameObject.Find("MainParent");
        MusicManager.Instance.stopMusic();
    }

    public void MenuButton()
    {
        SceneManager.LoadScene("Title Screen");
        Time.timeScale = 1;
    }

    public void QuitButton()
    {
        Application.Quit();
    }

    public void ControlsButton()
    {
        LoadNewScene("Controls");
    }

    public void LoadNewScene(string scene)
    {
        SceneManager.LoadScene(scene, LoadSceneMode.Additive);
        MainScene.SetActive(false);
    }

    public void ReturntoScene(string scene)
    {
        SceneManager.UnloadSceneAsync(scene);
        MainScene.SetActive(true);
    }
}
