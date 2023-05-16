using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;

public class ScoreManager : MonoBehaviour
{
    public Material rescued;
    public Material destroyed;
    public Text planetsRemaining;
    public Text planetsSaved;
    public List<GameObject> planetUI;
    public List<GameObject> planets;
    // Start is called before the first frame update
    void Start()
    {
        planetUI = GameObject.FindGameObjectsWithTag("PlanetUI").ToList();
        planets = GameObject.Find("PlanetManager").GetComponent<PlanetSpawn>().planets;
    }

    // Update is called once per frame
    void Update()
    {
        planetsSaved.text = "Rescued: " + GameSettings.Score.ToString();
        planetsRemaining.text = "Remaining: " + GameObject.Find("arrow").GetComponent<FindingPlanets>().planetsNotRescued.Count.ToString();
        foreach(GameObject p in planets)
        {
            if(p == null)
            {
                planetUI[planets.IndexOf(p)].GetComponent<MeshRenderer>().material = destroyed;
            }
            else if(p.GetComponent<PlanetDetection>().planetRescued == true)
            {
                planetUI[planets.IndexOf(p)].GetComponent<MeshRenderer>().material = rescued;

            }
        }
        
    }
}
