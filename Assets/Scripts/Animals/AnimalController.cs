// Description: Script controls each individual animal after spawn
// Author: Erika Stuart
// Last Updated: 9/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//using System;

//Script controls each individual animal after spawn
public class AnimalController : MonoBehaviour
{
    private const float SPEED = 10;
    private Vector3 velocity = Vector3.zero;
    private Rigidbody rb;
    private float radius;

    private const int MINWAIT = 4;
    private const int MAXWAIT = 11;

    // Start is called before the first frame update
    void Start()
    {
        radius = GameObject.Find("Planet").transform.localScale.x / 2;
        rb = GetComponent<Rigidbody>();
        StartCoroutine(wait());
    }

    // Update is called once per frame
    void Update() { }

    private void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player") && Input.GetKeyDown(Keybinds.Interact))
        {
            GameSettings.Score++;
            Destroy(gameObject);
        }
    }

    IEnumerator wait()
    {
        while (true) //while its running (forever)
        {
            Vector3 pos = Random.onUnitSphere * radius; //picks a random point on the surface of a sphere with the radius
            transform.LookAt(pos, transform.position * Time.deltaTime); //makes them face the direction they will move to

            //https://forum.unity.com/threads/help-using-coroutine-to-move-game-object-to-position-wait-then-return-to-original-position.1122784/
            //BLESSED UNITY FORUMS
            RaycastHit hit;

            while (Vector3.Distance(transform.position, pos) > 1) //while the animal is not at their desired position
            { //This code is a mess but it works and every time I try to make it better it stops working.
                if (
                    Physics.Raycast(transform.position, pos, out hit, .5f) //if there is a collider in front of the animal
                    && hit.collider.gameObject.tag == "OnPlanetCollision" //if the collider is for collision
                    && hit.collider.gameObject.transform.parent.gameObject != gameObject //if the collider is not the animal's own collider
                )
                {
                    //end the movement
                    break;
                }
                transform.position = Vector3.MoveTowards(
                    transform.position,
                    pos,
                    SPEED * Time.deltaTime
                ); //move them to it!
                yield return 0; //used to let the engine wait for a frame which breaks an endless broken loop
            }
            yield return new WaitForSeconds(Random.Range(MINWAIT, MAXWAIT)); //pause for a random time and then go again
        }
    }
}
