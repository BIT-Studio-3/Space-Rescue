using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class KeypressManager : MonoBehaviour
{
    private GameObject pauseMenu;

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
                    escapeScene();
                }           
            }
            else
            {
                    escapeScene();
            }
        }
        if (Input.GetKeyDown(Keybinds.Pause))
        {
            //Checks if it is currently paused or playing
            if (Time.timeScale == 0)
            {
                pauseMenu.SetActive(false);
                play();
            }
            else
            {
                pauseMenu.SetActive(true);
                pause();
            }
        }
    }

    private void escapeScene()
    {
        play();
        SceneManager.LoadScene("Game End");
    }

    private void play()
    {
        Time.timeScale = 1;
        //Disable cursor
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        pauseMenu.SetActive(false);
    }

    private void pause()
    {
        Time.timeScale = 0;

        Cursor.visible = true;//Enable cursor
        Cursor.lockState = CursorLockMode.None;
        //SceneManager.LoadScene("Pause Overlay", LoadSceneMode.Additive);
    }
}
