using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script controls each individual animal after spawn
public class AnimalController : MonoBehaviour
{
    public bool inRange = false;
    public bool doneMove= false;

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
       // doneMove = false;
        for (int i=0;i<10;i++)
        {
            Vector3 pos = new Vector3(Random.Range(-50,50), 0f, Random.Range(-50, 50));
            transform.position = pos;
            
            /*if (transform.position == pos)
            {
                doneMove = true;
            }*/
        //doneMove = false;
            yield return new WaitForSeconds(5);
           // doneMove = true;
        }
    }
}
