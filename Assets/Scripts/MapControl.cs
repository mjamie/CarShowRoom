using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MapControl : MonoBehaviour
{

    [SerializeField] GameObject infoPanel;
    [SerializeField] GameObject info;

    private void Start() {
        GetComponent<UnityEngine.UI.Button>().onClick.AddListener(() => OpenInfo());    
    }

    public void OpenInfo() {
        for (int i = 0; i < infoPanel.transform.childCount; i++) {
            infoPanel.transform.GetChild(i).gameObject.SetActive(false);
        }

        info.SetActive(true);
    }
}
