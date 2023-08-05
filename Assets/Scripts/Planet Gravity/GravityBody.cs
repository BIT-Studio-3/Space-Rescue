using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GravityBody : MonoBehaviour
{
    public GravityAttractor attractor;
    private Transform myTransform;
    private Rigidbody rb;
    private GameObject planet;

    // Start is called before the first frame update
    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        rb.useGravity = false;
        rb.constraints = RigidbodyConstraints.FreezeRotation; //Commented out because I don't know what it's changing
        planet = GameObject.FindWithTag("Planet"); //Finds the planet for the attractor script in the scene because it can't be added to the prefab before it's in the scene
        attractor = planet.GetComponent<GravityAttractor>(); //assigns the attractor to the gameobject in the scene instead of having to drag it in
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        attractor.Attract(rb);
    }
}
