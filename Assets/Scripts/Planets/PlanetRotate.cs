// Description: This script is used to rotate and orbit the planets
// Author: Palin Wiseman
// Last Modified By: Palin Wiseman
// Last Modified Date: 06/08/2023

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetRotate : MonoBehaviour
{
    private float speed;
    private float inverse;
    private float absDistance;
    private const float MINPLANETSPIN = -4.0f;
    private const float MAXPLANETSPIN = -10.0f;
    private const int MAXDISTANCE = 3500; //The max distance the planet can be from the black hole
    private const int MINDISTANCE = 800; //The min distance the planet can be from the black hole
    private const int MINSPEED = 1; //The min speed the planet can orbit at
    private const int MAXSPEED = 4; //This + 1 is the max speed the planet can rotate at

    // Start is called before the first frame update
    void Start()
    {
        if (gameObject.tag == "Planet") //If the object is a planet
        {
            speed = Random.Range(MINPLANETSPIN, MAXPLANETSPIN);
        }
        else //If the object is the planet rotator
        {
            //Find child gamobject and get its absolute localdistance from x 0
            absDistance = Mathf.Abs(gameObject.transform.GetChild(0).transform.localPosition.x);
            //Inverse lerp the distance to get a value between 1 and 0
            inverse = Mathf.InverseLerp(MAXDISTANCE, MINDISTANCE, absDistance);
            //Multiply the inverse by 4 and add 1 to get a value between 1 and 5
            speed = inverse * MAXSPEED + MINSPEED;
        }
    }

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(0, speed * Time.deltaTime, 0);
    }
}
