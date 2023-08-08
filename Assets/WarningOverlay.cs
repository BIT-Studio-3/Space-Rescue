//Description: This script is used to control the warning overlay that appears when the player is in range of the black-hole
//Programmer: Chase Bennett-Hill
//Last Modified By: Chase Bennett-Hill
//Last Modified Date: 08/08/2023
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class WarningOverlay : MonoBehaviour
{
    private float overlayAlpha = 0.0f; //The alpha value of the overlay
    [SerializeField] 
    private bool isFlashing; //Whether the overlay is flashing or not
    void Start()
    {
        isFlashing = false;
        gameObject.GetComponent<Image>().color = new Color(1.0f, 0.0f, 0.0f, overlayAlpha);
    }
    public void SetOverlayVisible(bool visible) //Changes the overlay to a transparent red or clear
    {
        isFlashing = visible;
        print("Go");
        if (visible)
            StartCoroutine(WarningFlashing());            
    }

    IEnumerator WarningBeginFlash(float colorDuration,Color start,Color end)
    {
        float t = 0;
        while (t < colorDuration)
        {
            t += Time.deltaTime;
            gameObject.GetComponent<Image>().color = Color.Lerp(start, end, t / colorDuration);
            yield return null;
        }
    }
    
    IEnumerator WarningFlashing()
    {
        while(isFlashing)
        {
            yield return StartCoroutine(WarningBeginFlash(2.25f, new Color(1.0f, 0.0f, 0.0f, 0.0f), new Color(1.0f, 0.0f, 0.0f, 0.4f)));
            yield return  StartCoroutine(WarningEndFlash(2.25f, new Color(1.0f, 0.0f, 0.0f, 0.4f), new Color(1.0f, 0.0f, 0.0f, 0)));
        }
        yield return null;

    }
    IEnumerator WarningEndFlash(float colorDuration,Color start,Color end)
    {
        float t = 0;
        while (t < colorDuration)
        {
            t += Time.deltaTime;
            gameObject.GetComponent<Image>().color = Color.Lerp(start, end, t / colorDuration);
            yield return null;
        }
    }
}
