using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LockSystem
{
    private List<string> locks = new List<string>();

    public void AddLock(string name)
    {
        locks.Add(name);
    }

    public void RemoveLock(string name)
    {
        int index = locks.IndexOf(name);
        if (index == -1)
        {
            Debug.LogWarning("LockSystem: Tried removing lock '" + name + "' which doesn't exist.");
            return;
        }

        locks.RemoveAt(index);
    }

    public bool IsLocked()
    {
        return locks.Count > 0;
    }
}
