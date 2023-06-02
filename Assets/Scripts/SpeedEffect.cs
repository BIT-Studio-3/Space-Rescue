using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpeedEffect : MonoBehaviour
{
    public float targetFOV = 90f; // The target FOV value when speeding up
    public float transitionDuration = 1f; // The duration of the FOV transition
    private bool boosters = false; // Flag to track if the speed-up effect is active
    private float originalFOV; // The original FOV value of the camera
    private float startFOV; //The FOV at the start of the effect
    private float transitionTimer = 0f; // Timer for the FOV transition
    private float currentFOV; //Current FOV
    public static SpeedEffect Instance;
    public ParticleSystem BoosterTop;
    public ParticleSystem BoosterBot;

    void Start()
    {
        Instance = this;
        originalFOV = Camera.main.fieldOfView; // Set the original FOV value at runtime
    }

    void Update()
    {
        currentFOV = Camera.main.fieldOfView; //Getting the current field of view
        if (boosters) //If the boosters are activated
        {
            if (!BoosterTop.isPlaying) //If effects are off
            {
                BoosterTop.Play(); //Activates effects
                BoosterBot.Play();
            }

            if (currentFOV < targetFOV) //If it isn't at the target FOV
            {
                transitionTimer += Time.deltaTime;
                // Calculate the current FOV based on the transition progress
                float t = Mathf.Clamp01(transitionTimer / transitionDuration);
                currentFOV = Mathf.Lerp(startFOV, targetFOV, t);
                // Apply the new FOV value to the camera
                Camera.main.fieldOfView = currentFOV;
            }
        }
        else //If boosters aren't active
        {
            if (BoosterTop.isPlaying) //If effects are on
            {
                BoosterTop.Stop(); //Deactiveate effects
                BoosterBot.Stop();
            }

            if (currentFOV > originalFOV) // If it isn't at target FOV
            {
                transitionTimer += Time.deltaTime;

                // Calculate the current FOV based on the transition progress
                float t = Mathf.Clamp01(transitionTimer / transitionDuration);
                float currentFOV = Mathf.Lerp(startFOV, originalFOV, t);

                // Apply the new FOV value to the camera
                Camera.main.fieldOfView = currentFOV;
            }
        }
    }


    public void SpeedControl(bool speed)
    {
        if (speed && boosters == false)
        {
            startFOV = Camera.main.fieldOfView;
            boosters = true;
            transitionTimer = 0;
        }
        else if (!speed && boosters == true)
        {
            startFOV = Camera.main.fieldOfView;
            boosters = false;
            transitionTimer = 0;
        }
    }
}
