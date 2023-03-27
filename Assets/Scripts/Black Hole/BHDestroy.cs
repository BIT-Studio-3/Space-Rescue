using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class BHDestroy : MonoBehaviour
{
    private int destroyDelay = 30;

    private void OnTriggerEnter(Collider other)
    {
        //On collision with a planet it destroys it in a specified amount of seconds. This is a delay so it can get fully enveloped first
        if (other.CompareTag("Planet"))
        {
            Destroy(other.gameObject, destroyDelay);
        }
        //Ends game with a loss
        if (other.CompareTag("Ship"))
        {
            GameSettings.Winning = false;
            SceneManager.LoadScene("gameEnd");
        }
    }
}
