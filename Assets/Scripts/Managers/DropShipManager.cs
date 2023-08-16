// Description: DropShipManager class for managing the dropship range and checking if the layer is nearby
// Author: Palin Wiseman
// Last Updated: 10/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DropShipManager : MonoBehaviour
{
    public void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            PlanetManager.Instance.dropShipRange = true;
        }
    }

    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            PlanetManager.Instance.dropShipRange = false;
        }
    }
}
