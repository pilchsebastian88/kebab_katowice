import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Zaloguj się'),
            const SizedBox(height: 20),
            TextField(
              controller: loginController,
              decoration: const InputDecoration(hintText: 'podaj email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'podaj hasło'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: loginController.text,
                    password: passwordController.text,
                  );
                } catch (error) {
                  print(error);
                }
              },
              child: const Text('Zaloguj się'),
            )
          ],
        ),
      ),
    );
  }
}
