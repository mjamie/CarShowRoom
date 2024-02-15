using UnityEngine;

public class DistanceScript : MonoBehaviour
{
    [SerializeField] public GameObject object1;
    [SerializeField] public GameObject object2;
    [SerializeField] float distance;

    void Update()
    {
        float currentDistance = Vector3.Distance(object1.transform.position, object2.transform.position);
        if (currentDistance > distance)
        {
            Vector3 direction = object1.transform.position - object2.transform.position;
            object1.transform.position = object2.transform.position + direction.normalized * distance;
        }
    }
}
