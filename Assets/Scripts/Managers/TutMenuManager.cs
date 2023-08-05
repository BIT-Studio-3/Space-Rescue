using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class TutMenuManager : MonoBehaviour
{
    private GameObject Tutorial;
    public static TutMenuManager Instance;
    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        Tutorial = GameObject.Find("TutorialParent");
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
        Tutorial.SetActive(false);
        SceneManager.LoadScene("Controls", LoadSceneMode.Additive);
    }

    public void ReturnButton()
    {
        SceneManager.UnloadSceneAsync("Controls");
        Tutorial.SetActive(true);
    }
}
