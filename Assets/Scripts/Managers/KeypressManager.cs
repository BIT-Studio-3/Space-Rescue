using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class KeypressManager : MonoBehaviour
{
    public GameObject PausedMessage;
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
        PausedMessage.SetActive(false);
    }

    private void pause()
    {
        Time.timeScale = 0;
        PausedMessage.SetActive(true);
    }
}
