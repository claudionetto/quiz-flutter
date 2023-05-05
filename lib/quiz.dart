import 'package:flutter/material.dart';
import 'package:quiz_mobile/resultados.dart';
import 'package:quiz_mobile/quiz_dados.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.quiz});

  final List quiz;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    quiz.shuffle();
    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('Acertou');
          acertos++;
        } else {
          print('Errou');
          erros++;
        }

        print('Acertos totais = $acertos ,  Erros totais = $erros');

        if (perguntaNumero == 10) {
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Flutter e Dart'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Pergunta $perguntaNumero de 10',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                'Pergunta: \n\n' + quiz[perguntaNumero - 1]['pergunta'],
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    respondeu(1);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][0],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    respondeu(2);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][1],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    respondeu(3);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][2],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    respondeu(4);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][3],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
