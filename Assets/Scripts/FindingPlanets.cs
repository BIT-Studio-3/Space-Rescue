using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FindingPlanets : MonoBehaviour
{
    public  List<GameObject> planetsNotRescued;
    public GameObject player;
    // Start is called before the first frame update
    void Start()
    {
        
        GameObject[] allPlanets = GameObject.FindGameObjectsWithTag("Planet"); //have to do this inside  update for now
        print(allPlanets.Length);

        foreach(GameObject planet in allPlanets)
        {
            if(planet.GetComponent<PlanetDetection>().planetRescued != true) 
            {
                planetsNotRescued.Add(planet);
            }
        }


        
    }

    // Update is called once per frame
    void Update()
    {

        GameObject closestPlanet = null;
        float minDist = Mathf.Infinity;
        Vector3 currentPos = player.transform.position; 

        foreach(GameObject planet in planetsNotRescued)
        {
            Vector3 directionToTarget = planet.transform.position - currentPos;
            float dist = directionToTarget.sqrMagnitude;
            if (dist < minDist)
            {
                closestPlanet = planet;
                minDist = dist;
            }

            if(planet == null || planet.GetComponent<PlanetDetection>().planetRescued == true) 
            {
                
                planetsNotRescued.Remove(planet);
                break;
            }

        }
        GameObject target = closestPlanet;
        Vector3 targetPostition = new Vector3( target.transform.position.x,target.transform.position.y,target.transform.position.z);
        transform.LookAt( targetPostition );
        // Quaternion newRotation = Quaternion.LookRotation(currentPos - target.transform.position, Vector3.forward);
        // newRotation.x = 0.0f;
        // newRotation.z = 0.0f;
        // transform.rotation = Quaternion.Slerp(transform.rotation, newRotation, Time.deltaTime * 8);
    }
}
