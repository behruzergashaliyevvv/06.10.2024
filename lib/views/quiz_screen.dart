

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is Flutter?',
      'answers': [
        {'text': 'A bird', 'score': 0},
        {'text': 'A mobile SDK', 'score': 1},
        {'text': 'A type of dance', 'score': 0},
        {'text': 'A programming language', 'score': 0},
      ],
    },
    {
      'question': 'Who developed Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': 0},
        {'text': 'Adobe', 'score': 0},
        {'text': 'Google', 'score': 1},
        {'text': 'Microsoft', 'score': 0},
      ],
    },
    {
      'question': 'Which language is used by Flutter?',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Kotlin', 'score': 0},
        {'text': 'Dart', 'score': 1},
        {'text': 'Swift', 'score': 0},
      ],
    },
    {
      'question': 'Flutter is used for?',
      'answers': [
        {'text': 'Web development', 'score': 0},
        {'text': 'Mobile development', 'score': 1},
        {'text': 'System programming', 'score': 0},
        {'text': 'Database management', 'score': 0},
      ],
    },
    {
      'question': 'What is the command to create a new Flutter project?',
      'answers': [
        {'text': 'flutter new project', 'score': 0},
        {'text': 'flutter create project', 'score': 0},
        {'text': 'flutter init project', 'score': 0},
        {'text': 'flutter create', 'score': 1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _score += score;

    setState(() {
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= _questions.length) {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Quiz Finished!'),
        content: Text('Your score is $_score/${_questions.length}'),
        actions: [
          TextButton(
            child: Text('Submit'),
            onPressed: () {
              Navigator.of(ctx).pop();
              _submitScore();
            },
          ),
        ],
      ),
    );
  }

  void _submitScore() async {
    // TODO: Implement the API call to submit the score
    // await ApiService.submitQuizResult(_score);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _questions[_currentQuestionIndex]['question'] as String,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ...(_questions[_currentQuestionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return ListTile(
                    title: Text(answer['text'] as String),
                    onTap: () => _answerQuestion(answer['score'] as int),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
