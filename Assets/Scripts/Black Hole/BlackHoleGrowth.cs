using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlackHoleGrowth : MonoBehaviour
{
    //The target size. The larger the number the larger it will get and the quicker it will expand
    private float targetScale = 8000; 
    //The time it takes to get to the size. The larger number the slower it will expand
    private float timeToReachTarget = 1200; 
    //The scale of the object when it starts growing
    private float startScale;  
    //The percent of the way to the target it has been scaled
    private float percentScaled;
    public bool isActive = true;

    // Start is called before the first frame update
    void Start()
    {
        //Setting the current scale
        startScale = transform.localScale.x;
        if(GameSettings.Tutorial)
        {
            timeToReachTarget = 3000;
            isActive = false;
        }
    }

    // Update is called once per frame
    void Update()
    {
        if(isActive)
        {
            //If it isn't fully scaled
        if (percentScaled < 1f) 
        {
            //Weird thing with keeping a consistant time even if the frame rate fluctuates
            percentScaled += Time.deltaTime / timeToReachTarget; 
            //Finding the new scale
            float scale = Mathf.Lerp(startScale, targetScale, percentScaled); 
            //Setting the new size
            transform.localScale = new Vector3(scale, scale, scale); 
        }
        }
        
    }
}
