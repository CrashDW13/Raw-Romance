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

    public Dictionary<string, object> unityVariables = new Dictionary<string, object>();

  
    public static void UpdateNotebook()
    {

    }

    public static void UpdateClickCount(string name, int count)
    {
        currentSave.UpdateClickCount(name, count);
    }
 

    private void Start()
    {
        currentSave = new Save("Autosave");
        saves.Add(currentSave);
       
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
