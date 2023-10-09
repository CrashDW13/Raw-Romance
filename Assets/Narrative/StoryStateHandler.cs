using Ink.Runtime;
using System.Collections.Generic;
using UnityEngine;

public class StoryStateHandler
{
    private Story story;
    private List<string> storyStateHistory = new List<string>();

    public StoryStateHandler(Story inkStory)
    {
        this.story = inkStory;
    }

    public void SaveState()
    {
        storyStateHistory.Add(story.state.ToJson());
    }

    public bool CanRewind()
    {
        return storyStateHistory.Count > 1;
    }

    public bool RewindStoryState()
    {
        if (CanRewind()) 
        {
            storyStateHistory.RemoveAt(storyStateHistory.Count - 1);
            story.state.LoadJson(storyStateHistory[storyStateHistory.Count - 1]);
            return true;
        }
        else
        {
            Debug.LogWarning("No more states to rewind to.");
            return false;
        }
    }

}
