using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Animal : MonoBehaviour
{
    [Tooltip("The Probability of the animal being selected for a planet (1 - 100)")]
    [Range(1, 100)]
    [SerializeField] private int probability;
    public int Probability { get => probability; set => probability = value; }
    [SerializeField] private string species;
    public string Species { get => species; set => species = value; }

}
