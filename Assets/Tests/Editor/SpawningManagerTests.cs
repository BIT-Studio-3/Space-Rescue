using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
using UnityEditor;
using UnityEditor.SceneManagement;

public class SpawningManagerTests
{
    [Test]
    // Start is called before the first frame update
    public void SpawningManagerExists()
    {
        EditorSceneManager.OpenScene("Assets/Scenes/Planet.unity");
        GameObject spawnManager = GameObject.Find("PlanetParent/Managers/SpawningManager");
        Assert.IsNotNull(spawnManager);
        Assert.AreEqual("SpawningManager", spawnManager.name);
    }

    //Monobehavior tests don't seem to work properly. When we have figured them out I want tests
    // for the following: Checking if parents are assigned, checking if prefabs are assigned,
    //  checking if the spawn function works, checking if the spawn function spawns the correct amount of objects
}
