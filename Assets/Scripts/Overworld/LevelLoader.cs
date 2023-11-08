using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LevelLoader : MonoBehaviour
{
    public List<GameObject> transitionList = new List<GameObject>();
    public IEnumerator Load(string transition, string sceneName)
    {
        GameObject transitionPrefab = null; 
        foreach (GameObject transitionListObject in transitionList)
        {
            if (transitionListObject.name == transition)
            {
                transitionPrefab = transitionListObject;
            }
        }

        if (transitionPrefab == null)
        {
            Debug.LogError("Transition Prefab '" + transition + "' not found.");
            yield break;
        }

        GameObject transitionObject = Instantiate(transitionPrefab, Vector3.zero, Quaternion.identity);

        if (transitionObject.TryGetComponent(out Animator animator))
        {
            float length = animator.GetCurrentAnimatorClipInfo(0).Length;
            yield return new WaitForSeconds(length);
            Debug.Log("loading");

            SceneManager.LoadScene(sceneName);
        }

        else
        {
            Debug.LogError("Animator not found in Transition object, aborting.");
        }

    }


    private void Awake()
    {
        DontDestroyOnLoad(gameObject);

        if (FindObjectsOfType<LevelLoader>().Length > 1)
        {
            Destroy(gameObject);
        }
    }
}