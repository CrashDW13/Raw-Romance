using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine;

public class NotesManager : MonoBehaviour, IFreezable
{
    private static List<Tab> tabs = new List<Tab>();
    private static int currentTab = 0;
    private static int currentNote = 0;

    private bool canInteract = true;

    [SerializeField] private GameObject notebookPrefab;
    private Notebook notebook; 
    //private static List<Note> notes;
    private bool showing = false;

    private void Awake()
    {
        DontDestroyOnLoad(gameObject);

        if (FindObjectsOfType<NotesManager>().Length > 1)
        {
            Destroy(gameObject);
        }
    }

    private void Start()
    {
        tabs.Add(new Tab("Tab 1"));
    }

    private void Update()
    {
        Debug.Log(canInteract);
        if (Input.GetKeyDown(KeyCode.N) && canInteract)
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

        if (tabs[tab].Notes.Contains(note))
        {
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

        var interactables = FindObjectsOfType<MonoBehaviour>().OfType<IFreezable>();
        /*foreach (IFreezable interactable in interactables)
        {
            if (interactable != this.GetComponent<IFreezable>()) 
            {
                interactable.Freeze();
            }
        }*/
    }

    private void HideNotebook()
    {
        showing = false; 
        //notebook.Leave();
        Destroy(notebook.gameObject);
        notebook = null;

        var interactables = FindObjectsOfType<MonoBehaviour>().OfType<IFreezable>();
        foreach (IFreezable interactable in interactables)
        {
            if (interactable != this.GetComponent<IFreezable>())
            {
                interactable.Unfreeze();
            }
        }
    }

    public static List<Tab> GetNotes()
    {
        return tabs;
    }

    public void Freeze()
    {
        canInteract = false;
        if (notebook != null) Destroy(notebook.gameObject);
    }

    public void Unfreeze()
    {
        canInteract = true; 
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

