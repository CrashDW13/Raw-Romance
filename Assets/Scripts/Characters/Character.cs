using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Character : ScriptableObject
{
    public string characterName = "New Character";
    public string characterTag; 

    public List<CharacterSprite> CharacterSprites = new List<CharacterSprite>();

    public string fileName;

    public Sprite GetSprite(string name)
    {
        for (var i  = 0; i < CharacterSprites.Count; i++) 
        {
            if (CharacterSprites[i].name == name)
            {
                return CharacterSprites[i].sprite;
            }
        }

        Debug.LogWarning("Character: Tried getting sprite, but none were found in this character's List.");
        return null;
    }
}

[System.Serializable]
public class CharacterSprite
{
    public Sprite sprite;
    public string name;
}
