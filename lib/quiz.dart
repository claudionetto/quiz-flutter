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
  bool atualizar = true;

  @override
  Widget build(BuildContext context) {
    if (atualizar) {
      quiz.shuffle();
      atualizar = false;
    }
    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('Acertou');
          acertos++;
        } else {
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
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
          title: Text('Quiz TI(Tudo Incluso)'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      Image.asset('assets/images/fogo.png', width: 45),
                      SizedBox(width: 5),
                      Text(
                        acertos.toString(),
                        style: TextStyle(
                            fontSize: 42, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Text(
                quiz[perguntaNumero - 1]['pergunta'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
