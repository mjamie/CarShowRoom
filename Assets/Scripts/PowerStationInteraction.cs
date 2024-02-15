using BNG;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerStationInteraction : MonoBehaviour
{

    [SerializeField] SnapZone powerSlot;
    [SerializeField] SnapZone carPowerSlot;
    [SerializeField] MeshRenderer powerIndicator;
    [SerializeField] CardScanner cardScanner;

    public void PowerOnButtonClicked()
    {
        if (powerSlot.HeldItem && cardScanner.openButtons)
        {
            StartCoroutine(Charging());

            IEnumerator Charging()
            {
                yield return new WaitForSeconds(2);
                powerIndicator.enabled = false;
                powerSlot.CanRemoveItem = false;
                carPowerSlot.CanRemoveItem = false;
                cardScanner.openButtons = false;
            }

        }
        else
        {
            print("Nothing in slot");
        }
    }

    public void PowerOffButtonClicked()
    {
        if (powerSlot.HeldItem && cardScanner.openButtons)
        {
            powerSlot.CanRemoveItem = true;
            carPowerSlot.CanRemoveItem = true;
            cardScanner.openButtons = false;
        }
        else
        {
            print("Nothing in slot");
        }
    }

    public void RemovedFromSlot()
    {
        powerIndicator.enabled = true;
    }

}
