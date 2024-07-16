using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CarColourUI : MonoBehaviour
{
    public SimpleCarSelection simpleCarSelection;
    public Button[] colorButtons;
    public Color[] carColors;

    private void Start()
    {
        SetupColorButtons();
    }

    private void SetupColorButtons()
    {
        for (int i = 0; i < colorButtons.Length; i++)
        {
            int colorIndex = i;
            colorButtons[i].onClick.AddListener(() => ChangeCarColor(carColors[colorIndex]));
        }
    }

    private void ChangeCarColor(Color newColor)
    {
        GameObject currentCar = simpleCarSelection.GetCurrentCar();
        if (currentCar != null)
        {
            CarColourChanger colorChanger = currentCar.GetComponent<CarColourChanger>();
            if (colorChanger != null)
            {
                colorChanger.ChangeColor(newColor);
            }
        }
    }
}
