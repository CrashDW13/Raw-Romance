using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;



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
        if (save == null)
        {
            if (index == 0)
            {
                save = SaveManager.currentSave;
                save.UpdateDateTime();
            }

            else if (SaveManager.saves[index].JsonExists())
            {
                save = SaveManager.saves[index];
            }

            else
            {
                saveName.text = "Empty";
                saveTime.text = "";
                return;
            }
        }

        saveName.text = save.name;
        saveTime.text = save.dateTime.ToString();
    }

    /*public void Save(Save save)
    {
        this.save = save;
    }

    public Save LoadSave()
    {
        return save;
    }*/
}

[System.Serializable]
public class Save
{
    //private Checkpoint checkpoint;
    public string name;
    public System.DateTime dateTime;
    public string checkpoint;
    public List<Tab> notebook;
    public List<PointAndClickInteractableState> interactableStates = new List<PointAndClickInteractableState>();
    public Dictionary<string, object> inkGlobalVariables = new Dictionary<string, object>();

    public Save()
    {
        name = "Slot " + SaveManager.saves.Count;
    }
    public Save(string name)
    {
        this.name = name;
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
        dateTime = System.DateTime.Now;
    }

    private void SaveToJson()
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