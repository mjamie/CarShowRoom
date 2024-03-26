using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class CarAnimation : MonoBehaviour
{

    [SerializeField] private string animationID;
    [Space]
    [SerializeField] private TextMeshProUGUI text;

    [HideInInspector] public bool carFloating = false;

    private InsideCar insideCar;
    private void Start()
    {
        insideCar = GetComponent<InsideCar>();
    }

    public void PlayAnimationByID()
    {
        if (!carFloating)
        {
            transform.GetChild(0).GetComponent<DOTweenAnimation>().DORestartAllById(animationID);
            text.text = "Retract Car";
            insideCar.LabelsDisplay(true);
            carFloating = true;
        }
        else
        {
            transform.GetChild(0).GetComponent<DOTweenAnimation>().DOPlayBackwardsAllById(animationID);
            text.text = "Expand Car";
            insideCar.LabelsDisplay(false);
            carFloating = false;
        }
    }
}
