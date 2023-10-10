using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetRotation : MonoBehaviour
{
    public Transform player;          // Reference to the player's Transform component.
    [HideInInspector]
    public float sensitivityX = 2.0f; // Mouse sensitivity for horizontal
    [HideInInspector]
    public float sensitivityY = 2.0f; // Mouse sensitivity for vertical
    [HideInInspector]
    public float movementSpeed = 5.0f; // Horizontal movement speed
    private float rotationX = 0.0f;  // Current X rotation of the camera.

    private bool isGamePaused = false; // Flag to track game pause state

    void Start()
    {
        // Set the initial camera rotation to look at the player.
        Vector3 lookAtPlayerDirection = player.position - transform.position;
        Quaternion initialRotation = Quaternion.LookRotation(lookAtPlayerDirection);
        transform.rotation = initialRotation;
    }
    void Update()
    {
        // Check if the game is paused
        if (!isGamePaused)
        {
            // Mouse input.
            float mouseX = Input.GetAxis("Mouse X") * sensitivityX;
            float mouseY = Input.GetAxis("Mouse Y") * sensitivityY;

            player.Rotate(Vector3.up * mouseX);

            rotationX -= mouseY;

            rotationX = Mathf.Clamp(rotationX, 70f, 90f);

            Camera.main.transform.localRotation = Quaternion.Euler(rotationX, 0, 0);
        }

        // Check for pause input
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            isGamePaused = !isGamePaused; // Toggle pause state
        }

    }
}
