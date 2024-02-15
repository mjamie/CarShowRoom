using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ElevatorPortal : MonoBehaviour
{

    [SerializeField] Animator animator;
    [SerializeField] GameObject mainSpace, carShowRoom;
    [SerializeField] Camera mainCamera;

    private bool canCLick = true;
    public void MoveToRoom()
    {
        if (canCLick)
        {
            canCLick = false;
            StartCoroutine(ChangeArea());
        }

        IEnumerator ChangeArea()
        {
            animator.SetTrigger("Close");

            yield return new WaitForSeconds(2);
            if (mainSpace.activeSelf)
            {
                mainSpace.SetActive(false);
            }
            else
            {
                RenderSettings.fog = false;
                mainCamera.useOcclusionCulling = true;
                mainSpace.SetActive(true);
            }

            if (carShowRoom.activeSelf)
            {
                carShowRoom.SetActive(false);
            }
            else
            {
                RenderSettings.fog = true;
                mainCamera.useOcclusionCulling = false;
                carShowRoom.SetActive(true);
            }

            yield return new WaitForSeconds(3);

            animator.SetTrigger("Open");

            yield return new WaitForSeconds(4);
            canCLick = true;
        }

        
    }

}

