import 'dart:convert';
import 'package:advisor_graduation_project/config/serverConfig.dart';
import 'package:advisor_graduation_project/model/userMessages.dart';
import 'package:http/http.dart' as http;

class UserMessagesServices {

  Future<List<UserMessages>> displayUserMessages(String token, int userId) async {
    try {
      var response = await http.get(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
            .userMessages}/$userId'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // Parse the JSON response
        List<dynamic> jsonResponse = json.decode(response.body);

        // Convert JSON to a list of UserMessages
        List<UserMessages> userMessagesList = jsonResponse.map((data) => UserMessages.fromJson(data)).toList();

        return userMessagesList;
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to load user messages');
      }
    } catch (e) {
      // Catch any exceptions thrown during the process
      print('Exception during request: $e');
      rethrow; // Rethrow the exception to be caught by the caller
    }
  }
}

