using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [Header("Movement")]
    public float speed = 5f;
    public float smoothTime = 0.1f;
    float smoothVelo;
    float verticalInput;
    float horizontalInput;

    [Header("Game Objects")]
    public CharacterController controller;
    public Transform cam;
    Rigidbody rb;

    Vector3 moveAmo;
    Vector3 smoothMoveVel;

    public Vector3 direction;
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
        direction = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical")).normalized;
        Vector3 targetMove = direction * speed;
        moveAmo = Vector3.SmoothDamp(moveAmo, targetMove, ref smoothMoveVel, .1f);

        /*if (direction != Vector3.zero)
        {
            transform.rotation = Quaternion.RotateTowards(transform.rotation, Quaternion.LookRotation(direction, Vector3.up), Time.deltaTime * 50f);
        }
        rb.MovePosition(rb.position + transform.TransformDirection(direction) * speed * Time.deltaTime);
        */
    }

    void FixedUpdate()
    {
        Vector3 localMove = transform.TransformDirection(moveAmo) * Time.fixedDeltaTime;
		rb.MovePosition(rb.position + localMove);
    }
}
