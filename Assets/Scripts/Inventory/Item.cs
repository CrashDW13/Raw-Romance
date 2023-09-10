using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
[CreateAssetMenu(menuName = "Data/Item", fileName = "New Item")]
public class Item : ScriptableObject
{
    [SerializeField]
    private string name;
    [SerializeField]
    private string description;
    private Sprite sprite;

    public Item(string _name = "Item")
    {
        name = _name;
    }
}