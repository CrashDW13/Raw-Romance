using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventory : MonoBehaviour
{
    static List<Item> inventoryList = new List<Item>();
    
    public static void AddItem(Item _item)
    {
        inventoryList.Add(_item);
    }

    public static void Clear()
    {
        inventoryList.Clear();
    }
}
