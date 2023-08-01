using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlackHoleGrowth : MonoBehaviour
{
    // Update is called once per frame
    void Update()
    {
        //Increases every frame if not paused
        if (Time.timeScale == 1)
        {
            transform.localScale = new Vector3(transform.localScale.x * 1.00005f, transform.localScale.y * 1.00005f, transform.localScale.z * 1.00005f); 
        }
    }
}
