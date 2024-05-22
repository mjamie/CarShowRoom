using BNG;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HydrogenStationFunctions : MonoBehaviour
{

    [SerializeField] private SnapZone carSnapZone;

    [Space]
    [Header("UI")]
    [SerializeField] private GameObject stationPanelUI;
    [SerializeField] private Image fullUpBarUI;

    [Header("Sounds")]
    [SerializeField] private AudioClip airReleaseSound;
    [SerializeField] private AudioClip fuelingSound;

    private AudioSource audioSource;

    private int currentPanel = 0;

    private bool isCarFueling = false;
    private bool isCarFueled = false;

    private void Start()
    {
        audioSource = GetComponent<AudioSource>();

        ResetStation();
    }

    private void Update()
    {
        if (isCarFueling)
        {
            fullUpBarUI.fillAmount += Time.deltaTime / 10;

            if (fullUpBarUI.fillAmount >= 1)
            {
                NextPanel();
                isCarFueling = false;
            }
        }
    }

    public void ResetStation()
    {
        Transform stationUITransform = stationPanelUI.transform;

        for (int i = 0; i < stationPanelUI.transform.childCount; i++)
        {
            stationUITransform.GetChild(i).gameObject.SetActive(false);
        }

        isCarFueled = false;
        stationUITransform.GetChild(0).gameObject.SetActive(true);
    }

    public void NextPanel()
    {
        Transform stationUITransform = stationPanelUI.transform;

        for (int i = 0; i < stationUITransform.childCount; i++)
        {
            stationUITransform.GetChild(i).gameObject.SetActive(false);
        }

        currentPanel++;

        stationUITransform.GetChild(currentPanel).gameObject.SetActive(true);
    }

    public void NextPanel(int panelNo)
    {
        Transform stationUITransform = stationPanelUI.transform;

        for (int i = 0; i < stationPanelUI.transform.childCount; i++)
        {
            stationUITransform.GetChild(i).gameObject.SetActive(false);
        }

        stationUITransform.GetChild(panelNo).gameObject.SetActive(true);
        currentPanel = panelNo;
    }

    public void AttatchToVehicle()
    {
        NextPanel(1);
    }

    public void FullUpCar()
    {
        if (carSnapZone.HeldItem is null)
        {
            return;
        }

        if(!isCarFueling && !isCarFueled)
            StartCoroutine(CarFullUpTimer());
    }

    private IEnumerator CarFullUpTimer()
    {
        isCarFueled = true;
        carSnapZone.CanRemoveItem = false;

        yield return new WaitForSeconds(1);

        audioSource.PlayOneShot(airReleaseSound);

        yield return new WaitForSeconds(5);

        NextPanel();

        isCarFueling = true;
        audioSource.PlayOneShot(fuelingSound);

        yield return new WaitForSeconds(10);
        
        NextPanel(3);

        audioSource.Stop();
        isCarFueling = false;
        carSnapZone.CanRemoveItem = true;

        fullUpBarUI.fillAmount = 0;
    }
}
