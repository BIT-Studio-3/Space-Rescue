using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlackHoleGravity : MonoBehaviour
{
    [SerializeField]
    private float planetGravity; //This will be set for each distance in the editor
    [SerializeField]
    private float playerGravity; //This will be set for each distance in the editor
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
            if (other.transform.CompareTag("Planet")) //Checks if it should use the player or planet gravity
            {
                other.attachedRigidbody.AddForce((transform.position - other.transform.position) * gravityIntensity * other.attachedRigidbody.mass * planetGravity * Time.smoothDeltaTime);
                //The Add Force method works by determining the position of itself and and the planet/ship and multiplying it by the distance to the object, the mass of the object, 
                //a gravity multiplier depending on if it is a ship or planet, and the time intervals to keep it an even pull.
            }
            else if (!SpeedEffect.Instance.boosters) // If boosters are off. This is so that the gravity can be threatening but also able to escape it with boosters
            {
                other.attachedRigidbody.AddForce((transform.position - other.transform.position) * gravityIntensity * other.attachedRigidbody.mass * playerGravity * Time.smoothDeltaTime);
            }
            else //If boosters are on
            {
                other.attachedRigidbody.AddForce((transform.position - other.transform.position) * (gravityIntensity * 0.5f) * other.attachedRigidbody.mass * playerGravity * Time.smoothDeltaTime);
            }
        }
    }
}
