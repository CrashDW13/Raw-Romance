using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using System;

public class DialoguePanel : MonoBehaviour
{
    [Header("Characters")]
    [SerializeField] private CharacterDatabase characterDB;
    [Space(10)]

    [Header("Ink File")]
    [SerializeField] private TextAsset inkAsset;
    private Story inkStory;
    private string knot;
    [Space(10)]


    [Header("Graphics")]
    [SerializeField] private Image Background;
    [SerializeField] private Image CharacterArt;
    [Space(10)]


    [Header("Choices")]
    [SerializeField] private GameObject choicePrefab; 
    [SerializeField] private TMP_Text CharacterName;
    [SerializeField] private TMP_Text DialogueBox;
    [Space(10)]


    [Header("Scrawl")]
    [SerializeField] private float defaultScrawlSpeed;
    [SerializeField] private float scrawlMultiplier;
    [SerializeField] private float defaultWaitTimeSeconds;

    private Coroutine textCoroutine;

    private bool scrawling;
    private float scrawlSpeed;

    private void Start()
    {
        StartConversation("demo_start");

        CharacterName.text = "";
        DialogueBox.text = "";

        scrawling = false;
        scrawlSpeed = defaultScrawlSpeed;

        inkStory = new Story(inkAsset.text);

        inkStory.BindExternalFunction("updateAffinity", (string character, int value) => { UpdateAffinity(character, value); });
        inkStory.BindExternalFunction("spawnChoice", (string message, string knot, float time, string positionPreset) => { SpawnChoice(message, knot, time, positionPreset); });
        inkStory.ChoosePathString(knot);

        ShowLine(inkStory.Continue());
    }

    public void StartConversation(string knotToLoad)
    {
        knot = knotToLoad;
    }

    void ShowLine(string line)
    {
        // Check tags as necessary
        List<string> tags = inkStory.currentTags;
        foreach (string tag in tags)
        {
            if (tag.Contains("Speaker"))
            {
                string name = tag.Substring(tag.IndexOf(":") + 1);

                /*foreach (Character character in characterDB.Characters)
                {
                    string[] charTags = character.characterTag.Split(":");
                    bool isChar = false;
                    foreach (string s in charTags)
                        if (s == name)
                            isChar = true;

                    if (isChar)
                    {
                        CharacterName.text = character.characterName;

                        //CharacterArt.sprite = character.GetSprite();
                    }
                }*/
            }
        }
        textCoroutine = StartCoroutine(ScrawlText(line));
    }

    IEnumerator ScrawlText(string line)
    {
        scrawling = true;
        DialogueBox.text = "";
        scrawlSpeed = defaultScrawlSpeed;

        int i = 0;
        while (i < line.Length)
        {
            DialogueBox.text += line[i];
            i++;

            yield return new WaitForSeconds(0.05f / scrawlSpeed);
        }

        scrawling = false;

        if (inkStory.currentChoices.Count > 0)
        {
            ShowChoices();
            StartCoroutine(Advance());
        }

        else
        {
            StartCoroutine(Advance());
        }

    }

    void ShowChoices()
    {
        /*ChoiceParent.SetActive(true);

        int i = 0;
        foreach (Transform choice in ChoiceParent.transform)
        {
            if (i < inkStory.currentChoices.Count)
            {
                choice.gameObject.SetActive(true);

                choice.GetComponentInChildren<TMP_Text>().text = inkStory.currentChoices[i].text;
            }
            else
            {
                choice.gameObject.SetActive(false);
            }
            i++;
        }*/
    }

    public void SelectChoice(float choice)
    {
        inkStory.ChooseChoiceIndex((int)choice);

        ShowLine(inkStory.Continue());
    }

    public IEnumerator Advance()
    {
        yield return new WaitForSeconds(defaultWaitTimeSeconds);

        if (inkStory.canContinue && !scrawling)
        {
            ShowLine(inkStory.Continue());
        }
        else if (!inkStory.canContinue && !scrawling && inkStory.currentChoices.Count > 0)
        {
            //SelectChoice();
        }
        else if (!inkStory.canContinue && !scrawling && inkStory.currentChoices.Count == 0)
        {
            //GameManager.Instance.CloseDialogue(this);
            Destroy(gameObject);
        }
    }

    void UpdateAffinity(string character, int value)
    {
        Debug.Log(character + ": " + value);
    }

    void SpawnChoice(string message, string knot, float time, string positionPreset)
    {
        Vector3 position;

        //TO-DO: Post-prototype, this should be handled in its own function. 
        switch(positionPreset)
        {
            case "top-right":
                position = new Vector3(300, 300, 0);
                break;
            case "top-left":
                position = new Vector3(200, 300, 0);
                break;

            case "bottom-right":
                position = new Vector3(300, 200, 0);
                break;
            case "bottom-left":
                position = new Vector3(200, 200, 0);
                break;
            default:
                position = Vector3.zero;
                break;
        }

        ChoicePanel.Instantiate(choicePrefab, position, transform.rotation, message, knot, time);
    }

    public void ForcePath(string path)
    {
        StopCoroutine(textCoroutine);
        inkStory.ChoosePathString(path);
        ShowLine(inkStory.Continue());
    }
}
