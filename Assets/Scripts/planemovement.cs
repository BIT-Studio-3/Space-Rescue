using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class planemovement : MonoBehaviour
{

    private Rigidbody spaceshipRB;
    float verticalMove;
    float horizontalMove;
    float mouseInputX;
    float mouseInputY;
    float tiltInput;

    //speed
    float speedMult = 1;
    float speedMultAngle = 0.5f;
    float speedtiltMultiAngle = 0.1f;

    //Thrusters - Set to private after testing is done and ideal speed is found
    public float thrust = 10000;
    public float boostDuration = 10000f;//Frames the boost can be active for

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked; //keep mouse in the game
        spaceshipRB = GetComponent<Rigidbody>();
    }
    // Update is called once per frame
    void Update()
    {
        verticalMove = Input.GetAxis("Vertical");
        horizontalMove = Input.GetAxis("Horizontal");
        tiltInput = Input.GetAxis("Roll");

        mouseInputX = Input.GetAxis("Mouse X");
        mouseInputY = Input.GetAxis("Mouse Y");
                
        if(Input.GetKey(KeyCode.LeftShift))
        {
            if (boostDuration > 0) //If boosting and having boost left
            {
                SpeedEffect.Instance.SpeedControl(true);
                spaceshipRB.AddRelativeForce(Vector3.forward * thrust);
                boostDuration -= 1;
                Debug.Log(boostDuration);
                //Visual boost bar reducing
            }
            else //If boosting but empty
            {
                SpeedEffect.Instance.SpeedControl(false);
                Debug.Log("Empty");
                //Effect for empty boost
            }


        }
        else //If not boosting
        {
            SpeedEffect.Instance.SpeedControl(false);
        }
    }
    
    void FixedUpdate()
    {
        spaceshipRB.AddForce(spaceshipRB.transform.TransformDirection(Vector3.forward) * verticalMove * speedMult, ForceMode.VelocityChange);

        spaceshipRB.AddForce(spaceshipRB.transform.TransformDirection(Vector3.right) * horizontalMove * speedMult, ForceMode.VelocityChange);

        spaceshipRB.AddTorque(spaceshipRB.transform.right * speedMultAngle * mouseInputY * -1, ForceMode.VelocityChange);
        spaceshipRB.AddTorque(spaceshipRB.transform.up * speedMultAngle * mouseInputX, ForceMode.VelocityChange);

        spaceshipRB.AddTorque(spaceshipRB.transform.forward * speedtiltMultiAngle * tiltInput, ForceMode.VelocityChange);

    }
}
