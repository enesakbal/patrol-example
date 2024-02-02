import 'package:flutter/material.dart';
import 'package:patrol_example/authentication_example/user_service.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final UserService userService;

  @override
  void initState() {
    userService = Provider.of<UserService>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home User ${userService.currentUser.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome ${userService.currentUser.name}'),
            const SizedBox(height: 24),
            Text('ID ${userService.currentUser.id}'),
            const SizedBox(height: 24),
            Text('Email: ${userService.currentUser.email}'),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                userService.logout(userService.currentUser);
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
