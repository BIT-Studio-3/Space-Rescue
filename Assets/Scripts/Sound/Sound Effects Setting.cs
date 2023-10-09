// Description: This script is used to set the sound effects volume and mute.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class SoundEffectsSetting
{
    //Set sound for gameplay
    public static void SoundSetting(AudioSource audioSource)
    {
        SetAudio(audioSource);
        if (Time.timeScale != 0 && !audioSource.isPlaying) //If not paused and not playing, play
        {
            audioSource.Play();
        }
        else if (Time.timeScale == 0 && audioSource.isPlaying) //If paused and playing, stop
        {
            audioSource.Stop();
        }
    }

    //Set the sound when you are in the menu and want it to play while game is paused
    public static void SoundMenuSetting(AudioSource audioSource)
    {
        SetAudio(audioSource);
        if (!audioSource.isPlaying) //If not paused and not playing, play
        {
            audioSource.Play();
        }
        else if (audioSource.isPlaying) //If paused and playing, stop
        {
            audioSource.Stop();
        }
    }

    //Overload so you can specify the clip. for playing while paused
    public static void SoundMenuSetting(AudioSource audioSource, AudioClip audioClip)
    {
        audioSource.clip = audioClip;
        SoundMenuSetting(audioSource);
    }

    //Overload so you can specify the clip
    public static void SoundSetting(AudioSource audioSource, AudioClip audioClip)
    {
        audioSource.clip = audioClip;
        SoundSetting(audioSource);
    }


    //Sets volume and mute
    private static void SetAudio(AudioSource audioSource)
    {
        if (audioSource.volume != GameSettings.SoundEffectsVolume) //Sets the volume to the sound effect volume setting
        {
            audioSource.volume = GameSettings.SoundEffectsVolume;
        }
        if (audioSource.mute != GameSettings.Mute) //Sets the mute to the mute setting
        {
            audioSource.mute = GameSettings.Mute;
        }
    }
}
