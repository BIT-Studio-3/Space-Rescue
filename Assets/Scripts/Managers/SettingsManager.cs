using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SettingsManager : MonoBehaviour
{
    public void BackButton()
    {
        Scene main = SceneManager.GetSceneByName("Main Scene");
        Scene menu = SceneManager.GetSceneByName("Menu");
        Scene tutorial = SceneManager.GetSceneByName("Game Tutorial");
        if (menu.IsValid())
        {
            MenuManager.Instance.BackButton();
        }
        if (main.IsValid())
        {
            GameMenuManager.Instance.ReturntoScene("Controls");
        }
        if (tutorial.IsValid())
        {
            TutMenuManager.Instance.ReturnButton();
        }
    }
}
