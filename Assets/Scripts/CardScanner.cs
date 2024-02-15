using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CardScanner : MonoBehaviour
{
    AudioSource audioSource;
    [SerializeField] CarChargingWalkthrough carChargingWalkthrough;
    public bool openButtons = false;

    private void Start()
    {
        audioSource = GetComponent<AudioSource>();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Card"))
        {
            print("Card Entered");
            //play buzz noise.
            audioSource.Play();
            //Unlock sockets.
            openButtons = true;

            if (carChargingWalkthrough.walkThroughStart)
            {
                carChargingWalkthrough.PlayNextAudioClipAtPosition(3);
                carChargingWalkthrough.walkThroughStart = false;
            }
        }
    }

    private void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Card"))
        {
            
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Card"))
        {
            print("Card Exited");
        }
    }
}
