using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

public class OnPlanetTests
{
    public GameObject animalParent;
    public GameObject animal;

    // A Test behaves as an ordinary method
    [Test]
    public void FindsAnimalParent()
    {
        animalParent = GameObject.Find("AnimalParent");
        Assert.AreEqual("AnimalParent", animalParent.name);
    }

   [Test]
     public void AnimalParentHasChildren()
    {
        animalParent = GameObject.Find("AnimalParent");
        //cant instantiate without a prefab but also cant drag a prefab into the test
        animal = new GameObject("Animal");
        animal.transform.parent = animalParent.transform;

        Assert.Greater(animalParent.transform.childCount, 0);
    }
}
