using System.Collections;
using System.Collections.Generic;
using System.IO;
using Unity.VisualScripting;
using UnityEngine;
using Ink.Runtime;

public class SaveManager : MonoBehaviour
{

    public static List<Save> saves = new List<Save>();
    public static Save currentSave;
    [SerializeField]
    private int saveSlotCount = 3; 
    private Story inkStory;
    private bool calledUnity;

    public Dictionary<string, object> unityVariables = new Dictionary<string, object>();

    public void Initialize(Story story)
    {
        inkStory = story;
    }
    public static void UpdateNotebook()
    {

    }

    public static void UpdateClickCount(string name, int count)
    {
        currentSave.UpdateClickCount(name, count);
    }
    public void UpdateUnityVariables(Dictionary<string, object> unityVariables)
    {
        foreach (string variableName in inkStory.variablesState)
        {
            object inkValue = inkStory.variablesState[variableName];
            unityVariables[variableName] = inkValue;
            Debug.Log(unityVariables);
        }
    }
    public void UpdateInkVariables(Dictionary<string, object> unityVariables)
    {
        foreach (KeyValuePair<string, object> variable in unityVariables)
        {
          
            inkStory.variablesState[variable.Key] = variable.Value;
            Debug.Log(variable.Key);

        }
    }
    public string SaveInkState()
    {
        return inkStory.state.ToJson();
    }
    public void LoadInkState(string savedState)
    {
        inkStory.state.LoadJson(savedState);
    }

    private void Start()
    {
        currentSave = new Save("Autosave");
        saves.Add(currentSave);
        UpdateUnityVariables(unityVariables);
        UpdateInkVariables(unityVariables);
        for (int i = 0; i < saveSlotCount; i++)
        {
            Save s = new Save();            
            Debug.Log(s.name);

            if (File.Exists(Application.persistentDataPath + string.Format("/{0}.json", name)))
            {
                s = s.LoadFromJson();
            }

            else
            {
                Debug.Log("this file does not exist");
            }

            saves.Add(s);
        }
    }
}
