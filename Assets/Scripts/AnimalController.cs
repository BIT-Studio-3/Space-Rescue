using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script controls each individual animal after spawn
public class AnimalController : MonoBehaviour
{
    public bool inRange = false;
    public bool doneMove= false;
    public float speed = 10;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(wait());
    }

    // Update is called once per frame
    void Update()
    {
        if (inRange == true && Input.GetKeyDown(KeyCode.Return))
        {
            Debug.Log("Interacted");
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
        for (int i=0;i<10;i++) //avoiding while cos it crashes unity
        {
            Vector3 pos = new Vector3(Random.Range(-50,50), 0, Random.Range(-50, 50)); //picks a random position to move to

            //https://forum.unity.com/threads/help-using-coroutine-to-move-game-object-to-position-wait-then-return-to-original-position.1122784/
            //BLESSED UNITY FORUMS
            while (transform.position != pos) //while the animal is not at their desired position
            {
                transform.position = Vector3.MoveTowards(transform.position, pos, speed * Time.deltaTime); //move them to it!
                transform.LookAt(pos + transform.position * Time.deltaTime);
                yield return 0; //used to let the engine wait for a frame which breaks an endless broken loop
            }
        yield return new WaitForSeconds(Random.Range(4, 11)); //pause for a random time and then go again
        }
    }

}
