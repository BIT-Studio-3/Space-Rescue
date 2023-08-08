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
    public GameObject target;
    public bool locked;

    [SerializeField]
    private GameObject warning;

    // Start is called before the first frame update
    void Start() { }

    // Update is called once per frame
    void Update()
    {
        if (locked)
        {
            LockedOn(target);
        }
        else
        {
            FindTarget();
        }
        //If the target is set turn on the warning
    }

    private void FindTarget() //Look for player object with a raycast directly in front and if it hits, set the player as the target
    {
        RaycastHit hit;
        if (
            Physics.Raycast(
                transform.position,
                transform.TransformDirection(Vector3.forward),
                out hit,
                10
            )
        )
        {
            if (hit.collider.CompareTag("Player"))
            {
                target = hit.collider.gameObject;
                locked = true;
                warning.SetActive(true);
            }
        }
    }

    private void LockedOn(GameObject target) //When locked on it is much harder to escape. Need to get behind scenery or very far out of range
    {
        RaycastHit hit;
        //Raycast targeting the gameobject "target" and if it doesn't hit, set locked to false
        if (
            Physics.Raycast(
                transform.position,
                transform.position - target.transform.position,
                out hit,
                200
            )
        )
        {
            Debug.DrawRay(transform.position, transform.position - target.transform.position, Color.red);
            if (hit.collider.CompareTag("Scenery"))
            {
                locked = false;
                warning.SetActive(false);
            }
        }
    }

    private void MoveEnemy()
    {
        //Moves to the target
    }
}
