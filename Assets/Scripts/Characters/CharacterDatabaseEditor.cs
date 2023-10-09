#if UNITY_EDITOR
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.TerrainTools;
using Unity.VisualScripting;
using System.Reflection;

[CustomEditor(typeof(CharacterDatabase))]
public class CharacterDatabaseEditor : Editor
{
    private CharacterDatabase characterDatabase;
    private IngredientDatabase ingredientDatabase;
    private void OnEnable()
    {
        characterDatabase = target as CharacterDatabase;
    }

    public override void OnInspectorGUI()
    {
        CreateForm();
        EditorUtility.SetDirty(characterDatabase);
    }

    private void CreateForm()
    {
        GUILayout.FlexibleSpace();

        using (new EditorGUILayout.VerticalScope("Box"))
        {
            characterDatabase.scriptableObjectsPath = HandyFields.StringField("SO Path", characterDatabase.scriptableObjectsPath, null);
        }

        if (GUILayout.Button("Add New Character"))
        {
            AddNewCharacter();
        }

        if (GUILayout.Button("Save Changes!"))
        {
            UpdateScriptableObjects();
        }

        if (characterDatabase == null)
        {
            return;
        }

        for (var i = 0; i < characterDatabase.Characters.Count; i++)
        {
            using (new EditorGUILayout.HorizontalScope("Box"))
            {
                var character = characterDatabase.Characters[i];
                ShowCharacterInfo(character, i);
                ShowCharacterSprites(character, i);
                GUILayout.FlexibleSpace();
            }
        }
    }

    private void ShowCharacterInfo(Character character, int index)
    {
        using (new EditorGUILayout.VerticalScope("Box"))
        {
            var _bigLabelStyle = new GUIStyle
            {
                normal =
                {
                    textColor = Color.white
                },
                fontSize = 20,
                fontStyle = FontStyle.Bold,
                alignment = TextAnchor.MiddleLeft
            };

            if (character != null) GUILayout.Label(characterDatabase.Characters[index].characterName, _bigLabelStyle);

            //GUILayout.FlexibleSpace();

            Character _characterAsset = (Character)AssetDatabase.LoadAssetAtPath(characterDatabase.Characters[index].fileName, typeof(Character));

            if (character != null) //   Character Name
            {
                if (_characterAsset != null) characterDatabase.Characters[index].characterName = HandyFields.StringField("Name", _characterAsset.characterName, null);            }

            if (character != null) //   Character tag to look for in ink files
            {
                if (_characterAsset != null) characterDatabase.Characters[index].characterTag = HandyFields.StringField("Tag", _characterAsset.characterTag, null);
            }

            if (GUILayout.Button("Remove", GUILayout.Width(100)))
            {
                AssetDatabase.DeleteAsset(characterDatabase.Characters[index].fileName);
                characterDatabase.Characters.Remove(character);
            }
        }
    }

    private void ShowCharacterSprites(Character character, int index)
    {
        using (new EditorGUILayout.VerticalScope("Box"))
        {
            Character _characterAsset = (Character)AssetDatabase.LoadAssetAtPath(characterDatabase.Characters[index].fileName, typeof(Character));

            if (GUILayout.Button("Add New Sprite"))
            {
                CharacterSprite sprite = new CharacterSprite();
                characterDatabase.Characters[index].CharacterSprites.Add(sprite);
            }
            
            using (new EditorGUILayout.VerticalScope("Box"))
            {
                for (var i = 0; i < characterDatabase.Characters[index].CharacterSprites.Count; i++)
                {
                    if (character != null)
                    {
                        if (_characterAsset != null) characterDatabase.Characters[index].CharacterSprites[i].sprite = HandyFields.SpriteField("Sprite Image", _characterAsset.CharacterSprites[i].sprite);
                    }

                    if (character != null)
                    {
                        if (_characterAsset != null) characterDatabase.Characters[index].CharacterSprites[i].name = HandyFields.StringField("Sprite Name", _characterAsset.CharacterSprites[i].name);
                    }

                    if (GUILayout.Button("Remove Sprite"))
                    {
                        characterDatabase.Characters[index].CharacterSprites.RemoveAt(i);
                    }
                }
            }
        }
    }

   

    private void AddNewCharacter()
    {
        Character newCharacter = CreateInstance<Character>();

        var uniqueFileName = AssetDatabase.GenerateUniqueAssetPath(characterDatabase.scriptableObjectsPath + "/NewCharacter.asset");

        AssetDatabase.CreateAsset(newCharacter, uniqueFileName);
        newCharacter.fileName = uniqueFileName;

        AssetDatabase.SaveAssets();

        characterDatabase.Characters.Add(newCharacter);

    }

    private void UpdateScriptableObjects()
    {
        for (var i = 0; i < characterDatabase.Characters.Count; i++)
        {
            var _name = characterDatabase.Characters[i].characterName;
            var _sprites = characterDatabase.Characters[i].CharacterSprites;

            AssetDatabase.RenameAsset(characterDatabase.Characters[i].fileName, characterDatabase.Characters[i].characterName);

            characterDatabase.Characters[i].characterName = _name;
            characterDatabase.Characters[i].CharacterSprites = _sprites;
            characterDatabase.Characters[i].fileName = characterDatabase.scriptableObjectsPath + "/" + characterDatabase.Characters[i].characterName + ".asset";
            

            Debug.Log("ScriptableObject saved at " + characterDatabase.Characters[i].fileName);
            EditorUtility.SetDirty(characterDatabase.Characters[i]);
            AssetDatabase.SaveAssets();
        }
    }
}
#endif