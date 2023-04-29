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
        GetComponent<Text>().text = "(i) " + prompt;
        tag = "Tooltip";
        
    }

    // Update is called once per frame
    void Update()
    {
        
        if(isActive)
        {
        if(completed)
        {
            GetComponent<Text>().color = Color.green;
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
}
