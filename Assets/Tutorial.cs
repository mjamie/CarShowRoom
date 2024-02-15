using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tutorial : MonoBehaviour
{

    [SerializeField] private Animator leftControllerAnimator;
    [SerializeField] private Animator rightControllerAnimator;

    [SerializeField] private List<AudioClip> audioClips;
    
    private AudioSource audioSource;

    private int currentAudioClipIndex = 0;

    private void Start()
    {
        audioSource = GetComponent<AudioSource>();

        PlayNextAudio();
    }

    public void PlayNextAudio()
    {
        audioSource.clip = audioClips[currentAudioClipIndex];

        audioSource.Play();

        ActionOnIndex();

        currentAudioClipIndex++;
    }

    public void PlayAudio()
    {
        audioSource.Play();
    }

    private void ActionOnIndex()
    {
        switch (currentAudioClipIndex)
        {
            case 0:
                leftControllerAnimator.SetTrigger("LeftAnalog");
                rightControllerAnimator.SetTrigger("RightAnalog");
                break;
            case 1:
                leftControllerAnimator.SetTrigger("LeftAnalog");
                rightControllerAnimator.SetTrigger("RightAnalog");
                leftControllerAnimator.SetTrigger("LeftGrip");
                rightControllerAnimator.SetTrigger("RightGrip");
                break;
            default:
                break;
        }
    }
}
