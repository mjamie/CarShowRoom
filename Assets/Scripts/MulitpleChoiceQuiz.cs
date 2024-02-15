using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class MulitpleChoiceQuiz : MonoBehaviour
{
    [SerializeField] private Transform buttonHolder;
    [SerializeField] private TextMeshProUGUI questionText;
    [SerializeField] private TextMeshProUGUI questionNumberText;
    [SerializeField] private TextMeshProUGUI scoreTotalText;
    [SerializeField] private Transform answerPanel;
    [SerializeField] private Transform endPanel;
    [SerializeField] private Button nextButton;

    [Header("Colours")]
    [SerializeField] private Color correctColor;
    [SerializeField] private Color incorrectColor;

    [Header("Questions")]
    [SerializeField] private List<Questions> questions;

    private List<Button> buttons;
    private List<TextMeshProUGUI> buttonAnswerText;

    private int questionNumber;
    private int answersCorrect = 0;

    private ColorBlock initialColorBlock;
    private void Start()
    {
        buttons = new List<Button>();
        buttonAnswerText = new List<TextMeshProUGUI>();

        initialColorBlock = buttonHolder.GetChild(0).GetComponent<Button>().colors;

        for (int i = 0; i < buttonHolder.childCount; i++)
        {
            //buttonHolder.GetChild(i).GetComponent<Button>().onClick.AddListener(() => SelectedAnswer(i));

            buttons.Add(buttonHolder.GetChild(i).GetComponent<Button>());
            buttonAnswerText.Add(buttonHolder.GetChild(i).GetComponentInChildren<TextMeshProUGUI>());
        }

        nextButton.onClick.AddListener(() => NextQuestion());

        SetNewQuestionTexts();
    }

    private void SetNewQuestionTexts()
    {
        questionNumberText.text = "" + (questionNumber + 1);
        questionText.text = questions[questionNumber].question;

        for (int i = 0; i < buttonAnswerText.Count; i++)
        {
            buttonAnswerText[i].text = questions[questionNumber].answers[i];
        }

        answerPanel.GetComponentsInChildren<TextMeshProUGUI>()[1].text = questions[questionNumber].longAnswer;
    }

    public void SelectedAnswer(int chosenQuestionNumber)
    {
        ColorBlock colorBlock = buttonHolder.GetChild(chosenQuestionNumber).GetComponent<Button>().colors;

        colorBlock.disabledColor = correctColor;
        buttonHolder.GetChild(GetAnswerNumber()).GetComponent<Button>().colors = colorBlock;

        for (int i = 0; i < buttonHolder.childCount; i++)
        {
            buttonHolder.GetChild(i).GetComponent<Button>().interactable = false;
        }

        if (chosenQuestionNumber == GetAnswerNumber())
        {
            //Answer Correct
            answerPanel.GetChild(0).GetComponent<TextMeshProUGUI>().text = "Correct";
            answersCorrect++;
        }
        else
        {
            //Answer Incorerct
            answerPanel.GetChild(0).GetComponent<TextMeshProUGUI>().text = "Incorrect";
            colorBlock.disabledColor = incorrectColor;
            buttonHolder.GetChild(chosenQuestionNumber).GetComponent<Button>().colors = colorBlock;
        }

        answerPanel.gameObject.SetActive(true);
        nextButton.gameObject.SetActive(true);
    }
    public void NextQuestion()
    {
        questionNumber++;

        //Check if at the end of the quiz
        if (questionNumber >= 10)
        {
            endPanel.gameObject.SetActive(true);

            answerPanel.gameObject.SetActive(false);
            nextButton.gameObject.SetActive(false);

            scoreTotalText.text = answersCorrect + "/10";
            return;
        }

        ResetButtonsAndAnswerPanel();

        SetNewQuestionTexts();
    }

    private void ResetButtonsAndAnswerPanel()
    {
        for (int i = 0; i < buttonHolder.childCount; i++)
        {
            //Change buttons
            buttonHolder.GetChild(i).GetComponent<Button>().interactable = true;
            buttonHolder.GetChild(i).GetComponent<Button>().colors = initialColorBlock;
        }

        //Hide UI
        answerPanel.gameObject.SetActive(false);
        nextButton.gameObject.SetActive(false);
    }

    public void RestartQuiz()
    {
        questionNumber = 0;
        answersCorrect = 0;

        endPanel.gameObject.SetActive(false);

        ResetButtonsAndAnswerPanel();
        SetNewQuestionTexts();
    }

    private int GetAnswerNumber()
    {
        return questions[questionNumber].answerNumber;
    }
}
