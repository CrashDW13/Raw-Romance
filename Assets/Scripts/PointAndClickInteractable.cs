using Ink.Parsed;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointAndClickInteractable : MonoBehaviour
{
    private bool selected;
    private float easeScaleTimer = 0;
    private float easeScaleLength = 3f;

    private int encounterIndex = 0;

    [SerializeField] private GameObject dialoguePanelPrefab;
    [Space(10)]
    [SerializeField] private TextAsset inkAsset;
    [SerializeField] private PointAndClickEncounter[] encounters;

    private void OnMouseEnter()
    {
        selected = true;
    }

    private void OnMouseOver()
    {
        if (Input.GetMouseButtonDown(0))
        {
            SpawnDialoguePanel();
        }
    }

    private void OnMouseExit()
    {
        selected = false;
    }

    private void Update()
    {
        if (selected)
        {
            if (easeScaleTimer < 1)
            {
                EasingFunction.Ease ease = EasingFunction.Ease.EaseOutQuad;
                EasingFunction.Function func = EasingFunction.GetEasingFunction(ease);

                float value = func(1, 1.2f, easeScaleTimer);
                transform.localScale = new Vector3(value, value, 1);

                easeScaleTimer += easeScaleLength * Time.deltaTime;
            }
        }

        else
        {
            if (easeScaleTimer > 0)
            {
                EasingFunction.Ease ease = EasingFunction.Ease.EaseInQuad;
                EasingFunction.Function func = EasingFunction.GetEasingFunction(ease);

                float value = func(1f, 1.2f, easeScaleTimer);
                transform.localScale = new Vector3(value, value, 1);

                easeScaleTimer -= easeScaleLength * Time.deltaTime;
            }
        }
    }

    private void SpawnDialoguePanel()
    {
        if (encounters.Length < 1)
        {
            Debug.LogError("No encounters set for this Interactable.");
            return;
        }

        if (encounters[encounterIndex].Knot == "")
        {
            Debug.LogError("Knot at index " + encounterIndex + " is blank, aborting.");
            return;
        }

        GameObject panel = Instantiate(dialoguePanelPrefab, new Vector3(0, 0, 0), Quaternion.identity);
        panel.transform.SetParent(FindObjectOfType<Canvas>().gameObject.transform);

        RectTransform rectTransform = panel.GetComponent<RectTransform>();
        rectTransform.anchoredPosition = new Vector3(0, 50, 0);
        rectTransform.localScale = new Vector3(1f, 1f, 1);

        if (panel.TryGetComponent(out DialoguePanel dialoguePanel))
        {

            dialoguePanel.StartConversation(inkAsset, encounters[0].Knot);
        }

        
    }
}

[System.Serializable]
class PointAndClickEncounter
{
    public string Knot;
    public string Note;
}

public interface IInteractable
{
    public void Freeze();
    public void Unfreeze();
}
