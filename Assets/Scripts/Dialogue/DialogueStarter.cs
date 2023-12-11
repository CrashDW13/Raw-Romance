using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueStarter : MonoBehaviour
{
    [SerializeField] private GameObject dialoguePanelPrefab;
    [SerializeField] private TextAsset inkAsset;
    [SerializeField] private string knot;
    [SerializeField] private bool automaticScroll = false;
    [SerializeField] private bool checkpoint = false;

    private void Start()
    {
        DialoguePanel.Create(dialoguePanelPrefab, inkAsset, knot, automaticScroll);
    }
}
