//Updates UI as needed
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;
    public Text savedNumber;
    void Awake()
    {
        Instance = this;
        UpdateScore();
    }

    public void UpdateScore()
    {
        savedNumber.text = GameSettings.Score.ToString();
    }
}
