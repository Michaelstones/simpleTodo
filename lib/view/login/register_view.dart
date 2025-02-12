import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/utils/provider/auth_provider.dart';

class RegisterView extends ConsumerWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: userNameController,
                decoration: InputDecoration(labelText: "Username")),
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email")),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true),
            ElevatedButton(
              onPressed: () async {
                bool success = await ref.read(authProvider.notifier).register(
                      userNameController.text,
                      emailController.text,
                      passwordController.text,
                    );
                if (success) {
                  Navigator.pop(context); // Navigate back to login
                }
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
