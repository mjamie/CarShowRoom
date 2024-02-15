using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyObject : MonoBehaviour
{

    float timePassed = 0;

    public void DestroyObjectc() {
        Destroy(gameObject);
    }

    private void Update() {
        timePassed += Time.deltaTime;

        if (timePassed >= 60) {
            DestroyObjectc();
        }
    }

    public void DestroyObjectWithDelay(float delay) {
        Destroy(gameObject, delay);
    }
}
