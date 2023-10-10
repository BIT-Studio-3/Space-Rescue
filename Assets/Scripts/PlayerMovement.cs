// Description: Handles player movement
// Author: Erika Stuart
// Last Updated: 2/10/2023
// Last Updated By: Chase Bennet-Hill
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public enum PlayerState //Enum of possible states for the player
{
    IDLE,
    RUN,
    PICKUP,
    DEATH
}
public class PlayerMovement : MonoBehaviour
{
    [Header("Movement")]
    private float speed = 20f;
    private Rigidbody rb;
    private Vector3 moveAmo;
    private Vector3 smoothMoveVel = Vector3.zero;
    private Vector3 direction;
    private bool isMoving;
    private Animator animator;
    private PlayerState animationState;

    public PlayerState AnimationState { get => animationState; set => animationState = value; }


    // Start is called before the first frame update
    void Start()
    {
        isMoving = false;
        animationState = PlayerState.IDLE;
        rb = GetComponent<Rigidbody>();
        rb.freezeRotation = true;

        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        animator = GameObject.Find("Model").GetComponent<Animator>();

    }

    void Update()
    {
        isMoving = (Input.GetAxisRaw("Horizontal") != 0 || Input.GetAxisRaw("Vertical") != 0);
        direction = new Vector3(
            Input.GetAxisRaw("Horizontal"),
            0,
            Input.GetAxisRaw("Vertical")
        ).normalized;
        Vector3 targetMove = direction * speed;
        //current, target, velocity,  smooth time
        moveAmo = Vector3.SmoothDamp(moveAmo, targetMove, ref smoothMoveVel, .1f);
        if (isMoving)
        {
            AnimationState = PlayerState.RUN;
        }
        else
        {
            AnimationState = PlayerState.IDLE;
        }

        if (Input.GetKeyDown(Keybinds.Interact))
        {
            AnimationState = PlayerState.PICKUP;
        }

        PlayAnimation();

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
    private void PlayAnimation() //Plays the current animation State given from the enum
    {
        if (animator != null)
        {
            switch (animationState)
            {
                case PlayerState.RUN:
                    animator.Play("Run");
                    break;

                case PlayerState.PICKUP:
                    animator.Play("Pickup");
                    break;
                case PlayerState.DEATH:
                    animator.Play("Death");
                    break;
                    //I dont include Idle because the other animations are directed to play idle immediately after they are done

            }
        }
    }

    public void Death()
    {
        AnimationState = PlayerState.DEATH;
        PlayAnimation();
    }
}
