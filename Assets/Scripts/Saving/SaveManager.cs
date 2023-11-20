using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SaveManager : MonoBehaviour
{
    [SerializeField]
    private Save currentSave;
    public void SaveToJson()
    {
        string json = JsonUtility.ToJson(currentSave);
        System.IO.File.WriteAllText(Application.persistentDataPath + "/TestSaveData.json", json);
    }
    public static void UpdateNotebook()
    {

    }
    public static void UpdateClickCount(string name, int count)
    {
        //currentSave.UpdateClickCount(name, count);
    }

    private void Start()
    {
        //SaveToJson();
        Debug.Log(Application.persistentDataPath);
    }
}
