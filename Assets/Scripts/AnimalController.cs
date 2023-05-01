using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimalController : MonoBehaviour
{
    public bool entered = false;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (entered == true && Input.GetKeyDown(KeyCode.Space))
        {
            Debug.Log("Interacted");
        }
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            entered = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            entered = false;
        }
    }
}
