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
            escapeScene();
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

        if(GameSettings.Tutorial)
        {
            if((Input.GetKeyDown(KeyCode.W) ||Input.GetKeyDown(KeyCode.A)||Input.GetKeyDown(KeyCode.S)||Input.GetKeyDown(KeyCode.D)) && GameObject.Find("Movement") != null)
            {
                GameObject.Find("Movement").GetComponent<ToolTip>().completed = true;

            }
            if((Input.GetKeyDown(KeyCode.Q) || Input.GetKeyDown(KeyCode.E)) && GameObject.Find("Rolling") != null)
            {
                print("1");
                GameObject g = GameObject.Find("Rolling");
                if(g.activeSelf)
                    print("1b");
                    GameObject.Find("Rolling").GetComponent<ToolTip>().completed = true;
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
