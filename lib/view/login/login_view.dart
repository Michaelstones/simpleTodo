import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/utils/provider/auth_provider.dart';
import 'package:todo/view/login/register_view.dart';
import '../home/home_view.dart';

class LoginView extends ConsumerWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: userNameController,
                decoration: InputDecoration(labelText: "Username")),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true),
            ElevatedButton(
              onPressed: () async {
                bool success = await ref.read(authProvider.notifier).login(
                      userNameController.text,
                      passwordController.text,
                    );
                if (success) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterView())),
              child: Text("Create an account"),
            ),
          ],
        ),
      ),
    );
  }
}
