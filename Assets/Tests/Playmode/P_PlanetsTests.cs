using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

public class P_PlanetsTests
{
    [UnityTest]
    public IEnumerator PlanetsSpawnWithParents()
    {
        // Use the Assert class to test conditions.
        // Use yield to skip a frame.
        yield return null;

        GameObject planetParent = GameObject.Find("Rotator");
        GameObject planet = GameObject.Find("Planet(Clone)");

        Assert.AreEqual(planet.transform.parent, planetParent);
    }
}
