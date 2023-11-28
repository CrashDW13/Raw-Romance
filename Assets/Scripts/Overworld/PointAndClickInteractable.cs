using Ink.Parsed;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Collider))]
public class PointAndClickInteractable : MonoBehaviour, IFreezable
{
    private bool selected;
    private float easeScaleTimer = 0;
    private float easeScaleLength = 3f;
    private bool canInteract = true; 

    private int encounterIndex = 0;

    public delegate void ClickEventHandler();
    public static event ClickEventHandler OnClick; 

    private Renderer renderer;

    [SerializeField] private GameObject dialoguePanelPrefab;
    [Space(10)]
    [SerializeField] private TextAsset inkAsset;
    [SerializeField] private PointAndClickEncounter[] encounters;


    private void Start()
    {
        renderer = GetComponent<Renderer>();
        PauseManager.OnPause += Freeze;
        PauseManager.OnResume += Unfreeze;
    }

    private void OnDestroy()
    {
        PauseManager.OnPause -= Freeze;
        PauseManager.OnResume -= Unfreeze;
    }

    private void OnMouseEnter()
    {
        if (canInteract) selected = true;
    }

    private void OnMouseOver()
    {
        if (Input.GetMouseButtonDown(0))
        {
            if (canInteract)
            {
                OnClick += SpawnDialoguePanel;
                OnClick?.Invoke();
                OnClick -= SpawnDialoguePanel;

                SaveManager.UpdateClickCount(name, encounterIndex);
            }
        }

        if (!canInteract) selected = false;
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

                float value = func(0f, 1f, easeScaleTimer);
                renderer.material.color = Color.Lerp(Color.white, Color.gray, value);
                easeScaleTimer += easeScaleLength * Time.deltaTime;
            }
        }

        else
        {
            if (easeScaleTimer > 0)
            {
                EasingFunction.Ease ease = EasingFunction.Ease.EaseInQuad;
                EasingFunction.Function func = EasingFunction.GetEasingFunction(ease);

                float value = func(1f, 0f, easeScaleTimer);
                renderer.material.color = Color.Lerp(Color.gray, Color.white, value);
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

        GameObject canvas = GameObject.Find("Canvas");

        if (canvas == null)
        {
            Debug.LogError("PointAndClickInteracable: You're missing a Canvas!");
            return; 
            
        }

        DialoguePanel.Create(dialoguePanelPrefab, inkAsset, encounters[encounterIndex].Knot);

        if (encounters[encounterIndex].Note.GetTitle() != "")
        {
            NotesManager.AddNote(encounters[encounterIndex].Note);
        }

        if (encounterIndex <  encounters.Length - 1)
        {
            encounterIndex++;
        }

        Debug.Log("encounter index" + encounterIndex);
    }

    public void Freeze()
    {
        canInteract = false;
    }

    public void Unfreeze()
    {
        canInteract = true;
    }
}

[System.Serializable]
class PointAndClickEncounter
{
    public string Knot;
    public Note Note;
}