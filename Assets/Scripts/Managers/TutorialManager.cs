using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TutorialManager : MonoBehaviour
{
    public GameObject toolTipPrefab;
    public static TutorialManager instance;
    public Canvas canvas;

    public List<GameObject> toolTips;
    // Start is called before the first frame update
    void Start()
    {
        instance = this;
        GameSettings.Tutorial = true;
        CreateToolTip("Use the WASD keys to move your Ship!","Movement",true);
        CreateToolTip("Use Q & E to Roll your Spaceship!","Rolling",false);
        CreateToolTip("Use the mouse to look Around","Looking",false);
    }

    // Update is called once per frame
    void Update()
    {
        if(toolTips[0].activeSelf == false)
        {
            toolTips[0].SetActive(true);
            toolTips[0].GetComponent<ToolTip>().isActive = true;
        }
    }


    public void CreateToolTip(string prompt,string name,bool active)
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
