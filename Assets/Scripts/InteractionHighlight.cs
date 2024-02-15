using BNG;
using HighlightPlus;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

[RequireComponent(typeof(PointerEvents))]
[RequireComponent(typeof(HighlightEffect))]
public class InteractionHighlight : MonoBehaviour
{
    HighlightEffect highlightEffect;

    [SerializeField] UnityEvent clickEvent;
    void Start()
    {
        highlightEffect = GetComponent<HighlightEffect>();
    }

    public void Click()
    {
        highlightEffect.outlineColor = Color.green;
        clickEvent.Invoke();
    }

    public void EnterHighlight()
    {
        highlightEffect.outlineColor = Color.red;
    }

    public void ExitHighlight()
    {

        highlightEffect.outlineColor = Color.blue;
    }
}
