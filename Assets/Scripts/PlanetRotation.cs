using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetRotation : MonoBehaviour
{
    public Transform player;          // Reference to the player's Transform component.
    public float sensitivityX = 2.0f; // Mouse sensitivity for horizontal
    public float sensitivityY = 2.0f; // Mouse sensitivity for vertical
    private float rotationX = 0.0f;  // Current X rotation of the camera.

    void Update()
    {
        // Check for right mouse button click.
        if (Input.GetMouseButton(1))
        {
            // mouse input.
            float mouseX = Input.GetAxis("Mouse X") * sensitivityX;
            float mouseY = Input.GetAxis("Mouse Y") * sensitivityY;

            // player's rotation around the Y-axis
            player.Rotate(Vector3.up * mouseX);

            // camera's rotation around the X-axis
            rotationX -= mouseY;
            rotationX = Mathf.Clamp(rotationX, -90f, 90f);
            Camera.main.transform.localRotation = Quaternion.Euler(rotationX, 0, 0);
        }
    }
}
