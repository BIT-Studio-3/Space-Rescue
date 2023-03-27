//Updates UI as needed
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{
    public Text savedNumber;
    public GameObject savedNumGO;
    public GameObject savedTextGO;
    public Text winningText;
    void Start()
    {
        UpdateScore();
        UpdateWinning(GameSettings.Winning);
    }

    public void UpdateScore()
    {
        savedNumber.text = GameSettings.Score.ToString();
    }

    public void UpdateWinning(bool win)
    {
        if (win)
        {
            winningText.text = "Escaped!";
        }
        else
        {
            winningText.text = "You got caught by the black hole\nBetter luck next time!";
            savedNumGO.SetActive(true);
            savedTextGO.SetActive(true);
        }
    }
}
