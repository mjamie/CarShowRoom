using Dreamteck.Splines;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InstantiateCars : MonoBehaviour
{
    [SerializeField] GameObject [] newCars;
    float timePassed = 0;

    float randomNo;

    SplineComputer splineComputer;

    private void Start() {
        splineComputer = GetComponent<SplineComputer>();
        randomNo = UnityEngine.Random.Range(4, 8);
    }
    private void Update() {
        timePassed += Time.deltaTime;

        if (timePassed >= randomNo) {
            randomNo = UnityEngine.Random.Range(8, 12);

            int randomCar = UnityEngine.Random.Range(0, newCars.Length);

            GameObject car = Instantiate(newCars[randomCar], gameObject.transform);
            car.GetComponent<SplineFollower>().spline = splineComputer;

            car.AddComponent<DestroyObject>();

            timePassed = 0;
        }
    }
}
