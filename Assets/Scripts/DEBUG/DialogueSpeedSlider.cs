using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Android;
using UnityEngine.UI;

public class DialogueSpeedSlider : MonoBehaviour
{
    [SerializeField] DialoguePanel dialoguePanel;
    [SerializeField] TextMeshProUGUI sliderText;
    private Slider slider;
    private static float value = 1.0f; 

    private void Start()
    {
        slider = GetComponent<Slider>();
        dialoguePanel = FindObjectOfType<DialoguePanel>();

        if (slider)
        {
            slider.onValueChanged.AddListener(delegate { SetDialoguePanelScrawlSpeed(); });
            slider.value = value; 
            sliderText.text = value.ToString("0.00");
        }
    }

    private void Update()
    {
        Debug.Log(value);
    }

    private void SetDialoguePanelScrawlSpeed()
    {
        Debug.Log("set scrawl speed to " +  slider.value);
        dialoguePanel.SetScrawlSpeed(slider.value);
        sliderText.text = slider.value.ToString("0.00");
        value = slider.value;
    }
}
