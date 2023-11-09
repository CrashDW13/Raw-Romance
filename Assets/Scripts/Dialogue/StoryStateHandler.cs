using Ink.Runtime;
using System.Collections.Generic;
using UnityEngine;



public class SaveState
{
    public string State;
    public string FallbackNode = "";

    public SaveState(string json, string fallbackNode)
    {
        State = json;
        FallbackNode = fallbackNode;
    }
}

public class StoryStateHandler : MonoBehaviour
{
    private Story story;
    private List<SaveState> storyStateHistory = new List<SaveState>();

    public StoryStateHandler(Story inkStory)
    {
        this.story = inkStory;
    }

    public void SaveState(string fallbackNode)
    {
        Debug.Log(fallbackNode);
        storyStateHistory.Add(new SaveState(story.state.ToJson(), fallbackNode));
    }

    public bool CanRewind()
    {
        return storyStateHistory.Count > 1;
    }

    public bool RewindStoryState()
    {
        Debug.Log("Number of saved states: " + storyStateHistory.Count);
        if (CanRewind()) 
        {
            SaveState saveState = storyStateHistory[storyStateHistory.Count - 1];
            DialoguePanel dialoguePanel = FindObjectOfType<DialoguePanel>();

            if (!dialoguePanel)
            {
                Debug.Log("DialoguePanel not found.");
                return false;
            }


            /*if (saveState.FallbackNode == "") 
            {
                Debug.Log("No fallback node found.");
                Debug.Log(story.state.ToJson()) ;
                story.state.LoadJson(saveState.State);
                Debug.Log(story.state.ToJson());
                storyStateHistory.RemoveAt(storyStateHistory.Count - 1);
                //dialoguePanel.Continue();

                return true;
            }*/

            dialoguePanel.ForcePath(saveState.FallbackNode);
            storyStateHistory.RemoveAt(storyStateHistory.Count - 1);
            return true;
        }

        else
        {
            return false;
        }
    }
}
