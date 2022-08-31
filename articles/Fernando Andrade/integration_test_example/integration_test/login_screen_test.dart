import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_example/main.dart';

void main() {
  /// Garante que os pacotes sejam inicializados corretamente
  WidgetsFlutterBinding.ensureInitialized();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login', (tester) async {
    /// Constrói o app
    await tester.pumpWidget(const MyApp());

    /// Busca por elementos em nosso layout com base no texto exibido.
    Finder emailInput = find.bySemanticsLabel('E-mail');
    Finder passwordInput = find.bySemanticsLabel('Senha');
    Finder loginBtn = find.bySemanticsLabel('Acessar');

    /// Escreve o texto nos [TextField]'s encontrados.
    await tester.enterText(emailInput, 'test@test.com');
    await tester.enterText(passwordInput, 'test123');

    /// Pressiona o botão de login.
    await tester.tap(loginBtn);

    /// Aciona a frame depois do tempo informado.
    await tester.pump(const Duration(seconds: 5));

    /// Verifica se existe um tipo widget do tipo [Text] na tela
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets('Erro no login', (tester) async {
    /// Constrói o app
    await tester.pumpWidget(const MyApp());

    /// Busca por elementos em nosso layout com base no texto exibido.
    Finder emailInput = find.bySemanticsLabel('E-mail');
    Finder passwordInput = find.bySemanticsLabel('Senha');
    Finder loginBtn = find.bySemanticsLabel('Acessar');

    /// Escreve o texto nos [TextField]'s encontrados.
    await tester.enterText(emailInput, 'test.error@test.com');
    await tester.enterText(passwordInput, 'test123');
    await tester.tap(loginBtn);

    /// Aciona a frame depois do tempo informado.
    await tester.pump(const Duration(seconds: 10));

    /// Define a busca por um texto especifico.
    Finder textError = find.text('Verifique as credenciais');

    /// Verifica a existência do texto no layout.
    expect(textError, findsOneWidget);
  });
}
