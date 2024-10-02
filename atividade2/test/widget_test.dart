// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:atividade2/main.dart';

void main() {
  test('verifica tipoLista passando lista de inteiros', () {
    expect(tipoLista([1,2,3]),'lista de inteiros: [1, 2, 3]');
  });

  test('verifica tipoLista passando lista de Strings', () {
    expect(tipoLista(['a','b','c']),'lista de Strings: [a, b, c]');
  });

  test('verifica tipoLista passando lista vazia', () {
    expect(tipoLista([]), 'lista de outro tipo (não é nem int nem String): []');
  });

  test('verifica tipoLista passando lista de outro tipo', () {
    expect(tipoLista([1.2,2.2,3.2]),'lista de outro tipo (não é nem int nem String): [1.2, 2.2, 3.2]');
  });
}
