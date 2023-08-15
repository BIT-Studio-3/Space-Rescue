using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class GameSettings
{
    //Global variable to adjust game mechanics in tutorial
    public static bool Tutorial = false;
    //Global variable to keep track of amount of rescued animals
    public static int Score = 0;
    //Variable to see if player has lost
    public static bool Winning = true;
    //Variable to see how many planets are in danger
    //Need to add -- to this variable when planet is saved
    public static int PlanetDanger = 0;

    //Global Array that will be populated with the variety of planet prefabs in the resources folder
    public static GameObject[] planetPrefabs;
    

}

