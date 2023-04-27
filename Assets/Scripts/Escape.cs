using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class Escape : MonoBehaviour
{
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.Space))
        {
            EscapeScene();
        }
    }

    public void EscapeScene()
    {
        SceneManager.LoadScene("Game End");
    }
}
