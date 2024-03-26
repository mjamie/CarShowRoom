using BNG;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using TMPro;

public class InsideCar : MonoBehaviour
{
    private CarAnimation carAnimation;

    [SerializeField] private Transform insideCarPosition;
    [SerializeField] private Transform exitCarPosition;
    [Space]
    [SerializeField] private GameObject startCarButton;
    [SerializeField] private GameObject exitCarButton;
    [Space]
    [SerializeField] private AudioClip carStartClip;
    [SerializeField] private AudioClip carMotorClip;
    [Space]
    [SerializeField] private AudioClip retractCarClip;
    [Space]
    [SerializeField] private float playerOffsetInsideCar = -0.04f;

    private PlayerTeleport playerTeleporter;

    private float originalPlayerOffset;

    private BNGPlayerController playerController;
    private AudioSource audioSource;

    private void Start()
    {
        carAnimation = GetComponent<CarAnimation>();

        playerTeleporter = FindAnyObjectByType<PlayerTeleport>();
        playerController = playerTeleporter.GetComponent<BNGPlayerController>();

        originalPlayerOffset = playerController.CharacterControllerYOffset;

        audioSource = GetComponent<AudioSource>();
        exitCarButton.GetComponent<UnityEngine.UI.Button>().onClick.AddListener(() => ExitCar());

        LabelsDisplay(false);

        startCarButton.SetActive(false);
        exitCarButton.SetActive(false);
    }

    public void EnterCar()
    {
        if (!carAnimation.carFloating)
        {
            playerTeleporter.TeleportPlayerToTransform(insideCarPosition);
            StartCoroutine(SizeChangeDelay(-0.41f));

            startCarButton.SetActive(true);
            exitCarButton.SetActive(true);
            LabelsDisplay(false);
        }
        else
        {
            audioSource.PlayOneShot(retractCarClip);
        }
    }

    public void ExitCar()
    {
        playerTeleporter.TeleportPlayerToTransform(exitCarPosition);

        StartCoroutine(SizeChangeDelay(originalPlayerOffset));
        LabelsDisplay(true);
        StopCar();
    }

    public void StartCarEngine()
    {
        if (!audioSource.clip)
        {
            return;
        }
        StartCoroutine(StartCar());
    }

    private void StopCar()
    {
        audioSource.Stop();
        audioSource.loop = false;

        startCarButton.SetActive(false);
        exitCarButton.SetActive(false);
    }

    public void LabelsDisplay(bool enabled)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            if (transform.GetChild(i).GetComponent<InteractionHighlight>())
            {
                for (int k = 0; k < transform.GetChild(i).GetComponents<BoxCollider>().Length; k++)
                {
                    transform.GetChild(i).GetComponents<BoxCollider>()[k].enabled = enabled;
                }
                
            }
        }
    }

    IEnumerator StartCar()
    {
        audioSource.PlayOneShot(carStartClip);
        yield return new WaitForSeconds(carStartClip.length);
        audioSource.clip = carMotorClip;

        audioSource.Play();
        audioSource.loop = true;
    }

    IEnumerator SizeChangeDelay(float playerOffset)
    {
        yield return new WaitForSeconds(0.1f);
        playerController.CharacterControllerYOffset = playerOffset;
    }

}
