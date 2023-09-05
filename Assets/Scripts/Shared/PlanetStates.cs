//Description: This script is used to store the information in an array of all the planets and the planet that is being entered at the moment. It is also used to transfer information between scenes.
//Author: Palin Wiseman
//Last Updated: 5/09/2023
//Last Updated By: Palin Wiseman
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetStates : MonoBehaviour
{
    public static PlanetStates Instance;

    //Array of info for all the planets
    [HideInInspector]
    public PlanetInfo[] planetInfo = new PlanetInfo[8];

    //Current planet being entered
    [HideInInspector]
    public int activePlanet;

    private void Awake()
    {
        //Singleton pattern
        if (Instance != null)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    //Destroys the current instance when the game ends so the animals can be regenerated
    public void ResetPlanets()
    {
        Destroy(gameObject);
    }
}
