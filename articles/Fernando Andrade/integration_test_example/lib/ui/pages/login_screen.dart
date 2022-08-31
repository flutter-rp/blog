import 'package:flutter/material.dart';
import 'package:integration_test_example/ui/pages/private_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool hasError;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    hasError = false;
  }

  /// Checa as credenciais, caso exista algum erro a variável [hasError] é ativada
  void onSubmit() {
    if (emailController.text != 'test@test.com' ||
        passwordController.text != 'test123') {
      setState(() {
        hasError = true;
      });
      return;
    }

    setState(() {
      hasError = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrivateScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                errorText: hasError ? 'Verifique as credenciais' : null,
                border: const OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onSubmit,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Acessar',
                  key: ValueKey('loginBtn'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
