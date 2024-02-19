using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CarAnimation : MonoBehaviour
{

    [SerializeField] private string animationID;

    private bool carFloating = false;
    public void PlayAnimationByID()
    {
        if (!carFloating)
        {
            transform.GetChild(0).GetComponent<DOTweenAnimation>().DORestartAllById(animationID);
            carFloating = true;
        }
        else
        {
            transform.GetChild(0).GetComponent<DOTweenAnimation>().DOPlayBackwardsAllById(animationID);
            carFloating = false;
        }
    }
}
