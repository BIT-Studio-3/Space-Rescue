using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GravityBody : MonoBehaviour
{
    public GravityAttractor attractor;
    private Transform myTransform;
    private Rigidbody rb;

    // Start is called before the first frame update
    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        rb.useGravity = false;
        rb.constraints = RigidbodyConstraints.FreezeRotation;
        //GetComponent<Rigidbody>().constraints = RigidbodyConstraints.FreezeRotation;
        //GetComponent<Rigidbody>().useGravity = false;
        //myTransform = transform;
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        attractor.Attract(rb);
    }
}
