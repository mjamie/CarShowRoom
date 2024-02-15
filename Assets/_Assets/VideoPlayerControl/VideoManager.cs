using DG.Tweening;
using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
using UnityEngine.Video;

public class VideoManager : MonoBehaviour
{
    public VideoPlayer videoPlayer;

    [SerializeField] GameObject playButton;
    [SerializeField] GameObject pasueButton;
    [SerializeField] RenderTexture renderTexture;

#if UNITY_WEBGL
    public string videoName;
    public bool useStreamingAssetsFolder = true;

    private bool isVideoPlaying = true;
#endif
    public bool playOnAwake = false;

    [HideInInspector]
    public bool videoComplete = false;

    [SerializeField] UnityEvent videoEndEvent;

    private bool fullscreen = false;
    IEnumerator Start() {

#if UNITY_WEBGL
        if (useStreamingAssetsFolder) {
            videoPlayer.url = System.IO.Path.Combine(Application.streamingAssetsPath, videoName);
        } else {
            videoPlayer.url = videoName;
        }
#endif

        yield return new WaitForSeconds(1);
        // Using WEBGL
        if (playOnAwake) {
            videoPlayer.Prepare();
            videoPlayer.Play();

            InvokeRepeating("checkOver", .1f, .1f);
            videoComplete = false;
        }
#if UNITY_WEBGL
        if (!videoPlayer.isPlaying) {
            isVideoPlaying = false;
        }
#endif

        videoPlayer.Prepare();

        renderTexture = new RenderTexture(renderTexture);
        videoPlayer.GetComponent<RawImage>().texture = renderTexture;
        videoPlayer.targetTexture = renderTexture;
    }

#if UNITY_WEBGL
    private void Update() {

        if (playOnAwake) {
            if (!isVideoPlaying) {
                if (!videoPlayer.isPlaying) {
                    videoPlayer.Prepare();
                    videoPlayer.Play();
                } else {
                    if (!videoPlayer.GetComponent<RawImage>().enabled) {
                        videoPlayer.GetComponent<RawImage>().enabled = true;
                    }

                    InvokeRepeating("checkOver", .1f, .1f);
                    videoComplete = false;
                    isVideoPlaying = true;
                }
            }
        }
    }
#endif

    private IEnumerator playVideoInThisURL(string _url) {
        videoPlayer.source = UnityEngine.Video.VideoSource.Url;
        videoPlayer.url = _url;
        videoPlayer.Prepare();

        while (videoPlayer.isPrepared == false) {
            yield return null;
        }
        videoPlayer.Play();
    }

    public void PlayVideo() {
        if (!videoPlayer.GetComponent<RawImage>().enabled) {
            videoPlayer.GetComponent<RawImage>().enabled = true;
        }

        videoPlayer.Play();

        if (!videoComplete) {
            InvokeRepeating("checkOver", .1f, .1f);
            videoComplete = false;
        }
    }

    public void PauseVideo() {
        videoPlayer.Pause();
        CancelInvoke("checkOver");
    }
    public void PlayAndPauseVideo() {
        if (videoPlayer.isPlaying) {
            videoPlayer.Pause();

            SetButtons();
        } else {

            if (!videoPlayer.GetComponent<RawImage>().enabled) {
                videoPlayer.GetComponent<RawImage>().enabled = true;
            }

            videoPlayer.Play();

            SetButtons();

            if (!videoComplete) {
                InvokeRepeating("checkOver", .1f, .1f);
                videoComplete = false;
            }
        }
    }

    public void Fullscreen() {
        if (!fullscreen) {
            GetComponent<DOTweenAnimation>().DORestartAllById("zoom");
            fullscreen = true;
        } else {
            GetComponent<DOTweenAnimation>().DOPlayBackwardsAllById("zoom");
            fullscreen = false;
        }
    }

    private void SetButtons() {
        if (playButton) {
            if (!playButton.activeSelf) {
                playButton.SetActive(true);
                pasueButton.SetActive(false);
            } else {
                playButton.SetActive(false);
                pasueButton.SetActive(true);
            }
        }
    }
    public void RestartVideo() {
        videoPlayer.Stop();
        videoPlayer.Play();
    }

    public void StopVideo() {
        videoPlayer.Stop();

        if (!videoPlayer.GetComponent<RawImage>().enabled) {
            videoPlayer.GetComponent<RawImage>().enabled = false;
        }

        videoPlayer.targetTexture.Release();
    }

    public void ClosePanelwithVideo() {
        playButton.SetActive(true);
        pasueButton.SetActive(false);

        StopVideo();
    }

    private void checkOver() {
        long playerCurrentFrame = videoPlayer.frame;
        long playerFrameCount = Convert.ToInt64(videoPlayer.frameCount);

        if (playerCurrentFrame < playerFrameCount - 3) {
        } else {
            
            //Do w.e you want to do for when the video is done playing.
            videoComplete = true;

            if(playerCurrentFrame >= 0)
                StopVideo();

            if (videoEndEvent is null) { }
                videoEndEvent.Invoke();

            //Cancel Invoke since video is no longer playing
            CancelInvoke("checkOver");
            SetButtons();
        }
    }
}
