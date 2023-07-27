using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;


public class FindingPlanets : MonoBehaviour
{
    public List<GameObject> planetsNotRescued;
    public GameObject player;
    public GameObject tick;
    public GameObject blackHole;
    public Text distanceText;

    public GameObject crosshair;
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



                    

                }

                if (planet == null || planet.GetComponent<PlanetDetection>().planetRescued == true)
                {

                    planetsNotRescued.Remove(planet); //Remove saved planets from the list
                    break;
                }

            }


            //Reworking the HUD
                    RaycastHit hit;
                    
                    Vector3 fwd = cam.transform.forward;
                    screenMiddle = new Vector3(Screen.width / 2, Screen.height / 2, cam.nearClipPlane);
                    
                    int layerMask = 1 << 2; //the layer mask is set to layer 2
                    layerMask = ~layerMask; // the ~ symbol inverts this so the ray will ignore layer 2 ("this layer is called ignore raycast") I set the warning sphere to this layer 


                    if (Physics.Raycast(cam.ScreenPointToRay(screenMiddle),out hit, Mathf.Infinity) && hit.transform.tag == "Planet") //Ray that tests when the player is looking at a planet
                    //Sends out a raycast, returns true if an object is hit and that object has the Planet tag.
                    {
                        //For Debugging purposes in scene view. Draws the ray in yellow
                            Debug.DrawRay(screenMiddle, transform.TransformDirection(Vector3.forward) * hit.distance, Color.yellow); //Note: the editor doesn't draw the ray as expected likely due to the 3dgui camera , however data works as expected
                          Vector3 directionToPlanet = hit.transform.position - currentPos; //Finds the direction between the player and the target planet
                        float dist = directionToPlanet.sqrMagnitude; //calculates the distance from this direction
                 
                        float distBlackHole = hit.transform.gameObject.GetComponent<PlanetDetection>().PlanetDistanceToBlackHole(); //Gets the planets approx distance from the blackhole (the distortion hitbox)
                        //Accesses the child of the planet object which is the model. Takes the name and removes 7 characters from the end to remove the (Clone) from the name
                        //This way each planet has a unique identifier in the HUD
                        string name = hit.transform.gameObject.transform.GetChild(0).name.Substring(0,hit.transform.gameObject.transform.GetChild(0).gameObject.name.Length-7);
                        if(Physics.Raycast(player.transform.position,hit.transform.position - player.transform.position,out hit, Mathf.Infinity,layerMask) ) //This raycast is fired from the player and finds the distance between the player and the planet
                        {
                            Debug.DrawRay(player.transform.position, hit.transform.position - player.transform.position,Color.white,5f,false);
                            Debug.Log(hit.distance + " Ray from the player to the " + hit.transform.name + " Old dist was " + (hit.transform.position - player.transform.position).sqrMagnitude);
                            HudBehaviour.instance.ShowPlanetInfo(hit.transform.GetComponent<PlanetDetection>(),Mathf.Round(hit.distance),distBlackHole,name);

                        }
                        //Calls the showplanetInfo method for the planet


                    }
  
    // Filter out e.g. using Linq
   
              
                    
                    else if(Physics.Raycast(cam.ScreenPointToRay(screenMiddle),out hit, Mathf.Infinity,layerMask) && hit.transform.name == "DistortionHitbox") //Ray that tests when the player is looking at the black hole
                    {
                        //Debug.DrawRay(screenMiddle, transform.TransformDirection(Vector3.forward) * hit.distance, Color.green); //Note: the editor doesn't draw the ray as expected likely due to the 3dgui camera , however data works as expected
                        Vector3 directionToPlanet = hit.transform.position - currentPos; //Finds the direction between the player and the target planet
                        float dist = directionToPlanet.sqrMagnitude; //calculates the distance from this direction
                        //Debug.DrawLine(player.transform.position,hit.transform.position, Color.red,25f);
                        if(Physics.Raycast(player.transform.position,blackHole.transform.position - player.transform.position,out hit, Mathf.Infinity,layerMask) ) //ray that is fired from the player to find the distance to the black hole
                        {
                            Debug.DrawRay(player.transform.position, hit.transform.position - player.transform.position,Color.white,5f,false);
                            //Debug.Log(hit.distance + " Ray from the player to the " + hit.transform.name + " Old dist was " + (hit.transform.position - player.transform.position).sqrMagnitude);
                            HudBehaviour.instance.ShowBlackholeInfo(Mathf.Round(hit.distance));

                        }
                    }
                    
                    else
                    { //Hides the planet info panel and creates a "failed" raycast
                        Debug.DrawRay(screenMiddle, transform.TransformDirection(Vector3.forward) * 1000, Color.red);
                        HudBehaviour.instance.HideInfoPanel();
                    }
             
                    RaycastHit[] hits = (Physics.RaycastAll(cam.ScreenPointToRay(screenMiddle),Mathf.Infinity));
                    if(hits.Length > 0)
                        hits = hits.Where(hit => hit.transform.name != "WarningBox").ToArray();
                         foreach(RaycastHit hito in hits)
                            Debug.Log(hito.transform.name);


//The arrow still finds the closest planet and points to it as in previous iterations
        
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
                if(GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Finding" && GameObject.Find("Finding") != null && GameObject.Find("Finding").GetComponent<ToolTip>().isActive )
                {
                    GameObject.Find("Finding").GetComponent<ToolTip>().completed = true; //The Finding tooltip is marked as true when the player looks at the closest planet.
                }
            }
        }
        else
        {
            GetComponent<Renderer>().enabled = true;
            tick.SetActive(false);
            //HudBehaviour.instance.HidePlanetInfo(target.GetComponent<PlanetDetection>());



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
