// Description: Handles player movement
// Author: Erika Stuart
// Last Updated: 9/08/2023
// Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [Header("Movement")]
    private float speed = 20f;
    private Rigidbody rb;
    private Vector3 moveAmo;
    private Vector3 smoothMoveVel = Vector3.zero;
    private Vector3 direction;

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
        direction = new Vector3(
            Input.GetAxisRaw("Horizontal"),
            0,
            Input.GetAxisRaw("Vertical")
        ).normalized;
        Vector3 targetMove = direction * speed;
        //current, target, velocity,  smooth time
        moveAmo = Vector3.SmoothDamp(moveAmo, targetMove, ref smoothMoveVel, .1f);
    }

    void FixedUpdate()
    {
        RaycastHit hit;
        //transform direction transforms direction from local to world
        Vector3 localMove = transform.TransformDirection(moveAmo) * Time.fixedDeltaTime;
        //Turn child gameobject in the direction of movement
        if (direction != Vector3.zero)
        {
            transform.GetChild(0).localRotation = Quaternion.LookRotation(direction);
        }
        //The reason I am using raycasts here and not just non trigger colliders is because the player can use the animals as a ramp with proper colliders
        if (Physics.Raycast(transform.GetChild(0).position, localMove, out hit, .5f)
            && hit.collider.gameObject.tag == "OnPlanetCollision")
        {
            return;
        }
        //If there is no trigger collider in the movement direction (or it is the collider for the animal FOV) the player moves
        rb.MovePosition(rb.position + localMove);
    }
}
