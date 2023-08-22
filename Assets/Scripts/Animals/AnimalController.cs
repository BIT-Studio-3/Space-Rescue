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
    private bool inRange = false;
    private bool alerted = false;

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
    void Update()
    {
        if (inRange && Input.GetKeyDown(Keybinds.Interact) && Time.timeScale != 0) //TODO: Add a max held? Also have a better visual way of seeing when you have held animals. And what ones
        {
            PlanetManager.Instance.UpdateHeldAnimals(gameObject.name); //Updating the UI to show the amount of animals held
            Destroy(gameObject);
        }
    }

    //on trigger enter and on trigger exit toggling in range on and off
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            inRange = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            inRange = false;
        }
    }

    IEnumerator wait()
    {
        while (true)
        {
            Vector3 pos = Random.onUnitSphere * radius; //picks a random point on the surface of a sphere with the radius
            movement(pos); //moves them to the point
            yield return new WaitForSeconds(Random.Range(MINWAIT, MAXWAIT)); //pause for a random time and then go again
        }
    }

    private void Movement(Vector3 pos)
    {
        transform.LookAt(pos, transform.position * Time.deltaTime); //makes them face the direction they will move to
        RaycastHit hit;
        //https://forum.unity.com/threads/help-using-coroutine-to-move-game-object-to-position-wait-then-return-to-original-position.1122784/
        while (Vector3.Distance(transform.position, pos) > 1) //while the animal is not at their desired position
        { //This code is a mess but it works and every time I try to make it better it stops working.
            if (
                (alerted)
                || //If the animal has seen an enemy OR
                (
                    Physics.Raycast(transform.position, pos, out hit, .5f)
                    && hit.collider.gameObject.tag == "OnPlanetCollision"
                    && hit.collider.gameObject.transform.parent.gameObject != gameObject
                ) //If the animal sees a collider that is for collision and not itself
            )
            {
                //end the movement
                break;
            }
            transform.position = Vector3.MoveTowards(
                transform.position,
                pos,
                SPEED * Time.deltaTime
            ); //move them to it
            yield return 0; //used to let the engine wait for a frame which breaks an endless broken loop
        }
    }
}
