using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CircleCollider2D))]
public class Bowl : MonoBehaviour
{
    public List<Ingredient> ingredients;
    private CircleCollider2D circleCollider;

    private void Start()
    {
        circleCollider = GetComponent<CircleCollider2D>();
    }

    private void Update()
    {
        CheckForNewIngredients(); 
    }

    /// <summary>
    /// Gets the grade of a bowl by comparing it to a list of preferences, passed from a Character. 
    /// </summary>
    /// <param name="preferences">The character's preferences.</param>
    /// <returns>A Grade class.</returns>
    public Grade GetGrade(List<Preference> preferences)
    {
        //  Make a new grade. 
        Grade grade = new Grade();

        //  We need to make two lists here: one for all the ingredients we've already checked (and therefore can skip),
        //  ...and one for all the preferences we haven't accounted for yet (if this list isn't empty by the end, it means there are likes/dislikes that weren't included in the bowl). 
        //  Of course, that's good for dislikes, bad for likes. 

        List<Ingredient> checkedIngredients = new List<Ingredient>();
        List<Preference> preferencesNotAccountedFor = new List<Preference>(preferences);

        //For every ingredient...
        for (var i = 0; i < ingredients.Count; i++)
        {
            //  First, we need to save booleans for two different things:
            //  1) If we've checked this ingredient before,
            //  2) If the any of the preferences we check has the ingredient we're checking. 
            bool checkedIngredient = false;
            bool hasIngredientOfPreference = false;

            Ingredient ingredientInBowl = ingredients[i];

            //  For every ingredient we've checked thus far...
            for (var j = 0; j < checkedIngredients.Count; j++)
            {
                if (checkedIngredients[j] != null)
                {
                    if (checkedIngredients[j].ingredientName == ingredientInBowl.ingredientName)
                    {
                        checkedIngredient = true;
                        break;
                    }
                }
            }

            //  If we've checked it already, we ignore it and move onto the next ingredient. 
            if (checkedIngredient)
            {
                continue;
            }

            //  Loop through all the current preferences. 
            for (var k = 0; k < preferences.Count; k++)
            {
                Preference preference = preferences[k];

                //  If it's the ingredient we're looking for...

                if (ingredientInBowl.ingredientName == preference.ingredient.ingredientName)
                {
                    //  First, mark that the bowl does in fact have the ingredient the preference is looking for.

                    hasIngredientOfPreference = true;

                    //  First, make sure it isn't an ingredient we've already checked. If it is, we don't care and should skip it.  
                    //  In the future, I can change this so that it instead increments a counter (ie. character prefers 2x of this ingredient.

                    //  TO-DO: Above implementation. 

                    //  We want to change our grade number according to the weight of the preference. Likes push it up, dislikes move it down. 
                    if (preference.type == Preference.PreferenceType.Like)
                    {
                        grade.gradeNumber += preference.weight;
                    }  
                        
                    else if (preference.type == Preference.PreferenceType.Dislike)
                    {
                        grade.gradeNumber -= preference.weight;
                    }

                    grade.gradeDict.Add(preference, true);
                    checkedIngredients.Add(ingredientInBowl);
                    preferencesNotAccountedFor.Remove(preference);
                }
            }

            //  If, for any ingredient, no preferences towards that ingredient are found, then it means that character is neutral towards it. 
            if (!hasIngredientOfPreference)
            {
                checkedIngredients.Add(ingredientInBowl);
                grade.gradeNumber += 5;
            }
        }

        //  Finally, if there are any preferences we haven't accounted for, we should add them to the grade dictionary, but flagged as false. 
        if (preferencesNotAccountedFor.Count > 0)
        {
            for (var i = 0; i < preferencesNotAccountedFor.Count; i++)
            {
                grade.gradeDict.Add(preferencesNotAccountedFor[i], false);
            }
        }

        return grade;
    }

    private void CheckForNewIngredients()
    {
        Collider2D[] colliders = Physics2D.OverlapCircleAll(transform.position, circleCollider.radius * (transform.localScale.x));
        if (colliders.Length > 1)
        {
            if (Input.GetMouseButtonUp(0))
            {
                for (var i = 0; i < colliders.Length; i++)
                {
                    if (colliders[i].gameObject.TryGetComponent(out IngredientInteractable ingredientInteractable))
                    {
                        ingredients.Add(ingredientInteractable.ingredient);
                        Destroy(ingredientInteractable.gameObject);
                    }
                }
            }
        }
    }
}
