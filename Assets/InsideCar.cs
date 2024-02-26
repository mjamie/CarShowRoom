using BNG;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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

    private PlayerTeleport player;
    private AudioSource audioSource;

    private void Start()
    {
        carAnimation = GetComponent<CarAnimation>();
        player = FindAnyObjectByType<PlayerTeleport>();
        audioSource = GetComponent<AudioSource>();

        exitCarButton.GetComponent<Button>().onButtonDown.AddListener(() => ExitCar());

        startCarButton.SetActive(false);
        exitCarButton.SetActive(false);
    }

    public void EnterCar()
    {
        if (!carAnimation.carFloating)
        {
            player.TeleportPlayerToTransform(insideCarPosition);
            startCarButton.SetActive(true);
            exitCarButton.SetActive(true);
        }
    }

    public void ExitCar()
    {
        player.TeleportPlayerToTransform(exitCarPosition);
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

    IEnumerator StartCar()
    {
        audioSource.PlayOneShot(carStartClip);
        yield return new WaitForSeconds(carStartClip.length);
        audioSource.clip = carMotorClip;

        audioSource.Play();
        audioSource.loop = true;
    }

}
