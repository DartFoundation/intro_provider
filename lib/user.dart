import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String firstName;
  String lastName;
  String email;
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
  });
  // Set the first name
  set setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void info() {
    Uri url = Uri.parse('https://randomuser.me/api');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        Map body = json.decode(response.body);
        String firstName = body['results'][0]['name']['first'];
        // Get the last name
        String lastName = body['results'][0]['name']['last'];
        // Get the email address
        String email = body['results'][0]['email'];
        print('First Name: $firstName');
        print('Last Name: $lastName');
      }
    });
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Email: $email');
  }

  // Get the first name
  String get getFirstName => firstName;
}
