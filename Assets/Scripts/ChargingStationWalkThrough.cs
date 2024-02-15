using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChargingStationWalkThrough : MonoBehaviour
{
    [SerializeField] private List<AudioClip> audioClips;

    private AudioSource audioSource;

    private void Start()
    {
        audioSource = GetComponent<AudioSource>();
    }

    public void PlayAudioSourceAtClipNumber(int clipNumber)
    {
        audioSource.clip = audioClips[clipNumber];
        audioSource.Play();
    }
}
