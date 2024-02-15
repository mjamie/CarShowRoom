using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovePlatform : MonoBehaviour
{
    [SerializeField] DOTweenAnimation terrainAnim;
    private bool terrainLifted = false;
    private bool liftInUse = false;

    public void MovingTerrain()
    {

        if (!liftInUse)
            StartCoroutine(Move());

        IEnumerator Move()
        {
            liftInUse = true;

            if (terrainLifted)
            {
                terrainAnim.DOPlayBackwards();
                terrainLifted = false;
            }
            else
            {
                terrainAnim.DORestart();
                terrainLifted = true;
            }

            yield return new WaitForSeconds(14);

            liftInUse = false;
        }
    }

}
