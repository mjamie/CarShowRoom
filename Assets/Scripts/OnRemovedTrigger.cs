using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OnRemovedTrigger : MonoBehaviour
{
    Tutorial tutorial;

    private void Start()
    {
        tutorial = GetComponentInParent<Tutorial>();
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.name.Contains("Cube"))
        {
            tutorial.PlayNextAudio();
        }
    }
}
