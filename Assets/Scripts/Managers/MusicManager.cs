// Description: This script is used to control the volume of the music in the game.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicManager : MonoBehaviour
{
    AudioSource audioSource;
    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        //Setting the volume of the audio source to current music volume
        audioSource.volume = GameSettings.MusicVolume;
    }

    public void SetVolume(float volume)
    {
        //Setting global volume to the volume passed in
        GameSettings.MusicVolume = volume;
        //Setting the volume of the audio source to the volume passed in
        audioSource.volume = volume;
    }
}
