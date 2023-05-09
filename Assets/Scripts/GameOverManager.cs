using System.Collections;
using System.Collections.Generic;
using TMPro;
#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameOverManager : MonoBehaviour
{
    public TextMeshProUGUI scoreText;

    private void OnEnable()
    {
        int score = PlayerPrefs.GetInt("score");
        if (score > 0)
        {
            PlayerPrefs.SetInt("Score", score);
        }
    }
}
