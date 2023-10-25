using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using Unity.VisualScripting;
using UnityEngine;

public class NotesManager : MonoBehaviour
{
    private static List<Tab> tabs = new List<Tab>();
    private static int currentTab = 0;
    private static int currentNote = 0;

    [SerializeField] private GameObject notebookPrefab;
    private Notebook notebook; 
    //private static List<Note> notes;
    private bool showing = false;

    private void Awake()
    {
        DontDestroyOnLoad(gameObject);
    }

    private void Start()
    {
        tabs.Add(new Tab("Tab 1"));
    }

    private void Update()
    {
        //debug
        if (Input.GetKeyDown(KeyCode.N))
        {
            ToggleNotebook();
        }
    }

    public void ToggleNotebook()
    {
        if (!showing) ShowNotebook();
        else HideNotebook();
    }

    public static void AddNote(Note note, int tab = -1)
    {
        if (tab == -1) tab = currentTab;
        if (tab > tabs.Count - 1)
        {
            Debug.Log("AddNote: Given tab is out of bounds.");
            return;
        }

        if (tabs[0].Notes[0].GetTitle() == "")
        {
            tabs[0].Notes.RemoveAt(0);
        }

        tabs[tab].Notes.Add(note);
    }

    private void ShowNotebook()
    {
        showing = true; 

        notebook = Instantiate(notebookPrefab, Vector3.zero, Quaternion.identity).GetComponent<Notebook>();
        notebook.transform.SetParent(FindObjectOfType<Canvas>().gameObject.transform);

        RectTransform rectTransform = notebook.GetComponent<RectTransform>();
        rectTransform.anchoredPosition = new Vector3(0, 50, 0);
        rectTransform.localScale = new Vector3(1f, 1f, 1);

        notebook.Show();
    }

    private void HideNotebook()
    {
        showing = false; 
        //notebook.Leave();
        Destroy(notebook.gameObject);
        notebook = null;
    }

    public static List<Tab> GetNotes()
    {
        return tabs;
    }
}


[System.Serializable]
public class Tab
{
    [SerializeField]
    private string title;
    [SerializeField]
    private List<Note> notes = new List<Note>();
    public List<Note> Notes
    {
        get { return notes; }
    }

    public Tab(string title)
    {
        this.title = title;
        notes.Add(new Note("", "Nothing of note, yet..."));
    }
}

