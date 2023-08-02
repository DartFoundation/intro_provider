import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page.dart';
import 'main_model.dart';
import 'user.dart';
import 'service.dart';

Future<void> main() async {
  User user = User(firstName: 'John', lastName: 'Doe', email: 'test@mail.com');
  // Get the user using the service
  // User user = await RandomUserService().getUsers();
  runApp(
    Provider(
      // Initialize the user service
      create: (context) => user,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        // '/page': (context) => Page(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider Demo'),
        ),
        body: Center(
          child: Column(children: [
            Text('First Name: ${user.firstName}'),
            Text('Last Name: ${user.lastName}'),
            Text('Email: ${user.email}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('Go to Second Page'),
            ),
          ]),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Column(children: [
            Text('First Name: ${user.firstName}'),
            Text('Last Name: ${user.lastName}'),
            Text('Email: ${user.email}'),
          ]),
        ));
  }
}
