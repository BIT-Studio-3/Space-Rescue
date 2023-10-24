using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
using UnityEditor.SceneManagement;
public class ShipMovementTest
{
    public GameObject player;
    
    //Testing that the player's tag is "Player"
    //Should return true
    [Test]
    public void PlayerTagTrue()
    {
        EditorSceneManager.OpenScene("Assets/Scenes/Main Scene.unity");
        player = GameObject.Find("Player");
        Assert.AreEqual("Player", player.tag);
    }

    //Testing that the player's tag is not "Ship"
    //should return true
    [Test]
    public void PlayerTagFalse()
    {
        EditorSceneManager.OpenScene("Assets/Scenes/Main Scene.unity");
        player = GameObject.Find("Player");
        Assert.AreNotEqual("Ship", player.tag);
    }
}
