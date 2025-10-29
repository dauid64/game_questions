import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) onResponder;
  final bool temPerguntaSelecionada;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.onResponder,
    required this.temPerguntaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
              as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map(
          (resposta) => Resposta(
            texto: resposta['texto'] as String,
            onSelecao: () =>
                onResponder(int.parse(resposta['pontuacao'].toString())),
          ),
        ),
      ],
    );
  }
}
