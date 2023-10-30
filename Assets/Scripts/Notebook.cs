using System.Collections;
using System.Collections.Generic;
using System.Linq;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.AI;

public class Notebook : MonoBehaviour
{
    [Header("UI Elements")]
    [SerializeField]
    private TextMeshProUGUI titleSpace;
    [SerializeField]
    private TextMeshProUGUI contentSpace;
    [SerializeField]
    private GameObject nextNoteArrow;
    [SerializeField]
    private GameObject prevNoteArrow;

    private static List<Tab> tabs = new List<Tab>();
    private static int currentTab = 0;
    private static int currentNote = 0;

    private int easePositionTimer = 0;

    private void Awake()
    {
        tabs = NotesManager.GetNotes();
    }

    private void Start()
    {
        Debug.Log(tabs[0].Notes[0].GetContents());
        UpdateCurrentNote();
    }

    public void Show()
    {

    }
    
    public void Leave()
    {

    }

    private void UpdateCurrentNote()
    {

        titleSpace.text = tabs[currentTab].Notes[currentNote].GetTitle();
        contentSpace.text = tabs[currentTab].Notes[currentNote].GetContents();

        //  Fallback for when the notebook is empty. 
        if (tabs[0].Notes[0].GetTitle() == "")
        {
            prevNoteArrow.SetActive(false);
            nextNoteArrow.SetActive(false);
            return;
        }

        if (currentNote == 0)
        {
            if (tabs[currentTab].Notes.Count <= 1)
            {
                prevNoteArrow.SetActive(false);
                nextNoteArrow.SetActive(false);
                return; 
            }

            else
            {
                nextNoteArrow.SetActive(true);
                prevNoteArrow.SetActive(false);
            }
        }

        else if (currentNote == tabs[currentTab].Notes.Count - 1)
        {
            nextNoteArrow.SetActive(false);
            prevNoteArrow.SetActive(true);
        }

        else
        {
            nextNoteArrow.SetActive(true);
            prevNoteArrow.SetActive(true);
        }
    }

    public void GoToNextNote()
    {
        currentNote++;
        UpdateCurrentNote();
    }

    public void GoToPrevNote()
    {
        currentNote--;
        UpdateCurrentNote();
    }
}

[System.Serializable]
public class Note
{
    [SerializeField]
    private string title;
    [SerializeField]
    private string contents;

    public Note (string title, string contents)
    {
        this.title = title;
        this.contents = contents;
    }

    public string GetTitle()
    {
        return title;
    }

    public string GetContents()
    {
        return contents;
    }

    public bool IsEmpty()
    {
        return string.IsNullOrEmpty(title);
    }
}

