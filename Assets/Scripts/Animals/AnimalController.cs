// Description: Script controls each individual animal after spawn
// Author: Erika Stuart
// Last Updated: 16/09/2023
// Last Updated By: Chase Bennett-Hill
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

//using System;

//Script controls each individual animal after spawn
public class AnimalController : MonoBehaviour
{
    private float radius;
    private bool inRange;
    [SerializeField] private bool moving;
    private Vector3 pos;
    [SerializeField] private bool attacking;
    [SerializeField] private bool running;
    private Vector3 normalizedDirection;
    private Vector3 quarterRadiusOffset;

    private float speed = 10;
    private const int MINWAIT = 10;
    private const int MAXWAIT = 30;

    public static AnimalController Instance;

    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        radius = GameObject.Find("Planet").transform.localScale.x / 2 + 1;
        pos = transform.position; //Sets initial movement to the animals spawn point
        inRange = false;
        attacking = false;
        StartCoroutine(wait());
    }

    // Update is called once per frame
    void Update()
    {
        if (gameObject.transform.Find("Model"))
            PlayAnimation();
        if (inRange && Input.GetKeyDown(Keybinds.Interact) && Time.timeScale != 0)
        {
            PlanetAnimalCountTEMP.Instance.AnimalCount(gameObject.name); //sends the name of the game object to planetanimalcountTemp
            //This checks if the name of the gameobject contains a keyword of it's type and then updates the count of that animal and passes a string to the planet manager to update the UI
            if (gameObject.name.Contains("Hostile"))
            {
                PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].hostileCount--;
                PlanetManager.Instance.UpdateHeldAnimals("Hostile");
            }
            else if (gameObject.name.Contains("Scared"))
            {
                PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].scaredCount--;
                PlanetManager.Instance.UpdateHeldAnimals("Scared");
            }
            else if (gameObject.name.Contains("Neutral"))
            {
                PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].neutralCount--;
                PlanetManager.Instance.UpdateHeldAnimals("Neutral");
            }
            PlanetStates.Instance.planetInfo[PlanetStates.Instance.activePlanet].totalAnimals--;

            Destroy(gameObject);
        }

        if (attacking && Vector3.Distance(transform.position, pos) < 2) //This will now kick you out of the planet if you get caught. I want to make this more interesting in the future but it works for the moment
        {

            PlanetManager.Instance.Death();
        }
        Movement();


        attacking = false; //This will stop the attacking until it gets another command from the hostile animal script. If the attack is still going on then that will be right away
        running = false; //This will stop the running until it gets another command from the scared animal script. If the animal is still scared then that will be right away
    }

    public void PlayAnimation()
    {
        Animator animator = gameObject.transform.Find("Model").GetComponent<Animator>();
        if (attacking)
        {
            animator.Play("Attack"); //This is playing the Attacking animation on the model
        }
        else if (running)
        {
            animator.Play("Run"); //This is playing the run animation on the model
        }
        else if (moving)
        {
            animator.Play("Walk"); //This is playing the walk animation on the model
        }
        else
        {
            animator.Play("Idle_A"); //This is playing the Idle animation on the model
        }
    }

    //On trigger enter and on trigger exit toggling in range on and off
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            inRange = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            inRange = false;
        }
    }

    public void Scared(Vector3 playerPos)
    {
        running = true;
        //set pos to 1/4 of the planet away from the player. This is a lot of algebra I don't fully understand and got to through trial and error. However it works
        Vector3 AB = transform.position - playerPos;
        Vector3 AC = playerPos - new Vector3(0, 0, 0);
        Vector3 BC = Vector3.Cross(AB, AC); //This is getting the three points of the triangle and then getting the cross product of two of the sides
        BC.Normalize(); //Normalizing the vector so it is a unit vector
        pos = new Vector3(0, 0, 0) + BC * radius; //Setting the position to new point on the surface of the planet
        speed = 15; //Animal gets scared and runs away faster
        LookAtMovement();
    }

    public void Hostile(Vector3 playerPos)
    {
        pos = playerPos;
        LookAtMovement();
        attacking = true;
    }

    IEnumerator wait()
    {
        while (true)
        {
            if (!moving)
            {
                pos = Random.onUnitSphere * radius; //picks a random point on the surface of a sphere with the radius
                LookAtMovement();
            }
            yield return new WaitForSeconds(Random.Range(MINWAIT, MAXWAIT)); //pause for a random time and then go again
        }
    }

    //Moving towards the current position
    private void Movement()
    {
        moving = false;
        if (
            Vector3.Distance(transform.position, pos) > 2 //if the animal is not at the desired position
            && //If any of the following three statements are false it returns true. If all are true it returns false. This is a manual way of making a NAND gate
            (
                !Physics.Raycast(transform.position, pos, out RaycastHit hit, .5f)
                || hit.collider.gameObject.tag != "OnPlanetCollision"
                || hit.collider.gameObject.transform.parent.gameObject == gameObject
            ) //If the animal sees a collider that is for collision and not itself
        )
        {
            moving = true;
            transform.position = Vector3.MoveTowards(
                transform.position,
                pos,
                speed * Time.deltaTime
            ); //move them to it
        }
    }

    //Animals look at the direction they are moving
    private void LookAtMovement()
    {
        transform.LookAt(pos, transform.position); //makes them face the direction they are moving to
    }
}
