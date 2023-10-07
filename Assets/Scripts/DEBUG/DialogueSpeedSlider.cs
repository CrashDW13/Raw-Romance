using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class DialogueSpeedSlider : MonoBehaviour
{
    [SerializeField] DialoguePanel dialoguePanel;
    [SerializeField] TextMeshProUGUI sliderText;
    private Slider slider;

    private void Start()
    {
        slider = GetComponent<Slider>();
    }

    private void Update()
    {
        if (dialoguePanel)
        {
            dialoguePanel.SetScrawlSpeed(slider.value); 
            sliderText.text = slider.value.ToString("0.00");
        }
    }
}
