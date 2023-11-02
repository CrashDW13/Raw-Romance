using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueStarter : MonoBehaviour
{
    [SerializeField] private GameObject dialoguePanelPrefab;
    [SerializeField] private TextAsset inkAsset;
    [SerializeField] private string knot;
    [SerializeField] private bool automaticScroll = false;

    private void Start()
    {
        GameObject panel = Instantiate(dialoguePanelPrefab, new Vector3(0, 0, 0), Quaternion.identity);
        panel.transform.SetParent(GameObject.Find("Canvas").gameObject.transform);

        RectTransform rectTransform = panel.GetComponent<RectTransform>();
        rectTransform.anchoredPosition = new Vector3(0, 50, 0);
        rectTransform.localScale = new Vector3(1f, 1f, 1);

        if (panel.TryGetComponent(out DialoguePanel dialoguePanel))
        {
            dialoguePanel.StartConversation(inkAsset, knot, automaticScroll);
        }

        else
        {
            Debug.LogError("Dialogue Panel not found.");
        }
    }
}
