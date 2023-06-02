using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraSize : MonoBehaviour
{
    // Update is called once per frame
    void Update()
    {
        gameObject.GetComponent<Camera>().orthographicSize = Screen.height / 2; //sets the 3d UI camera to scale with the current screen size
    }
}
