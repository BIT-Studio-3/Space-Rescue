//This keeps all of the keybindings in one, easily changable, script. All key controls should be added to here and used in reference.
//To be done: Allowing all keybinds to be rebound
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Keybinds
{
    //Figure out how movement works and if it can be added?
    public static KeyCode Boost = KeyCode.LeftShift;
    //Leave is now on return temporarily until we figure out how we want escaping to work.
    public static KeyCode Leave = KeyCode.Return;
    //Mouse0 is the primary button, usually left click
    public static KeyCode Interact = KeyCode.Mouse0;
    //This is the button for pausing or opening the menu
    public static KeyCode Pause = KeyCode.Escape
}
