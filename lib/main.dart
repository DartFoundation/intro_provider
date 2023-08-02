import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page.dart';
import 'main_model.dart';
import 'user.dart';
import 'service.dart';

void main() {
  // Get the user using the service
  // User user = await RandomUserService().getUsers();
  User user = User(
    firstName: 'John',
    lastName: 'Doe',
    email: 'user@mail.com',
  );
  runApp(
    Provider(
      create: (context) => user,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user from the provider
    User user = Provider.of<User>(context);
    return Scaffold(
      body: Column(
        children: [
          Text('First Name: ${user.firstName}'),
          Text('Last Name: ${user.lastName}'),
          Text('Email: ${user.email}'),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user from the provider
    User user = Provider.of<User>(context);
    return Scaffold(
      body: Column(
        children: [
          Text('First Name: ${user.firstName}'),
          Text('Last Name: ${user.lastName}'),
          Text('Email: ${user.email}'),
        ],
      ),
    );
  }
}
