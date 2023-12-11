using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SaveSlot : MonoBehaviour
{
    Save save;
    [SerializeField]
    private int index;

    [SerializeField]
    private TextMeshProUGUI saveName;
    [SerializeField]
    private TextMeshProUGUI saveTime;


    private void OnEnable()
    {
        UpdateSaveAppearance();
    }

    private void UpdateSaveAppearance()
    {
        save = SaveManager.saves[index]; 

        if (save.JsonExists())
        {
            Save s = save.LoadFromJson();
            saveName.text = s.name;
            saveTime.text = s.dateTime;
            return;
        }

        else
        {
            if (index == 0)
            {
                save.SaveToJson();
                saveName.text = save.name;
                saveTime.text = save.dateTime;
            }

            else
            {
                saveName.text = "Empty";
                saveTime.text = "";
            }
        }
    }

    public void UpdateSave()
    {

        Debug.Log("Updating save...");

        Save s = SaveManager.currentSave.GetCopy();
        s.name = SaveManager.saves[index].name;
        SaveManager.saves[index] = s;
        SaveManager.saves[index].SaveToJson();
        UpdateSaveAppearance();
    }

    public void LoadSave()
    {
        if (!SaveManager.saves[index].JsonExists())
        {
            Debug.Log("File doesn't exist!");
        }

        LevelLoader levelLoader = FindObjectOfType<LevelLoader>();
        if (levelLoader != null)
        {
            if (save.checkpoint != null)
            {
                SaveManager.currentSave = SaveManager.saves[index];
                StartCoroutine(levelLoader.Load("TestTransition", SaveManager.saves[index].checkpoint));
                Debug.Log("Loading...");
            }

            else
            {
                Debug.LogError("Checkpoint has not been saved!");
            }
        }
    }
}

[System.Serializable]

public class Save
{
    public string name;
    public string dateTime;
    public string checkpoint = "Gate";
    public List<Tab> notebook;
    public List<PointAndClickInteractableState> interactableStates = new List<PointAndClickInteractableState>();
    public Dictionary<string, object> globalVariables = new Dictionary<string, object>();

    public void setDefaultGlobalVariables() {
        globalVariables["calledFam"] = false;
    }

    public Save()
    {
        name = "Slot " + SaveManager.saves.Count;

        setDefaultGlobalVariables();
        
    }
    public Save(string name)
    {
        this.name = name;
        setDefaultGlobalVariables();
    }

    public void updateGlobalVariable(string varName, object val) {
        globalVariables[varName] = val;
        
    }

    public object getGlobalVariable(string varName) {
        Debug.Log("Getting the globale var");
        Debug.Log(varName);
        return globalVariables[varName];

    }

    public void UpdateClickCount(string name, int count)
    {
        PointAndClickInteractableState currentState = interactableStates.Find(x => x.name == name);
        if (currentState == null)
        {
            interactableStates.Add(new PointAndClickInteractableState(name, count));
        }

        else
        {
            currentState.clickCount = count;
        }

        SaveToJson();
    }

    public void UpdateDateTime()
    {
        dateTime = System.DateTime.Now.ToString();
    }

    public void UpdateCheckpoint(string newCheckpoint = "")
    {
        if (newCheckpoint == "")
        {
            checkpoint = SceneManager.GetActiveScene().name;
        }

        else
        {
            checkpoint = newCheckpoint;
        }
        Debug.Log("Checkpoint saved!");
    }

    public void SaveToJson()
    {
        UpdateDateTime();

        string json = JsonUtility.ToJson(this);
        System.IO.File.WriteAllText(Application.persistentDataPath + string.Format("/{0}.json", name), json);
        Debug.Log("Save named " + name + " to " + Application.persistentDataPath + string.Format("/{0}.json", name));
        Debug.Log(json);
    }

    public Save LoadFromJson()
    {
        string filePath = Application.persistentDataPath + string.Format("/{0}.json", name);
        if (!File.Exists(filePath)) 
        {
            Debug.LogError("Tried loading from a file that doesn't exist!");
            return null;
        }

        using StreamReader reader = new(filePath);
        string json = reader.ReadToEnd();
        return JsonConvert.DeserializeObject<Save>(json);
    }

    public bool JsonExists()
    {
        string filePath = Application.persistentDataPath + string.Format("/{0}.json", name);
        return (File.Exists(filePath));
    }

    public Save GetCopy()
    {
        return MemberwiseClone() as Save;
    }
}

[System.Serializable]
public class PointAndClickInteractableState
{
    public string name;
    public int clickCount; 

    public PointAndClickInteractableState(string name, int clickCount)
    {
        this.name = name;
        this.clickCount = clickCount;
    }
}