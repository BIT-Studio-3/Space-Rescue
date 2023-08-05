using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class BHDestroy : MonoBehaviour
{

    private void OnTriggerEnter(Collider other)
    {
        //On collision with a planet it destroys it in a specified amount of seconds
        if (other.CompareTag("Planet"))
        {
            Destroy(other.gameObject);
            //TODO: Add a destroy animation of it getting sucked in to the black hole
            GameSettings.PlanetDanger--;
            BHWarning.Instance.PlanetWarning();
        }
        //On collision with the player it ends game with a loss
        if (other.CompareTag("Player"))
        {
            GameSettings.Winning = false;
            SceneManager.LoadScene("Game End");
        }
    }
}
