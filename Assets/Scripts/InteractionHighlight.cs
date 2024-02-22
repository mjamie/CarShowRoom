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
    private PointerEvents pointerEvents;

    [SerializeField] private InfoDisplay infoDisplay;
    [SerializeField] private int infoIndex;
    void Start()
    {
        highlightEffect = GetComponent<HighlightEffect>();
        pointerEvents = GetComponent<PointerEvents>();

        pointerEvents.OnPointerClickEvent.AddListener((data) => Click(data));
        pointerEvents.OnPointerEnterEvent.AddListener((data) => EnterHighlight(data));
        pointerEvents.OnPointerExitEvent.AddListener((data) => ExitHighlight(data));
    }

    public void Click(PointerEventData data)
    {
        highlightEffect.outlineColor = Color.green;
        infoDisplay.ShowInfoAtIndex(infoIndex);
    }

    public void EnterHighlight(PointerEventData data)
    {
        highlightEffect.outlineColor = Color.red;
    }

    public void ExitHighlight(PointerEventData data)
    {
        highlightEffect.outlineColor = Color.blue;
    }
}
