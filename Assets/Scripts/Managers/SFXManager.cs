using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SFXManager : MonoBehaviour
{
    private AudioSource audioSource;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        SetVolume();
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
}
