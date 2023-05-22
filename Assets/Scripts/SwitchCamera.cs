using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SwitchCamera : MonoBehaviour
{
    public GameObject camera1;
    public GameObject camera2;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetButtonDown("Switch1"))
        {
            camera1.SetActive(true);
            camera2.SetActive(false);
        }
        if (Input.GetButtonDown("Switch2"))
        {
            camera1.SetActive(false);
            camera2.SetActive(true);
        }
    }
}
