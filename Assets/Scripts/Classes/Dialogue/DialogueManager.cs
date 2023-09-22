using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class DialogueManager : MonoBehaviour
{
    [SerializeField]
    public GameObject dialoguePrefab;
    [SerializeField]
    public Area windowArea; 
    private AreaManager areaManager;
    
    public void StartConversation(string conversationId)
    {
        areaManager.TransitionToArea(windowArea);
        Canvas canvas = GameObject.Find("Canvas").GetComponent<Canvas>();
        GameObject prefab = Instantiate(dialoguePrefab, canvas.transform);
        if (prefab.TryGetComponent(out DialoguePanel dialoguePanel))
        {
            dialoguePanel.StartConversation(conversationId);

        }
    }

    //  DEBUG, PROTOTYPE ONLY
    private void Start()
    {
        areaManager = FindObjectOfType<AreaManager>();
        windowArea = areaManager.currentArea;
        StartConversation("");
    }
}
