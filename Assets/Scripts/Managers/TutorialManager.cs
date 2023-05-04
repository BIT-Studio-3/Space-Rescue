using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TutorialManager : MonoBehaviour
{
    public GameObject toolTipPrefab;
    public Canvas canvas;
    public float minMovement = 1300;
    private float mouseDistance = 0;
    private Vector3 lastPosition;
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
        //Tests whether the first tooltip is hidden, IF it is the tooltip is shown and set to active.
        if(toolTips[0].activeSelf == false)
        {
            toolTips[0].SetActive(true);
            toolTips[0].GetComponent<ToolTip>().isActive = true;
        }

        if((Input.GetKeyDown(KeyCode.W) ||Input.GetKeyDown(KeyCode.A)||Input.GetKeyDown(KeyCode.S)||Input.GetKeyDown(KeyCode.D)) && toolTips[0].name == "Movement" &&  GameObject.Find("Movement") != null)
        {
            GameObject.Find("Movement").GetComponent<ToolTip>().completed = true; //The movement tooltip is complete when the player moves

        }
        if((Input.GetKeyDown(KeyCode.Q) || Input.GetKeyDown(KeyCode.E)) && toolTips[0].name == "Rolling" && GameObject.Find("Rolling") != null)
        {
            GameObject.Find("Rolling").GetComponent<ToolTip>().completed = true; //tooltip is complete when the player rolls
        }
    if(toolTips[0].name == "Looking"  && GameObject.Find("Rolling") != null)
        {
            Vector3 newPosition = Input.mousePosition;

            mouseDistance += (newPosition - lastPosition).magnitude;
            lastPosition = newPosition;          
            //Tracks the distance the mouse has moved
            if(mouseDistance >= minMovement) //When the mouse has moved a distance of 1300 the objective is completed. 
            //I decided to add a set value because sometimes it is completed to quickly.
            {
                 
                 GameObject.Find("Looking").GetComponent<ToolTip>().completed = true;
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
        toolTip.transform.SetParent(canvas.transform);
        toolTip.transform.localPosition = new Vector3(-400,350,0);

        toolTip.GetComponent<ToolTip>().prompt = prompt;
        toolTip.name = name;
        toolTip.SetActive(active);
        toolTip.GetComponent<ToolTip>().isActive = active;
        toolTips.Add(toolTip);
        return toolTip;
        

    }
}
