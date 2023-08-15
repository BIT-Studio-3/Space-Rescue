//Updates UI as needed
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameEndManager : MonoBehaviour
{
    //The text of the number of planets saved
    public Text savedNumber;
    //Game objects for saved numbers and the text above it
    public GameObject savedNumGO;
    public GameObject savedTextGO;
    public GameObject menuButton;
    //Text announcing the result
    public Text winningText;
    void Start()
    {
        //Updates score and winning state when end game state is entered
        UpdateScore();
        UpdateWinning();
        //Enable cursor
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
        if(GameSettings.Tutorial)
            GameObject.Find("Restart").GetComponent<Text>().text = "Continue";
            menuButton.SetActive(true);
 
    }

    //Sets the score display to the current game score
    public void UpdateScore()
    {
        savedNumber.text = GameSettings.Score.ToString();
    }

    //Updates the text depending on if you escaped or died
    public void UpdateWinning()
    {
        if(GameSettings.Tutorial)
        {
            winningText.text = "You Completed the Tutorial! \n Press the button below \nto play the game!";
        } 
        else if (GameSettings.Winning)
        {
            winningText.text = "Escaped!";
        }
        else
        {
            savedNumGO.SetActive(false);
            savedTextGO.SetActive(false);
            winningText.text = "You got caught by the black hole\nBetter luck next time!";
        }
    }

    public void Restart()
    {
        GameSettings.Score = 0;
        GameSettings.PlanetDanger = 0;
        GameSettings.Winning = true;
        GameSettings.Tutorial = false;
        SceneManager.LoadScene("Main scene");
    }
    public void QuitButton()
    {
        Application.Quit();
    }
    public void MenuButton()
    {
        GameSettings.Tutorial = false;
        SceneManager.LoadScene("Title Screen");
    }

}
