using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TutorialManager : MonoBehaviour
{
    public GameObject toolTipPrefab;
    public Canvas canvas;
    public List<GameObject> toolTips;
    // Start is called before the first frame update
    void Start()
    {
        GameSettings.Tutorial = true; //Set the tutorial true in the GameSettings to alter some behaviours.
        CreateToolTip("Use the WASD keys to move your Ship!","Movement",true); //The tooltips appear in the top left corner of the screen to teach the player the controls of the game and how to play
        CreateToolTip("Use Q & E to Roll your Spaceship!","Rolling");
        CreateToolTip("Use the mouse to look Around","Looking");
        CreateToolTip("The Arrow points in the direction of the Closest Planet \n Look around to find it","Finding");
        CreateToolTip("Reach the Planet","Approaching");
        CreateToolTip("Use 'R' to rescue the planet from the blackhole","Rescue");
        CreateToolTip("Well Done, You have rescued a planet, The Blackhole is now active!, Try and rescue the other Planets or press 'Spacebar' to escape!","Escaping");

    }

    // Update is called once per frame
    void Update()
    {
        //Tests whether the first tooltip is hidden, IF it is the tooltip is shown and set to active.
        if(toolTips[0].activeSelf == false)
        {
            toolTips[0].SetActive(true);
            toolTips[0].GetComponent<ToolTip>().isActive = true;
        }



            if((Input.GetKeyDown(KeyCode.W) ||Input.GetKeyDown(KeyCode.A)||Input.GetKeyDown(KeyCode.S)||Input.GetKeyDown(KeyCode.D)) && toolTips[0].name == "Movement")
            {
                GameObject.Find("Movement").GetComponent<ToolTip>().completed = true; //The movement tooltip is complete when the player moves

            }
            if((Input.GetKeyDown(KeyCode.Q) || Input.GetKeyDown(KeyCode.E)) && toolTips[0].name == "Rolling")
            {
                GameObject.Find("Rolling").GetComponent<ToolTip>().completed = true; //tooltip is complete when the player rolls
            }
            if((Input.GetAxis("Mouse X") > 0 || Input.GetAxis("Mouse X") < 0 || Input.GetAxis("Mouse Y") > 0 || Input.GetAxis("Mouse Y") < 0) && toolTips[0].name == "Looking")
            {
                GameObject.Find("Looking").GetComponent<ToolTip>().completed = true; //tooltip is complete when the player moves the mouse in any direction.
            }

            if(toolTips[0].name == "Escaping")
            {
                GameObject.Find("Black Hole").GetComponent<BlackHoleGrowth>().isActive = true;
            }
    }


    public void CreateToolTip(string prompt,string name,bool active = false) //Creates a Tooltip, Requaires a prompt that will be the message, a name and whether it is active which is false by default
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
        

    }
}
