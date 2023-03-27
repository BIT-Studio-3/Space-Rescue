using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class BHDestroy : MonoBehaviour
{
    //Delay on destroying the planet so the black hole has time to envelop it. Might be changed later to a more natural implementation
    private int destroyDelay = 30;

    private void OnTriggerEnter(Collider other)
    {
        //On collision with a planet it destroys it in a specified amount of seconds
        if (other.CompareTag("Planet"))
        {
            Destroy(other.gameObject, destroyDelay);
        }
        //On collision with the player it ends game with a loss
        if (other.CompareTag("Player"))
        {
            GameSettings.Winning = false;
            SceneManager.LoadScene("gameEnd");
        }
    }
}
