using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpeedEffect : MonoBehaviour
{
    public float targetFOV = 90f; // The target FOV value when speeding up
    public float transitionDuration = 1f; // The duration of the FOV transition
    private bool isSpeedingUp = false; // Flag to track if the speed-up effect is active
    private float originalFOV; // The original FOV value of the camera
    private float startFOV; //The FOV at the start of the effect
    private float transitionTimer = 0f; // Timer for the FOV transition
    private float currentFOV;
    public static SpeedEffect Instance;

    void Start()
    {
        Instance = this;
        originalFOV = Camera.main.fieldOfView; // Set the original FOV value at runtime
    }

    void Update()
    {
        currentFOV = Camera.main.fieldOfView;
        if (isSpeedingUp && currentFOV < targetFOV)
        {
            transitionTimer += Time.deltaTime;
            // Calculate the current FOV based on the transition progress
            float t = Mathf.Clamp01(transitionTimer / transitionDuration);
            currentFOV = Mathf.Lerp(startFOV, targetFOV, t);

            // Apply the new FOV value to the camera
            Camera.main.fieldOfView = currentFOV;
        }
        else if (!isSpeedingUp && currentFOV > originalFOV)
        {
            transitionTimer += Time.deltaTime;

            // Calculate the current FOV based on the transition progress
            float t = Mathf.Clamp01(transitionTimer / transitionDuration);
            float currentFOV = Mathf.Lerp(startFOV, originalFOV, t);

            // Apply the new FOV value to the camera
            Camera.main.fieldOfView = currentFOV;
        }
    }


    public void SpeedControl(bool speed)
    {
        if (speed && isSpeedingUp == false)
        {
            startFOV = Camera.main.fieldOfView;
            isSpeedingUp = true;
            transitionTimer = 0;
        }
        else if (!speed && isSpeedingUp == true)
        {
            startFOV = Camera.main.fieldOfView;
            isSpeedingUp = false;
            transitionTimer = 0;
        }
    }
}
