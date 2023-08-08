// Description: This script is used to attract the player/animal to the planet's surface.
// Author: Erika Stuart
// Last Updated: 8/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GravityAttractor : MonoBehaviour
{
    private float gravity = -12;

    public void Attract(Rigidbody body)
    {
        Vector3 gravityUp = (body.position - transform.position).normalized;
        Vector3 bodyUp = body.transform.up;

        body.AddForce(gravityUp * gravity);

        body.rotation = Quaternion.FromToRotation(bodyUp, gravityUp) * body.rotation;
        //body.rotation = Quaternion.Slerp(body.rotation, targetRotation, 50f * Time.deltaTime);
    }
}
