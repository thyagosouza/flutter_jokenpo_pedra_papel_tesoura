import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class JokenpoPage extends StatefulWidget {
  const JokenpoPage({Key? key}) : super(key: key);

  @override
  State<JokenpoPage> createState() => _JokenpoPageState();
}

class _JokenpoPageState extends State<JokenpoPage> {
  var _imagemVazia = AssetImage('assets/images/empty.png');
  var _imagemVaziaPlayer = AssetImage('assets/images/empty.png');
  var _imageRobo = AssetImage('');
  String _msgResultado = '';
  bool _jogoIniciado = false;

  void _escolha(String escolhaJogador) {
    var escolha = ['rock', 'paper', 'scissor'];
    var num = Random().nextInt(3);
    var escolhaBot = escolha[num];

    //Exibir imagem escolhida pela maquina
    Timer(Duration(seconds: 1), () {
      switch (escolhaBot) {
        case "rock":
          setState(() {
            _imagemVazia = AssetImage("assets/images/rock.png");
          });
          break;

        case "paper":
          setState(() {
            _imagemVazia = AssetImage("assets/images/paper.png");
          });
          break;
        case "scissor":
          setState(() {
            _imagemVazia = AssetImage("assets/images/scissor.png");
          });
          break;
      }
    });

    //Condições para ver quem ganha

    setState(() {
      if ((escolhaJogador == 'rock' && escolhaBot == 'scissor') ||
          (escolhaJogador == 'scissor' && escolhaBot == 'paper') ||
          (escolhaJogador == 'paper' && escolhaBot == 'rock')) {
        Timer(Duration(seconds: 1), () {
          _msgResultado = 'Você ganhou!';
          _imageRobo = AssetImage('assets/images/paper.png');
        });
      } else if ((escolhaJogador == 'scissor' && escolhaBot == 'rock') ||
          (escolhaJogador == 'paper' && escolhaBot == 'scissor') ||
          (escolhaJogador == 'rock' && escolhaBot == 'paper')) {
        Timer(Duration(seconds: 1), () {
          _msgResultado = "Você perdeu!";
          _imageRobo = AssetImage('assets/images/paper.png');
        });
      } else {
        Timer(Duration(seconds: 1), () {
          _msgResultado = "Empatou!";
          _imageRobo = AssetImage('assets/images/paper.png');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(
          'Jogo Pedra Papel Tesoura',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                      'Você',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image(
                      image: _imagemVaziaPlayer,
                      height: 150,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Computador',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image(
                      image: _imagemVazia,
                      height: 150,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                _msgResultado,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AbsorbPointer(
              absorbing: _jogoIniciado,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //  mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _jogoIniciado = true;
                      _escolha('rock');
                      _imagemVaziaPlayer = AssetImage('assets/images/rock.png');
                      _espera();

                      fimJogoIniciado();
                    },
                    child: Image.asset(
                      'assets/images/rock.png',
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _jogoIniciado = true;
                      _escolha('paper');
                      _imagemVaziaPlayer =
                          AssetImage('assets/images/paper.png');
                      _espera();

                      fimJogoIniciado();
                    },
                    child: Image.asset(
                      'assets/images/paper.png',
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _jogoIniciado = true;
                      _escolha('scissor');
                      _imagemVaziaPlayer =
                          AssetImage('assets/images/scissor.png');
                      _espera();

                      fimJogoIniciado();
                    },
                    child: Image.asset(
                      'assets/images/scissor.png',
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fimJogoIniciado() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _jogoIniciado = false;
      });
    });
  }

  void _espera() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        _imagemVazia = AssetImage('assets/images/empty.png');
        _imagemVaziaPlayer = AssetImage('assets/images/empty.png');
        _msgResultado = '';
      });
    });
  }
}
