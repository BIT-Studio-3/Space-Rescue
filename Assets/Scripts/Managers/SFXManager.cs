// Description: This script is used to manage the sound effects in the game.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SFXManager : MonoBehaviour
{
    void Awake()
    {
        //Setting the volume of the audio source to current music volume
        this.GetComponent<AudioSource>().volume = GameSettings.SoundEffectsVolume;
    }

    public void SetVolume(float volume)
    {
        //Setting global volume to the volume passed in
        GameSettings.SoundEffectsVolume = volume;
        //Setting the volume of the audio source to the volume passed in
        this.GetComponent<AudioSource>().volume = volume;
    }
}
