using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Linq;

public class PlanetDetection : MonoBehaviour
{
    public bool playerInsideRadius;
    public bool planetRescued;
    public bool inDanger;

    public GameObject planet; //the planet prefab

    void Start() { }

    void Update()
    {
        if (
            GameSettings.Tutorial
            && GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips.Count
                != 0
        )
        {
            if (
                playerInsideRadius
                && GameObject.Find("TutorialManager").GetComponent<TutorialManager>().toolTips[
                    0
                ].name == "Approaching"
                && GameObject.Find("Approaching") != null
                && GameObject.Find("Approaching").GetComponent<ToolTip>().isActive
            )
            {
                GameObject.Find("Approaching").GetComponent<ToolTip>().completed = true;
            }
        }
        if (Input.GetKeyDown(Keybinds.Interact))
        {
            if (playerInsideRadius && !planetRescued)
            {
                if (GameSettings.Tutorial)
                {
                    if (
                        playerInsideRadius
                        && GameObject
                            .Find("TutorialManager")
                            .GetComponent<TutorialManager>()
                            .toolTips[0].name == "Rescue"
                        && GameObject.Find("Rescue") != null
                        && GameObject.Find("Rescue").GetComponent<ToolTip>().isActive
                    )
                    {
                        GameObject.Find("Rescue").GetComponent<ToolTip>().completed = true;
                        planetRescued = true; //Note from Chase - Temp fix for tutorial until updated with planet and minigame scenes
                        GameObject
                            .Find("TutorialManager")
                            .GetComponent<TutorialManager>()
                            .planetRescued++;
                    }
                    else if (
                        playerInsideRadius
                        && !planetRescued
                        && GameObject
                            .Find("TutorialManager")
                            .GetComponent<TutorialManager>()
                            .toolTips[0].name == "Escaping"
                        && GameObject.Find("Escaping") != null
                        && GameObject.Find("Escaping").GetComponent<ToolTip>().isActive
                    )
                    {
                        planetRescued = true; //Note from Chase - Temp fix for tutorial until updated with planet and minigame scenes
                        GameObject
                            .Find("TutorialManager")
                            .GetComponent<TutorialManager>()
                            .planetRescued++; //Counts ammount of rescued planets, so the tutorial can count the rescued planets properly
                    }
                }
                if (!GameSettings.Tutorial)
                {
                    planetRescued = true;
                    GameMenuManager.Instance.LoadNewScene("Planet");
                }

                if (inDanger)
                {
                    GameSettings.PlanetDanger--;
                    BHWarning.Instance.PlanetWarning();
                }
            }
        }
    }

    public float PlanetDistanceToBlackHole() //The Planet fires a raycast to find it's approx distance from the black hole
    {
        Vector3 blackHoleLocation = GameObject.Find("Black Hole").gameObject.transform.position;
        Vector3 PlanetdirectionToBlackHole = blackHoleLocation - gameObject.transform.position;
        float distBlackHole = PlanetdirectionToBlackHole.sqrMagnitude; //This is not the correct value because the black hole remains at 0 0 0. this distance does not change which is why the raycast is needed

        int layerMask = 1 << 2; //the layer mask is set to layer 2
        layerMask = ~layerMask; // the ~ symbol inverts this so the ray will ignore layer 2 ("this layer is called ignore raycast") I set the warning sphere to this layer
        //so the raycast would hit the danger hitbox and not the warning sphere.

        //The ray is fired from the planet towards the blackhole the hit object is returned as hit, ignores the layermask value and returns true if the object is DistortionHitbox

        RaycastHit[] hits = (
            Physics.RaycastAll(
                gameObject.transform.position,
                PlanetdirectionToBlackHole * distBlackHole,
                distBlackHole
            )
        );
        if (hits.Length > 0)
            hits = hits.Where(hit => hit.transform.name != "WarningBox").ToArray();
        hits = hits.Where(hit => hit.transform.name == "SphereHitbox").ToArray();
        Debug.DrawRay(gameObject.transform.position, PlanetdirectionToBlackHole, Color.blue, 5f);
        Debug.Log(" Planet New Raycast: " + hits[0].transform.name);

        return Mathf.Round(hits[0].distance); //hit.distance is the length of the raycast the value is then rounded to a whole number
    }

    private void OnDestroy()
    {
        GameObject o = GameObject.Find("arrow");
        if (o != null)
        {
            o.GetComponent<FindingPlanets>().planetsNotRescued.Remove(gameObject);
        }
        GameObject a = GameObject.Find("PlanetManager");
        if (a != null)
        {
            int i = a.GetComponent<PlanetSpawn>().planets.IndexOf(gameObject);
            a.GetComponent<PlanetSpawn>().planets[i] = null;
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInsideRadius = true;
        }
        if (other.CompareTag("Black Hole Warning"))
        {
            inDanger = true;
        }
    }

    private void OnTriggerExit(Collider other)
    //When the player leaves the radius the planet is no longer active.
    {
        if (other.CompareTag("Player"))
        {
            playerInsideRadius = false;
        }
    }
}
