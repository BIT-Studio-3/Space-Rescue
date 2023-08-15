using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class KeypressManager : MonoBehaviour
{
    private GameObject pauseMenu;
    public static KeypressManager Instance;

    void Awake()
    {
        Instance = this;
    }
    void Start()
    {
        pauseMenu = GameObject.Find("Pause Menu");
        pauseMenu.SetActive(false);
    }
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(Keybinds.Leave))
        {
            Time.timeScale = 1;
            if (GameSettings.Tutorial)
            {         
                if (GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Escaping" || GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Complete" )
                {
                    EscapeScene();
                }           
            }
            else
            {
                EscapeScene();
            }
        }
        if (Input.GetKeyDown(Keybinds.Pause))
        {
            //Checks if it is currently paused or playing
            if (Time.timeScale == 0)
            {
                pauseMenu.SetActive(false);

                if(SceneManager.GetSceneByName("Settings").isLoaded){ //gets the settings scene and checks if its loaded
                    SceneManager.UnloadSceneAsync("Settings"); //then unloads it if the player presses escape in the settings menu
                }

                Play();
            }
            else
            {
                pauseMenu.SetActive(true);
                Pause();
            }
        }
    }

    private void EscapeScene()
    {
        Play();
        SceneManager.LoadScene("Game End");
    }

    public void Play()
    {
        Time.timeScale = 1;
        Cursor.visible = false;//Disable cursor

        Cursor.lockState = CursorLockMode.Locked;
        pauseMenu.SetActive(false);
    }

    private void Pause()
    {
        Time.timeScale = 0;

        Cursor.visible = true;//Enable cursor
        Cursor.lockState = CursorLockMode.None;
    }
}
