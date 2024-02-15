using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Question", menuName = "Quiz/Question", order = 1)]
public class Questions : ScriptableObject
{
    public string question;

    public string[] answers = new string[4];

    public int answerNumber;
   
    [TextArea(0,10)]
    public string longAnswer;


    
}
