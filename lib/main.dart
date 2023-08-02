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
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'second': (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get the user from the provider
    User user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('First Name: ${user.firstName}'),
            Text('Last Name: ${user.lastName}'),
            Text('Email: ${user.email}'),
            ElevatedButton(
              onPressed: () {
                // Update the user
                // user.firstName = 'Jane';

                setState(() {
                  user.info();
                });

                print('First Name: ${user.getFirstName}');
              },
              child: Text('Update User'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'second');
              },
              child: Text('Next Page'),
            ),
          ],
        ),
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
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
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
