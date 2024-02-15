using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MuliVideoShow : MonoBehaviour
{
    [SerializeField] float [] secondsToShowVideo;

    GameObject [] videos;

    float timeInSeconds;

    int videoNo;

    bool playingVideo = false;
    private void Start() {
        videos = new GameObject[transform.childCount];

        for (int i = 0; i < videos.Length; i++) {
            videos[i] = transform.GetChild(i).gameObject;

            if (i != 0) {
                transform.GetChild(i).GetComponent<RawImage>().enabled = false;
            }
        }
    }

    private void Update() {
        if (playingVideo) {
            timeInSeconds += Time.deltaTime;

            print(timeInSeconds + "   " + secondsToShowVideo[videoNo]);

            if (timeInSeconds >= secondsToShowVideo[videoNo]) {
                videos[videoNo].GetComponent<RawImage>().enabled = true;
                videos[videoNo].GetComponentInChildren<AudioSource>().mute = false;
                ++videoNo;
            }
        }
    }

    public void ShowVideo() {
        playingVideo = true;
    }

    public void PlayAllVideos() {
        for (int i = 0; i < videos.Length; i++) {
            transform.GetChild(i).GetComponent<VideoManager>().PlayVideo();

            if (i != 0) {
                transform.GetChild(i).GetComponent<RawImage>().enabled = false;
            }

        }
    }
}
