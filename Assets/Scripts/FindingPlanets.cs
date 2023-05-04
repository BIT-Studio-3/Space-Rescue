using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class FindingPlanets : MonoBehaviour
{
    public List<GameObject> planetsNotRescued;
    public GameObject player;
    public GameObject tick;
    public Text distanceText;

    public Text crosshair;
    // Start is called before the first frame update

    
    public Camera cam;  //Camera to use
    private Vector3 targetPos; //Target position on screen
    private Vector3 screenMiddle; //Middle of the screen

    void Start()
    {
        distanceText.text = "";
        GameObject[] allPlanets= GameObject.FindGameObjectsWithTag("Planet"); //have to do this inside  update for now

        foreach (GameObject planet in allPlanets)
        {
            if (!planet.GetComponent<PlanetDetection>().planetRescued)
            {
                planetsNotRescued.Add(planet);
            }
        }
    }
    void Update()
    { 

        GameObject closestPlanet = null;
        float minDist = Mathf.Infinity;
        Vector3 currentPos = player.transform.position;
        if(planetsNotRescued.Count > 0)
        {   
            foreach (GameObject planet in planetsNotRescued) //finds the closest planet to the player that hasn't already been rescued.
            {
                Vector3 directionToTarget = planet.transform.position - currentPos;
                float dist = directionToTarget.sqrMagnitude;
                if (dist < minDist)
                {
                    closestPlanet = planet;
                    minDist = dist;
                    if(minDist < 3000000) //test if the distance to the closest exceeds the limit
                    {
                        distanceText.text = Mathf.Round(minDist / 100).ToString(); //round the distance to a whole number for readability 
                    }
                    else 
                    {
                        distanceText.text = "Out of Range!";
                    }
                }

                if (planet == null || planet.GetComponent<PlanetDetection>().planetRescued == true)
                {

                    planetsNotRescued.Remove(planet); //Remove saved planets from the list
                    break;
                }

            }
        
        GameObject target = closestPlanet;
        //Get the targets position on screen into a Vector3
        targetPos = cam.WorldToScreenPoint(target.transform.position);
        //Get the middle of the screen into a Vector3
        screenMiddle = new Vector3(Screen.width / 2, Screen.height / 2, 0);
        crosshair.transform.position = screenMiddle;
        //Compute the angle from screenMiddle to targetPos
        float tarAngle = (Mathf.Atan2(targetPos.x - screenMiddle.x, Screen.height - targetPos.y - screenMiddle.y) * Mathf.Rad2Deg) + 90;
        if (tarAngle < 0)
        {
            tarAngle += 360;
        }

        //Calculate the angle from the camera to the target
        Vector3 targetDir = target.transform.position - cam.transform.position;
        Vector3 forward = cam.transform.forward;
        float angle = Vector3.Angle(targetDir, forward);
        //  distanceText.text = angle.ToString();
        if (angle < 10 && angle > 0) //Range for the crosshair to the planet. 
        {
            GetComponent<Renderer>().enabled = false;
            tick.SetActive(true);
            if(GameSettings.Tutorial) //Only checks if the tutorial is set to true.
            {
                if(GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Finding" && GameObject.Find("Finding") != null )
                {
                    GameObject.Find("Finding").GetComponent<ToolTip>().completed = true; //The Finding tooltip is marked as true when the player looks at the closest planet.
                }
            }
        }
        else
        {
            GetComponent<Renderer>().enabled = true;
            tick.SetActive(false);


        }

        //If the angle exceeds 90deg inverse the rotation to point correctly
        if (angle > 90)
        {
            transform.localRotation = Quaternion.Euler(-tarAngle, 90, 270);
        }
        else
        {
            transform.localRotation = Quaternion.Euler(tarAngle, 270, 90);
        }

    }
    }

}
