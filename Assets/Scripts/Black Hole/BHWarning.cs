using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BHWarning : MonoBehaviour
{
    public static BHWarning Instance;
    public GameObject planetWarning;
    public GameObject shipWarning;

    void Awake()
    {
        Instance = this;
    }

    //Activates warnings when objects are within the black hole warning area
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Planet"))
        {
            GameSettings.PlanetDanger++;
            PlanetWarning();
        }
        if (other.CompareTag("Player"))
        {
            shipWarning.SetActive(true);
        }
    }

    //Removes warning when player leaves area
    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            shipWarning.SetActive(false);
        }
    }

    public void PlanetWarning()
    {
        if (GameSettings.PlanetDanger > 0)
        {
            planetWarning.SetActive(true);
        } 
        else
        {
            planetWarning.SetActive(false);
        }
    }
}
