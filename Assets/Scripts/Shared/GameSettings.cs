// Description: This file contains the global variables that will be used throughout the game.
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

    //Global Array that will be populated with the variety of planet prefabs in the resources folder. This is loaded in PlanetTextureGenerator.cs
    public static GameObject[] planetPrefabs = new GameObject[0];

    //Volume from 0 to .8 for the sound effects
    public static float SoundEffectsVolume = .4f;

    //Volume from 0 to .8 for the music. 1 is way too loud
    public static float MusicVolume = .4f;

    //Mute variable for sound effects
    public static bool Mute = false;
}
