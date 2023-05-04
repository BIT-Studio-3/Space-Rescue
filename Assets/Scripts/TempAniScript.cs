using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//Temp Script for forgetting to push
public class TempAniScript : MonoBehaviour
{
    /*
    - speed of animal
    - wait time
    - random next position
    - random orientation
    
    animal should pick a random position (-50,50)
    */

    public bool doneMove= false;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(wait());
    }

    // Update is called once per frame
    void Update()
    {
    }

    private void MoveAnimal()
    {

    }

    IEnumerator wait()
    {
        while (!doneMove)
        {
            Vector3 pos = new Vector3(Random.Range(-50,50), 0f, Random.Range(-50, 50));
            transform.position = pos;
            
            if (transform.position == pos)
            {
                doneMove = true;
            }
        }
        doneMove = false;
        yield return new WaitForSeconds(10);
    }

}
