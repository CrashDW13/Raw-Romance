#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using UnityEditorInternal;
using System;
using Unity.VisualScripting;
using JetBrains.Annotations;

[CustomEditor(typeof(IngredientDatabase))]
public class IngredientDatabaseEditor : Editor
{
    //
    //  An editor for the Ingredient Database, designed to make adding and removing new Ingredients extremely easy for programmers and non-programmers alike.
    //  New Ingredients are stored as ScriptableObject assets in the IngredientDatabase's scripatbleObjectPath's folder.
    //

    private IngredientDatabase ingredientDatabase;
    private void OnEnable()
    {
        ingredientDatabase = target as IngredientDatabase;
    }

    public override void OnInspectorGUI()
    {
        CreateForm();
        EditorUtility.SetDirty(ingredientDatabase); //  Marks the editor as "saveable" in the Unity Editor.
    }

    private void CreateForm()
    {
        GUILayout.FlexibleSpace();

        using (new EditorGUILayout.HorizontalScope("Box"))
        {
            ingredientDatabase.scriptableObjectsPath = HandyFields.StringField("SO Path", ingredientDatabase.scriptableObjectsPath, null, 260, 80);
            ingredientDatabase.spritesPath = HandyFields.StringField("Sprites Path", ingredientDatabase.spritesPath, null, 260, 80);
        }

        if (GUILayout.Button("Add New Ingredient"))
        {
            Ingredient ingredient = CreateInstance<Ingredient>();
            var uniqueFileName = AssetDatabase.GenerateUniqueAssetPath(ingredientDatabase.scriptableObjectsPath + "/NewIngredient.asset");
            AssetDatabase.CreateAsset(ingredient, uniqueFileName);
            ingredient.fileName = uniqueFileName; 
            AssetDatabase.SaveAssets();

            ingredientDatabase.IngredientList.Add(ingredient);
        }

        if (GUILayout.Button("Save Changes!"))
        {
            RenameScriptableObjects();
        }

        if (ingredientDatabase == null)
        {
            return;
        }

        for (var i = 0; i < ingredientDatabase.IngredientList.Count; i++)
        {
            var _ingredient = ingredientDatabase.IngredientList[i];
            using (new EditorGUILayout.HorizontalScope("Box"))
            {
                ShowIngredientInfo(_ingredient, i);
                ShowSprite(_ingredient, i);
                GUILayout.FlexibleSpace();
            }
        }
    }

    private void ShowIngredientInfo(Ingredient _ingredient, int _index)
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
                fontStyle = FontStyle.Bold
            };

            if (_ingredient != null) GUILayout.Label(ingredientDatabase.IngredientList[_index].ingredientName, _bigLabelStyle);

            GUILayout.FlexibleSpace();

            if (_ingredient != null)
            {
                Ingredient _thisIngredient = (Ingredient)AssetDatabase.LoadAssetAtPath(ingredientDatabase.IngredientList[_index].fileName, typeof(Ingredient));
                if (_thisIngredient != null) ingredientDatabase.IngredientList[_index].ingredientName = HandyFields.StringField("Name", _thisIngredient.ingredientName, null, 400, 120);
            }
            if (_ingredient != null)
            {
                Ingredient _thisIngredient = (Ingredient)AssetDatabase.LoadAssetAtPath(ingredientDatabase.IngredientList[_index].fileName, typeof(Ingredient));
                if (_thisIngredient != null) ingredientDatabase.IngredientList[_index].description = HandyFields.StringField("Description", _thisIngredient.description, null, 400, 120);
            }

            if (_ingredient != null)
            {
                Ingredient _thisIngredient = (Ingredient)AssetDatabase.LoadAssetAtPath(ingredientDatabase.IngredientList[_index].fileName, typeof(Ingredient));
                if (_thisIngredient != null) ingredientDatabase.IngredientList[_index].sprite = CheckForSprite(ingredientDatabase.IngredientList[_index].ingredientName);
            }

            if (_ingredient != null)
            {
                Ingredient _thisIngredient = (Ingredient)AssetDatabase.LoadAssetAtPath(ingredientDatabase.IngredientList[_index].fileName, typeof(Ingredient));
                if (_thisIngredient != null) ingredientDatabase.IngredientList[_index].ingredientType = (Ingredient.IngredientType)EditorGUILayout.EnumPopup("Ingredient Type", _thisIngredient.ingredientType);
            }

            if (GUILayout.Button("Remove", GUILayout.Width(100)))
            {
                AssetDatabase.DeleteAsset(ingredientDatabase.IngredientList[_index].fileName);
                ingredientDatabase.IngredientList.Remove(_ingredient);
            }
        }
    }

    private Sprite CheckForSprite(string _name)
    {
        Sprite sprite = (Sprite)AssetDatabase.LoadAssetAtPath(ingredientDatabase.spritesPath + "/" + _name + ".png", typeof(Sprite));
        if (sprite == null)
        {
            return (Sprite)AssetDatabase.LoadAssetAtPath(ingredientDatabase.spritesPath + "/Fallback.png", typeof(Sprite));
        }

        else return sprite;
    }

    private void ShowSprite(Ingredient ingredient, int _index)
    {
        if (ingredient != null && ingredient.sprite != null)
        {
            GUI.DrawTexture(GUILayoutUtility.GetRect(80, 80), ingredientDatabase.IngredientList[_index].sprite.texture);
        }
    }

    private void RenameScriptableObjects()
    {
        for (var i = 0; i < ingredientDatabase.IngredientList.Count; i++) 
        {
            var _name = ingredientDatabase.IngredientList[i].ingredientName;
            var _description = ingredientDatabase.IngredientList[i].description;

            AssetDatabase.RenameAsset(ingredientDatabase.IngredientList[i].fileName, ingredientDatabase.IngredientList[i].ingredientName);

            ingredientDatabase.IngredientList[i].ingredientName = _name;
            ingredientDatabase.IngredientList[i].fileName = ingredientDatabase.scriptableObjectsPath + "/" + ingredientDatabase.IngredientList[i].ingredientName + ".asset";
            ingredientDatabase.IngredientList[i].description = _description;

            Debug.Log("ScriptableObject saved at " + ingredientDatabase.IngredientList[i].fileName);
            EditorUtility.SetDirty(ingredientDatabase.IngredientList[i]);
            AssetDatabase.SaveAssets();
        }
    }
}
#endif