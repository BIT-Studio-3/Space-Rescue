using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShipMovement : MonoBehaviour
{
    public static ShipMovement Instance;

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
    [SerializeField] private float thrust = 2500f; //Amount of boost power
    private float boostDuration; //Frames the boost can be active for
    [SerializeField] private float cap = 2500f; //Max amount of boost duration that can be held
    [SerializeField] private float recharge = .25f; //Amount recharged. .25 means you recharge at a quarter of the speed you use it

    private Vector3 initialVelocity;
    public Text speedText;

    private AudioSource audioSource;
    [SerializeField]
    private AudioClip boostSound;

    private float rechargeClipLength;
    private float boostPercent;

    //Energy bars to edit
    public Image[] bars;

    void Start()
    {
        Instance = this;
        Cursor.lockState = CursorLockMode.Locked; //keep mouse in the game
        spaceshipRB = GetComponent<Rigidbody>();
        ResetBoost(); //Sets boost to Cap
        initialVelocity = spaceshipRB.velocity;
        audioSource = GetComponent<AudioSource>();
    }
    // Update is called once per frame
    void Update()
    {
        if(Time.timeScale == 0)
        {
            audioSource.Stop();
            return; //This instantly returns from update when the game is paused
        }
        verticalMove = Input.GetAxis("Vertical");
        horizontalMove = Input.GetAxis("Horizontal");
        tiltInput = Input.GetAxis("Roll");

        mouseInputX = Input.GetAxis("Mouse X");
        mouseInputY = Input.GetAxis("Mouse Y");
                
        if(Input.GetKey(Keybinds.Boost)) //If boosting
        {
            UseBoost();
        }
        else //If not boosting
        {
            if (audioSource.clip == boostSound)
            {
                audioSource.Stop();
            }
            RechargeBoost();
        }

        EnergyBar(boostDuration/cap); //Gives a value of boost left between 0 and 1
    }

    private void UseBoost() //Boosting
    {
        if (boostDuration >= 1) //If boosting and having boost left
            {
                SpeedEffect.Instance.SpeedControl(true);
                spaceshipRB.AddRelativeForce(Vector3.forward * thrust);
                boostDuration -= 1;
                audioSource.loop = true;
                SoundEffectsSetting.SoundSetting(audioSource, boostSound);
                //Visual boost bar reducing
            }
            else //If boosting but empty
            {
                SpeedEffect.Instance.SpeedControl(false);
                audioSource.Stop();
                //Effect for empty boost
            }
    }

    private void RechargeBoost() //Recharging boost
    {
        SpeedEffect.Instance.SpeedControl(false);
        if (boostDuration < cap)
        {
            boostDuration += recharge; //Slowly refilling boost
            if (boostDuration >= cap) //If boost is over cap, set to cap
            {
                boostDuration = cap;
            }
        }
    }

    public void ResetBoost() //Sets the boost to max
    {
        boostDuration = cap;
    }

    private void EnergyBar(float percentage) //Takes a value between 0 and 1 and fills the image appropriately
    {
        foreach (var image in bars)
        {
            image.fillAmount = percentage;
        }
    }
    
    void FixedUpdate()
    {
        spaceshipRB.AddForce(speedMult * verticalMove * spaceshipRB.transform.TransformDirection(Vector3.forward), ForceMode.VelocityChange);
        float currentVelocity = Mathf.Round((spaceshipRB.velocity - initialVelocity).magnitude);
        currentVelocity = currentVelocity * 10; 
        speedText.text = currentVelocity < 10 ? $"0{currentVelocity}" : $"{currentVelocity}";
        spaceshipRB.AddForce(horizontalMove * speedMult * spaceshipRB.transform.TransformDirection(Vector3.right), ForceMode.VelocityChange);

        spaceshipRB.AddTorque(-1 * mouseInputY * speedMultAngle * spaceshipRB.transform.right, ForceMode.VelocityChange);
        spaceshipRB.AddTorque(mouseInputX * speedMultAngle * spaceshipRB.transform.up, ForceMode.VelocityChange);

        spaceshipRB.AddTorque(speedtiltMultiAngle * tiltInput * spaceshipRB.transform.forward, ForceMode.VelocityChange);

    }
}
