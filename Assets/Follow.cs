using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Follow : MonoBehaviour
{
    public Transform target; // Reference to the object to look around
    public float rotationSpeed = 3f; // Adjust this value to control the rotation speed
    public float distanceFromTarget = 5f; // Adjust this value to control the distance from the target object

    public bool isRotating = false;
    private Quaternion originalLocalRotation;
    private Vector3 originalLocalPosition;

    private void Start()
    {
        originalLocalRotation = transform.localRotation;
        originalLocalPosition = transform.localPosition;
    }

    void Update()
    {
        if (Input.GetMouseButtonDown(0)) // Left mouse button click
        {
            isRotating = true;
        }

        if (Input.GetMouseButtonUp(0)) // Left mouse button release
        {
            isRotating = false;
            transform.localRotation = originalLocalRotation;
            transform.localPosition = originalLocalPosition;
        }

        if (isRotating)
        {
            float rotationX = Input.GetAxis("Mouse X") * rotationSpeed;
            float rotationY = Input.GetAxis("Mouse Y") * rotationSpeed;

            if (rotationX != 0f || rotationY != 0f) // Check if there is any rotation input
            {
                transform.LookAt(target);
                transform.RotateAround(target.position, Vector3.up, rotationX);
                transform.RotateAround(target.position, transform.right, -rotationY);
            }
        }
    }
}
