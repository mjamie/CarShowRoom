using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DayCycle : MonoBehaviour
{
    [Header("Colours")]
    [SerializeField] private Color directionalNightColor;
    [SerializeField] private Color ambientNightColor;

    [Header("Lighting")]
    [SerializeField] private Light directionalLight;
    [SerializeField] private GameObject lighting;

    [SerializeField] private Material skyBoxNight;

    private Color directionalDayColor;
    private Color ambientDayColor;
    private Material skyBoxDay;

    private Quaternion directionalLightRotation;

    private bool isNight = false;
    void Start()
    {
        directionalDayColor = directionalLight.color;
        ambientDayColor = RenderSettings.ambientLight;
        skyBoxDay = RenderSettings.skybox;

        directionalLightRotation = directionalLight.transform.rotation;
    }

    public void ChangeDayCycle()
    {
        if (isNight)
        {
            directionalLight.color = directionalDayColor;
            RenderSettings.ambientLight = ambientDayColor;
            RenderSettings.skybox = skyBoxDay;

            directionalLight.transform.rotation = Quaternion.Euler(50, -120, 0);

            lighting.SetActive(false);

            isNight = false;
        }
        else
        {
            directionalLight.color = directionalNightColor;
            RenderSettings.ambientLight = ambientNightColor;
            RenderSettings.skybox = skyBoxNight;

            directionalLight.transform.rotation = Quaternion.Euler(50, -350, 0);

            lighting.SetActive(true);

            isNight = true;
        }
    }
}
