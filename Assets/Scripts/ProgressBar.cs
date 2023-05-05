using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class ProgressBar : MonoBehaviour
{

    private RectTransform progressBar;
    public float targetScale; 
    public float barSpeed = 5 ; 
    private float startScale;  
    private float percentScaled;
    // Start is called before the first frame update
    void Start()
    {
        progressBar = gameObject.GetComponent<RectTransform>();
        startScale = progressBar.sizeDelta.x;

    }

    // Update is called once per frame
    void Update()
    {     
        float scale = Mathf.Lerp(startScale, targetScale, percentScaled); 
        progressBar.sizeDelta = Vector2.Lerp(new Vector2(progressBar.sizeDelta.x,progressBar.sizeDelta.y),new Vector2(targetScale,progressBar.sizeDelta.y),barSpeed  * Time.deltaTime);
    }



}
