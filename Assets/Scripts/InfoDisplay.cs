using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoDisplay : MonoBehaviour
{
    public void ShowInfoAtIndex(int infoNo)
    {
        ClosePanels();
        transform.GetChild(infoNo).gameObject.SetActive(true);
    }

    private void ClosePanels()
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            transform.GetChild(i).gameObject.SetActive(false);
        }
    }
}
