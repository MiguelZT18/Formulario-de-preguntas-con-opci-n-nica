import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyQuiz(),
    );
  }
}

class MyQuiz extends StatefulWidget {
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  int currentQuestionIndex = 0;

  List<Question> questions = [
    Question(
      '¿Cuál es la capital de Francia?',
      ['Londres', 'Berlín', 'París', 'Madrid'],
      'París',
    ),
    Question(
      '¿Cuál es el río más largo del mundo?',
      ['Nilo', 'Amazonas', 'Misisipi', 'Yangtsé'],
      'Amazonas',
    ),
    // Agrega más preguntas aquí
  ];

  void nextQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz de Preguntas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              questions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Column(
              children: questions[currentQuestionIndex]
                  .options
                  .map((option) => RadioListTile(
                        title: Text(option),
                        value: option,
                        groupValue:
                            questions[currentQuestionIndex].selectedOption,
                        onChanged: (value) {
                          setState(() {
                            questions[currentQuestionIndex].selectedOption =
                                value!;
                          });
                        },
                      ))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: nextQuestion,
              child: Text('Siguiente Pregunta'),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  String selectedOption;

  Question(this.questionText, this.options, this.selectedOption);
}
