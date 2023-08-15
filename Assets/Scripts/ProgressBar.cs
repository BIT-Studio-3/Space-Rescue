using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class ProgressBar : MonoBehaviour
{

    private RectTransform progressBar;
    public float targetScale; 
    public float barSpeed = 5 ; 
    // Start is called before the first frame update
    void Start()
    {
        progressBar = gameObject.GetComponent<RectTransform>();
        RectTransform b = gameObject.transform.parent.GetComponent<RectTransform>();
        b.anchorMin = new Vector2(0,0);
        b.anchorMax = new Vector2(0,0);
        b.pivot = new Vector2(0,0);
        b.anchoredPosition = new Vector3(0,0,0);
    }
    // Update is called once per frame
    void Update()
    {     
        progressBar.sizeDelta = Vector2.Lerp(new Vector2(progressBar.sizeDelta.x,progressBar.sizeDelta.y),new Vector2(targetScale,progressBar.sizeDelta.y),barSpeed  * Time.deltaTime);
    }
}
