using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GravityAttractor : MonoBehaviour
{
    public float gravity = -10;

    public void Attract(Rigidbody body)
    {
        Vector3 gravityUp = (body.position - transform.position).normalized;
        Vector3 bodyUp = body.transform.up;

        body.AddForce(gravityUp * gravity);

        body.rotation = Quaternion.FromToRotation(bodyUp, gravityUp) * body.rotation;
        //body.rotation = Quaternion.Slerp(body.rotation, targetRotation, 50f * Time.deltaTime);
    }

}
