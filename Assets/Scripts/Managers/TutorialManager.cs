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
    private List<KeyCode> movementKeys = new List<KeyCode>() { Keybinds.Forward, Keybinds.Left, Keybinds.Back, Keybinds.Right};
    private List<KeyCode> rollKeys = new List<KeyCode>() { Keybinds.RollLeft, Keybinds.RollRight };
    private int totalMovementProgress = 4;
    private int totalRollingProgress = 2;
    public List<GameObject> toolTips;


    [HideInInspector] public int planetRescued = 0; //temp fix for tutorial until fully integrated
    // Start is called before the first frame update
    void Start()
    {
        GameSettings.Tutorial = true; //Set the tutorial true in the GameSettings to alter some behaviours.

        CreateToolTip("Use the WASD keys to move your Ship!", "Movement"); //The tooltips appear in the top left corner of the screen to teach the player the controls of the game and how to play
        CreateToolTip("Use Q & E to Roll your Spaceship!", "Rolling");
        CreateToolTip("Use the mouse to look Around", "Looking");
        CreateToolTip("The Arrow points in the direction of the Closest Planet \n Look around to find it", "Finding");
        CreateToolTip("Reach the Planet", "Approaching");
        CreateToolTip("Use 'Left Mouse Button' to rescue the planet from the Blackhole", "Rescue");
        CreateToolTip("Well Done, You have rescued a planet, Rescue the other Planets or press 'Enter' to escape!", "Escaping");
        CreateToolTip("Tutorial Completed! Press Enter to escape", "Complete");


    }

    // Update is called once per frame
    void Update()
    {
        if (Time.timeScale != 0) //Checks the timescale to make sure the game isn't paused to complete the objectives
        {
            if (toolTips.Count != 0)
            {
                TestObjectives();
            }
        }
    }



    private void TestObjectives()
    {
                    //Tests whether the first tooltip is hidden, IF it is the tooltip is shown and set to active.
                if (toolTips[0].activeSelf == false)
                {
                    toolTips[0].SetActive(true);
                }
            

            if (toolTips[0].name == "Movement" && GameObject.Find("Movement") != null && GameObject.Find("Movement").GetComponent<ToolTip>().isActive)
            {
                if (GameObject.Find("MovementProgress") == null)
                {
                    objectiveProgress = GameObject.Instantiate(progressBarPrefab, new Vector3(0, 0, 0), Quaternion.identity);
                    objectiveProgress.transform.SetParent(GameObject.Find("Movement").transform);
                    objectiveProgress.transform.localPosition = new Vector3(-90, -50, 0);
                    objectiveProgress.transform.localScale = new Vector3(8, 0.5f, 1);
                    objectiveProgress.name = "MovementProgress";

                }


                if (Input.GetKeyDown(Keybinds.Forward) && movementKeys.Contains(Keybinds.Forward))
                {
                    movementProgress++;
                    movementKeys[movementKeys.IndexOf(Keybinds.Forward)] = KeyCode.None;
                }
                if (Input.GetKeyDown(Keybinds.Left) && movementKeys.Contains(Keybinds.Left))
                {
                    movementProgress++;
                    movementKeys[movementKeys.IndexOf(Keybinds.Left)] = KeyCode.None;

                }
                if (Input.GetKeyDown(Keybinds.Back) && movementKeys.Contains(Keybinds.Back))
                {
                    movementProgress++;
                    movementKeys[movementKeys.IndexOf(Keybinds.Back)] = KeyCode.None;


                }
                if (Input.GetKeyDown(Keybinds.Right) && movementKeys.Contains(Keybinds.Right))
                {
                    movementProgress++;
                    movementKeys[movementKeys.IndexOf(Keybinds.Right)] = KeyCode.None;

                }

                objectiveProgress.transform.Find("Progress").GetComponent<ProgressBar>().targetScale = ((float)movementProgress / totalMovementProgress) * 100;


                if (movementProgress == totalMovementProgress)
                {
                    GameObject.Find("Movement").GetComponent<ToolTip>().completed = true; //The movement tooltip is complete when the player moves
                }

            }
            if (toolTips[0].name == "Rolling" && GameObject.Find("Rolling") != null && GameObject.Find("Rolling").GetComponent<ToolTip>().isActive)
            {
                if (GameObject.Find("RollProgress") == null)
                {
                    objectiveProgress = GameObject.Instantiate(progressBarPrefab, new Vector3(0, 0, 0), Quaternion.identity);
                    objectiveProgress.transform.SetParent(GameObject.Find("Rolling").transform);
                    objectiveProgress.transform.localPosition = new Vector3(-90, -50, 0);
                    objectiveProgress.transform.localScale = new Vector3(8, 0.5f, 1);
                    objectiveProgress.name = "RollProgress";
                }
                if (Input.GetKeyDown(Keybinds.RollLeft) && rollKeys.Contains(Keybinds.RollLeft)) //If the key is pressed and the list still contains the key
                {
                    rollingProgress++;
                    rollKeys[rollKeys.IndexOf(Keybinds.RollLeft)] = KeyCode.None;  //Sets the key index to None so it is not detected again
                }
                if (Input.GetKeyDown(Keybinds.RollRight) && rollKeys.Contains(Keybinds.RollRight))
                {
                    rollingProgress++;
                    rollKeys[rollKeys.IndexOf(Keybinds.RollRight)] = KeyCode.None;
                }


                objectiveProgress.transform.Find("Progress").GetComponent<ProgressBar>().targetScale = ((float)rollingProgress / totalRollingProgress) * 100;

                if (rollingProgress == totalRollingProgress)
                {
                    GameObject.Find("Rolling").GetComponent<ToolTip>().completed = true; //tooltip is complete when the player rolls
                }
            }



            if ((Input.GetAxis("Mouse X") > 0 || Input.GetAxis("Mouse X") < 0 || Input.GetAxis("Mouse Y") > 0 || Input.GetAxis("Mouse Y") < 0) && toolTips[0].name == "Looking" && GameObject.Find("Looking").GetComponent<ToolTip>().isActive) 
            {

                if (toolTips[0].name == "Looking")
                {
                    GameObject.Find("Looking").GetComponent<ToolTip>().completed = true; //tooltip is complete when the player moves the mouse in any direction.

                }
            }








            if (toolTips[0].name == "Escaping" && GameObject.Find("Escaping") != null && GameObject.Find("Escaping").GetComponent<ToolTip>().isActive)
            {

                toolTips[0].GetComponent<Text>().text = "(i) " + toolTips[0].GetComponent<ToolTip>().prompt + " " + planetRescued + "/3 Planets Rescued!";

                if (planetRescued == 3 || Input.GetKeyDown(Keybinds.Leave))
                {
                    GameObject.Find("Escaping").GetComponent<ToolTip>().completed = true; //The Escaping Game Object is marked as complete when 3 planets are rescued or space is pressed.
                }

            }
    }

    public GameObject CreateToolTip(string prompt, string name, bool active = false) //Creates a Tooltip, Requires a prompt that will be the message, a name and whether it is active which is false by default
    {
        GameObject toolTip;
        toolTip = Instantiate(toolTipPrefab, new Vector3(0, 0, 0), Quaternion.identity); //Instantiates the tooltip game object

        toolTip.transform.SetParent(GameObject.Find("Tooltips").transform); //Adds the tooltip as a child to the Tooltips game object
        // toolTip.transform.localPosition = new Vector3(-1500, 350, 0); //sets the starting position 
        toolTip.GetComponent<RectTransform>().anchorMin = new Vector2(0,1);
        toolTip.GetComponent<RectTransform>().anchorMax = new Vector2(0,1);
        toolTip.GetComponent<RectTransform>().pivot = new Vector2(0,1);
        toolTip.GetComponent<RectTransform>().anchoredPosition = new Vector3(0,0,0);
        toolTip.GetComponent<ToolTip>().prompt = prompt; //Sets the Prompt
        toolTip.name = name; //Sets the name
        toolTip.SetActive(active); //Hides or shows the tooltip
        toolTips.Add(toolTip); //Adds to the list
        return toolTip; //Returns the tooltip as a Game Object for easy reference


    }
}
