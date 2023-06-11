using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform target;                    // Reference to the object to look around
    public float rotationSpeed = 3f;            // Adjust this value to control the rotation speed
    public float distanceFromTarget = 5f;       // Adjust this value to control the distance from the target object

    public bool isRotating = false;
    private Quaternion originalLocalRotation;   // Store the original local rotation of the camera
    private Vector3 originalLocalPosition;      // Store the original local position of the camera

    private void Start()
    {
        originalLocalRotation = transform.localRotation; // Store the original local rotation
        originalLocalPosition = transform.localPosition; // Store the original local position

    }

    void Update()
    {
        if (Input.GetMouseButtonDown(0)) // Left mouse button click
        {
            isRotating = true; // Set the rotating to true
        }

        if (Input.GetMouseButtonUp(0)) // Left mouse button release
        {
            isRotating = false; // Set the rotating to false
            transform.localRotation = originalLocalRotation; // Reset the local rotation to the original value
            transform.localPosition = originalLocalPosition; // Reset the local position to the original value
        }

        if (isRotating)
        {
            float rotationX = Input.GetAxis("Mouse X") * rotationSpeed; // Get the horizontal rotation input
            float rotationY = Input.GetAxis("Mouse Y") * rotationSpeed; // Get the vertical rotation input

            if (rotationX != 0f || rotationY != 0f) // Check if there is any rotation input
            {
                Quaternion originalRotation = transform.rotation;

                // Rotate the camera horizontally around the target
                transform.RotateAround(target.position, Vector3.up, rotationX);

                // Apply the vertical rotation
                transform.RotateAround(target.position, transform.right, -rotationY);

                Quaternion newRotation = transform.rotation;

                // Smoothly interpolate between the original and new rotation
                transform.rotation = Quaternion.Lerp(originalRotation, newRotation, 0.9f);

                // Make the camera look at the target object
                transform.LookAt(target);
            }
        }
    }
}
