using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;

public class SimpleCarSelection : MonoBehaviour
{
    [SerializeField ]private GameObject[] vehicleareas = new GameObject[3];

    private GameObject currentCar;
    private void Start()
    {
        OnChangeVehicle(0);
    }

    public void OnChangeVehicle(int vehicleNo)
    {
        foreach (GameObject vehicle in vehicleareas)
        {
            vehicle.SetActive(false);
        }

        vehicleareas[vehicleNo].SetActive(true);

        currentCar = vehicleareas[vehicleNo].transform.GetChild(0).gameObject;

        OnUpdateUI(vehicleNo);
    }

    void OnUpdateUI(int buttonPositon)
    {
        for (int i = 0; i < transform.childCount; i++)
        {  
            transform.GetChild(i).gameObject.GetComponent<Button>().interactable = true;
        }

        transform.GetChild(buttonPositon).gameObject.GetComponent<Button>().interactable = false;
    }

    public GameObject GetCurrentCar()
    {
        return currentCar;
    }
}
