using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OpenCar : MonoBehaviour
{
    [SerializeField] Material carMat;
    [SerializeField] Material carTransMat;

    [SerializeField] List<Renderer> rends;
    [SerializeField] DOTweenAnimation animUp;

    private void Start()
    {

        //CarUp();
    }

    public void CarUp()
    {
        foreach (var item in rends)
        {
            item.material = carTransMat;
        }

        animUp.DORestartAllById("up");
    }
}
