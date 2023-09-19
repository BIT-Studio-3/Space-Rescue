// Description: This script is used to manage the pause menu. It is used to control the pause menu buttons and their functionality.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class PauseMenuManager : MonoBehaviour
{
    private GameObject pauseMenu;
    private AudioSource audioSource;
    public AudioClip menuHover;

    // Start is called before the first frame update
    void Start()
    {
        pauseMenu = GameObject.Find("Pause Menu");
        audioSource = GetComponent<AudioSource>();
    }

    public void Continue()
    {
        if (PlanetManager.Instance != null)
        {
            PlanetManager.Instance.Play(); //Uses KeypressManager.Play() same as pressing esc
        }
        else if (KeypressManager.Instance != null)
        {
            KeypressManager.Instance.Play(); //Uses KeyPressManager.Play() same as pressing
        }

    }

    public void Options()
    {
        SceneManager.LoadScene("Settings", LoadSceneMode.Additive);
    }

    public void MainMenu()
    {
        Time.timeScale = 1;
        SceneManager.LoadScene("Title Screen");
    }

    public void PlayHoverSound(Button button)
    {
        if (button.interactable) //This makes sure the button isn't already selected
        {
            audioSource.Stop();
            SoundEffectsSetting.SoundMenuSetting(audioSource, menuHover);
        }
    }
}
