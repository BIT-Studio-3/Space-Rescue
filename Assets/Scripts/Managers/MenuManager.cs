using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MenuManager : MonoBehaviour
{
    public static MenuManager Instance;
    private AudioSource audioSource;
    public AudioClip menuHover;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        MusicManager.Instance.stopMusic();
        audioSource = GetComponent<AudioSource>();
    }

    public void PlayButton()
    {
        GameSettings.Tutorial = false;
        SceneManager.LoadScene("Main Scene");
    }

    public void SettingsButton()
    {
        /*title.SetActive(false);
        settings.SetActive(true);
        credits.SetActive(false);
        controlsButton.interactable = false; //makes controls tab automatically "selected"*/
        SceneManager.LoadScene("Settings", LoadSceneMode.Additive);
    }

    public void QuitButton()
    {
        Application.Quit();
    }

    public void TutorialButton()
    {
        SceneManager.LoadScene("Game Tutorial");
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
