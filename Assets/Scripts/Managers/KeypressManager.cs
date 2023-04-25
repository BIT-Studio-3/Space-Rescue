using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class KeypressManager : MonoBehaviour
{
    public GameObject PausedMessage;
    public GameObject QuitButton;
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
    }

    private void escapeScene()
    {
        play();
        SceneManager.LoadScene("gameEnd");
    }

    private void play()
    {
        Time.timeScale = 1;
        //Disable cursor
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
        PausedMessage.SetActive(false);
        QuitButton.SetActive(false);
    }

    private void pause()
    {
        Time.timeScale = 0;
        //Enable cursor
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
        PausedMessage.SetActive(true);
        QuitButton.SetActive(true);
    }
}
