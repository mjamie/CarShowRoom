using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HybridCarAnimLift : MonoBehaviour
{
    [SerializeField] private DOTweenAnimation topCar;

    public void PlayLiftAnimation()
    {
        topCar.DOPlay();
    }
}
