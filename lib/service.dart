import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class RandomUserService {
  Future<User> getUsers() async {
    final response = await http.get('https://randomuser.me/api' as Uri);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      String firstName = body['results'][0]['name']['first'];
      // Get the last name
      String lastName = body['results'][0]['name']['last'];
      // Get the email address
      String email = body['results'][0]['email'];
      return User(firstName: firstName, lastName: lastName, email: email);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
