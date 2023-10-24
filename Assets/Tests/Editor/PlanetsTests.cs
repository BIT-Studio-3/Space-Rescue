using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

public class PlanetsTests
{
    public GameObject rotator;
    public GameObject planet;

    // A Test behaves as an ordinary method
    [Test]
    public void PlanetsSpawnInParent()
    {
        rotator = new GameObject("Rotator");
        planet = new GameObject("Planet");

        rotator = GameObject.Find("Rotator");
        planet = GameObject.Find("Planet");

        planet.transform.parent = rotator.transform;

        Assert.AreEqual(rotator.transform, planet.transform.parent);
        
    }
    
}
