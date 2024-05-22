using BNG;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class CarChargingWalkthrough : MonoBehaviour
{
    [SerializeField] private SnapZone carSnapZone;
    [SerializeField] private SnapZone chargerSnapZone;

    [SerializeField] private Button redOffButton;
    [SerializeField] private Button greenOnButton;

    [SerializeField] private List<AudioClip> audioClips;

    private AudioSource audioSource;

    [HideInInspector] public bool walkThroughStart = false;

    private int audioClipPos = -1;
    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
    }

    private void Start()
    {
        walkThroughStart = false;
    }

    public void PlayNextAudioClip()
    {
        audioClipPos++;

        audioSource.PlayOneShot(audioClips[audioClipPos]);
    }

    public void PlayNextAudioClipAtPosition(int audioClipPosition)
    {
        audioSource.PlayOneShot(audioClips[audioClipPosition]);
    }

    public void WalkThroughStart()
    {

        Debug.Log("Play=ing");
        PlayNextAudioClip();

        carSnapZone.OnSnapEvent.AddListener(delegate { PlayNextAudioClipAtPosition(1); });
        chargerSnapZone.OnSnapEvent.AddListener(delegate { PlayNextAudioClipAtPosition(2); });
        greenOnButton.onButtonDown.AddListener(delegate { PlayNextAudioClipAtPosition(4); });

    }

    public void EndWalkthrough()
    {
        carSnapZone.OnSnapEvent.RemoveAllListeners();
        chargerSnapZone.OnSnapEvent.RemoveAllListeners();

        greenOnButton.onButtonDown.RemoveListener(delegate { PlayNextAudioClipAtPosition(4); });
        redOffButton.onButtonDown.RemoveListener(delegate { PlayNextAudioClipAtPosition(5); });
    }
}
