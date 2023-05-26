using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//using System;

//Script controls each individual animal after spawn
public class AnimalController : MonoBehaviour
{
    private bool inRange = false;
    private float speed = 10;

    private float RANGE;
    private const int MINWAIT = 4;
    private const int MAXWAIT = 11;

    // Start is called before the first frame update
    void Start()
    {
        RANGE = 4 * Mathf.PI * 25 * 25;
        //StartCoroutine(wait()); NOTE: Disabled by Palin so as to not have the animal bouncing until fixed.
    }

    // Update is called once per frame
    void Update()
    {
        if (inRange == true && Input.GetKeyDown(KeyCode.R))
        {
            Debug.Log("Interacted");
            Destroy(gameObject);
            PlanetManager.Instance.LoadMiniGame();
        }
    }

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
        while (true) //while its running (forever)
        {
            Vector3 pos = new Vector3(Random.Range(-RANGE,RANGE), 0, Random.Range(-RANGE, RANGE)); //picks a random position to move to

            //https://forum.unity.com/threads/help-using-coroutine-to-move-game-object-to-position-wait-then-return-to-original-position.1122784/
            //BLESSED UNITY FORUMS
            while (transform.position != pos) //while the animal is not at their desired position
            {
                transform.position = Vector3.MoveTowards(transform.position, pos, speed * Time.deltaTime); //move them to it!
                //transform.LookAt(pos + transform.position * Time.deltaTime); //makes them face the direction they will move to
                yield return 0; //used to let the engine wait for a frame which breaks an endless broken loop
            }
        yield return new WaitForSeconds(Random.Range(MINWAIT, MAXWAIT)); //pause for a random time and then go again
        }
    }
}
