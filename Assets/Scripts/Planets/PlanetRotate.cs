using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetRotate : MonoBehaviour
{
    [SerializeField]
    private float orbitSpeed = 3.0f;
    [SerializeField]
    private float minSpin = -4.0f;
    [SerializeField]
    private float maxSpin = -10.0f;
    // Start is called before the first frame update
    void Start()
    {
        if (gameObject.tag == "Planet")
        {
            orbitSpeed = Random.Range(maxSpin, minSpin);
        }
    }

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(0, orbitSpeed * Time.deltaTime, 0);
    }

}
