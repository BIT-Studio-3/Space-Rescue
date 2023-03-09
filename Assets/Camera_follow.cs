using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Camera_follow : MonoBehaviour
{
    public Transform cube;

    public bool isCustomOffset;
    public Vector3 offset;

    public float smoothSpeed = 0.1f;
    // Start is called before the first frame update
    void Start()
    {
        if (!isCustomOffset)
        {
            offset = transform.position - cube.position;
        }
    }

    // Update is called once per frame
    void LateUpdate()
    {
        SmoothFollow();
    }

    public void SmoothFollow()
    {
        Vector3 cubePos = cube.position + offset;
        Vector3 smoothFollow = Vector3.Lerp(transform.position, cubePos, smoothSpeed);

        transform.position = smoothFollow;
        transform.LookAt(cube);
    }
}
