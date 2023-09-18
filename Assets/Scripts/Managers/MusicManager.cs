// Description: This script is used to control the volume of the music in the game.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MusicManager : MonoBehaviour
{
    public static MusicManager Instance;
    private AudioSource audioSource;
    private float volume = .5f;
    public AudioClip[] menuClips;
    public AudioClip[] gameClips;

    void Update()
    {
        //Checking if the audio source is not playing
        if (!audioSource.isPlaying)
        {
            string currentScene = SceneManager.GetActiveScene().name;
            switch (currentScene)
            {
                case "Main scene":
                case "Planet":
                case "Game Tutorial":
                    audioSource.clip = gameClips[Random.Range(0, gameClips.Length)];
                    break;
                case "Title Screen":
                case "Settings":
                case "Game End":
                    audioSource.clip = menuClips[Random.Range(0, menuClips.Length)];
                    break;
                default:
                    break;
            }
            audioSource.Play();
        }
    }

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

    public void stopMusic()
    {
        audioSource.Pause();
    }
}
