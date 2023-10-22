using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using TMPro;
using UnityEngine;
using UnityEngine.UI; 

public class ChoicePanel : MonoBehaviour
{

    [HideInInspector]
    public string message;
    [HideInInspector]
    public string choice;
    [HideInInspector]
    public float maxTime;

    private float timer; 

    private bool active = false;

    private Slider slider;

    private float easeScaleTimer = 0;
    private float easeScaleLength = 0.5f;

    private void Start()
    {
        timer = maxTime;
        slider = GetComponentInChildren<Slider>();
        slider.value = 1;

        Canvas canvas = FindObjectOfType<Canvas>();
        if (canvas)
        {
            transform.SetParent(canvas.transform) ;
        }

        TextMeshProUGUI textMesh= GetComponentInChildren<TextMeshProUGUI>();
        if (textMesh)
        {
            textMesh.text = JumbleBySanity(message);
        }
    }

    private string JumbleBySanity(string message)
    {
        char[] chars = message.ToCharArray();
        float sanity = SanityHandler.GetSanity() + 0.4f;

        for (var i = 0; i < chars.Length; i++)
        {
            float rand = Random.Range(0f, 1f);
            if (rand > sanity)
            {
                int randomIndex = Random.Range(0, chars.Length - 1);
                char temp = chars[randomIndex];
                chars[randomIndex] = chars[i];
                chars[i] = temp;
            }
        }

        string newMessage = new string(chars);
        return newMessage;
    }

    private void Update()
    {
        CalculateTimer();

        if (easeScaleTimer < 1)
        {
            EasingFunction.Ease ease = EasingFunction.Ease.EaseOutQuad;
            EasingFunction.Function func = EasingFunction.GetEasingFunction(ease);
            
            float value = func(0, 0.6f, easeScaleTimer);
            transform.localScale = new Vector3(value, value, 1);

            easeScaleTimer += easeScaleLength * Time.deltaTime;
        }
    }

    public void OnClick()
    {
        DialoguePanel dialoguePanel = FindObjectOfType<DialoguePanel>();
        if (!dialoguePanel)
        {
            Debug.Log("Dialogue Panel can't be found.");
            return;
        }

        dialoguePanel.ForcePath(choice);
        ChoicePanel[] choicePanels = FindObjectsOfType<ChoicePanel>();
        foreach (ChoicePanel choicePanel in choicePanels)
        {
            Destroy(choicePanel.gameObject);
        }
    }

    public static void ClearAll()
    {
        ChoicePanel[] choicePanels = FindObjectsOfType<ChoicePanel>();
        foreach (ChoicePanel choicePanel in choicePanels)
        {
            Destroy(choicePanel.gameObject);
        }
    }

    public static void Instantiate(GameObject original, Vector3 position, Quaternion rotation, string message, string choice, float maxTime)
    {
        Canvas canvas = FindObjectOfType<Canvas>();
        if (!canvas)
        {
            Debug.Log("Tried spawning ChoicePanel, canvas not found.");
            return;
        }

        GameObject panelObject = Instantiate(original, position, rotation, canvas.transform);

        if (panelObject.TryGetComponent(out RectTransform rectTransform))
        {
            if (canvas)
            {
                rectTransform.position = position;
            }
        }

        else
        {
            Debug.Log("No RectTransform found.");
        }

        if (panelObject.TryGetComponent(out ChoicePanel choicePanel))
        {
            choicePanel.message = message;
            choicePanel.choice = choice;
            choicePanel.maxTime = maxTime;

            choicePanel.SetActive(true);
        }

        else
        {
            Debug.Log("No ChoicePanel component found.");
        }

        Debug.Log(panelObject.transform.position);
    }

    public void CalculateTimer()
    {
        if (active)
        {
            if (timer > 0)
            {
                timer -= Time.deltaTime;
                if (slider)
                {
                    slider.value = timer / maxTime;
                }
            }

            else
            {
                Debug.Log("Choice Panel is finished, self-destructing.");
                Destroy(gameObject);
            }
        }
    }

    public void SetActive(bool active)
    {
        this.active = active;
    }
}
