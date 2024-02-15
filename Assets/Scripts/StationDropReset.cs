using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StationDropReset : MonoBehaviour
{
    [SerializeField] GameObject handleIn, handleOut, card;

    private Vector3 handleInPos, handleOutPos, cardPos;
    private void Start()
    {
        handleInPos = handleIn.transform.position;
        handleOutPos = handleOut.transform.position;
        cardPos = card.transform.position;
    }

    private void OnTriggerEnter(Collider other)
    {

        if (other.gameObject == handleIn)
        {
            handleIn.transform.position = handleInPos;
        }

        if (other.gameObject == handleOut)
        {
            handleOut.transform.position = handleOutPos;
        }

        if (other.gameObject == card)
        {

            Debug.Log("Test");
            card.transform.position = cardPos;
        }
    }
}
