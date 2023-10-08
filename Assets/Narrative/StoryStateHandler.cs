// StoryStateHandler.cs
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
        SaveState();
    }

    public void SaveState()
    {
        storyStateHistory.Add(story.state.ToJson());
    }

    public void RewindStoryState()
    {
        if (storyStateHistory.Count > 1) 
        {
            storyStateHistory.RemoveAt(storyStateHistory.Count - 1);
            story.state.LoadJson(storyStateHistory[storyStateHistory.Count - 1]);
        }
        else
        {
            Debug.LogWarning("No more states to rewind to.");
        }
    }
}
