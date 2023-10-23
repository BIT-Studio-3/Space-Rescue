using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
//using UnityEditor;

public class P_PlanetsTests
{
    //public GameObject animal;
    //private GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Prefabs/Animals/Neutral/Animal - Neutral Deer Base.prefab");
    [UnityTest]
    public IEnumerator PlanetsSpawnWithParents()
    {
        //animal = GameObject.Instantiate(prefab, new Vector3(0, 0, 0), Quaternion.identity);
        //Assert.AreEqual("Animal - Neutral Deer Base", animal.name);
        yield return null;
    }
}
