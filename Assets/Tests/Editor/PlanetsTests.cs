using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

public class PlanetsTests
{
    public GameObject planetParent;
    public GameObject planet;

    // A Test behaves as an ordinary method
    [Test]
    public void PlanetsSpawnInParent()
    {
        planetParent = GameObject.Find("Rotator");
        planet = GameObject.Find("Planet(Clone)");

        Assert.AreEqual(planet.transform.parent, planetParent);
        
    }
    
}
