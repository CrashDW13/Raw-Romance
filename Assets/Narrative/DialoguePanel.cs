using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;

public class DialoguePanel : MonoBehaviour
{
    [SerializeField] TextAsset inkAsset;
    [SerializeField] Image Background;
    [SerializeField] Image CharacterArt;
    [SerializeField] GameObject ChoiceParent;
    [SerializeField] TMP_Text CharacterName;
    [SerializeField] TMP_Text DialogueBox;

    [SerializeField] float defaultScrawlSpeed;
    [SerializeField] float scrawlMultiplier;
    bool scrawling;
    float scrawlSpeed;
    bool pauseDialogue;
    Story inkStory;
    CharacterDatabase characterDB;

    private void Start()
    {
        CharacterName.text = "";
        DialogueBox.text = "";
        scrawling = false;
        scrawlSpeed = defaultScrawlSpeed;
        pauseDialogue = false;
        characterDB = GameObject.FindObjectOfType<CharacterDatabase>();

        inkStory = new Story(inkAsset.text);
    }

    public void StartConversation(string knot)
    {
        inkStory.ChoosePathString(knot);

        ShowLine(inkStory.Continue());
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

                foreach (Character character in characterDB.Characters)
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
                }
            }
        }

        StartCoroutine(ScrawlText(line));
    }

    IEnumerator ScrawlText(string line)
    {
        scrawling = true;
        DialogueBox.text = "";
        //advanceIndicator.enabled = false;
        scrawlSpeed = defaultScrawlSpeed;

        int i = 0;
        while (i < line.Length)
        {
            //if (!dialogueAudio.isPlaying)
            //{
            //    int rand = Random.Range(0, 7);
            //    dialogueAudio.PlayOneShot(TypingSounds[rand]);
            //}

            DialogueBox.text += line[i];
            i++;

            yield return new WaitForSeconds(0.05f / scrawlSpeed);
        }

        scrawling = false;
        //advanceIndicator.enabled = true;

        if (inkStory.currentChoices.Count > 0)
            ShowChoices();
    }

    void ShowChoices()
    {
        ChoiceParent.SetActive(true);

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
        }
    }

    public void SelectChoice(float choice)
    {
        inkStory.ChooseChoiceIndex((int)choice);

        ChoiceParent.SetActive(false);

        ShowLine(inkStory.Continue());
    }

    public void Advance()
    {
        if (inkStory.canContinue && !scrawling && !pauseDialogue)
        {
            ShowLine(inkStory.Continue());
        }
        else if (scrawling)
        {
            //Debug.Log("SCRAWLING SPED UP");
            scrawlSpeed = defaultScrawlSpeed * scrawlMultiplier;
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
    public void ChangeChoice(float input)
    {
        //if (ChoiceParent.activeInHierarchy)
        //{
        //    int i = 0;
        //    foreach (Transform choice in ChoiceParent.transform)
        //    {
        //        foreach (Transform comp in choice)
        //        {
        //            if (comp.gameObject == Highlight)
        //            {
        //                if (input < 0 && i > 0)
        //                {
        //                    Highlight.transform.SetParent(ChoiceParent.transform.GetChild(i - 1));
        //                    Highlight.transform.localPosition = Vector3.zero;
        //                    Highlight.transform.SetSiblingIndex(0);
        //                }
        //                else if (input > 0 && i < inkStory.currentChoices.Count - 1)
        //                {
        //                    Highlight.transform.SetParent(ChoiceParent.transform.GetChild(i + 1));
        //                    Highlight.transform.localPosition = Vector3.zero;
        //                    Highlight.transform.SetSiblingIndex(0);
        //                }

        //                i = inkStory.currentChoices.Count;
        //            }
        //        }
        //        i++;
        //    }
        //}
    }
}
