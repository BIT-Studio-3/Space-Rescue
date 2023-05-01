using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class KeypressManager : MonoBehaviour
{
    public GameObject PauseMenu;
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
             if(GameSettings.Tutorial)
            {
                if(GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Escaping")
                {
                    escapeScene();
                }
            }
            else
            {
                escapeScene();
            }
           
        }
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            //Checks if it is currently paused or playing
            if (Time.timeScale == 0)
            {
                play();
            }
            else
            {
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
        PauseMenu.SetActive(false);
        }

    private void pause()
    {
        Time.timeScale = 0;
        //Enable cursor
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
        PauseMenu.SetActive(true);
    }
}
