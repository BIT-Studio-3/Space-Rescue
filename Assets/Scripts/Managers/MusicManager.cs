// Description: This script is used to control the volume of the music in the game.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicManager : MonoBehaviour
{
    void Awake()
    {
        //Setting the volume of the audio source to current music volume
        this.GetComponent<AudioSource>().volume = GameSettings.MusicVolume;
    }

    public void SetVolume(float volume)
    {
        //Setting global volume to the volume passed in
        GameSettings.MusicVolume = volume;
        //Setting the volume of the audio source to the volume passed in
        this.GetComponent<AudioSource>().volume = volume;
    }
}
