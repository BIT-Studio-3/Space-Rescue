using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hostile : MonoBehaviour
{

    [SerializeField]
    private GameObject warning;

    // Start is called before the first frame update
    void Start()
    {
        warning.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (Detection.Instance.detected == true)
        {
            warning.SetActive(true);
        }
        else
        {
            warning.SetActive(false);
        }
    }
}
