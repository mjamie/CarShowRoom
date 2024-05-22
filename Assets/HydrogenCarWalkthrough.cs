using BNG;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HydrogenCarWalkthrough : MonoBehaviour
{
    [Header("SnapZones")]
    [SerializeField] private SnapZone carSnapZone;
    [SerializeField] private SnapZone chargerSnapZone;

    [Header("Buttons")]
    [SerializeField] private GameObject h70Button, h70MButton;

    [Space]
    [SerializeField] private AudioSource stationAudioSource;
    [SerializeField] private AudioClip[] walkthroughAudio;

    private AudioSource audioSource;

    private int currentClip = -1;

    private bool walkthroughActive = false;
    private void Start()
    {
        audioSource = GetComponent<AudioSource>();
    }

    public void StartHydrogenWalkThrough()
    {
        walkthroughActive = true;
        PlayClip(0);
    }

    public void PlayNextClip()
    {
        if (walkthroughActive)
            return;

        currentClip++;

        if (currentClip >= walkthroughAudio.Length)
        {
            currentClip = -1;
            walkthroughActive = false;
            return;
        }

        audioSource.PlayOneShot(walkthroughAudio[currentClip]);
    }

    public void PlayClip(int i)
    {
        if (!walkthroughActive)
            return;

        if (currentClip == i)
        {
            return;
        }

        currentClip = i;

        audioSource.PlayOneShot(walkthroughAudio[i]);

        if (currentClip + 1 >= walkthroughAudio.Length)
        {
            currentClip = -1;
            walkthroughActive = false;
            return;
        }

    }


}
