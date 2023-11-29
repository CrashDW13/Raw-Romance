using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Unity.VisualScripting;
using UnityEngine;

public class SaveManager : MonoBehaviour
{

    public static List<Save> saves = new List<Save>();
    public static Save currentSave;
    [SerializeField]
    private int saveSlotCount = 3; 

    public static void UpdateNotebook()
    {
        
    }

    public static void UpdateClickCount(string name, int count)
    {
        currentSave.UpdateClickCount(name, count);
    }

    public static void UpdateCheckpoint()
    {
        currentSave.UpdateCheckpoint();
    }


    private void Awake()
    {
        DontDestroyOnLoad(gameObject);

        if (FindObjectsOfType<SaveManager>().Length > 1)
        {
            Destroy(gameObject);
            return;
        }


        currentSave = new Save("Autosave");
        saves.Add(currentSave);
        for (int i = 0; i < saveSlotCount; i++)
        {
            Save s = new Save();            
            Debug.Log(s.name);

            if (File.Exists(Application.persistentDataPath + string.Format("/{0}.json", s.name)))
            {
                s = s.LoadFromJson();
                Debug.Log(s);
            }

            else
            {
                Debug.Log("this file does not exist");
            }

            saves.Add(s);
        }
    }

    private void Start()
    {
        currentSave.UpdateCheckpoint();
    }
}
