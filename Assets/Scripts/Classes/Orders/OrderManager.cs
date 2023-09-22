using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using UnityEngine;
using UnityEditor.UI;
using UnityEngine.UI;
using static UnityEngine.GraphicsBuffer;

public class OrderManager : MonoBehaviour
{
    //  TO-DO: CurrentCharacter should be set exclusively through the StartOrder() function and therefore this should be private. 

    [Header("[DEBUG] Character Info")]
    public Character currentCharacter;
    private bool orderIsActive;
    private float currentOrderTime;

    private float baseCookingTime;
    private bool baseIsCooking;

    [Space(10)]
    [Header("Base Cooker Info")]
    [SerializeField]
    private GameObject baseCookerTimerPrefab;
    [SerializeField]
    private float baseCookingMaxTime;
    [SerializeField]
    private Canvas canvas;
    private Image baseCookerTimerImage;
    private GameObject baseCookerTimer;
    private IngredientInteractable currentCookingIngredient;

    private DialogueManager dialogueManager;

    private void Start()
    {
        dialogueManager = FindObjectOfType<DialogueManager>();  
    }
    private void Update()
    {
        if (orderIsActive)
        { 
            CalculateOrderTimer();
        }

        if (baseIsCooking)
        {
            CalculateBaseTimer();
        }
    }

    //  We need this here so that cooking timer persists between areas. 
    public void StartCookingBase(Vector3 timerSpawnPosition, IngredientInteractable ingredientInteractable)
    {
        if (!baseIsCooking)
        {
            currentCookingIngredient = ingredientInteractable;
            Ingredient ingredient = ingredientInteractable.ingredient;
            Vector3 newSpawnPosition;


            if (ingredient.ingredientType != Ingredient.IngredientType.Base)
            {
                Debug.LogWarning("OrderManager: Tried cooking ingredient that isn't classified as a base.");
                return;
            }

            baseIsCooking = true;

            // Offset position above object bbox (in world space)
            float offsetPosY = timerSpawnPosition.y + 1.5f;

            // Final position of marker above GO in world space
            Vector3 offsetPos = new Vector3(timerSpawnPosition.x, offsetPosY, timerSpawnPosition.z);

            // Calculate *screen* position (note, not a canvas/recttransform position)
            Vector2 canvasPos;
            Vector2 screenPoint = Camera.main.WorldToScreenPoint(offsetPos);

            // Convert screen position to Canvas / RectTransform space <- leave camera null if Screen Space Overlay
            RectTransformUtility.ScreenPointToLocalPointInRectangle(baseCookerTimerPrefab.GetComponent<Image>().rectTransform, screenPoint, null, out canvasPos);

            newSpawnPosition = canvasPos;

            baseCookerTimer = Instantiate(baseCookerTimerPrefab, newSpawnPosition, transform.rotation);
            canvas = GameObject.Find("Canvas").GetComponent<Canvas>();
            baseCookerTimerImage = baseCookerTimer.GetComponent<Image>();
            baseCookerTimer.transform.SetParent(canvas.transform);
        }
    }

    public void StartOrder(Character character)
    {
        currentCharacter = character;

        //  Reset timer. 
        currentOrderTime = 0;
    }

    public void SubmitOrder(Bowl bowl)
    {
        orderIsActive = false;
        Grade grade = bowl.GetGrade(currentCharacter.Preferences);
        Debug.Log("Final grade " + grade.gradeNumber);
        if (grade.gradeNumber > 30)
        {
            Debug.Log("peak");
            dialogueManager.StartConversation("");
        }

        else if (grade.gradeNumber < -30)
        {
            Debug.Log("ass");
            dialogueManager.StartConversation("");
        }

        else
        {
            Debug.Log("mid");
            dialogueManager.StartConversation("");
        }

        //  TO-DO: Adjust grade based on how long the player has waited since the start of the order (currentOrderTime). 
        //  TO-DO: Implement UI that uses grade to show player feedback (ie. which preferences were included + final grade)
    }

    private void CalculateOrderTimer()
    {
        currentOrderTime += Time.deltaTime; 
    }

    private void CalculateBaseTimer()
    {
        baseCookingTime += Time.deltaTime;

        //  This code assumes that there's only one Base Cooker in the scene. 
        if (baseCookerTimer == null)
        {
            return;
        }

        Debug.Log(baseCookerTimerImage.fillAmount);
        baseCookerTimerImage.fillAmount = baseCookingTime / baseCookingMaxTime;
        if (baseCookerTimerImage.fillAmount >= 1)
        {
            Debug.Log("Base is finished!");
        }
    }

    public bool IsCooking()
    {
        return baseIsCooking;
    }

    public IngredientInteractable GetIngredient()
    {
        return currentCookingIngredient;
    }

    public void FinishCooking()
    {
        Destroy(baseCookerTimer);

    }


}
