using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ToolTip : MonoBehaviour
{

    public string prompt;
    public bool completed;

    public bool isActive;

    // Start is called before the first frame update
    void Start()
    {
        //The text of the tooltip is set to the provided prompt with an (i) added to the front.
        GetComponent<Text>().text = "(i) " + prompt;
        tag = "Tooltip";
        
    }

    // Update is called once per frame
    void Update()
    {
        //Checks if the tooltip is active and completed
        if(isActive && completed)
        {
      
            GetComponent<Text>().color = Color.green; //when the tooltip is marked as complete it will start sliding off screen removed from the list and then destoryed.
            if(transform.localPosition.x > -1100)
            {
                transform.localPosition -= new Vector3(150*Time.deltaTime,0,0);
            }
            else 
            {
                GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips.Remove(gameObject);
                Destroy(gameObject);
            }     
        
        }

       
    }
}
