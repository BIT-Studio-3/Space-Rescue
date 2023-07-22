//This keeps all of the keybindings in one, easily changable, script. All key controls should be added to here and used in reference.
//To be done: Allowing all keybinds to be rebound
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Keybinds
{
    //These are currently just here to be used in the tutorial tooltips. Need to figure out how to get them used for the actual movement?
    //Movement
    public static KeyCode Forward = KeyCode.W;
    public static KeyCode Left = KeyCode.A;
    public static KeyCode Right = KeyCode.D;
    public static KeyCode Back = KeyCode.S;
    //Rolling
    public static KeyCode RollLeft = KeyCode.Q;
    public static KeyCode RollRight = KeyCode.E;

    //Also need to do mouse movement. This will help if we ever make the game compatable with controllers or touchpads

    //Figure out how movement works and if it can be added?
    public static KeyCode Boost = KeyCode.LeftShift;
    //Leave is now on return temporarily until we figure out how we want escaping to work.
    public static KeyCode Leave = KeyCode.Return;
    //Mouse0 is the primary button, usually left click
    public static KeyCode Interact = KeyCode.Mouse0;
    //This is the button for pausing or opening the menu
    public static KeyCode Pause = KeyCode.Escape;
}
