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

    private string closestPlanetName; //Gets the name of the closest planet
    public Camera cam;  //Camera to use
    private Vector3 targetPos; //Target position on screen
    private Vector3 screenMiddle; //Middle of the screen

    void Start()
    {
        //Hides the planet info panel;
        HudBehaviour.instance.HideInfoPanel();
        distanceText.text = "";
        GameObject[] allPlanets = GameObject.FindGameObjectsWithTag("Planet"); //have to do this inside  update for now

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
        if (planetsNotRescued.Count > 0)
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
                else
                {
                }

                if (planet == null || planet.GetComponent<PlanetDetection>().planetRescued == true)
                {

                    planetsNotRescued.Remove(planet); //Remove saved planets from the list
                    planet.GetComponent<Target>().enabled = false;
                    break;
                }

            }


            //Reworking the HUD
            //  RaycastHit hit;

            Vector3 fwd = cam.transform.forward;
            screenMiddle = new Vector3(Screen.width / 2, Screen.height / 2, cam.nearClipPlane);



            LayerMask layerAsLayerMask = (1 << 0);
            RaycastHit[] hits;
            hits = Physics.RaycastAll(cam.ScreenPointToRay(screenMiddle), Mathf.Infinity);
            hits = hits.Where(hit => hit.transform.parent.transform.name != "Post Processing").ToArray();
            foreach (RaycastHit hit in hits)
            {
            }
            if (hits.Length > 0)
            {
                hits = hits.OrderBy(hit => hit.distance).ToArray();
                if (hits.Length > 0)
                {
                    RaycastHit[] playerhits;
                    playerhits = (Physics.RaycastAll(player.transform.position, (hits[0].transform.position - player.transform.position), hits[0].distance, layerAsLayerMask));
                    if (playerhits.Length > 0)
                    {
                        playerhits = playerhits.Where(hit => hit.transform.gameObject == hits[0].transform.gameObject).ToArray();
                        playerhits = playerhits.Where(hit => hit.transform.parent.transform.name != "Post Processing").ToArray();
                        playerhits = playerhits.OrderBy(hit => hit.distance).ToArray();

                        if (playerhits.Length > 0)
                        {
                            if (playerhits[0].transform.name == "SphereHitbox") //Because of the gravity feature changing some aspects of the black hole this will be later changed to the physcial game object of the black hole hit box
                            {
                                HudBehaviour.instance.ShowBlackholeInfo(Mathf.Round(playerhits[0].distance));
                            }
                            else if (playerhits[0].transform.name == "Planet(Clone)")
                            {
                                float distBlackHole = playerhits[0].transform.gameObject.GetComponent<PlanetDetection>().PlanetDistanceToBlackHole();
                                string name = playerhits[0].transform.gameObject.transform.GetChild(1).name[..(playerhits[0].transform.gameObject.transform.GetChild(1).gameObject.name.Length - 7)];
                                HudBehaviour.instance.ShowPlanetInfo(playerhits[0].transform.GetComponent<PlanetDetection>(), Mathf.Round(playerhits[0].distance), distBlackHole, name);
                            }
                        }
                    }
                }
            }

            else
            {
                HudBehaviour.instance.HideInfoPanel();
            }




        }












        //The arrow still finds the closest planet and points to it as in previous iterations

        GameObject target = closestPlanet;
        closestPlanetName = closestPlanet.transform.GetChild(1).transform.name;
        foreach (GameObject planet in planetsNotRescued)
        {
            if (planet.transform.GetChild(1).transform.name != closestPlanetName)
            {
                if (planet.GetComponent<PlanetDetection>().inDanger)
                {
                    planet.GetComponent<Target>().enabled = true;
                    planet.GetComponent<Target>().TargetColor = Color.red;

                }
                else
                {
                    planet.GetComponent<Target>().enabled = false;
                }
            }
            else
            {
                planet.GetComponent<Target>().enabled = true;
                planet.GetComponent<Target>().TargetColor = new Color(0.5f,1,1);

            }
        }
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
            //GetComponent<Renderer>().enabled = false;
            //tick.SetActive(true);


            if (GameSettings.Tutorial) //Only checks if the tutorial is set to true.
            {
                if (GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[0].name == "Finding" && GameObject.Find("Finding") != null && GameObject.Find("Finding").GetComponent<ToolTip>().isActive)
                {
                    GameObject.Find("Finding").GetComponent<ToolTip>().completed = true; //The Finding tooltip is marked as true when the player looks at the closest planet.
                }
            }
        }
        else
        {
            //GetComponent<Renderer>().enabled = true;
            //tick.SetActive(false);
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


