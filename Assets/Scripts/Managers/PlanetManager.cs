using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlanetManager : MonoBehaviour
{
    private GameObject planetParent;
    public static PlanetManager Instance;
    // Start is called before the first frame update
    void Start()
    {
        Instance = this;
        planetParent = GameObject.Find("PlanetParent");
    }

    void Update()
    {
        if (Input.GetKeyDown(Keybinds.Leave) && planetParent.activeSelf)
        {
            ShipMovement.Instance.ResetBoost(); //This resets the ships boost before it goes back to the main scene
            GameMenuManager.Instance.ReturntoScene("Spherical Planet");
        }
    }

    public void LoadMiniGame()
    {
        SceneManager.LoadScene("Mini Game", LoadSceneMode.Additive);
        planetParent.SetActive(false);
    }

    public void ReturnMiniGame()
    {
        planetParent.SetActive(true);
        SceneManager.UnloadSceneAsync("Mini Game");
    }
}
