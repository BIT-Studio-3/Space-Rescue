using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlackHoleGrowth : MonoBehaviour
{
    private const float GROWTHRATE = 1f; //Black hole grows this amount every second
    private const float STEPRATE = 0.1f; //How many times it updates per second

    //Start BH Growth when enabled. This means it will also start it when leaving planet
    void OnEnable()
    {
        StartCoroutine(Growth());
    }

    IEnumerator Growth() //Grow this amount
    {
        float StepGrowth = GROWTHRATE * STEPRATE; //This is so that you can change the growth rate and the step rate independently and it will work out the growth per step
        while (true)
        {
            if (Time.timeScale != 0)
            {
                transform.localScale = new Vector3(transform.localScale.x + StepGrowth, transform.localScale.y + StepGrowth, transform.localScale.z + StepGrowth); 
            }
            yield return new WaitForSeconds(STEPRATE); //pause for half a second
        }
    }
}
