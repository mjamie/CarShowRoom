using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CarColourChanger : MonoBehaviour
{
    public Material carMaterial;

    
    public void ChangeColor(Color newColor)
    {
        if (carMaterial != null)
        {
            carMaterial.color = newColor;
        }
    }
}
