// Description: Handles the End Screen
// Author: Palin Wiseman
// Last Updated: 5/09/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameEndManager : MonoBehaviour
{
    //Game objects for saved numbers and the text above it
    public GameObject savedTextGO; //Animals saved
    public GameObject statusTextGO; //Win or lose status
    private AudioSource audioSource;
    public AudioClip menuHover;

    void Start()
    {
        //Updates score and winning state when end game state is entered
        UpdateScore();
        UpdateWinning();
        //Enable cursor
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
        audioSource = GetComponent<AudioSource>();
        // if (GameSettings.Tutorial)
        //     GameObject.Find("Restart").GetComponent<Text>().text = "Continue";
    }

    //Sets the score display to the current game score
    public void UpdateScore()
    {
        savedTextGO.GetComponent<TMPro.TextMeshProUGUI>().text =
            GameSettings.Score == 1
                ? $"You rescued {GameSettings.Score} animal"
                : $"You rescued {GameSettings.Score} animals";
    }

    //Updates the text depending on if you escaped or died
    public void UpdateWinning()
    {
        // if(GameSettings.Tutorial)
        // {
        //     winningText.text = "You Completed the Tutorial! \n Press the button below \nto play the game!";
        // }
        if (GameSettings.Winning)
        {
            statusTextGO.GetComponent<TMPro.TextMeshProUGUI>().text = "Mission Successful";
        }
        else
        {
            statusTextGO.GetComponent<TMPro.TextMeshProUGUI>().text = "Mission Failed";
        }
    }

    //Restarts the game and resets all variables
    public void Restart()
    {
        GameSettings.Score = 0;
        GameSettings.PlanetDanger = 0;
        GameSettings.Winning = true;
        GameSettings.Tutorial = false;
        PlanetStates.Instance.ResetPlanets();
        SceneManager.LoadScene("Main scene");
    }

    public void QuitButton()
    {
        Application.Quit();
    }

    public void MenuButton()
    {
        GameSettings.Tutorial = false;
        PlanetStates.Instance.ResetPlanets();
        SceneManager.LoadScene("Title Screen");
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
