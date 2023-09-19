// Description: This script is used to set the sound effects volume and mute.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class SoundEffectsSetting
{
    public static void SoundSetting(AudioSource audioSource)
    {
        if (audioSource.volume != GameSettings.SoundEffectsVolume) //Sets the volume to the sound effect volume setting
        {
            audioSource.volume = GameSettings.SoundEffectsVolume;
        }
        if (audioSource.mute != GameSettings.Mute) //Sets the mute to the mute setting
        {
            audioSource.mute = GameSettings.Mute;
        }
        if (Time.timeScale != 0 && !audioSource.isPlaying) //If not paused and not playing, play
        {
            audioSource.Play();
        }
        else if (Time.timeScale == 0 && audioSource.isPlaying) //If paused and playing, stop
        {
            audioSource.Stop();
        }
    }
}
