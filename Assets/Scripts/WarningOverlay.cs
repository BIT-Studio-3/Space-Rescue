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
    private bool isFlashing; //Whether the overlay is flashing or not
    private float colorDuration = 2.5f; //How long the overlay takes to change color
    private AudioSource audioSource;


    void Start()
    {
        isFlashing = false;
        gameObject.GetComponent<Image>().color = new Color(1.0f, 0.0f, 0.0f, 0.0f);
        audioSource = GetComponent<AudioSource>();
    }

    void Update()
    {
        if (isFlashing)
        {
            SoundEffectsSetting.SoundSetting(audioSource);
        }
        else if (audioSource.isPlaying)
        {
            audioSource.Stop();
        }
    }

    public void SetOverlayVisible(bool visible) //Changes the overlay to a transparent red or clear
    {
        isFlashing = visible;
        if (visible)
            StartCoroutine(
                RepeatFlash(
                    colorDuration,
                    new Color(1.0f, 0.0f, 0.0f, 0.0f),
                    new Color(1.0f, 0.0f, 0.0f, 0.075f)
                )
            );
        ;
    }

    IEnumerator RepeatFlash(float colorDuration, Color start, Color end)
    {
        while (isFlashing)
        {
            yield return StartCoroutine(WarningChangeColor(2.25f, start, end));
            yield return StartCoroutine(WarningChangeColor(2.25f, end, start));
        }
        yield return null;
    }

    IEnumerator WarningChangeColor(float colorDuration, Color start, Color end)
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
