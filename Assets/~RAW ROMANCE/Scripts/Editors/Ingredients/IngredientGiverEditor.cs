#if UNITY_EDITOR
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.TerrainTools;
using System;
using System.Reflection;
using Unity.VisualScripting;

[CustomEditor(typeof(IngredientGiver))]
public class IngredientGiverEditor : Editor
{
    IngredientGiver ingredientGiver;

    private void OnEnable()
    {
        ingredientGiver = target as IngredientGiver;
    }

    public override void OnInspectorGUI()
    {
        CreateForm();
        EditorUtility.SetDirty(ingredientGiver);
    }
    
    private void CreateForm()
    {
        GUILayout.FlexibleSpace();

        using (new EditorGUILayout.VerticalScope("Box"))
        {
            IngredientDatabase ingredientDatabase = FindObjectOfType<IngredientDatabase>();

            if (ingredientDatabase == null)
            {
                return;
            }

            else
            {
                if (ingredientGiver != null)
                {
                    string[] ingredientNames = new string[ingredientDatabase.IngredientList.Count];
                    for (var i = 0; i < ingredientDatabase.IngredientList.Count; i++)
                    {
                        ingredientNames[i] = ingredientDatabase.IngredientList[i].ingredientName;
                    }

                    var _ingredientIndex = EditorGUILayout.Popup("Ingredient", ingredientGiver.ingredientIndex, ingredientNames);
                    ingredientGiver.ingredientIndex = _ingredientIndex;
                    ingredientGiver.ingredientToGive = ingredientDatabase.IngredientList[_ingredientIndex];
                }

            }

            if (ingredientGiver != null)
            {
                ingredientGiver.isInfinite = EditorGUILayout.Toggle("Infinite?", ingredientGiver.isInfinite);

                if (!ingredientGiver.isInfinite)
                {
                    ingredientGiver.count = HandyFields.IntField("Count", ingredientGiver.count, 100, 75);
                }
            }

            if (ingredientGiver != null)
            {
                if (ingredientGiver.ingredientToGive.ingredientType == Ingredient.IngredientType.Base)
                {
                    ingredientGiver.ingredientInteractablePrefab = HandyFields.UnityField(ingredientGiver.ingredientInteractablePrefab);
                }
            }

        }
    }
}
#endif
