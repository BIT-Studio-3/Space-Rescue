// Description: This script is used to control the volume of the music in the game.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicManager : MonoBehaviour
{
    public static MusicManager Instance;
    private AudioSource audioSource;
    private float volume = .5f;

    private void Awake()
    {
        //Singleton pattern
        if (Instance != null)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        DontDestroyOnLoad(gameObject);
        audioSource = GetComponent<AudioSource>();
    }

    public void SetVolume(float input)
    {
        //Storing the volume passed in
        volume = input;
        //Setting the volume of the audio source to the volume passed in if not muted
        if (!GameSettings.Mute)
        {
            audioSource.volume = volume;
        }
    }
    public void ToggleMute()
    {
        if (GameSettings.Mute)
        {
            //Setting the volume of the audio source to the current stored volume
            audioSource.mute = false;
            audioSource.volume = volume;
        }
        else
        {
            //Muting the audioSource
            audioSource.mute = true;
        }
    }
}
