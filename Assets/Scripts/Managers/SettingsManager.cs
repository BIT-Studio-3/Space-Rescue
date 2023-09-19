using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SettingsManager : MonoBehaviour
{
    private GameObject controlsMenu;
    private GameObject otherMenu;
    private GameObject credits;
    private GameObject settings;
    private Button controlsButton;
    private Button creditsButton;
    private Button settingsButton;
    private Slider musicSlider;
    private Slider soundEffectsSlider;
    private GameObject musicNumber;
    private GameObject soundEffectsNumber;
    private Toggle muteToggle;
    [SerializeField]
    private AudioClip menuHover;
    private AudioSource audioSource;

    void Start()
    {
        controlsMenu = GameObject.Find("Controls Menu");
        credits = GameObject.Find("Credits Menu");
        settings = GameObject.Find("Settings Menu");
        controlsButton = GameObject.Find("Controls Button").GetComponent<Button>();
        creditsButton = GameObject.Find("Credits Button").GetComponent<Button>();
        settingsButton = GameObject.Find("Settings Button").GetComponent<Button>();
        musicSlider = GameObject.Find("Music Slider").GetComponent<Slider>();
        soundEffectsSlider = GameObject.Find("Sound Effects Slider").GetComponent<Slider>();
        musicNumber = GameObject.Find("Music Number");
        soundEffectsNumber = GameObject.Find("Sound Effects Number");
        muteToggle = GameObject.Find("Mute Toggle").GetComponent<Toggle>();

        //Setting everything to the current volume whenever settings is opened
        musicSlider.value = GameSettings.MusicVolume;
        soundEffectsSlider.value = GameSettings.SoundEffectsVolume;
        musicNumber.GetComponent<TMPro.TextMeshProUGUI>().text = (musicSlider.value * 100).ToString("0");
        soundEffectsNumber.GetComponent<TMPro.TextMeshProUGUI>().text = (soundEffectsSlider.value * 100).ToString("0");
        //This needs to be done as set without notify otherwise it triggers itself
        muteToggle.SetIsOnWithoutNotify(GameSettings.Mute);
        audioSource = GetComponent<AudioSource>();

        credits.SetActive(false);
        settings.SetActive(false);
        controlsButton.interactable = false;
    }

    //Switches to the controls/keybinds menu
    public void ControlsButton()
    {
        controlsMenu.SetActive(true);
        credits.SetActive(false);
        settings.SetActive(false);
        controlsButton.interactable = false;
        creditsButton.interactable = true;
        settingsButton.interactable = true;
    }

    //Switches to the Settings menu
    public void SettingsButton()
    {
        controlsMenu.SetActive(false);
        credits.SetActive(false);
        settings.SetActive(true);
        controlsButton.interactable = true;
        creditsButton.interactable = true;
        settingsButton.interactable = false;
    }

    //Switches to the credits menu
    public void Credits()
    {
        controlsMenu.SetActive(false);
        credits.SetActive(true);
        settings.SetActive(false);
        controlsButton.interactable = true;
        settingsButton.interactable = true;
        creditsButton.interactable = false;
    }

    public void BackButton()
    {
        SceneManager.UnloadSceneAsync("Settings");
        //Time.timeScale = 1;
    }

    public void MusicSlider()
    {
        MusicManager.Instance.SetVolume(musicSlider.value);
        musicNumber.GetComponent<TMPro.TextMeshProUGUI>().text = (musicSlider.value * 100).ToString("0");
    }

    public void SoundEffectsSlider()
    {
        GameSettings.SoundEffectsVolume = soundEffectsSlider.value;
        soundEffectsNumber.GetComponent<TMPro.TextMeshProUGUI>().text = (soundEffectsSlider.value * 100).ToString("0");
    }

    public void MuteToggle()
    {
        GameSettings.Mute = !GameSettings.Mute;
        MusicManager.Instance.ToggleMute();
    }

    public void PlayHoverSound(Button button)
    {
        if (button.interactable) //This makes sure the button isn't already selected
        {
            audioSource.Stop();
            SoundEffectsSetting.SoundMenuSetting(audioSource, menuHover);
        }
    }
}
