using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NightDayCHange : MonoBehaviour
{
    [SerializeField] GameObject nightLight, dayLight, lights;
    [SerializeField] Material nightSkyMat;
    public void NightTime()
    {
        nightLight.SetActive(true);
        dayLight.SetActive(false);
        //lights.SetActive(true);
        RenderSettings.skybox = nightSkyMat;
        RenderSettings.ambientIntensity = 0.44f;
    }
}
