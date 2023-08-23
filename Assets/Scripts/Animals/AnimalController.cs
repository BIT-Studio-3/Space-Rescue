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
    private float radius;
    private bool inRange = false;
    private bool alerted = false;
    private bool moving;
    private Vector3 pos;

    private const int MINWAIT = 4;
    private const int MAXWAIT = 11;

    // Start is called before the first frame update
    void Start()
    {
        radius = GameObject.Find("Planet").transform.localScale.x / 2 + 1;
        pos = transform.position; //Sets initial movement to the animals spawn point
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
        Movement();
    }

    //On trigger enter and on trigger exit toggling in range on and off
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

    public void Scared(Vector3 playerPos)
    {
        //set pos to 100 units in the opposite direction on the sphere from the player
        pos = playerPos * -1;
        LookAtMovement(pos);
        //Set the pos to a certain distance in the opposite direction from the player and set alerted to make sure a new pos is not set
    }

    public void Hostile(Vector3 playerPos)
    {
        pos = playerPos;
        alerted = true;
        LookAtMovement(pos);
        //Set the pos to the player and set alerted to make sure a new pos is not set
        //Will also need to check if the player has escaped?
    }

    IEnumerator wait()
    {
        while (true)
        {
            if (!alerted && !moving)
            {
                pos = Random.onUnitSphere * radius; //picks a random point on the surface of a sphere with the radius
                transform.LookAt(pos, transform.position * Time.deltaTime); //makes them face the direction they are moving to
            }
            yield return new WaitForSeconds(Random.Range(MINWAIT, MAXWAIT)); //pause for a random time and then go again
        }
    }

    //Moving towards the current position
    private void Movement()
    {
        moving = false;
        if (
            Vector3.Distance(transform.position, pos) > 2 //if the animal is not at the desired position
            && //If any of the following three statements are false it returns true. If all are true it returns false. This is a manual way of making a NAND gate
            (
                !Physics.Raycast(transform.position, pos, out RaycastHit hit, .5f)
                || hit.collider.gameObject.tag != "OnPlanetCollision"
                || hit.collider.gameObject.transform.parent.gameObject == gameObject
            ) //If the animal sees a collider that is for collision and not itself
        )
        {
            moving = true;
            transform.position = Vector3.MoveTowards(
                transform.position,
                pos,
                SPEED * Time.deltaTime
            ); //move them to it
        }
    }

    //Animals look at the direction they are moving
    private void LookAtMovement(Vector3 pos)
    {
        transform.LookAt(pos, transform.position * Time.deltaTime); //makes them face the direction they are moving to
    }
}
