using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Scaling : MonoBehaviour
{
    private float scaleFactor = 1f; //Scales the minigame by this value;
    // Start is called before the first frame update
    void Start()
    {
        gameObject.transform.localScale = new Vector3(1, 1, 1); //set the initial size to 1;

    }

    // Update is called once per frame
    void Update()
    {
        float ratio = 0;
        if (Screen.width > Screen.height) //check if the screen is horizontal or vertical
        {
            ratio = (float)Screen.height / Screen.width; //Horizontal
            scaleFactor = 1.75f; //the minigame ui will scale to fit most horizontal screens
        }
        else if (Screen.width < Screen.height)
        {
            ratio = (float)Screen.width / Screen.height; //Vertical
            scaleFactor = 1f; ///the minigame ui will scale to fit most vertical screens
        }
        ratio = scaleFactor * ratio;

        gameObject.transform.localScale = new Vector3(ratio, ratio, ratio);

    }
}
