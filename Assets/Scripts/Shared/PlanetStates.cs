using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlanetStates : MonoBehaviour
{

    public static PlanetStates Instance;
    // Start is called before the first frame update

    public PlanetInfo[] planetInfo = new PlanetInfo[8];
    public int activePlanet;

    private void Awake()
    {
        if (Instance != null)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    void Start()
    {
        
    }
}
