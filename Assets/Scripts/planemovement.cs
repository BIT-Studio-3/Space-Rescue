using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class planemovement : MonoBehaviour
{

    private Rigidbody spaceshipRB;
    float verticalMove;      // Movement input along the vertical axis
    float horizontalMove;    // Movement input along the horizontal axis
    float mouseInputX;       // Mouse input along the X-axis
    float mouseInputY;       // Mouse input along the Y-axis
    float tiltInput;         // Tilt input for rolling

    //speed
    float speedMult = 1;               // Multiplier for general speed
    float speedMultAngle = 0.5f;       // Multiplier for mouse input-based rotation
    float speedtiltMultiAngle = 0.1f;  // Multiplier for tilt-based rotation

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;  // Keep mouse in the game window
        spaceshipRB = GetComponent<Rigidbody>();   // Get the reference to the Rigidbody component
    }
    // Update is called once per frame
    void Update()
    {
        verticalMove = Input.GetAxis("Vertical");       // Get vertical input value
        horizontalMove = Input.GetAxis("Horizontal");   // Get horizontal input value
        tiltInput = Input.GetAxis("Roll");              // Get roll input value

        // Check if the Main Camera is not rotating (controlled by Follow script)
        if (!GameObject.Find("Main Camera").GetComponent<Follow>().isRotating)
        {
            mouseInputX = Input.GetAxis("Mouse X");   // Get mouse X-axis input
            mouseInputY = Input.GetAxis("Mouse Y");   // Get mouse Y-axis input
        }

    }
    
    void FixedUpdate()
    {
        // Apply forward force based on vertical movement input
        spaceshipRB.AddForce(spaceshipRB.transform.TransformDirection(Vector3.forward) * verticalMove * speedMult, ForceMode.VelocityChange);

        // Apply rightward force based on horizontal movement input
        spaceshipRB.AddForce(spaceshipRB.transform.TransformDirection(Vector3.right) * horizontalMove * speedMult, ForceMode.VelocityChange);

        // Apply torque (rotation) around the spaceship's right axis based on mouse Y-axis input
        spaceshipRB.AddTorque(spaceshipRB.transform.right * speedMultAngle * mouseInputY * -1, ForceMode.VelocityChange);

        // Apply torque (rotation) around the spaceship's up axis based on mouse X-axis input
        spaceshipRB.AddTorque(spaceshipRB.transform.up * speedMultAngle * mouseInputX, ForceMode.VelocityChange);

        // Apply torque (rotation) around the spaceship's forward axis based on tilt input
        spaceshipRB.AddTorque(spaceshipRB.transform.forward * speedtiltMultiAngle * tiltInput, ForceMode.VelocityChange);
    }
}
