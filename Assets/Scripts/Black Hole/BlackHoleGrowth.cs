using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlackHoleGrowth : MonoBehaviour
{
    // Update is called once per frame
    void Update()
    {
        //Increases every frame
        transform.localScale = new Vector3(transform.localScale.x * 1.0001f, transform.localScale.y * 1.0001f, transform.localScale.z * 1.0001f); 
    }
}
