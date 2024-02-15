using DG.Tweening;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using DG.Tweening;
using UnityEngine.UI;

public class CarSelection : MonoBehaviour
{
    [SerializeField] private Button rightButton;
    [SerializeField] private Button leftButton;
    [SerializeField] private Transform carStand;

    [SerializeField] private List<Car> cars;

    private List<Transform> carsSpawnedUI;

    [Serializable]
    private struct Car
    {
        public Transform car;
        public float yOffSet;
        public float stageYOffSet;
    }

    private int carPosition = 0;
    private int carAmount;

    private float currentSpawnLocationX;
    private void Start()
    {
        rightButton.onClick.AddListener(() => MoveCars(1));
        leftButton.onClick.AddListener(() => MoveCars(-1));

        carsSpawnedUI = new List<Transform>();

        currentSpawnLocationX = transform.position.x;

        carAmount = cars.Count;

        SpawnChoiceCars();
        HideCars();
        SpawnCenterCar();
    }

    private void SpawnChoiceCars()
    {
        int xPos = 0;

        foreach (Car car in cars)
        {
            Transform newCarTransform = Instantiate(car.car, transform).transform;

            newCarTransform.localPosition = new Vector3(xPos, car.yOffSet, 0);
            newCarTransform.GetComponent<DOTweenAnimation>().DORestart();

            xPos -= 7;
            carsSpawnedUI.Add(newCarTransform);
        }
    }

    public void SpawnCenterCar()
    {
        StartCoroutine(SpinChange());

    }

    IEnumerator SpinChange()
    {
        if (carStand.childCount > 0)
        {
            GameObject currentCarInCenter = carStand.GetChild(0).gameObject;

            currentCarInCenter.transform.DOLocalRotate(new Vector3(0, 2000, 0), 2, RotateMode.Fast).SetEase(Ease.InCubic).SetRelative(true);

            yield return new WaitForSeconds(1.9f);
            Destroy(currentCarInCenter);
        }

        GameObject carPrefab = cars[carPosition].car.gameObject;
        Transform newCarTransform = Instantiate(carPrefab, carStand).transform;

        newCarTransform.localPosition = new Vector3(0, cars[carPosition].stageYOffSet, 0);
        newCarTransform.localRotation = Quaternion.identity;

        newCarTransform.DOLocalRotate(new Vector3(0, 2000, 0), 2, RotateMode.Fast).SetEase(Ease.OutCubic).SetRelative(true);
    }

    /// <summary>
    /// Move cars right 1 and move cars left -1
    /// </summary>
    /// <param name="direction">The direction th car must move -1 or 1</param>
    public void MoveCars(int direction)
    {
        carPosition += direction;
        HideCars();
        InteractableCheck();

        currentSpawnLocationX += 7 * direction;

        transform.DOMoveX(currentSpawnLocationX, 1).SetEase(Ease.InOutQuint);
    }

    private void InteractableCheck()
    {
        rightButton.interactable = carPosition < carAmount - 1;
        leftButton.interactable = carPosition > 0;

    }

    private void HideCars()
    {
        int carCount = 0;

        foreach (Transform carUI in carsSpawnedUI)
        {
            carUI.gameObject.SetActive(Mathf.Abs(carPosition - carCount) <= 1);
            carCount++;
        }
    }
}
