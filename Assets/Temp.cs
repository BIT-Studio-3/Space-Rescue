using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Temp : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        print("hello world");
        gameObject.GetComponent<Animator>().Play("Run");

    }

    // Update is called once per frame
    void Update()
    {

    }
}
