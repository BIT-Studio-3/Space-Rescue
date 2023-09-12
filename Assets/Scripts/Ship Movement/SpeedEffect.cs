// Description: This script controls the speed-up effect of the player. It changes the field of view of the camera to give the illusion of speed.
// Author: Palin Wiseman
// Last Updated: 5/09/2023
// Last Updated By: Palin Wiseman
using System.Collections; 
using System.Collections.Generic;
using UnityEngine;

public class SpeedEffect : MonoBehaviour
{
    public float targetFOV = 90f; // The target FOV value when speeding up
    public float transitionDuration = 1f; // The duration of the FOV transition
    public bool boosters = false; // Flag to track if the speed-up effect is active
    private float originalFOV; // The original FOV value of the camera
    private float startFOV; //The FOV at the start of the effect
    private float transitionTimer = 0f; // Timer for the FOV transition
    private float currentFOV; //Current FOV
    public static SpeedEffect Instance;
    public ParticleSystem BoosterTop; //Two booster particle effects. Needs to be set in editor
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
                changeFOV(targetFOV);
            }
        }
        else //If boosters aren't active
        {
            if (BoosterTop.isPlaying) //If effects are on
            {
                BoosterTop.Stop(); //Deactivate effects
                BoosterBot.Stop();
            }

            if (currentFOV > originalFOV) // If it isn't at target FOV
            {
                changeFOV(originalFOV);
            }
        }
    }

    private void changeFOV(float goal)
    {
        transitionTimer += Time.deltaTime;

        // Calculate the current FOV based on the transition progress
        float t = Mathf.Clamp01(transitionTimer / transitionDuration);
        float currentFOV = Mathf.Lerp(startFOV, goal, t);

        // Apply the new FOV value to the camera
        Camera.main.fieldOfView = currentFOV;
    }

    public void SpeedControl(bool activateBoost) //True if booster button is pressed
    {
        if (activateBoost && boosters == false) //If booster button pressed and boosters aren't on
        {
            startFOV = Camera.main.fieldOfView;
            boosters = true;
            transitionTimer = 0;
        }
        else if (!activateBoost && boosters == true) //If booster button isn't pressed and boosters are on
        {
            startFOV = Camera.main.fieldOfView;
            boosters = false;
            transitionTimer = 0;
        }
    }
}
