import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page.dart';
import 'main_model.dart';
import 'user.dart';

void main() {
  runApp(
    Provider(
      create: (context) => User(
        firstName: 'John',
        lastName: 'Doe',
        email: 'test@mail.com',
      ),
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
          ]),
        ));
  }
}
