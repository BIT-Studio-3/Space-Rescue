using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FindingPlanets : MonoBehaviour
{
    public  List<GameObject> planetsNotRescued;
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

        GameObject tMin = null;
        float minDist = Mathf.Infinity;
        Vector3 currentPos = transform.position; 

        foreach(GameObject planet in planetsNotRescued)
        {
            Vector3 directionToTarget = planet.transform.position - currentPos;
            float dist = directionToTarget.sqrMagnitude;
            if (dist < minDist)
            {
                tMin = planet;
                minDist = dist;
            }

            if(planet == null || planet.GetComponent<PlanetDetection>().planetRescued == true) 
            {
                
                planetsNotRescued.Remove(planet);
                break;
            }

        }
        GameObject target = tMin;
       transform.LookAt(target.transform.position);
    }
}
