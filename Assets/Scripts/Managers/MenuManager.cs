using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MenuManager : MonoBehaviour
{
    public Canvas myCanvas;
    public Slider mySlider;
    // Start is called before the first frame update
    void Start()
    {
        if (myCanvas != null)
        {
            myCanvas.scaleFactor = GameSettings.menuScale; //
        }
        if (mySlider != null)
        {
            mySlider.value = GameSettings.menuScale;
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (mySlider != null)
        {
        GameSettings.menuScale = mySlider.value;
        }
    }

    public void PlayButton()
    {
        SceneManager.LoadScene("Main scene");
    }

    public void SettingsButton()
    {
        SceneManager.LoadScene("Settings");
    }

    public void QuitButton()
    {
        Application.Quit();
    }
    public void BackButton()
    {
        SceneManager.LoadScene("Menu");
    }

}
