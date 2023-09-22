using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueManager : MonoBehaviour
{
    [SerializeField]
    public GameObject dialoguePrefab; 
    
    public void StartConversation(string conversationId)
    {
        Canvas canvas = GameObject.Find("Canvas").GetComponent<Canvas>();
        GameObject prefab = Instantiate(dialoguePrefab, canvas.transform);
        if (prefab.TryGetComponent(out DialoguePanel dialoguePanel))
        {
            dialoguePanel.StartConversation(conversationId);

        }
    }

    //  DEBUG, PROTOTYPE ONLY
    private void Awake()
    {
        StartConversation("demo_start");
    }
}
