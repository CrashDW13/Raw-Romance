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
    private void Start()
    {
        CharacterName.text = "";
        DialogueBox.text = "";
        scrawling = false;
        scrawlSpeed = defaultScrawlSpeed;
        pauseDialogue = false;

        inkStory = new Story(inkAsset.text);
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
                //string name = tag.Substring(tag.IndexOf(":") + 1);

                //// Set the image if necessary
                //for (int i = 0; i < CharacterArtNames.Count; i++)
                //{
                //    if (name == CharacterArtNames[i])
                //    {
                //        if (name == "Jonathan")
                //        {
                //            CharacterImage.enabled = true;
                //            CharacterImage.sprite = CharacterArtImages[i];

                //            CharacterImage.transform.localPosition = new Vector3(-imageOffset, CharacterImage.transform.localPosition.y, CharacterImage.transform.localPosition.z);

                //            DialogueBox.transform.localPosition = new Vector3(-dialogueOffset, DialogueBox.transform.localPosition.y, DialogueBox.transform.localPosition.z);
                //        }
                //        else
                //        {
                //            CharacterImage.enabled = true;
                //            CharacterImage.sprite = CharacterArtImages[i];

                //            CharacterImage.transform.localPosition = new Vector3(imageOffset, CharacterImage.transform.localPosition.y, CharacterImage.transform.localPosition.z);

                //            DialogueBox.transform.localPosition = new Vector3(dialogueOffset, DialogueBox.transform.localPosition.y, DialogueBox.transform.localPosition.z);
                //        }
                //    }
                //}

                //// Remove the image if necessary
                //if (name == "Jonathan's Journal")
                //{
                //    CharacterImage.enabled = false;

                //    DialogueBox.transform.localPosition = new Vector3(0f, DialogueBox.transform.localPosition.y, DialogueBox.transform.localPosition.z);
                //}

                //tmpName.text = name;
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
