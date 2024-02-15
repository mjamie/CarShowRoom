using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CreateCar : MonoBehaviour
{

    [SerializeField] GameObject carSpawnSpot;

    [SerializeField] GameObject[] cars;
    private void OnTriggerEnter(Collider other) {
        if (other.CompareTag("BMW")) {
            Instantiate(cars[0], carSpawnSpot.transform, false);

            Destroy(other.gameObject, 3);
        }
    }
}
