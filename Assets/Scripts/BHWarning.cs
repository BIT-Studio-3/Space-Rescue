using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BHWarning : MonoBehaviour
{
    public GameObject planetWarning;
    public GameObject shipWarning;

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Ship"))
        {
            shipWarning.SetActive(false);
        }
    }
    private void OnTriggerStay (Collider other)
    {
        if (other.CompareTag("Planet")) //Will add something to check if it is saved
        {
            planetWarning.SetActive(true);
        }
        if (other.CompareTag("Ship"))
        {
            shipWarning.SetActive(true);
        }
    }
}
