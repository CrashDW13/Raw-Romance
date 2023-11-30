using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Checkpoint : MonoBehaviour
{
    private void Start()
    {
        SaveManager.currentSave.UpdateCheckpoint();
    }
}
