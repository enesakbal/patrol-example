import 'package:flutter/material.dart';
import 'package:patrol_example/authentication_example/home_view.dart';
import 'package:patrol_example/authentication_example/user_service.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final UserService userService;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    userService = Provider.of<UserService>(context);

    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;

                userService.login(email: email, password: password);

                await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
