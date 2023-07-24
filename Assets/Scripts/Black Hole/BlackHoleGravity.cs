using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlackHoleGravity : MonoBehaviour
{
    private float planetGravity = .00005f;
    private float playerGravity = .03f;
    private float radius;
    // Start is called before the first frame update
    void Start()
    {
        radius = GetComponent<SphereCollider>().radius;
    }

    void OnTriggerStay(Collider other)
    {
        if(other.attachedRigidbody)
        {
            float gravityIntensity = Vector3.Distance(transform.position, other.transform.position) / radius;
            float tempGravity;
            Debug.Log(other.transform.CompareTag("Player"));
            if (other.transform.CompareTag("Player")) //Checks if it should use the player or planet gravity
            {
                tempGravity = playerGravity;
            }
            else
            {
                tempGravity = planetGravity;
            }
            other.attachedRigidbody.AddForce((transform.position - other.transform.position) * gravityIntensity * other.attachedRigidbody.mass * tempGravity * Time.smoothDeltaTime);
            Debug.DrawRay(other.transform.position, transform.position - other.transform.position); //To show what it's targetting
        }
    }
}
