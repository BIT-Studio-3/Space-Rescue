//Updates UI as needed
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{
    public Text savedNumber;
    void Start()
    {
        UpdateScore();
    }

    public void UpdateScore()
    {
        savedNumber.text = GameSettings.Score.ToString();
    }
}
