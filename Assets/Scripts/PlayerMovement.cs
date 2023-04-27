using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [Header("Movement")]
    //public float moveSpeed;
    public float speed = 5f;
    public CharacterController controller;
    public float groundDrag;
    public float smoothTime = 0.1f;
    float smoothVelo;

    public Transform cam;

    [Header("Ground Check")]//needs tweaking!
    public float playerHeight;
    public LayerMask whatIsGround;
    bool grounded;

    public Transform orientation;
    float horizontalInput;
    float verticalInput;
    Vector3 moveDirection;
    Rigidbody rb;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        rb.freezeRotation = true;

        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    void Update()
    {
        //grounded = Physics.Raycast(transform.position, Vector3.down, playerHeight * 0.5f + 0.2f, whatIsGround); //checks if the player is contacting the ground using ~raycast~ o_O
        //UserInput();
        MovePlayer();
        //SpeedControl();
        /*
        if (grounded)
        {
            rb.drag = groundDrag;
        }
        else
        {
            rb.drag = 0;
        }
        */
    }
    // Update is called once per frame
    /*private void FixedUpdate()
    {
        MovePlayer();
    }

    private void UserInput(){
        horizontalInput = Input.GetAxisRaw("Horizontal");
        verticalInput = Input.GetAxisRaw("Vertical");
    }*/

    private void MovePlayer()
    {

        horizontalInput = Input.GetAxisRaw("Horizontal");
        verticalInput = Input.GetAxisRaw("Vertical");
        //moveDirection = orientation.forward * verticalInput + orientation.right * horizontalInput;
        //rb.AddForce(moveDirection * moveSpeed * 10, ForceMode.Force);
        Vector3 direction = new Vector3 (horizontalInput, 0f, verticalInput).normalized; //only x & z

        if (direction.magnitude >= 0.1f)
        {
            float targetAngle = Mathf.Atan2(direction.x, direction.z) * Mathf.Rad2Deg + cam.eulerAngles.y;
            float angle = Mathf.SmoothDampAngle(transform.eulerAngles.y, targetAngle, ref smoothVelo, smoothTime);
            transform.rotation = Quaternion.Euler(0f, angle, 0f);

            Vector3 moveDir = Quaternion.Euler(0f, targetAngle, 0f) * Vector3.forward; //follows camera
            controller.Move(moveDir * speed * Time.deltaTime);
        }
    }

    //Limits the acceleration
    /*private void SpeedControl()
    {
        Vector3 flatVel = new Vector3(rb.velocity.x, 0f, rb.velocity.z);
        
        if (flatVel.magnitude > speed)//if faster than movement speed
        {
            Vector3 limitedVel = flatVel.normalized * speed;//calculate the max speed
            rb.velocity = new Vector3(limitedVel.x, rb.velocity.y, limitedVel.z);//apply that max speed limit
        }
    }*/
}
