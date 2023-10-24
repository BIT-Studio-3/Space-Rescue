using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
using UnityEditor;

public class OnPlanetTests
{
    public GameObject animalParent;
    public GameObject animal;
    private GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Prefabs/Animals/Neutral/Animal - Neutral Deer Base.prefab");

    // A Test behaves as an ordinary method
    [Test]
    public void FindsAnimalParent()
    {
        // Tests run like as if they are in an empty scene.
        // so gameobjects need to be created
        // other scripts that create and set objects could be
        // referenced but due to the monobehaviour restriction, it is more difficult

        animalParent = new GameObject("AnimalParent");
        animalParent = GameObject.Find("AnimalParent");
        Assert.AreEqual("AnimalParent", animalParent.name);
    }

   [Test]
     public void AnimalParentHasChildren()
    {
        animalParent = new GameObject("AnimalParent");
        animalParent = GameObject.Find("AnimalParent");
        animal = new GameObject("Animal");
        animal.transform.parent = animalParent.transform;

        Assert.Greater(animalParent.transform.childCount, 0);
    }

    [Test]
    public void InstantiatingAnimal()
    {
        animal = GameObject.Instantiate(prefab, new Vector3(0, 0, 0), Quaternion.identity);
        Assert.AreEqual("Animal - Neutral Deer Base(Clone)", animal.name);
    }
}
