using System.Collections;
using System.Collections.Generic;
using UnityEngine;



public class SaveSlot : MonoBehaviour
{
    Save save;
    public void Save(Save save)
    {
        this.save = save;
    }

    public Save LoadSave()
    {
        return save;
    }
}

[System.Serializable]
public class Save
{
    //private Checkpoint checkpoint;
    public List<Tab> notebook;
    public List<PointAndClickInteractableState> interactableStates; 

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
    }

}

[System.Serializable]
public class PointAndClickInteractableState
{
    public string name;
    public int clickCount; 

    public PointAndClickInteractableState(string name, int count)
    {
        this.name = name;
        this.clickCount = count;
    }
}
