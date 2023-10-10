// Description: This script is used to control the volume of the music in the game.
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MusicManager : MonoBehaviour
{
    public static MusicManager Instance;
    private AudioSource audioSource;
    public AudioClip[] menuClips;
    public AudioClip[] gameClips;
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
        SetVolume();
    }

    void Update()
    {
        //Checking if the audio source is not playing
        string currentScene = SceneManager.GetActiveScene().name;
        if (!audioSource.isPlaying)
        {
            switch (currentScene)
            {
                case "Main scene":
                case "Planet":
                case "Game Tutorial":
                    audioSource.clip = gameClips[Random.Range(0, gameClips.Length)]; //Randomly selects a clip from the game clips array
                    break;
                case "Title Screen":
                case "Settings":
                case "Game End":
                    audioSource.clip = menuClips[Random.Range(0, menuClips.Length)]; //Randomly selects a clip from the menu clips array
                    break;
                default:
                    break;
            }
            audioSource.Play();
        }
        if (GameObject.Find("Pause Menu") != null && GameObject.Find("Pause Menu").activeSelf)
        //If it is currently in pause screen
        {
            audioSource.volume = GameSettings.MusicVolume / 2;
        }
        else
        {
            SetVolume();
        }
    }

    //Sets the volume of the music with an input
    public void SetVolume(float input)
    {
        //Storing the volume passed in
        GameSettings.MusicVolume = input;
        //Setting the volume of the audio source to the volume passed in if not muted
        if (!GameSettings.Mute)
        {
            audioSource.volume = GameSettings.MusicVolume;
        }
    }

    //Sets the volume of the music without an input
    public void SetVolume()
    {
        //Setting the volume of the audio source to the volume passed in if not muted
        if (!GameSettings.Mute)
        {
            audioSource.volume = GameSettings.MusicVolume;
        }
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

    public void stopMusic()
    {
        audioSource.Pause();
    }
}
