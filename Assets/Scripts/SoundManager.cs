using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class AudioEntry
{
    public string clipName;
    public AudioClip clip;
    [Range(0, 1)] public float volume = 1f;
}

public class SoundManager : MonoBehaviour
{
    public static SoundManager instance;

    [Header("Background Music")]
    public GameObject bgmPrefab; 
    public List<AudioEntry> bgmEntries;
    private Dictionary<string, AudioSource> bgmSources = new Dictionary<string, AudioSource>();

    [Header("Sound Effects")]
    public GameObject sfxPrefab; 
    public List<AudioEntry> sfxEntries;
    private Dictionary<string, AudioSource> sfxSources = new Dictionary<string, AudioSource>();

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else if (instance != this)
        {
            Destroy(gameObject);
            return;
        }

        InitializeAudio(bgmEntries, bgmSources, bgmPrefab);
        InitializeAudio(sfxEntries, sfxSources, sfxPrefab);
    }

    private void InitializeAudio(List<AudioEntry> entries, Dictionary<string, AudioSource> sourceDict, GameObject prefab)
    {
        foreach (AudioEntry entry in entries)
        {
            GameObject audioObject = Instantiate(prefab, transform);
            audioObject.name = entry.clipName;
            AudioSource source = audioObject.GetComponent<AudioSource>();
            source.clip = entry.clip;
            source.volume = entry.volume;
            sourceDict.Add(entry.clipName, source);
        }
    }

    public void PlaySFX(string clipName)
    {
        if (sfxSources.ContainsKey(clipName))
        {
            sfxSources[clipName].Play();
        }
        else
        {
            Debug.LogError($"No SFX named: {clipName} found.");
        }
    }

    public void PlayBGM(string clipName)
    {
        if (bgmSources.ContainsKey(clipName))
        {
            bgmSources[clipName].Play();
        }
        else
        {
            Debug.LogError($"No BGM named: {clipName} found.");
        }
    }

    public void StopBGM(string clipName)
    {
        if (bgmSources.ContainsKey(clipName))
        {
            bgmSources[clipName].Stop();
        }
        else
        {
            Debug.LogError($"No BGM named: {clipName} found.");
        }
    }
}
