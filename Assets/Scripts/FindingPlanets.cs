using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class FindingPlanets : MonoBehaviour
{
    public  List<GameObject> planetsNotRescued;
    public GameObject player;
    public Text distanceText;

    public Text crosshair;
    // Start is called before the first frame update


public Camera cam;  //Camera to use
GameObject target; //Target to point at (you could set this to any gameObject dynamically)
private Vector3 targetPos; //Target position on screen
private Vector3 screenMiddle; //Middle of the screen


void Update() { //2d arrow (working)

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
                distanceText.text = Mathf.Round(minDist/100).ToString();
            }

            if(planet == null || planet.GetComponent<PlanetDetection>().planetRescued == true) 
            {
                
                planetsNotRescued.Remove(planet);
                break;
            }

        }
         target = closestPlanet;
    //Get the targets position on screen into a Vector3
    targetPos = cam.WorldToScreenPoint (target.transform.position);
    //Get the middle of the screen into a Vector3
    screenMiddle = new Vector3(Screen.width/2, Screen.height/2, 0); 
    crosshair.transform.position = screenMiddle;
    //Compute the angle from screenMiddle to targetPos
    var tarAngle = (Mathf.Atan2(targetPos.x-screenMiddle.x,Screen.height-targetPos.y-screenMiddle.y) * Mathf.Rad2Deg)+90;
    if (tarAngle < 0) tarAngle +=360;


 //Calculate the angle from the camera to the target
 var targetDir = target.transform.position - cam.transform.position;
 var forward = cam.transform.forward;
 var angle = Vector3.Angle(targetDir, forward);
//  distanceText.text = angle.ToString();
if(angle < 5 && angle > 0)
{
    GetComponent<Renderer>().enabled = false;
}
else
{
    GetComponent<Renderer>().enabled = true;
}

 //If the angle exceeds 90deg inverse the rotation to point correctly
 if(angle > 90){
     transform.localRotation = Quaternion.Euler(-tarAngle,90,270);
 } else {
     transform.localRotation = Quaternion.Euler(tarAngle,270,90);
 }

}
    void Start()
    {
        distanceText.text = "";
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

    // // Update is called once per frame //3d Arrow (old)
    // void Update()
    // {

        // GameObject closestPlanet = null;
        // float minDist = Mathf.Infinity;
        // Vector3 currentPos = player.transform.position; 

        // foreach(GameObject planet in planetsNotRescued)
        // {
        //     Vector3 directionToTarget = planet.transform.position - currentPos;
        //     float dist = directionToTarget.sqrMagnitude;
        //     if (dist < minDist)
        //     {
        //         closestPlanet = planet;
        //         minDist = dist;
        //         distanceText.text = minDist.ToString();
        //     }

        //     if(planet == null || planet.GetComponent<PlanetDetection>().planetRescued == true) 
        //     {
                
        //         planetsNotRescued.Remove(planet);
        //         break;
        //     }

        // }
        // GameObject target = closestPlanet;
    //     Vector3 targetPostition = new Vector3( target.transform.position.x,target.transform.position.y,target.transform.position.z);
        
    //   targetPostition.y = 0.0f; //Arrow only roates on the y axis when looking at target
    //   transform.LookAt( targetPostition );



    //     //  Quaternion newRotation = Quaternion.LookRotation( target.transform.position-currentPos , Vector3.forward);
    //     // // newRotation.x = 0.0f;
    //     // // newRotation.z = 0.0f;
    //     // transform.rotation = Quaternion.Slerp(transform.rotation, newRotation, Time.deltaTime * 8) /* Quaternion.Euler(0,player.transform.rotation.y,0) */;
        
    // }
}
