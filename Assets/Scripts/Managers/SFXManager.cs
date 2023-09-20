using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SFXManager : MonoBehaviour
{
    private AudioSource audioSource;
    public static SFXManager instance;
    [HideInInspector]
    public bool isSettings = false;

    private void Start()
    {
        DontDestroyOnLoad(this.gameObject);
        audioSource = GetComponent<AudioSource>();
        SetVolume();
        if(SceneManager.GetSceneByName("Settings").isLoaded)
        { //gets the settings scene and checks if its loaded
            isSettings = true;
        }
    }

    
    public void SetVolume()
    {
        //Setting the volume of the audio source to the volume passed in
        audioSource.volume = GameSettings.MusicVolume;
    }

    public void ToggleMute()
    {
        if (GameSettings.Mute)
        {
            audioSource.mute = true;
        }
        else
        {
            audioSource.mute = false;
            audioSource.volume = GameSettings.MusicVolume;
        }
    }

    public void PlaySound()
    {
        audioSource.Play();
    }

    public void PlaySoundDestroy()
    {
        audioSource.Play();
        Destroy(this.gameObject, audioSource.clip.length);
    }
}
