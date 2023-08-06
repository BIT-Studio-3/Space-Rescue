using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;

public class ScoreManager : MonoBehaviour
{
   [SerializeField] private List<GameObject> planetUI;
    [SerializeField] private List<GameObject> planets;
    [SerializeField] private List<bool> planetStatus;
    // Start is called before the first frame update
    void Start()
    {
        planetUI = GameObject.FindGameObjectsWithTag("PlanetUI").ToList();
        planets = GameObject.Find("PlanetManager").GetComponent<PlanetSpawn>().planets;
        planetStatus = new List<bool>();
        for(int i = 0;i < planets.Count; i++ )
        {
            planetStatus.Add( planets[i].GetComponent<PlanetDetection>().planetRescued);
        }
    }
    // Update is called once per frame
    void Update()
    {
        foreach(GameObject p in planets)
        {
            if(p != null)
            {
                planetStatus[planets.IndexOf(p)] = planets[planets.IndexOf(p)].GetComponent<PlanetDetection>().planetRescued;
                if(p.GetComponent<PlanetDetection>().inDanger == true && p.GetComponent<PlanetDetection>().planetRescued != true)
                {
                    planetUI[planets.IndexOf(p)].transform.Find("warning").gameObject.SetActive(true);
                }
                else if(p.GetComponent<PlanetDetection>().planetRescued == true) //If The Planet has been rescued
                {
                    planetUI[planets.IndexOf(p)].gameObject.SetActive(false);
                }
            }
            if(p == null && planetStatus[planets.IndexOf(p)] != true)
            {
                planetUI[planets.IndexOf(p)].gameObject.SetActive(false);
            }
        } 
    }
}
