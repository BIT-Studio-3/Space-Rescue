using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TutorialManager : MonoBehaviour
{
    public GameObject toolTipPrefab;
    public GameObject progressBarPrefab;

    private GameObject objectiveProgress;
    private int movementProgress = 0;
    private int rollingProgress = 0;
   private List<KeyCode> movementKeys = new List<KeyCode>() {KeyCode.W,KeyCode.A,KeyCode.S,KeyCode.D};
   private List<KeyCode> rollKeys = new List<KeyCode>() {KeyCode.Q,KeyCode.E};
    private int totalMovementProgress = 4;
    private int totalRollingProgress = 2;
    public List<GameObject> toolTips;
    // Start is called before the first frame update
    void Start()
    {
        GameSettings.Tutorial = true; //Set the tutorial true in the GameSettings to alter some behaviours.

        CreateToolTip("Use the WASD keys to move your Ship!","Movement"); //The tooltips appear in the top left corner of the screen to teach the player the controls of the game and how to play
        CreateToolTip("Use Q & E to Roll your Spaceship!","Rolling");
        CreateToolTip("Use the mouse to look Around","Looking");
        CreateToolTip("The Arrow points in the direction of the Closest Planet \n Look around to find it","Finding");
        CreateToolTip("Reach the Planet","Approaching");
        CreateToolTip("Use 'R' to rescue the planet from the Blackhole","Rescue");
        CreateToolTip("Well Done, You have rescued a planet, Rescue the other Planets or press 'Spacebar' to escape!","Escaping");


    }

    // Update is called once per frame
    void Update()
    {
        if(Time.timeScale != 0) //Checks the timescale to make sure the game isn't paused to complete the objectives
        {
        if(toolTips.Count !=0)
        {
            //Tests whether the first tooltip is hidden, IF it is the tooltip is shown and set to active.
            if(toolTips[0].activeSelf == false)
            {
                toolTips[0].SetActive(true);
                toolTips[0].GetComponent<ToolTip>().isActive = true;
            }
        }

        if( toolTips[0].name == "Movement" &&  GameObject.Find("Movement") != null)
        {
                if(GameObject.Find("MovementProgress") == null)
                {
                objectiveProgress = GameObject.Instantiate(progressBarPrefab,new Vector3(0,0,0),Quaternion.identity);
                objectiveProgress.transform.SetParent(GameObject.Find("Movement").transform);
                objectiveProgress.transform.localPosition = new Vector3(-90,-50,0);
                objectiveProgress.transform.localScale = new Vector3(8,0.5f,1);
                objectiveProgress.name = "MovementProgress";

                }
                
            
                if(Input.GetKeyDown(KeyCode.W) && movementKeys.Contains(KeyCode.W))
                {
                    movementProgress++;
                    print(movementProgress);
                    movementKeys[movementKeys.IndexOf(KeyCode.W)] = KeyCode.None;
                }
                if(Input.GetKeyDown(KeyCode.A) && movementKeys.Contains(KeyCode.A))
                {
                    movementProgress++;
                    print(movementProgress);
                    movementKeys[movementKeys.IndexOf(KeyCode.A)] = KeyCode.None;

                }
                if(Input.GetKeyDown(KeyCode.S) && movementKeys.Contains(KeyCode.S))
                {
                    movementProgress++;
                    print(movementProgress);
                     movementKeys[movementKeys.IndexOf(KeyCode.S)] = KeyCode.None;
                   

                }
                if(Input.GetKeyDown(KeyCode.D) && movementKeys.Contains(KeyCode.D))
                {
                    movementProgress++;
                    print(movementProgress);
                       movementKeys[movementKeys.IndexOf(KeyCode.D)] = KeyCode.None;
                 
                }

                objectiveProgress.transform.Find("Progress").GetComponent<ProgressBar>().targetScale =  ( (float) movementProgress / totalMovementProgress) * 100;

            // print(( (float) movementProgress / totalMovementProgress) * 100);



            
            if(movementProgress == totalMovementProgress)
            {
                GameObject.Find("Movement").GetComponent<ToolTip>().completed = true; //The movement tooltip is complete when the player moves
            }





        }
        if(toolTips[0].name == "Rolling" && GameObject.Find("Rolling") != null)
        {
            if(GameObject.Find("RollProgress") == null)
            {
                objectiveProgress = GameObject.Instantiate(progressBarPrefab,new Vector3(0,0,0),Quaternion.identity);
                objectiveProgress.transform.SetParent(GameObject.Find("Rolling").transform);
                objectiveProgress.transform.localPosition = new Vector3(-90,-50,0);
                objectiveProgress.transform.localScale = new Vector3(8,0.5f,1);
                objectiveProgress.name = "RollProgress";
            }
            if(Input.GetKeyDown(KeyCode.Q) && rollKeys.Contains(KeyCode.Q))
            {
                rollingProgress++;
                rollKeys[rollKeys.IndexOf(KeyCode.Q)] = KeyCode.None;
            }
            if(Input.GetKeyDown(KeyCode.E) && rollKeys.Contains(KeyCode.E))
            {
                rollingProgress++;
                rollKeys[rollKeys.IndexOf(KeyCode.E)] = KeyCode.None;
            }


            objectiveProgress.transform.Find("Progress").GetComponent<ProgressBar>().targetScale =  ( (float) rollingProgress / totalRollingProgress) * 100;

            if(rollingProgress == totalRollingProgress)
            {            
            GameObject.Find("Rolling").GetComponent<ToolTip>().completed = true; //tooltip is complete when the player rolls
            }
        }

   
        
   if((Input.GetAxis("Mouse X") > 0 || Input.GetAxis("Mouse X") < 0 || Input.GetAxis("Mouse Y") > 0 || Input.GetAxis("Mouse Y") < 0) && toolTips[0].name == "Looking")
        {

        if(toolTips[0].name == "Looking")
        {
            GameObject.Find("Looking").GetComponent<ToolTip>().completed = true; //tooltip is complete when the player moves the mouse in any direction.

        }
        }








        if(toolTips[0].name == "Escaping"  && GameObject.Find("Escaping") != null)
        {

            toolTips[0].GetComponent<Text>().text = "(i) " + toolTips[0].GetComponent<ToolTip>().prompt + " " + GameSettings.Score + "/3 Planets Rescued!";

            if (GameSettings.Score == 3 || Input.GetKeyDown(KeyCode.Space) )
            {
                GameObject.Find("Escaping").GetComponent<ToolTip>().completed = true; //
            }

        }
        }
    }


    public GameObject CreateToolTip(string prompt,string name,bool active = false) //Creates a Tooltip, Requaires a prompt that will be the message, a name and whether it is active which is false by default
    {
        GameObject toolTip;
        toolTip = Instantiate(toolTipPrefab,new Vector3(0,0,0), Quaternion.identity);
        
        toolTip.transform.SetParent(GameObject.Find("Tooltips").transform);
        toolTip.transform.localPosition = new Vector3(-400,350,0);

        toolTip.GetComponent<ToolTip>().prompt = prompt;
        toolTip.name = name;
        toolTip.SetActive(active);
        toolTip.GetComponent<ToolTip>().isActive = active;
        toolTips.Add(toolTip);
        return toolTip;
        

    }
}
