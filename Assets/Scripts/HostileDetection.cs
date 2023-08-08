// Description: This script is used to detect the player and lock on to them. It will then follow them until they are out of range or behind cover.
// Author: Palin Wiseman
// Last Updated: 8/08/2023
// Last Updated By: Palin Wiseman
// Note: THIS SCRIPT IS WIP
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HostileDetection : MonoBehaviour
{
    private bool locked;
    private GameObject target;
    [SerializeField]
    private GameObject warning;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        FindTarget();
        if (locked)
        {
            warning.SetActive(true);
        } else
        {
            warning.SetActive(false);
        }
        //If the target is set turn on the warning
    }

    private void FindTarget() //Look for player object with a raycast directly in front and if it hits, set the player as the target
    {
        RaycastHit hit;
        if (Physics.Raycast(transform.position, transform.TransformDirection(Vector3.forward), out hit, 10))
        {
            if (hit.collider.CompareTag("Player"))
            {
                locked = true;
                target = hit.collider.gameObject;
                return;
            }
        }
        else //This is just for testing. Remove when done
        {
            locked = false;
            target = null;
        }
    }

    private void LockedOn(GameObject target) //When locked on it is much harder to escape. Need to get behind something
    {
        //Raycast in the direction of the target. If it doesnt hit it then set locked to false and clear target
    }

    private void MoveEnemy()
    {
        //Moves to the target
    }
}
